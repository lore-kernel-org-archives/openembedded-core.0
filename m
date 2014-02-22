Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id 86DF56B5D9
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 19:52:49 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id ma3so2198518pbc.40
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 11:52:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=GgrGocQ4KiKsbv/hDX8FDgTfRN+Z4pQ7Jlt0/OyuzX4=;
	b=g7ID25VTL9YKo0Ma+9+JUHrxUAtp8/1y4zaOOYlI9zUSJgBfopMz8hhk0iFgSnla6r
	Zd34QOIp5JK5po8xtYBAv7XdOzGBVqbb9b8/ZuOcD1rq3kH4yH/MEBYQukdYJo/QJKSn
	lar+qG35XmSfJm9wHpSyKom07LaI0LEM9KYnNc5uoE4OhZu7m47i9Gt+uNFf6eTrH2Df
	GM+5fK9dWVoR81PgJ8rBrmK4hGEfjiF5yrEcTsIoizxXi+Ygk1N8i5S9EQaDxjRG6nBM
	TrX5qGv4FXYy/pFyB5Fd9Hequ0g0Br2puw8GCHl4TfJyqxlb3gCzGhUdKiOwA1u2snkf
	nppQ==
X-Received: by 10.68.170.66 with SMTP id ak2mr16170139pbc.5.1393098770642;
	Sat, 22 Feb 2014 11:52:50 -0800 (PST)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	eo11sm79532728pac.0.2014.02.22.11.52.48 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Feb 2014 11:52:49 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1393092730.2640.25.camel@e130.pbcl.net>
Date: Sat, 22 Feb 2014 11:52:47 -0800
Message-Id: <A779E393-73D0-4FF8-A680-EA37F8CAFE3F@gmail.com>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
	<1393058961.5181.4.camel@ted>
	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
	<1393092730.2640.25.camel@e130.pbcl.net>
To: Phil Blundell <pb@pbcl.net>
X-Mailer: Apple Mail (2.1827)
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [RFT][PATCH 0/2] Systemd 209
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 22 Feb 2014 19:52:50 -0000
X-Groupsio-MsgNum: 50451
Content-Type: multipart/signed;
	boundary="Apple-Mail=_18ECF219-EDDE-4308-A2CE-9659A2BE6A4D";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_18ECF219-EDDE-4308-A2CE-9659A2BE6A4D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=windows-1252


On Feb 22, 2014, at 10:12 AM, Phil Blundell <pb@pbcl.net> wrote:

> On Sat, 2014-02-22 at 01:31 -0800, Khem Raj wrote:
>> builds might work but they won=92t run and yes so far IFUNC support =
is needed so it won=92t work on non-x86
>> architectures. One common runtime problem I am seeing is logind not =
being able to talk to dbus
>> across all architectures. I have pushed my latest rework to pull =
branch
>=20
> What is the problem with ifunc on non-x86? =20

they are not enabled across all architectures, well specifically, its =
not enabled on arm and seems also ppc is missing it.

> As far as I know the
> compiler, assembler, linker and ld.so for all reasonable architectures
> support that nowadays (though prelink support is a bit patchy).  GCC
> didn't have ifuncs enabled for some architectures until quite recently
> but if that was the problem then you'd see compile-time failures.  So,
> if it compiles then I can't think of any reason why it oughtn't to =
run.

systemd is using ifuncs to patch up the library migration it has done in =
209
so it only shows up when we enable compat lib support in systemd, and if =
we patch the apps to forward port to systemd 209 then we don=92t need to =
enable compat lib support and
it could be left alone.

if we want to enable compat libs/ifunc then we can think of adding =
--enable-gnu-indirect-function
to gcc configure but then it may not work on all architectures that we =
are interested in.


> Is this a uclibc thing?

no

>=20
> p.
>=20
>=20


--Apple-Mail=_18ECF219-EDDE-4308-A2CE-9659A2BE6A4D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMJAA8ACgkQuwUzVZGdMxRLzgCcCO8bOTWAmEDMkDuZZAHDjlrD
5C0An04YMQ3xrW8vQC/cFnYjjF63VclK
=P3WV
-----END PGP SIGNATURE-----

--Apple-Mail=_18ECF219-EDDE-4308-A2CE-9659A2BE6A4D--
