Return-Path: <sakoman@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90A5C433F5
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 18:00:49 +0000 (UTC)
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
 [209.85.166.52])
 by mx.groups.io with SMTP id smtpd.web09.213.1651168843049164384
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 11:00:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=v0hDBQXq;
 spf=pass (domain: gmail.com, ip: 209.85.166.52, mailfrom: sakoman@gmail.com)
Received: by mail-io1-f52.google.com with SMTP id z18so6932052iob.5
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 11:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EydvbUM0qTMb86IUaDTm5JLUXCsEeLTNCjj85Q2bG8E=;
        b=v0hDBQXqZ4amkQL5JQ66BNWea3ykHNy/3JaW3TTyNt6TP7P8odkmSvL+bdkRrYcn5C
         0qtS4DuCIZKtV+4sa7dEptI89YPVHdwtytEFw3jeWXoFrvPITMBLzQW9onlCrzyldV3q
         7RSXXWj1fBKTBQmS7aQUKpmHywZ7ARaO7Y0OifMxtq1mv9kz0Pilij2ytSBlok/MGXak
         WnuhSRkxCaeaZP0qsOAB2l7aB5H1q2/55C5touU35GF03eyCYHKTuzlUR7h9JRw4rCjY
         gOL6RNEj9wc16i7VCZPPUSbSgpZjJ4h05LsG4nMRiOOWnWUwbtTzkf49C61Qaqal7bAp
         MDow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EydvbUM0qTMb86IUaDTm5JLUXCsEeLTNCjj85Q2bG8E=;
        b=ObDK1UwohJpIqCRwHXnNO4Xryv5tNik/VGAoe/8aWAbGeJBjTCtR6H26/dkKiMlL7V
         exf7jUYLegwv6q8V4CEG6Eir3zqmZmjxiW27m51QiUgbgkxqV1wBHO/CJZoubKxK8gKB
         eigJehxoR4gxnWQivywzX7tVWI0cxe5HmOdSxj03cwiILcxE8lqqAwH4gOScGK6PMGAi
         4p9AVFqhxh8P0p65WvSOLm5ZZerei06wSYtXsNLf6/0GadxXsTXrpkBFd0dJ1ISVel5V
         mFjMpEPfxGS4V5mbN+LorUT+I2ONZRLzQFnn9fgiw6F56C1tb7CcTeL7YWyB0UANOYYH
         Mc7A==
X-Gm-Message-State: AOAM5334EnreiVgkxfMkymE5WyNzyQArshV1GbZ69ELx9nP69DEr3/0M
	13LP2iwJE1jS6nJnUu170STLTIIwV1ZSzC4dWaQrRr8b
X-Google-Smtp-Source: 
 ABdhPJwV51VeHMJQlj4RLHDajw5MSMK+UqyxLuLqtQQHC9ofmERh6t+bhl0Jd/4HBz4qZDEa3VyDOW87qx/XUlSLl2Q=
X-Received: by 2002:a02:a882:0:b0:32b:2d78:9ecc with SMTP id
 l2-20020a02a882000000b0032b2d789eccmr1521230jam.200.1651168842343; Thu, 28
 Apr 2022 11:00:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220427084009.3406717-1-alex@linutronix.de>
 <20220427084009.3406717-10-alex@linutronix.de>
 <CAOSpxdb+=7exCMsnw0zFb8HVuKuPuPjz15V9DwLRfuDnkRGe9A@mail.gmail.com>
 <CAMKF1srctGWnJXOX6O=zgf+YPRLiRfKS+OJb=mAFOxr_RkkcWQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1srctGWnJXOX6O=zgf+YPRLiRfKS+OJb=mAFOxr_RkkcWQ@mail.gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Thu, 28 Apr 2022 08:00:31 -1000
Message-ID: 
 <CAGDS+nmfJeKVcq9C_jw-MVjHCGvdTqjJ8buDttBCw_B0355kGQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/18] go: update 1.18 -> 1.18.1
To: Khem Raj <raj.khem@gmail.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 18:00:49 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164973

On Thu, Apr 28, 2022 at 7:04 AM Khem Raj <raj.khem@gmail.com> wrote:
>
> On Thu, Apr 28, 2022 at 9:22 AM Steve Sakoman <steve@sakoman.com> wrote:
> >
> > This appears to be a security/bug fix release.  Do you think it is
> > suitable for kirkstone?
> >
>
> I think so.

Ah, my bad!  Kirkstone is at version 17.8.  I was confused by
autocompletion of the go-1.18 subdirectory in the go directory when
checking the version and assumed that it was 1.18.  So this upgrade is
of course not suitable for kirkstone.

Which begs the question, what is a go-1.18 directory doing there when
we are at 1.17.8?

But from reading the recipe it seems to be intentional, so I'll move on :-)

Steve

> > On Tue, Apr 26, 2022 at 10:40 PM Alexander Kanavin
> > <alex.kanavin@gmail.com> wrote:
> > >
> > > Do not version patch directories; we carry only one version of go.
> > >
> > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > ---
> > >  meta/recipes-devtools/go/{go-1.18.inc => go-1.18.1.inc}       | 4 ++--
> > >  .../{go-binary-native_1.18.bb => go-binary-native_1.18.1.bb}  | 4 ++--
> > >  ...{go-cross-canadian_1.18.bb => go-cross-canadian_1.18.1.bb} | 0
> > >  .../go/{go-cross_1.18.bb => go-cross_1.18.1.bb}               | 0
> > >  .../go/{go-crosssdk_1.18.bb => go-crosssdk_1.18.1.bb}         | 0
> > >  .../go/{go-native_1.18.bb => go-native_1.18.1.bb}             | 0
> > >  .../go/{go-runtime_1.18.bb => go-runtime_1.18.1.bb}           | 0
> > >  ...cmd-go-make-content-based-hash-generation-less-pedan.patch | 0
> > >  ...0001-exec.go-do-not-write-linker-flags-into-buildids.patch | 0
> > >  ...src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch | 0
> > >  ...-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch | 0
> > >  .../0004-ld-add-soname-to-shareable-objects.patch             | 0
> > >  ...make.bash-override-CC-when-building-dist-and-go_boot.patch | 0
> > >  .../0006-cmd-dist-separate-host-and-target-builds.patch       | 0
> > >  .../0007-cmd-go-make-GOROOT-precious-by-default.patch         | 0
> > >  meta/recipes-devtools/go/{go_1.18.bb => go_1.18.1.bb}         | 0
> > >  16 files changed, 4 insertions(+), 4 deletions(-)
> > >  rename meta/recipes-devtools/go/{go-1.18.inc => go-1.18.1.inc} (82%)
> > >  rename meta/recipes-devtools/go/{go-binary-native_1.18.bb => go-binary-native_1.18.1.bb} (83%)
> > >  rename meta/recipes-devtools/go/{go-cross-canadian_1.18.bb => go-cross-canadian_1.18.1.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-cross_1.18.bb => go-cross_1.18.1.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-crosssdk_1.18.bb => go-crosssdk_1.18.1.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-native_1.18.bb => go-native_1.18.1.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-runtime_1.18.bb => go-runtime_1.18.1.bb} (100%)
> > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch (100%)
> > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0001-exec.go-do-not-write-linker-flags-into-buildids.patch (100%)
> > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch (100%)
> > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (100%)
> > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0004-ld-add-soname-to-shareable-objects.patch (100%)
> > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (100%)
> > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0006-cmd-dist-separate-host-and-target-builds.patch (100%)
> > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0007-cmd-go-make-GOROOT-precious-by-default.patch (100%)
> > >  rename meta/recipes-devtools/go/{go_1.18.bb => go_1.18.1.bb} (100%)
> > >
> > > diff --git a/meta/recipes-devtools/go/go-1.18.inc b/meta/recipes-devtools/go/go-1.18.1.inc
> > > similarity index 82%
> > > rename from meta/recipes-devtools/go/go-1.18.inc
> > > rename to meta/recipes-devtools/go/go-1.18.1.inc
> > > index 54e241af10..64426471df 100644
> > > --- a/meta/recipes-devtools/go/go-1.18.inc
> > > +++ b/meta/recipes-devtools/go/go-1.18.1.inc
> > > @@ -1,6 +1,6 @@
> > >  require go-common.inc
> > >
> > > -FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.18:"
> > > +FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
> > >
> > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> > >
> > > @@ -14,4 +14,4 @@ SRC_URI += "\
> > >      file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
> > >      file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
> > >  "
> > > -SRC_URI[main.sha256sum] = "38f423db4cc834883f2b52344282fa7a39fbb93650dc62a11fdf0be6409bdad6"
> > > +SRC_URI[main.sha256sum] = "efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088"
> > > diff --git a/meta/recipes-devtools/go/go-binary-native_1.18.bb b/meta/recipes-devtools/go/go-binary-native_1.18.1.bb
> > > similarity index 83%
> > > rename from meta/recipes-devtools/go/go-binary-native_1.18.bb
> > > rename to meta/recipes-devtools/go/go-binary-native_1.18.1.bb
> > > index 500bb4ddcc..da9f39f428 100644
> > > --- a/meta/recipes-devtools/go/go-binary-native_1.18.bb
> > > +++ b/meta/recipes-devtools/go/go-binary-native_1.18.1.bb
> > > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> > >  PROVIDES = "go-native"
> > >
> > >  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> > > -SRC_URI[go_linux_amd64.sha256sum] = "e85278e98f57cdb150fe8409e6e5df5343ecb13cebf03a5d5ff12bd55a80264f"
> > > -SRC_URI[go_linux_arm64.sha256sum] = "7ac7b396a691e588c5fb57687759e6c4db84a2a3bbebb0765f4b38e5b1c5b00e"
> > > +SRC_URI[go_linux_amd64.sha256sum] = "b3b815f47ababac13810fc6021eb73d65478e0b2db4b09d348eefad9581a2334"
> > > +SRC_URI[go_linux_arm64.sha256sum] = "56a91851c97fb4697077abbca38860f735c32b38993ff79b088dac46e4735633"
> > >
> > >  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
> > >  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> > > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.18.bb b/meta/recipes-devtools/go/go-cross-canadian_1.18.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-cross-canadian_1.18.bb
> > > rename to meta/recipes-devtools/go/go-cross-canadian_1.18.1.bb
> > > diff --git a/meta/recipes-devtools/go/go-cross_1.18.bb b/meta/recipes-devtools/go/go-cross_1.18.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-cross_1.18.bb
> > > rename to meta/recipes-devtools/go/go-cross_1.18.1.bb
> > > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.18.bb b/meta/recipes-devtools/go/go-crosssdk_1.18.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-crosssdk_1.18.bb
> > > rename to meta/recipes-devtools/go/go-crosssdk_1.18.1.bb
> > > diff --git a/meta/recipes-devtools/go/go-native_1.18.bb b/meta/recipes-devtools/go/go-native_1.18.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-native_1.18.bb
> > > rename to meta/recipes-devtools/go/go-native_1.18.1.bb
> > > diff --git a/meta/recipes-devtools/go/go-runtime_1.18.bb b/meta/recipes-devtools/go/go-runtime_1.18.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-runtime_1.18.bb
> > > rename to meta/recipes-devtools/go/go-runtime_1.18.1.bb
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > rename to meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
> > > rename to meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
> > > rename to meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > > rename to meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch
> > > rename to meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > > rename to meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch
> > > rename to meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
> > > diff --git a/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > > rename to meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > > diff --git a/meta/recipes-devtools/go/go_1.18.bb b/meta/recipes-devtools/go/go_1.18.1.bb
> > > similarity index 100%
> > > rename from meta/recipes-devtools/go/go_1.18.bb
> > > rename to meta/recipes-devtools/go/go_1.18.1.bb
> > > --
> > > 2.30.2
> > >
> > >
> > >
> > >
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164971): https://lists.openembedded.org/g/openembedded-core/message/164971
> Mute This Topic: https://lists.openembedded.org/mt/90726566/3617601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

