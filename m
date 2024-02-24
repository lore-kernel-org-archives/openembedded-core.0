Return-Path: <simone.weiss@posteo.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86D43C48BF6
	for <webhook@archiver.kernel.org>; Sat, 24 Feb 2024 08:13:31 +0000 (UTC)
Received: from mout01.posteo.de (mout01.posteo.de [185.67.36.65])
 by mx.groups.io with SMTP id smtpd.web10.15360.1708762401681699662
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Feb 2024 00:13:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@posteo.net header.s=2017 header.b=SSFC0EPd;
 spf=pass (domain: posteo.net, ip: 185.67.36.65, mailfrom: simone.weiss@posteo.net)
Received: from submission (posteo.de [185.67.36.169]) 
	by mout01.posteo.de (Postfix) with ESMTPS id 2076B24002A
	for <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 09:13:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
	t=1708762399; bh=aBBjO2LG/1STqufh1G9Yyf49nRsFnOFyJk41KUawY/s=;
	h=Message-ID:Subject:From:To:Date:Content-Type:
	 Content-Transfer-Encoding:MIME-Version:From;
	b=SSFC0EPdfcHO/JYl51/+YW292haPrAJS/8046phKtIp2WiKDSDAI2moEkd1exqV4P
	 MdyjwUZzbL5v4Srl9Lrz3aNOq2yjm7k5ZWAKzJGGJdaITw4+nx5fBU4w5ZmhEK7rHj
	 E/f9Qpyo/jQmaDV0+jFrtqJJPXjJNp2+UdqfZJXXpGq3DCloMGxbmqKRJfkPhqDeod
	 3uLNftkNUtk1FkzgvBdOkm11GKqGu32NtDqG/OzoWNeT9buQQV85wYWMVDc5AFTRJ+
	 kxgSLyOACK6uHKkRvq2lxUMrjxhQnCSdyfVBBeBCB0MN63DhJhoNgZEXyQRPt0R9DF
	 RlecQnIT6A9MQ==
Received: from customer (localhost [127.0.0.1])
	by submission (posteo.de) with ESMTPSA id 4ThflB4M3Qz9rxL;
	Sat, 24 Feb 2024 09:13:10 +0100 (CET)
Message-ID: <2d82dbf32da0f7ccaeae72eadc6ce5c32eb02376.camel@posteo.net>
Subject: Re: [OE-core] [PATCH] libxml2: Upgrade 2.11.5 -> 2.12.5
From: Simone =?ISO-8859-1?Q?Wei=DF?= <simone.weiss@posteo.net>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, Simone
 =?ISO-8859-1?Q?Wei=DF?= <simone.p.weiss@posteo.com>,
 openembedded-core@lists.openembedded.org
Date: Sat, 24 Feb 2024 08:13:10 +0000
In-Reply-To: <48aaddfb9f0faf22a75bf9fe775ef819765db3d5.camel@linuxfoundation.org>
References: <20240223191859.6912-1-simone.p.weiss@posteo.com>
	 <48aaddfb9f0faf22a75bf9fe775ef819765db3d5.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Feb 2024 08:13:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196121

On Sat, 2024-02-24 at 07:43 +0000, Richard Purdie wrote:
> On Fri, 2024-02-23 at 19:18 +0000, Simone Wei=C3=9F wrote:
> > From: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> >=20
> > Upgraded to address CVE-2024-25062
> >=20
> > License-Update: hash.c was rewritten and now also has MIT license,
> > trio was totally removed, hence remove license checksum as well.
> > Files are not mentioned as exception in overall license any more,
> > therefore, checksum changed there as well.
> >=20
> > Previous upgrades of libxml2 caused issues when building libsoup,
> > this in the meantime has been adressed via commit "9f57bfb74e280827"
> > ("libsoup-2.4: Fix build with clang-17 and libxml2-2.12") already.
> >=20
> > Changes:
> > - [CVE-2024-25062] xmlreader: Don't expand XIncludes when backtracking
> > - parser: Fix crash in xmlParseInNodeContext with HTML documents
> >=20
> > Signed-off-by: Simone Wei=C3=9F <simone.p.weiss@posteo.com>
> > ---
> > =C2=A0meta/recipes-core/libxml/libxml2/install-tests.patch=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 8 ++++---
> > -
> > =C2=A0.../libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.5.bb}=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 | 8 +++----
> > -
> > =C2=A02 files changed, 7 insertions(+), 9 deletions(-)
> > =C2=A0rename meta/recipes-core/libxml/{libxml2_2.11.5.bb =3D>
> > libxml2_2.12.5.bb} (91%)
> >=20
> > diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch
> > b/meta/recipes-core/libxml/libxml2/install-tests.patch
> > index 14ccce5873..4bddf9f05e 100644
> > --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> > +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> > @@ -1,4 +1,4 @@
> > -From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00
> > 2001
> > +From 582af12c9e89cd3d7c93c63756acb6e8180a776c Mon Sep 17 00:00:00
> > 2001
> > =C2=A0From: Ross Burton <ross.burton@arm.com>
> > =C2=A0Date: Mon, 5 Dec 2022 17:02:32 +0000
> > =C2=A0Subject: [PATCH] add yocto-specific install-ptest target
> > @@ -13,11 +13,11 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
> > =C2=A0 1 file changed, 10 insertions(+)
> > =C2=A0
> > =C2=A0diff --git a/Makefile.am b/Makefile.am
> > -index 5bc4018..57d27af 100644
> > +index 0a49d37..1097c63 100644
> > =C2=A0--- a/Makefile.am
> > =C2=A0+++ b/Makefile.am
> > -@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0testlimits \
> > +@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0testparser \
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0testrecurse
> > =C2=A0=20
> > =C2=A0+ptestdir=3D$(libexecdir)
> > diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb
> > b/meta/recipes-core/libxml/libxml2_2.12.5.bb
> > similarity index 91%
> > rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
> > rename to meta/recipes-core/libxml/libxml2_2.12.5.bb
> > index 44336c25e1..01e23b21cc 100644
> > --- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
> > +++ b/meta/recipes-core/libxml/libxml2_2.12.5.bb
> > @@ -4,10 +4,8 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
> > =C2=A0BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dl=
ibxml2"
> > =C2=A0SECTION =3D "libs"
> > =C2=A0LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D
> > "file://Copyright;md5=3D2044417e2e5006b65a8b9067b683fcf1=C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://hash.c;beginline=3D6;endline=3D15;md5=3De77f77b12cb69e203d8b4090=
a0eee879
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25b021ccaf287e5006060=
2d20f3a7
> > =C2=A0\
> > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://trio.c;beginline=3D5;endline=3D14;md5=3Dcd4f61e27f88c1d43df11296=
6b1cd28f
> > "
> > +LIC_FILES_CHKSUM =3D
> > "file://Copyright;md5=3Dfec7ecfe714722b2bb0aaff7d200c701=C2=A0\
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> > file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25b021ccaf287e5006060=
2d20f3a7
> > "
> > =C2=A0
> > =C2=A0DEPENDS =3D "zlib virtual/libiconv"
> > =C2=A0
> > @@ -19,7 +17,7 @@ SRC_URI +=3D
> > "http://www.w3.org/XML/Test/xmlts20130923.tar;subdir=3D${BP};name=3Dtes=
tt
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file=
://install-tests.patch=C2=A0\
> > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
> > =C2=A0
> > -SRC_URI[archive.sha256sum] =3D
> > "3727b078c360ec69fa869de14bd6f75d7ee8d36987b071e6928d4720a28df3a6"
> > +SRC_URI[archive.sha256sum] =3D
> > "a972796696afd38073e0f59c283c3a2f5a560b5268b4babc391b286166526b21"
> > =C2=A0SRC_URI[testtar.sha256sum] =3D
> > "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e69a2be4722379f08702ea7273"
> > =C2=A0
> > =C2=A0# Disputed as a security issue, but fixed in d39f780
> >=20
>=20
> Unfortunately this upgrade breaks webkitgtk:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8480/st=
eps/11/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/117/builds/4416/s=
teps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8643/st=
eps/11/logs/stdio
>=20
> and so on.
>=20
> Cheers,
>=20
Argh sorry, I understood that only libsoup was an issue. I will propose a
patch to webkitgtk and fix it there, then backport and finally upgrade
this...=20
> Richard
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#196120):
> https://lists.openembedded.org/g/openembedded-core/message/196120
> Mute This Topic: https://lists.openembedded.org/mt/104534962/8052774
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe:
> https://lists.openembedded.org/g/openembedded-core/unsub=C2=A0[simone.p.w=
eiss@posteo.com
> ]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20


