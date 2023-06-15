Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CAFEB64DB
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 07:24:29 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
 by mx.groups.io with SMTP id smtpd.web10.12643.1686813863343800300
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Jun 2023 00:24:23 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=JMFQVQRc;
 spf=pass (domain: gmail.com, ip: 209.85.208.180, mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-2b445512846so4295491fa.2
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 00:24:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686813861; x=1689405861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bvNCuCQI3fhA5f+UndJuIYnuYSlltZxE7is/jifOswE=;
        b=JMFQVQRczRRx+vbj9wFBrigyubkClyaOUuOqSWPh8u1wZD+0V6EffjKtv7K9Xo9T2u
         uWfRUspTAhR7mYuYN0AEaUYyOstRIUP/TaowzF78mDJExpNVZshe9zzLpAPXsJmdsjki
         GYkL4LdfAYf7+hq3zc3Zzj/CcrNhMQIiOB6/m05J20HZnvJ+HqdeTtQ6OPSgqOajrBNS
         eWYoMl/UHP0QOAGOSIn2PWtzfcqlq+Jb7E3atsnD9jWJNMrApp5WZK0TDlvP2QL/MR/Z
         nw2Z5UY6ROQeYS63NYKwQLH8NlaM3IJHTMcyn/UiOWA3awV3Cf5SfEs5U9P7rdapM3PV
         7++g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686813861; x=1689405861;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bvNCuCQI3fhA5f+UndJuIYnuYSlltZxE7is/jifOswE=;
        b=Vd7U8TGPBM6SZXuGBIG6HmnUmqLiS0w9mLcx604tRLOQvwvc6tUK9L3IlgO1vrXWGb
         Vw+Pxbrb77XazxjlZ78tcdgsNp1He2VerEjXj4Q3maE3G5aVJoprS6Qew5w/NdRlaT9z
         nS8i93kFIo5O94mu4O58U4eUTK31zrV162FCwStsOLulHTxBKHVUA8KYjSPSTbWaZwbg
         aoG39nhBI9G46Rcv4x5K6CxAsm+H/yv7YyS4bU83Ss7Df6xIhUq3Gds7X1NRLbyBd6BZ
         Irl5bgAiFvDSQM5yqf8zLxs5en1kzqEum6Z97+XSrD5viHUYZRDhLuxPcTdJLfB1eTkf
         +n6g==
X-Gm-Message-State: AC+VfDwx7S92OsM+8ikiPnA6nXdZ9DIuI/Xb5lyymhKMn0ChNIhw6cSH
	ha5z68PbAme2Pwjk7OYSzdAO+3YhKN8pYom1gKk=
X-Google-Smtp-Source: ACHHUZ5PWkZAMyPrwfVGnqMS648DKLrbMvYryIfKzm+x24zAFo/bRtuCMYxSSdH9M3XcVEzXkGhYbwGPJ5JABiRWxLg=
X-Received: by 2002:a2e:b619:0:b0:2af:1e55:1290 with SMTP id
 r25-20020a2eb619000000b002af1e551290mr7879245ljn.46.1686813861234; Thu, 15
 Jun 2023 00:24:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230614092918.4065570-1-alex@linutronix.de> <20230614092918.4065570-26-alex@linutronix.de>
 <CAMKF1sps70DwarBXcWoC-oY-qyFVpBdQP+yB_xs-xaytJu6+ew@mail.gmail.com>
In-Reply-To: <CAMKF1sps70DwarBXcWoC-oY-qyFVpBdQP+yB_xs-xaytJu6+ew@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Thu, 15 Jun 2023 09:24:09 +0200
Message-ID: <CANNYZj_+bVX58D-V4WFEz7sA1jNxaZjJmJ4HZ0KRZL0vLCu+7w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 26/55] libxcrypt: upgrade 4.4.33 -> 4.4.34
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Jun 2023 07:24:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182834

It's in master too:
https://github.com/besser82/libxcrypt/commits/master

I don't know why github won't show that but using master is preferable
over develop.

4.4.35 will be provided by AUH in due time and taken into the next
batch; I don't chase shifting 'latest upstream versions' when making
and testing those large version update patchsets, that would endanger
my sanity :)

Alex

On Wed, 14 Jun 2023 at 19:12, Khem Raj <raj.khem@gmail.com> wrote:
>
> On Wed, Jun 14, 2023 at 2:29=E2=80=AFAM Alexander Kanavin
> <alex.kanavin@gmail.com> wrote:
> >
> > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > ---
> >  ...{libxcrypt-compat_4.4.33.bb =3D> libxcrypt-compat_4.4.34.bb} | 0
> >  meta/recipes-core/libxcrypt/libxcrypt.inc                     | 4 ++--
> >  .../libxcrypt/{libxcrypt_4.4.33.bb =3D> libxcrypt_4.4.34.bb}    | 0
> >  3 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-core/libxcrypt/{libxcrypt-compat_4.4.33.bb =3D> li=
bxcrypt-compat_4.4.34.bb} (100%)
> >  rename meta/recipes-core/libxcrypt/{libxcrypt_4.4.33.bb =3D> libxcrypt=
_4.4.34.bb} (100%)
> >
> > diff --git a/meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb b/m=
eta/recipes-core/libxcrypt/libxcrypt-compat_4.4.34.bb
> > similarity index 100%
> > rename from meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.33.bb
> > rename to meta/recipes-core/libxcrypt/libxcrypt-compat_4.4.34.bb
> > diff --git a/meta/recipes-core/libxcrypt/libxcrypt.inc b/meta/recipes-c=
ore/libxcrypt/libxcrypt.inc
> > index 61b03810763..4d145cf3ccd 100644
> > --- a/meta/recipes-core/libxcrypt/libxcrypt.inc
> > +++ b/meta/recipes-core/libxcrypt/libxcrypt.inc
> > @@ -10,8 +10,8 @@ LIC_FILES_CHKSUM =3D "file://LICENSING;md5=3Dc0a30e2b=
1502c55a7f37e412cd6c6a4b \
> >  inherit autotools pkgconfig
> >
> >  SRC_URI =3D "git://github.com/besser82/libxcrypt.git;branch=3D${SRCBRA=
NCH};protocol=3Dhttps"
> > -SRCREV =3D "d7fe1ac04c326dba7e0440868889d1dccb41a175"
> > -SRCBRANCH ?=3D "develop"
> > +SRCREV =3D "e80cfde51bb4fe4bcf27585810e0b4ea3d1e4d7d"
> > +SRCBRANCH ?=3D "master"
> >
>
> branch change perhaps is unwanted here, If I look at
> https://github.com/besser82/libxcrypt/commit/e80cfde51bb4fe4bcf27585810e0=
b4ea3d1e4d7d
> its in develop branch
>
> btw. there already is 4.4.35 release to fix minor build issues.
>
> >  SRC_URI +=3D "file://fix_cflags_handling.patch"
> >
> > diff --git a/meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb b/meta/rec=
ipes-core/libxcrypt/libxcrypt_4.4.34.bb
> > similarity index 100%
> > rename from meta/recipes-core/libxcrypt/libxcrypt_4.4.33.bb
> > rename to meta/recipes-core/libxcrypt/libxcrypt_4.4.34.bb
> > --
> > 2.30.2
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#182771): https://lists.openembedded.org/g/openembed=
ded-core/message/182771
> > Mute This Topic: https://lists.openembedded.org/mt/99524163/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [=
raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >

