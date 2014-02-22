Return-Path: <martin.jansa@gmail.com>
Received: from mail-ee0-f45.google.com (mail-ee0-f45.google.com [74.125.83.45])
	by mail.openembedded.org (Postfix) with ESMTP id EF54A6B6BC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 20:46:34 +0000 (UTC)
Received: by mail-ee0-f45.google.com with SMTP id e53so729809eek.18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 22 Feb 2014 12:46:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=PrKUMjSodmplur1Zbzb1CgZbVLPzeZcEdjhfnG+v9r8=;
	b=cISc2B1JTKWvfrpepR4Gb2luCcLcTZWZJAaXAQgbP/8SvmxTNLZvF7+etuHyBa7yJ5
	NCuZc3SQ0LbC/3g9CnWPsmpiSHPnVIcFZq8n9vb2Kon5kEHN3U3r21+Z4dnp1hxL04Xk
	4R2aVVFtiM/ec9XbL+kihiEpRYpsnv+gHMGQKTo8KhMHFiEfQ+UMvb2dK7EWix/SX8/M
	ZvbW+Tb9yR5LBNG6REdlp8S/FvSvYY+zQfDIJkIQU5ZjIYMxya6YAnMqZ6O6rsTVzlnQ
	LixQI7+OjKgGAcx7VwZTCcGLGHC1tHhCW0tngwyyt0TMmI+ZnjQCc665dC0Q4tGea765
	1ZuQ==
X-Received: by 10.15.55.193 with SMTP id v41mr16183768eew.80.1393101994929;
	Sat, 22 Feb 2014 12:46:34 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	o43sm42908018eef.12.2014.02.22.12.46.33 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 22 Feb 2014 12:46:33 -0800 (PST)
Date: Sat, 22 Feb 2014 21:47:10 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: Phil Blundell <pb@pbcl.net>
Message-ID: <20140222204710.GQ3854@jama>
References: <cover.1392891203.git.raj.khem@gmail.com>
	<20140221151607.GG3854@jama> <1392996116.1560.14.camel@ted>
	<8730C02B-B94E-4873-88D1-E5BA9063B585@dominion.thruhere.net>
	<1393058961.5181.4.camel@ted>
	<FD6EC742-512D-4423-B59D-D88ECBF97AF1@gmail.com>
	<1393092730.2640.25.camel@e130.pbcl.net>
MIME-Version: 1.0
In-Reply-To: <1393092730.2640.25.camel@e130.pbcl.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
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
X-List-Received-Date: Sat, 22 Feb 2014 20:46:35 -0000
X-Groupsio-MsgNum: 50452
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oDto3OTLsk6uOlQH"
Content-Disposition: inline

--oDto3OTLsk6uOlQH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 22, 2014 at 06:12:10PM +0000, Phil Blundell wrote:
> On Sat, 2014-02-22 at 01:31 -0800, Khem Raj wrote:
> > builds might work but they won=E2=80=99t run and yes so far IFUNC suppo=
rt is needed so it won=E2=80=99t work on non-x86
> > architectures. One common runtime problem I am seeing is logind not bei=
ng able to talk to dbus
> > across all architectures. I have pushed my latest rework to pull branch
>=20
> What is the problem with ifunc on non-x86?  As far as I know the
> compiler, assembler, linker and ld.so for all reasonable architectures
> support that nowadays (though prelink support is a bit patchy).  GCC
> didn't have ifuncs enabled for some architectures until quite recently
> but if that was the problem then you'd see compile-time failures.  So,
> if it compiles then I can't think of any reason why it oughtn't to run.
> Is this a uclibc thing?

I'm seeing lots of compile errors like this:

| arm-oe-linux-gnueabi-libtool: link: arm-oe-linux-gnueabi-ranlib .libs/lib=
systemd-units.a
| libsystemd-id128.c:6:6: error: ifunc is not supported in this configurati=
on
|  void sd_id128_to_string(void) __attribute__((ifunc("resolve_sd_id128_to_=
string")));
|       ^

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--oDto3OTLsk6uOlQH
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.22 (GNU/Linux)

iEYEARECAAYFAlMJDM4ACgkQN1Ujt2V2gBw/IACghHLbkbOv38PItpGlrDVgqB4w
togAoKc+4+3fqXRnrhWJz0tm2FJcmoaj
=4RI7
-----END PGP SIGNATURE-----

--oDto3OTLsk6uOlQH--
