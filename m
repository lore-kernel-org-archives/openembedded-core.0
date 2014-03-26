Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 3909A6F7E5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 03:23:50 +0000 (UTC)
Received: by mail-pd0-f173.google.com with SMTP id z10so1299902pdj.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Mar 2014 20:23:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=1bVCDIs1ExMfGPZ7QVtYLgaT86ESGZXht4Z8LDzqBro=;
	b=bFGMHdDqryD42Ff9kgIpH6BXqkFar9047aCFMvRDKkc/iFs/c8TVtaKreAb3iNUcnJ
	i4O/6WpLL5lPL4xyZheUuNayNiQk/M1bo/RQpIITBlLiGU8NEmJw+o1XNvOy99dKezgG
	p9eL42BvQxMF6/M/CNKkd6amPlZZrRodDgyHIxBOSHQwJPau0vyo3Lun2XjmXxMiSPq/
	U//wlaPPDe7n5FWlV/wxoG8n/+PTliMapv8Q7EIzX/BqGJYn49Vvg47cmtsPTIEJeMVV
	twwo1Blg+AkegHW0fFj+NWLX4+jFdX3XET3MdquRoIwbfBXxQZyhfyr3/6GZ/oGjYeFG
	5UQQ==
X-Received: by 10.66.149.231 with SMTP id ud7mr83159616pab.8.1395804231483;
	Tue, 25 Mar 2014 20:23:51 -0700 (PDT)
Received: from [192.168.0.33] (99-57-140-30.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.30]) by mx.google.com with ESMTPSA id
	ac5sm51641406pbc.37.2014.03.25.20.23.49 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Mar 2014 20:23:49 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 7.2 \(1874\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <ED3E0BCACD909541BA94A34C4A164D4C5B3A5F1C@post.tritech.se>
Date: Tue, 25 Mar 2014 20:23:47 -0700
Message-Id: <39D03392-2417-45CF-BD80-D160E8C466EE@gmail.com>
References: <ED3E0BCACD909541BA94A34C4A164D4C5B3A5F1C@post.tritech.se>
To: =?iso-8859-1?Q?Mats_K=E4rrman?= <Mats.Karrman@tritech.se>
X-Mailer: Apple Mail (2.1874)
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: SDK build refers to existing installed SDK
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
X-List-Received-Date: Wed, 26 Mar 2014 03:23:53 -0000
X-Groupsio-MsgNum: 51591
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5C268595-58AD-46FA-926D-5EA19DE05CD3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5C268595-58AD-46FA-926D-5EA19DE05CD3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=iso-8859-1


On Mar 25, 2014, at 2:41 AM, Mats K=E4rrman <Mats.Karrman@tritech.se> =
wrote:

> Hi,
>=20
> I just ran into an unexpected error while doing some multitasking.
> Project is based on OE-core Dora "distroless".
>=20
> While my build machine was busy building a new SDK using "-c =
populate_sdk" I simultaneously deleted an older SDK that was installed =
under /usr/local and installed a different one. This resulted in the =
build stopping with the following error:
>=20
> | x86_64-oesdk-linux-gcc  =
--sysroot=3D/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/sysroots/x=
86_64-nativesdk-oesdk-linux -DHAVE_CONFIG_H -I../ncurses =
-I/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/work/x86_64-nativesd=
k-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurses-5.9/ncurses =
-isystem/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/sysroots/x86_6=
4-nativesdk-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linu=
x/usr/include -D_GNU_SOURCE -DNDEBUG -I. -I../include =
-I/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/work/x86_64-nativesd=
k-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurses-5.9/ncurses/../include =
-I/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/include =
-isystem/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/sysroots/x86_6=
4-nativesdk-oesdk-linux/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linu=
x/usr/include -O2 -pipe  --param max-inline-insns-single=3D1200 -fPIC -c =
/home/makr/projects/xxx/svn/main/trunk/oe/build/tmp/work/x86_64-
> =
nativesdk-oesdk-linux/nativesdk-ncurses/5.9-r15.1/ncurses-5.9/ncurses/base=
/lib_beep.c -o ../obj_s/lib_beep.o
> | cc1: error: =
/usr/local/oecore-x86_64/sysroots/x86_64-oesdk-linux/usr/include: =
Permission denied
>=20
> The offending directory is given with an include directive which seems =
strange, building a new SDK should not poke around in an old one...
>=20
> Config & log files available on request.

Was the installed SDK in your path that fed into the OE build env which =
was generating new SDK ?


>=20
> BR // Mats
>=20
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_5C268595-58AD-46FA-926D-5EA19DE05CD3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlMySEMACgkQuwUzVZGdMxTaOQCfeC2zbyvB3MqQmHQhyOBPNCsE
lzAAnRGOB+tLFjrGK12HNRSYhFmxYHih
=XfWV
-----END PGP SIGNATURE-----

--Apple-Mail=_5C268595-58AD-46FA-926D-5EA19DE05CD3--
