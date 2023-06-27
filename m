Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DA86BEB64D9
	for <webhook@archiver.kernel.org>; Tue, 27 Jun 2023 19:45:19 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.web11.340.1687895110218600625
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Jun 2023 12:45:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@linuxfoundation.org header.s=google header.b=bQzUI9xQ;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-3fa8cd4a113so29197905e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 12:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1687895108; x=1690487108;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jldqLISwM/YDFjeu6+txQQWU3kdKlhrep6lLea0QZdI=;
        b=bQzUI9xQZwqtuUlxBNJpHsKphFOjXjjOgpv99btFE8VRkc1igw0iZ3ZtXh+/jTXbNf
         t5GqeJ90fZ5dX8FaKpVWjJlAnkR/ZK7l9cZqwjYuB43qUXiracFkibLWcMTNChLQ4iee
         OxxcilkwDR+QXKQADeC3F/FfvdHCAkFfALTLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687895108; x=1690487108;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:to:from:subject:message-id:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jldqLISwM/YDFjeu6+txQQWU3kdKlhrep6lLea0QZdI=;
        b=GQ3y2z1kpbqeQAbB7k48VrlDOhlpf65JUMxfWSFt2VSs/8lH5PSd6gyfhMx+mmwdGs
         wgoVkuGs0Tzwu8jg/SAAe/u7laJYck7SGkTsi8G/ZwrcjVtAC94r5VteN08FqtI/1KgC
         HI+JfypYZd2tx30cxWDdwWafd5DzF4SCFfyjIIInQb+plWoFENSob4uGmk7bIix7lAS9
         CfACz3kDAEVClpuEIeiSA7mXfndLUKPmxr2XUvCvbAnmzb+x2mEHGDP/qkrFYdIi5j2F
         0N8w8v9G0pxzFJroINFcWNuk01OxrDAAOU1mWjRwlVqGZjCShedMZ0xGtdYRnzV+AGo4
         /M0g==
X-Gm-Message-State: AC+VfDyRi0qoBcctgzHrGO2B7TIfFXamq6q8JsmK/Kv/iA6DlSV7Sbac
	n2ThxN4lq/W1P8MEIuqm/mouYA==
X-Google-Smtp-Source: ACHHUZ4uChDsm+hqrC0hFT0shMYHjSV5QmD9XRjkrH+Nq9NtXqEX+3HN+pWHab7SJCmuNK8AldoJvQ==
X-Received: by 2002:adf:fac8:0:b0:313:eb8d:78e5 with SMTP id a8-20020adffac8000000b00313eb8d78e5mr6436995wrs.63.1687895108754;
        Tue, 27 Jun 2023 12:45:08 -0700 (PDT)
Received: from ?IPv6:2001:8b0:aba:5f3c:a71a:20d6:74fc:9334? ([2001:8b0:aba:5f3c:a71a:20d6:74fc:9334])
        by smtp.gmail.com with ESMTPSA id d17-20020adffbd1000000b002fb60c7995esm11342825wrs.8.2023.06.27.12.45.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 12:45:08 -0700 (PDT)
Message-ID: <9d5051857d8c97d7118296bcb7056efd23a0d0d0.camel@linuxfoundation.org>
Subject: Re: [OE-core] [PATCH V2] flac: upgrade 1.4.0 -> 1.4.2
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: cp0613 <cp0613@linux.alibaba.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2023 20:45:07 +0100
In-Reply-To: <b08ae6a31bca73e15a176c7965e25125f6d18b5b.camel@linuxfoundation.org>
References: <20221121132515.2028-1-cp0613@linux.alibaba.com>
	 <20221122015407.838-1-cp0613@linux.alibaba.com>
	 <b08ae6a31bca73e15a176c7965e25125f6d18b5b.camel@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.1-0ubuntu1 
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Jun 2023 19:45:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/183502

On Tue, 2023-06-27 at 20:43 +0100, Richard Purdie wrote:
> On Tue, 2022-11-22 at 09:54 +0800, cp0613 wrote:
> > From: Chen Pei <cp0613@linux.alibaba.com>
> >=20
> > This small version release only has a few changes, but fixes several bu=
gs.
> >=20
> > License-Update:
> > 	File removed
> > 	License URL updated
> >=20
> > FLAC 1.4.2 released 2022-10-22
> > Like the last release, this release only has a few changes. A problem w=
ith FLAC playback in GStreamer (and possibly other libFLAC users) was the r=
eason for the short time since the last release.
> > Changes:
> > 	Remove xmms plugin
> > 	Remove all pure assembler, removing build dependency on nasm
> > 	Made console output more uniform across different platforms and CPUs
> > 	Improve ability to tune compile for a certain system (for example with=
 -march=3Dnative) when combining with --disable-asm-optimizations: plain C =
functions can now be better optimized
> > 	Default CFLAGS are now prepended instead of dropped when user CFLAGS a=
re set
> > 	-msse2 is no longer added by default (was only applicable to x86)
> > 	Fix cross-compiling and out-of-tree building when pandoc and doxygen a=
re not available
> > 	Fix issue with Clang not compiling functions with intrinsics
> > 	Fix detection of bswap intrinsics
> > 	Improve search for libssp on MinGW
> > 	Fix issue when the libFLAC user seeks in a file instead of libFLAC its=
elf
> >=20
> > FLAC 1.4.1 released 2022-09-22
> > This release fixes the release tarball (which was missing man pages and=
 api documentation in FLAC 1.4.0) and some build problems that were found w=
ith FLAC 1.4.0.
> > Changes:
> > 	CMake fixes
> > 	Add checks that man pages and api docs end up in tarball
> > 	Enable installation of prebuilt man pages and api docs
> > 	Fix compiler warnings
> > 	Fix format specifier
> > 	Enable building on Universal Windows Platform
> > 	Fix versioning from git
> >=20
> > Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
> > ---
> >  .../flac/{flac_1.4.0.bb =3D> flac_1.4.2.bb}                | 9 +++----=
--
> >  1 file changed, 3 insertions(+), 6 deletions(-)
> >  rename meta/recipes-multimedia/flac/{flac_1.4.0.bb =3D> flac_1.4.2.bb}=
 (80%)
> >=20
> > diff --git a/meta/recipes-multimedia/flac/flac_1.4.0.bb b/meta/recipes-=
multimedia/flac/flac_1.4.2.bb
> > similarity index 80%
> > rename from meta/recipes-multimedia/flac/flac_1.4.0.bb
> > rename to meta/recipes-multimedia/flac/flac_1.4.2.bb
> > index 360396380d..32383927a2 100644
> > --- a/meta/recipes-multimedia/flac/flac_1.4.0.bb
> > +++ b/meta/recipes-multimedia/flac/flac_1.4.2.bb
> > @@ -9,29 +9,25 @@ LIC_FILES_CHKSUM =3D "file://COPYING.FDL;md5=3Dad1419=
ecc56e060eccf8184a87c4285f \
> >                      file://COPYING.GPL;md5=3Db234ee4d69f5fce4486a80fda=
f4a4263 \
> >                      file://src/flac/main.c;beginline=3D1;endline=3D18;=
md5=3D893456854ce6bf14a1a7ea77266eebab \
> >                      file://COPYING.LGPL;md5=3Dfbc093901857fcd118f065f9=
00982c24 \
> > -                    file://src/plugin_common/all.h;beginline=3D1;endli=
ne=3D18;md5=3D73c74192ce89ee6238d15a171e00c971 \
> >                      file://COPYING.Xiph;md5=3D3d6da238b5b57a0965d67302=
91119f65 \
> > -                    file://include/FLAC/all.h;beginline=3D65;endline=
=3D70;md5=3D64474f2b22e9e77b28d8b8b25c983a48"
> > +                    file://include/FLAC/all.h;beginline=3D65;endline=
=3D70;md5=3D39aaf5e03c7364363884c8b8ddda8eea"
> > =20
> >  SRC_URI =3D "http://downloads.xiph.org/releases/flac/${BP}.tar.xz"
> > -SRC_URI[sha256sum] =3D "af41c0733c93c237c3e52f64dd87e3b0d9af38259f1c7d=
11e8cbf583c48c2506"
> > +SRC_URI[sha256sum] =3D "e322d58a1f48d23d9dd38f432672865f6f79e73a6f9cc5=
a5f57fcaa83eb5a8e4"
> > =20
> >  CVE_PRODUCT =3D "libflac flac"
> > =20
> >  inherit autotools gettext
> > =20
> >  EXTRA_OECONF =3D "--disable-oggtest \
> > -                --disable-xmms-plugin \
> >                  --without-libiconv-prefix \
> >                  ac_cv_prog_NASM=3D"" \
> >                  "
> > =20
> >  PACKAGECONFIG ??=3D " \
> >      ${@bb.utils.filter("TUNE_FEATURES", "altivec vsx", d)} \
> > -    ${@bb.utils.contains_any("TUNE_FEATURES", "core2 corei7", "sse", "=
", d)} \
> >      ogg \
> >  "
> > -PACKAGECONFIG[sse] =3D "--enable-sse,--disable-sse"
> >  PACKAGECONFIG[altivec] =3D "--enable-altivec,--disable-altivec"
> >  PACKAGECONFIG[vsx] =3D "--enable-vsx,--disable-vsx"
> >  PACKAGECONFIG[avx] =3D "--enable-avx,--disable-avx"
> > @@ -41,3 +37,4 @@ PACKAGES +=3D "libflac libflac++"
> >  FILES:${PN} =3D "${bindir}/*"
> >  FILES:libflac =3D "${libdir}/libFLAC.so.*"
> >  FILES:libflac++ =3D "${libdir}/libFLAC++.so.*"
> > +
>=20
> On qemuppc this is showing:
>=20
> https://autobuilder.yoctoproject.org/typhoon/#/builders/107/builds/4775/s=
teps/12/logs/warnings
>=20
> WARNING: flac-1.4.3-r0 do_configure: QA Issue: flac: invalid PACKAGECONFI=
G: altivec [invalid-packageconfig]
>=20
> so I suspect there is another tweak needed there?

Sorry, wrong patch. This is against the 1.4.3 upgrade so I've replied
to that.

Cheers,

Richard

