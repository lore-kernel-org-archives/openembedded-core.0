Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 575BFC00A5A
	for <webhook@archiver.kernel.org>; Thu, 19 Jan 2023 16:52:42 +0000 (UTC)
Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
 by mx.groups.io with SMTP id smtpd.web10.50645.1674147156606960064
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Jan 2023 08:52:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=hz53mEu4;
 spf=pass (domain: gmail.com, ip: 209.85.161.47, mailfrom: raj.khem@gmail.com)
Received: by mail-oo1-f47.google.com with SMTP id j10-20020a4aa64a000000b004f9b746ee29so612399oom.0
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 08:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vawqZvg88W+RjEoEmkQ/v48AP71l4fYWSEu+6jUDavQ=;
        b=hz53mEu4/BeqGmueZAhZJDxM8QsYjaUCdF62JhpBD0C1M9sGqE996DoO2lYj6vl2H8
         Ip1RywLHqz7OQ2BuoDJwfiHPVd8ED/IK6eFpngBVW2SEbeaAiweVCIybltMmmTu4b/UO
         P53alZipV7ni1/RwBBQNfJN44vmgPOdO0itGZL54/3T2BVmKRHfp68JjWJSqfhvz6Ywu
         QL5W+pqjio2c0PrwpbxvwfkI+//HKh/5ZmxXLIfqZ76G6DrqRly3fUfTwpx4njANOetY
         h8reZmchz0DRi0NCGMX9vPpPwBtmBBhOtFTGDM3ddLaMiKkA6HhXaDVwpNtrA887dDb7
         CjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vawqZvg88W+RjEoEmkQ/v48AP71l4fYWSEu+6jUDavQ=;
        b=bsJA7fFk5xPUEv37dMmBdOv9NW6XLPXUquWFAZo/tjEd5AGK3+Oe659aXqpvp0eU1N
         EFuBDlIOzYmTt5hM0+qnYmIt/5F2VG3VroYSDvst3WOf3G3zt2aGugjDpsAwovFy8wl6
         n5JVXyB66oK6N3l2PQgAA6E2VGF6HvkR0S5Mijiae83+1u+zu4gDa39CRL/gVdoQG5IC
         w4YqV6BqmovaEps0pg5jNhKqK4zELy87mMMXqm+6h9tptkXh/vKITfwvMd8sLxpZd/rs
         ez6wRWSQZAQOu3jCcbdRG7rrQ2hJgsvAMNADw0BVGEGWr5ig39pc8LC2wgEVd4NKBjtF
         nqOA==
X-Gm-Message-State: AFqh2kqqtf3YbS6VYvEG2rPonC+194mw8rOXRsr4XVpWQM8KCO9p9vjT
	cIS3E3GKHNZG0vw/23pXGYwZNv6QwxsZF4R+tOO/Ft5o8J8=
X-Google-Smtp-Source: AMrXdXtAPESEogrkQ7KtnDP3VgzWA06XXbT/5thDVo77/2IqnRllu0f5CwJdp9kGRh33NU3iSMvoxWte11EzDG588is=
X-Received: by 2002:a4a:3513:0:b0:4b1:52d7:5963 with SMTP id
 l19-20020a4a3513000000b004b152d75963mr508750ooa.73.1674147155773; Thu, 19 Jan
 2023 08:52:35 -0800 (PST)
MIME-Version: 1.0
References: <20230119042724.1413857-1-raj.khem@gmail.com> <20230119104413.0afa6711@booty>
In-Reply-To: <20230119104413.0afa6711@booty>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 19 Jan 2023 08:52:09 -0800
Message-ID: <CAMKF1sr=HFFJJ-HNe2r3rn0zeD4Fw5Fxn69jde9EE_ZBFvJtEA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2 1/3] binutils: Upgrade to 2.40 release
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: openembedded-core@lists.openembedded.org, 
	Alejandro Hernandez <aehs29@gmail.com>, Richard Purdie <rpurdie@rpsys.net>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 19 Jan 2023 16:52:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/176150

On Thu, Jan 19, 2023 at 1:44 AM Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
>
> Hi Khem,
>
> On Wed, 18 Jan 2023 20:27:22 -0800
> "Khem Raj" <raj.khem@gmail.com> wrote:
>
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> > v1 -> v2:
> > - Fix build on mingw
> > - Backport fix to build with --disable-gdb
> >
> >  meta/conf/distro/include/tcmode-default.inc   |     2 +-
> >  .../{binutils-2.39.inc => binutils-2.40.inc}  |    22 +-
> >  ....39.bb => binutils-cross-canadian_2.40.bb} |     0
> >  ...39.bb => binutils-cross-testsuite_2.40.bb} |     0
> >  ...s-cross_2.39.bb => binutils-cross_2.40.bb} |     0
> >  ...ssdk_2.39.bb => binutils-crosssdk_2.40.bb} |     0
> >  ...s-crosssdk-Generate-relocatable-SDKs.patch |    10 +-
> >  ...o-not-generate-linker-script-directo.patch |     4 +-
> >  ...dk-Search-for-alternative-ld.so.conf.patch |    18 +-
> >  ...004-Point-scripts-location-to-libdir.patch |    10 +-
> >  ...stro-compiler-point-to-the-wrong-ins.patch |     4 +-
> >  ...-system-directories-when-cross-linki.patch |    44 +-
> >  ...ect-assembling-for-ppc-wait-mnemonic.patch |     8 +-
> >  .../binutils/0008-Use-libtool-2.4.patch       | 19254 ++++++++++------
> >  ...h-in-libtool-when-sysroot-is-enabled.patch |     2 +-
> >  .../0010-sync-with-OE-libtool-changes.patch   |     2 +-
> >  ...or-clang-before-checking-gcc-version.patch |    10 +-
> >  ...-RPATH-entry-if-LD_RUN_PATH-is-not-e.patch |     4 +-
> >  .../binutils/0013-CVE-2022-38533.patch        |    36 -
> >  ...sing-_Alignof-when-using-C11-or-newe.patch |    48 +
> >  .../binutils/0014-CVE-2022-38128-1.patch      |   350 -
> >  .../binutils/0014-CVE-2022-38128-2.patch      |   536 -
> >  .../binutils/0014-CVE-2022-38128-3.patch      |    95 -
> >  ...-dependencies-on-gmp-and-mpfr-when-g.patch |    56 +
> >  .../binutils/0015-CVE-2022-4285.patch         |    37 -
> >  ...-pe-dll.o-entry-deom-targ_extra_ofil.patch |    41 +
> >  .../{binutils_2.39.bb => binutils_2.40.bb}    |     0
> >  27 files changed, 11820 insertions(+), 8773 deletions(-)
> >  rename meta/recipes-devtools/binutils/{binutils-2.39.inc => binutils-2.40.inc} (71%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross-canadian_2.39.bb => binutils-cross-canadian_2.40.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross-testsuite_2.39.bb => binutils-cross-testsuite_2.40.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-cross_2.39.bb => binutils-cross_2.40.bb} (100%)
> >  rename meta/recipes-devtools/binutils/{binutils-crosssdk_2.39.bb => binutils-crosssdk_2.40.bb} (100%)
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0013-CVE-2022-38533.patch
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/0013-Define-alignof-using-_Alignof-when-using-C11-or-newe.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-1.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-2.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0014-CVE-2022-38128-3.patch
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/0014-configure-remove-dependencies-on-gmp-and-mpfr-when-g.patch
> >  delete mode 100644 meta/recipes-devtools/binutils/binutils/0015-CVE-2022-4285.patch
> >  create mode 100644 meta/recipes-devtools/binutils/binutils/0015-Remove-duplicate-pe-dll.o-entry-deom-targ_extra_ofil.patch
> >  rename meta/recipes-devtools/binutils/{binutils_2.39.bb => binutils_2.40.bb} (100%)
> >
> > diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
> > index 4d4929529a..bcc5f7ce1f 100644
> > --- a/meta/conf/distro/include/tcmode-default.inc
> > +++ b/meta/conf/distro/include/tcmode-default.inc
> > @@ -18,7 +18,7 @@ PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
> >
> >  GCCVERSION ?= "12.%"
> >  SDKGCCVERSION ?= "${GCCVERSION}"
> > -BINUVERSION ?= "2.39%"
> > +BINUVERSION ?= "2.40%"
> >  GDBVERSION ?= "12.%"
> >  GLIBCVERSION ?= "2.37"
> >  LINUXLIBCVERSION ?= "6.1%"
>
> Applying this patch on an oe-core repository fails with 'git am':
>
> error: sha1 information is lacking or useless (meta/conf/distro/include/tcmode-default.inc).
> error: could not build fake ancestor
> Patch failed at 0001 binutils: Upgrade to 2.40 release
>
> And also with 'git apply'
>
> error: patch failed: meta/conf/distro/include/tcmode-default.inc:18
> error: meta/conf/distro/include/tcmode-default.inc: patch does not apply

It might be due to glibc 2.37 upgrade which I have in my local tree
staged as well.
you might edit it locally. If you want I can push it to a dedicated branch

>
> I noticed you prepared the patch in a poky repository, so I did apply
> it there, re-extracted it via 'git format-patch' and the resulting
> patch applied perfectly on my oe-core. This happened with your v1 as
> well a couple days ago.
>
> I don't understand the root cause and definitely there are no recent
> commits that create conflicts. However I'm wondering whether you could
> move to working on actual oe-core instead of poky. It would certainly
> help me.
>
> Kind regards,
> Luca
>
> --
> Luca Ceresoli, Bootlin
> Embedded Linux and Kernel engineering
> https://bootlin.com

