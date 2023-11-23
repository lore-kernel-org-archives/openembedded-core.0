Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A697C5AD4C
	for <webhook@archiver.kernel.org>; Thu, 23 Nov 2023 17:15:39 +0000 (UTC)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
 by mx.groups.io with SMTP id smtpd.web10.98373.1700759729529259283
 for <openembedded-core@lists.openembedded.org>;
 Thu, 23 Nov 2023 09:15:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SlgnjFXp;
 spf=pass (domain: gmail.com, ip: 209.85.210.44, mailfrom: raj.khem@gmail.com)
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-6d7e67c169cso648686a34.1
        for <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 09:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1700759728; x=1701364528; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CO5627XJ33+gDbEjb9XBm4RXk00qAqVM7ySFAxkg25A=;
        b=SlgnjFXp5GxgGc7WgjSKluaj2pHenGWjx5pPQi3++jlBXt+j+9E2WAxVjnx0ItAiF6
         B7cBD1pd+DS8t9f0yitiq0Xs9NZBW+9/lxA0HnV62uAbr9jD2j7t4vambC3g16Xit8LK
         mQSvCKqOeU+rpOL9KlcKe/3zm9f6ESBJn+shXAE56ZuZWSspxToLhiWC9AUWytN3+Pfn
         3/GsGY0tAk1qukDcSPt3P1nOquP0BiM2J7ssndrvOl+TuvexsP8c2pKIMyTLFy2hw3Ek
         TJDULqhXmzQRy8Bv0JSXCy+qrz548RYWwcS8WWoIvOsQx1ODDif6wkrF/7ETgsI8Xg8W
         K6fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700759728; x=1701364528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CO5627XJ33+gDbEjb9XBm4RXk00qAqVM7ySFAxkg25A=;
        b=j1859v3jnMYZhwlxro7TCmEedUyon/EfA83PFbOzFeSCE8NKdxG/gh+Pe+uNeF+1l6
         SoYhRxIkqBPb9y8w/uRUUfQJtSk9q5Spe4KH1LwOVIdhclQPgBFCborEPAAZYhcJtCBd
         22ugRhLBtfTjMfjxT78jqexIFvS4x6gz4CTmkT/sez843p12rslm45t3mGfJs8LkrJ1n
         zXHCjr4eI98fGlkZmPnrHbbLPVGZrG1hnM3RF1b847yosMCIdN86NCSfL/Ei1cnt9w/k
         tz0TuE60ZV2s1LrOEwOXx814SvWNIqmyRI3fGoyD9WilVrZdrCfSQcObkhoK/dhHNzkf
         blsA==
X-Gm-Message-State: AOJu0YzKz50Yi0uCn0fIPWPfjB2bGKvb/E1cTtSrUz3y7xjfJ36xaxUW
	DgeXOlCh5qE99MJLzbQCmtF5N9cysWwF7958cOJZ/n8LaQWFOA==
X-Google-Smtp-Source: AGHT+IGHkJCwk3C/ILiqtAxWwuHRsz9nJxSgV0iMLEXFqYDUfdzA9/kl8i7LOGdXk/W1gSwZKMhUWjyBUf4mdWiPbjI=
X-Received: by 2002:a05:6870:8dcb:b0:1dc:33a:40d8 with SMTP id
 lq11-20020a0568708dcb00b001dc033a40d8mr7545915oab.4.1700759728359; Thu, 23
 Nov 2023 09:15:28 -0800 (PST)
MIME-Version: 1.0
References: <1700643791-9633-1-git-send-email-wangmy@fujitsu.com> <20231123080011c56c3ec6@mail.local>
In-Reply-To: <20231123080011c56c3ec6@mail.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 23 Nov 2023 09:15:02 -0800
Message-ID: <CAMKF1sqr6bJbmwoHU-OGZc2q7VgVj4e4TDXhqWRT2Pbd9iiPPQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] libxml2: upgrade 2.11.5 -> 2.12.0
To: alexandre.belloni@bootlin.com
Cc: wangmy <wangmy@fujitsu.com>, openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 23 Nov 2023 17:15:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/191172

On Thu, Nov 23, 2023 at 12:00=E2=80=AFAM Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=3Dbootlin.com@lists.openembedded.org> wrote:
>
> This breaks libsoup and webkit:
>
> https://autobuilder.yoctoproject.org/typhoon/#/builders/45/builds/8203/st=
eps/12/logs/stdio
> https://autobuilder.yoctoproject.org/typhoon/#/builders/52/builds/8058/st=
eps/11/logs/stdio

I have sent a fix for libsoup2 but there are more failures with
meta-openembedded layers

https://errors.yoctoproject.org/Errors/Build/174703/

>
> On 22/11/2023 17:03:11+0800, wangmy wrote:
> > From: Wang Mingyu <wangmy@fujitsu.com>
> >
> > License-Update:
> >  hash: Rewrite hash table code
> >
> > install-tests.patch
> > refreshed for new version.
> >
> > Changelog:
> >  https://github.com/GNOME/libxml2/blob/master/NEWS
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  meta/recipes-core/libxml/libxml2/install-tests.patch     | 8 ++++----
> >  .../libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.0.bb}      | 9 +++++--=
--
> >  2 files changed, 9 insertions(+), 8 deletions(-)
> >  rename meta/recipes-core/libxml/{libxml2_2.11.5.bb =3D> libxml2_2.12.0=
.bb} (92%)
> >
> > diff --git a/meta/recipes-core/libxml/libxml2/install-tests.patch b/met=
a/recipes-core/libxml/libxml2/install-tests.patch
> > index 14ccce5873..ef46af9ba8 100644
> > --- a/meta/recipes-core/libxml/libxml2/install-tests.patch
> > +++ b/meta/recipes-core/libxml/libxml2/install-tests.patch
> > @@ -1,4 +1,4 @@
> > -From 3fc716357ce1372d9418dc86f24315b34d9808de Mon Sep 17 00:00:00 2001
> > +From ad68c053d3c9926e43125058d33b5a7028159b44 Mon Sep 17 00:00:00 2001
> >  From: Ross Burton <ross.burton@arm.com>
> >  Date: Mon, 5 Dec 2022 17:02:32 +0000
> >  Subject: [PATCH] add yocto-specific install-ptest target
> > @@ -13,11 +13,11 @@ Signed-off-by: Ross Burton <ross.burton@arm.com>
> >   1 file changed, 10 insertions(+)
> >
> >  diff --git a/Makefile.am b/Makefile.am
> > -index 5bc4018..57d27af 100644
> > +index 0a49d37..1097c63 100644
> >  --- a/Makefile.am
> >  +++ b/Makefile.am
> > -@@ -26,6 +26,16 @@ check_PROGRAMS =3D \
> > -     testlimits \
> > +@@ -27,6 +27,16 @@ check_PROGRAMS =3D \
> > +     testparser \
> >       testrecurse
> >
> >  +ptestdir=3D$(libexecdir)
> > diff --git a/meta/recipes-core/libxml/libxml2_2.11.5.bb b/meta/recipes-=
core/libxml/libxml2_2.12.0.bb
> > similarity index 92%
> > rename from meta/recipes-core/libxml/libxml2_2.11.5.bb
> > rename to meta/recipes-core/libxml/libxml2_2.12.0.bb
> > index 319833f053..58b4c14301 100644
> > --- a/meta/recipes-core/libxml/libxml2_2.11.5.bb
> > +++ b/meta/recipes-core/libxml/libxml2_2.12.0.bb
> > @@ -4,10 +4,11 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
> >  BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml=
2"
> >  SECTION =3D "libs"
> >  LICENSE =3D "MIT"
> > -LIC_FILES_CHKSUM =3D "file://Copyright;md5=3D2044417e2e5006b65a8b9067b=
683fcf1 \
> > -                    file://hash.c;beginline=3D6;endline=3D15;md5=3De77=
f77b12cb69e203d8b4090a0eee879 \
> > +LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dfec7ecfe714722b2bb0aaff7d=
200c701 \
> > +                    file://hash.c;beginline=3D6;endline=3D15;md5=3D9af=
9349d0ead24569dc332f2116ef5f8 \
> >                      file://list.c;beginline=3D4;endline=3D13;md5=3Db9c=
25b021ccaf287e50060602d20f3a7 \
> > -                    file://trio.c;beginline=3D5;endline=3D14;md5=3Dcd4=
f61e27f88c1d43df112966b1cd28f"
> > +                    file://trio.c;beginline=3D5;endline=3D14;md5=3Dcd4=
f61e27f88c1d43df112966b1cd28f \
> > +                    "
> >
> >  DEPENDS =3D "zlib virtual/libiconv"
> >
> > @@ -19,7 +20,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts2013092=
3.tar;subdir=3D${BP};name=3Dtestt
> >             file://install-tests.patch \
> >             "
> >
> > -SRC_URI[archive.sha256sum] =3D "3727b078c360ec69fa869de14bd6f75d7ee8d3=
6987b071e6928d4720a28df3a6"
> > +SRC_URI[archive.sha256sum] =3D "431521c8e19ca396af4fa97743b5a6bfcccddb=
ba90e16426a15e5374cd64fe0d"
> >  SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83=
e69a2be4722379f08702ea7273"
> >
> >  # Disputed as a security issue, but fixed in d39f780
> > --
> > 2.34.1
> >
>
> >
> >
> >
>
>
> --
> Alexandre Belloni, co-owner and COO, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#191137): https://lists.openembedded.org/g/openembedde=
d-core/message/191137
> Mute This Topic: https://lists.openembedded.org/mt/102745852/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

