Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C8E7C52D6F
	for <webhook@archiver.kernel.org>; Sat, 24 Aug 2024 17:47:57 +0000 (UTC)
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
 by mx.groups.io with SMTP id smtpd.web10.17638.1724521674366740389
 for <openembedded-core@lists.openembedded.org>;
 Sat, 24 Aug 2024 10:47:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Omcr92vc;
 spf=pass (domain: gmail.com, ip: 209.85.160.41, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-270263932d5so2228914fac.2
        for <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 10:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724521673; x=1725126473; darn=lists.openembedded.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M8Grdqjv7YNVRbcLQByHgnxru486MOdSKuX1SNcCohI=;
        b=Omcr92vcON+gSkOhREVjch3QkAolBmYOHNb9RmIdVCAl+X6h9k1vx/+RyVjRRBgmJe
         kkbOvxcznjiDN4BJ/ctzvyfrtACUrUVEOa4PPyUhJglrpb9s4fiftoe1SSToTPL+/oGy
         zHpws2//VMepAZVlqgxpzcaVZqZJ27kfgv+jXR67lQ6laJr+KfTUzNsQJt2O/O0sVRoh
         CR5JT5Y11y8x9aTCH/yybta0l4kj7bI4vYEIvAoWWUt88IZT9ursW54JD9I8/82Rf4MM
         jQIK9epOZG3//ZDpFAZV2L+kKOFksOdGN+6QlJRG9KOxTZsEexXUxqp0/S7Nh96fUnXQ
         E4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724521673; x=1725126473;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M8Grdqjv7YNVRbcLQByHgnxru486MOdSKuX1SNcCohI=;
        b=lPbuHgrTG/Odc41oZ1fEFTvKPKwI3vpzEjgtoDfuAVHkyeOUnFNDfnJMjfSuleSmRW
         sEarh3fCwauPzCeBN2e3gkYxgS1PYibixbq5a6XifaHgcqyVd3dASXzLW/pgfkDbnZ9o
         1K0JvkKpNHaXx6taMTiAZGOwCn8rPsmLRG1Phy0Dhh90FpCm2LlKya+mVWcvVKyAJ/XA
         QhSBhbuw577pXS8wRLsUDE33vcN8iAX165XT+6iPNtAvQzCoQF7HKQ1woylCXPV6F4ao
         xX0ZzfUzKm4SY91SVA4dk3kFbQ+M0ZrmzIfI7bbbkmyu0Kqkh17ka2zTOWchtCUIYQZu
         uvTA==
X-Gm-Message-State: AOJu0Yz3pHkcRbeSQ6Taim6+U57p6fyMl5VwZC8BJVn6d79HaVe0mgrG
	/+u4ErTIhpjciMG9Qi4f2p4kSBBJA+Vt1LOEVveZafJo4l4nYi5mxcLVEKRLcx7DBNPXCiVMOex
	QqPz+8JEc54dZ69357SBcTYg4MS8ebi64
X-Google-Smtp-Source: AGHT+IGFcTmdaarf7agOZ4twCllrS/2MR70jlqLeq2Irh7GIM+09VjDLbknCmfuf/uQ1oeax/rpcxWLotKWPTDVTD8c=
X-Received: by 2002:a05:6870:82a1:b0:270:735:96e with SMTP id
 586e51a60fabf-273e6465ed4mr6643208fac.12.1724521673501; Sat, 24 Aug 2024
 10:47:53 -0700 (PDT)
MIME-Version: 1.0
References: <20240823014806.4154590-1-hongxu.jia@windriver.com> <20240823014806.4154590-4-hongxu.jia@windriver.com>
In-Reply-To: <20240823014806.4154590-4-hongxu.jia@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 24 Aug 2024 10:47:27 -0700
Message-ID: <CAMKF1soj55jyHO5Xhqvp2vzqx+XqkUHqh1LDt7P8=n2RaWYK2Q@mail.gmail.com>
Subject: Re: [OE-core] [poky][PATCH 3/9] libxml2: 2.12.8 -> 2.13.3
To: hongxu.jia@eng.windriver.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 24 Aug 2024 17:47:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203714

This version bump is not simple as it causes ABI breakage for several
packages. In meta-oe e.g.

https://errors.yoctoproject.org/Errors/Build/189834/

look at libgsf, libspatialite and raptor2

Other projects have noticed it too see Gentoo e.g.  -
https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=3D38181f7165be4709471a=
773e042dc8525e01d2bd

On Thu, Aug 22, 2024 at 6:48=E2=80=AFPM hongxu via lists.openembedded.org
<hongxu.jia=3Deng.windriver.com@lists.openembedded.org> wrote:
>
> * Remove Trio and updated Copyright to remove Trio [1]
> * Remove --with-fexceptions configuration option [2]
>
> [1] https://gitlab.gnome.org/GNOME/libxml2/-/commit/7d6969d95509a94347d6f=
96167ac5420abafa291
> [2] https://gitlab.gnome.org/GNOME/libxml2/-/commit/e349709ae7e07a2183304=
ccc9352b6ac86f62a18
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  .../libxml/{libxml2_2.12.8.bb =3D> libxml2_2.13.3.bb}        | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
>  rename meta/recipes-core/libxml/{libxml2_2.12.8.bb =3D> libxml2_2.13.3.b=
b} (93%)
>
> diff --git a/meta/recipes-core/libxml/libxml2_2.12.8.bb b/meta/recipes-co=
re/libxml/libxml2_2.13.3.bb
> similarity index 93%
> rename from meta/recipes-core/libxml/libxml2_2.12.8.bb
> rename to meta/recipes-core/libxml/libxml2_2.13.3.bb
> index fb103f0273..df24f3031c 100644
> --- a/meta/recipes-core/libxml/libxml2_2.12.8.bb
> +++ b/meta/recipes-core/libxml/libxml2_2.13.3.bb
> @@ -4,10 +4,9 @@ HOMEPAGE =3D "https://gitlab.gnome.org/GNOME/libxml2"
>  BUGTRACKER =3D "http://bugzilla.gnome.org/buglist.cgi?product=3Dlibxml2"
>  SECTION =3D "libs"
>  LICENSE =3D "MIT"
> -LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Dfec7ecfe714722b2bb0aaff7d20=
0c701 \
> +LIC_FILES_CHKSUM =3D "file://Copyright;md5=3Df437ed9058e8e5135e47c01e973=
376ba \
>                      file://dict.c;beginline=3D6;endline=3D15;md5=3D2b4b7=
b827d2d8b080372433c4c9c85b6 \
>                      file://list.c;beginline=3D4;endline=3D13;md5=3Db9c25=
b021ccaf287e50060602d20f3a7 \
> -                    file://trio.c;beginline=3D5;endline=3D14;md5=3Dcd4f6=
1e27f88c1d43df112966b1cd28f \
>                      "
>
>  DEPENDS =3D "zlib virtual/libiconv"
> @@ -20,7 +19,7 @@ SRC_URI +=3D "http://www.w3.org/XML/Test/xmlts20130923.=
tar;subdir=3D${BP};name=3Dtestt
>             file://install-tests.patch \
>             "
>
> -SRC_URI[archive.sha256sum] =3D "43ad877b018bc63deb2468d71f95219c2fac1968=
76ef36d1bee51d226173ec93"
> +SRC_URI[archive.sha256sum] =3D "0805d7c180cf09caad71666c7a458a74f041561a=
532902454da5047d83948138"
>  SRC_URI[testtar.sha256sum] =3D "c6b2d42ee50b8b236e711a97d68e6c4b5c8d83e6=
9a2be4722379f08702ea7273"
>
>  # Disputed as a security issue, but fixed in d39f780
> @@ -52,7 +51,7 @@ RDEPENDS:${PN}-ptest:append:libc-glibc =3D " glibc-gcon=
v-ebcdic-us \
>                                           "
>
>  # WARNING: zlib is required for RPM use
> -EXTRA_OECONF =3D "--without-debug --without-legacy --with-catalog --with=
-c14n --without-lzma --with-fexceptions"
> +EXTRA_OECONF =3D "--without-debug --without-legacy --with-catalog --with=
-c14n --without-lzma"
>  EXTRA_OECONF:class-native =3D "--without-legacy --with-c14n --without-lz=
ma --with-zlib"
>  EXTRA_OECONF:class-nativesdk =3D "--without-legacy --with-c14n --without=
-lzma --with-zlib"
>  EXTRA_OECONF:linuxstdbase =3D "--with-debug --with-legacy --with-c14n --=
without-lzma --with-zlib"
> --
> 2.27.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#203670): https://lists.openembedded.org/g/openembedde=
d-core/message/203670
> Mute This Topic: https://lists.openembedded.org/mt/108049764/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [ra=
j.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>

