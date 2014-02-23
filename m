Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f170.google.com (mail-wi0-f170.google.com
	[209.85.212.170])
	by mail.openembedded.org (Postfix) with ESMTP id 576586B7A6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 23 Feb 2014 07:36:58 +0000 (UTC)
Received: by mail-wi0-f170.google.com with SMTP id hi5so2056034wib.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 23:36:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=gGFBQ+w1X9xwuNF8GtS4GyjrVsqOurF05AVOv7Y0qvw=;
	b=bSYOj0gy9BrKmU781IgrH2WE8RQcb4Zfm1WwduUXSX6hV2GHokCu1BWUUQ8j4folvo
	WbHIzEBiy/Up8gGxLyMKl3tOs5X5vhiJbnwtEjWsCu3aHBsqIa/95lEgFkpnBOzCiZbQ
	wakDKZym7ip+HySchCbYI5NeQquObNudcEFmCvLe/t7dBNg7SFVdaRGNQjnTAmu18zbv
	zz7deW7MXylG9VnRv0/HpPBAwcpip6NfmKWq1Jn4thqNkOG3HnMG2BLHcfA9c/BsGmJA
	YI4sJe69GgyKzkn1cjw3EVCvQbMAFzIJuwDdY0vlg8qWuvu6ZcQTq3Ic9oVUshx+f/of
	q0Mg==
X-Gm-Message-State: ALoCoQmcap4InFhmAaPBixERZgdzTEuFW1GWpU/auzAtdHQKMdGjqvl4Q3/na4LfThxcc5RYd9BQ
X-Received: by 10.180.13.197 with SMTP id j5mr9328469wic.14.1393141018414;
	Sat, 22 Feb 2014 23:36:58 -0800 (PST)
Received: from ?IPv6:2001:610:612::7098:dc61:11e3:5494?
	([2001:610:612:0:7098:dc61:11e3:5494])
	by mx.google.com with ESMTPSA id t5sm31161080wjw.15.2014.02.22.23.36.57
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sat, 22 Feb 2014 23:36:57 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 7.1 \(1827\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <A779E393-73D0-4FF8-A680-EA37F8CAFE3F@gmail.com>
Date: Sun, 23 Feb 2014 08:36:56 +0100
Message-Id: <8D402F63-A17D-458D-8C9B-CE3340EF0F9A@dominion.thruhere.net>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
	<1393058961.5181.4.camel@ted>
	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
	<1393092730.2640.25.camel@e130.pbcl.net>
	<A779E393-73D0-4FF8-A680-EA37F8CAFE3F@gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Mailer: Apple Mail (2.1827)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Sun, 23 Feb 2014 07:36:59 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable


Op 22 feb. 2014, om 20:52 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

>=20
> On Feb 22, 2014, at 10:12 AM, Phil Blundell <pb@pbcl.net> wrote:
>=20
>> On Sat, 2014-02-22 at 01:31 -0800, Khem Raj wrote:
>>> builds might work but they won=92t run and yes so far IFUNC support =
is needed so it won=92t work on non-x86
>>> architectures. One common runtime problem I am seeing is logind not =
being able to talk to dbus
>>> across all architectures. I have pushed my latest rework to pull =
branch
>>=20
>> What is the problem with ifunc on non-x86? =20
>=20
> they are not enabled across all architectures, well specifically, its =
not enabled on arm and seems also ppc is missing it.
>=20
>> As far as I know the
>> compiler, assembler, linker and ld.so for all reasonable =
architectures
>> support that nowadays (though prelink support is a bit patchy).  GCC
>> didn't have ifuncs enabled for some architectures until quite =
recently
>> but if that was the problem then you'd see compile-time failures.  =
So,
>> if it compiles then I can't think of any reason why it oughtn't to =
run.
>=20
> systemd is using ifuncs to patch up the library migration it has done =
in 209
> so it only shows up when we enable compat lib support in systemd, and =
if we patch the apps to forward port to systemd 209 then we don=92t need =
to enable compat lib support and
> it could be left alone.

Or we can cherry-pick =
http://cgit.freedesktop.org/systemd/systemd/commit/?id=3D03e37dd767e52908f=
30783d9b4c09fb6a4e865c7 :)

>=20
> if we want to enable compat libs/ifunc then we can think of adding =
--enable-gnu-indirect-function
> to gcc configure but then it may not work on all architectures that we =
are interested in.
>=20
>=20
>> Is this a uclibc thing?
>=20
> no
>=20
>>=20
>> p.
>>=20
>>=20
>=20


