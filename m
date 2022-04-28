Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0CD59C433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Apr 2022 20:37:31 +0000 (UTC)
Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com
 [209.85.219.47])
 by mx.groups.io with SMTP id smtpd.web10.2167.1651178241497814219
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:37:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=EYt4sZV9;
 spf=pass (domain: gmail.com, ip: 209.85.219.47, mailfrom: raj.khem@gmail.com)
Received: by mail-qv1-f47.google.com with SMTP id q13so4058174qvk.3
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Apr 2022 13:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XNZQE4bEALntiGzeDfuJ7bsyEeGODZ6UC4TX3bZd0IY=;
        b=EYt4sZV98CY3PmDPWSFPqwVdPEIcabOqr9jaxntH3k/Y9nMhTJv94Nl2gHS6vcScxE
         A4IkMj/vdH6RXoIo0hRkojD6x6a4lKXMX9SHhBEXdBdSJ83Sl3kdCFagS9pszRrwrCo9
         5MddaLSkICOZUtZhYt0SoJ86pbPT3oXAEXRkypx94Xd2+NlEDew7Bl6gOrcWx7FVTN1j
         fl+SduEeKpsDCZtwd3U6c03v2zpedpwfs9YcYGbSnhUCtgP3ld/ISCdT1GHOytOFfvHa
         qJaURKZ1L3zXIxrCzfqtdorhNz5w4dDVOhNj0i+t90Yx4PMDek3RSH9pkLE1zlM67ViY
         uQow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XNZQE4bEALntiGzeDfuJ7bsyEeGODZ6UC4TX3bZd0IY=;
        b=ufFfICOlMVsqDvcPsd6Uhai/z4iZ7OMEvfceo7hAXTQ4PsDfo6xV0u6rARSIqX53cN
         BS0lsK3EjNtPE1tdOPwdF+vsNRGDy6/fMlwH2jMaWl25XhW+1fjRdL+n2cXhWySimpH9
         Kbfbep3bJrgXJ0v84x1/5q5V8rHJ6HiAW9CcRtYVwy5bh0SFqYf02zhfW0YQISgnZ1Nb
         5xoRxxtpRzMRt5K/TpqjVH5h8mdGFJUbrV09coXwYJrXp6sxQ4LyKa2Cleika/vVcWUn
         LVpkz7wg9oEsVDHMusc8F08+tRL/DUjPj+TPACh3UvH2JeQh4haTE27Y3i/0MKGboDWh
         Ldiw==
X-Gm-Message-State: AOAM533K/s+7T9oh5lQQJUIdFNp+4eC4aIvUkuHHgzsEhfTqJvpddCoq
	3Jj19h4FTnOb4OHmuXQpoZdpiHy9Eka9byPi3Ls=
X-Google-Smtp-Source: 
 ABdhPJwpnqT4wemtBLUTYo0qkckLLW/z2IM+5DZrfwENasFEsxVHSZgBCgn8ZrVSbm8eUeLUGuZWZWQurFJSqwlZjnc=
X-Received: by 2002:a05:6214:1948:b0:456:3aac:af92 with SMTP id
 q8-20020a056214194800b004563aacaf92mr15399065qvk.24.1651178240511; Thu, 28
 Apr 2022 13:37:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220427084009.3406717-1-alex@linutronix.de>
 <20220427084009.3406717-10-alex@linutronix.de>
 <CAOSpxdb+=7exCMsnw0zFb8HVuKuPuPjz15V9DwLRfuDnkRGe9A@mail.gmail.com>
 <CAMKF1srctGWnJXOX6O=zgf+YPRLiRfKS+OJb=mAFOxr_RkkcWQ@mail.gmail.com>
 <CAGDS+nmfJeKVcq9C_jw-MVjHCGvdTqjJ8buDttBCw_B0355kGQ@mail.gmail.com>
In-Reply-To: 
 <CAGDS+nmfJeKVcq9C_jw-MVjHCGvdTqjJ8buDttBCw_B0355kGQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Apr 2022 13:36:54 -0700
Message-ID: 
 <CAMKF1srg9H=PfCrbf50y9UdcJ-T+E2vFxte9YamkK2u-4AjZuw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 10/18] go: update 1.18 -> 1.18.1
To: Steve Sakoman <steve@sakoman.com>
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	Alexander Kanavin <alex@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Apr 2022 20:37:31 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/164975

On Thu, Apr 28, 2022 at 11:00 AM Steve Sakoman <steve@sakoman.com> wrote:
>
> On Thu, Apr 28, 2022 at 7:04 AM Khem Raj <raj.khem@gmail.com> wrote:
> >
> > On Thu, Apr 28, 2022 at 9:22 AM Steve Sakoman <steve@sakoman.com> wrote:
> > >
> > > This appears to be a security/bug fix release.  Do you think it is
> > > suitable for kirkstone?
> > >
> >
> > I think so.
>
> Ah, my bad!  Kirkstone is at version 17.8.  I was confused by
> autocompletion of the go-1.18 subdirectory in the go directory when
> checking the version and assumed that it was 1.18.  So this upgrade is
> of course not suitable for kirkstone.

yeah I think we left out 1.18 out of main release intentionally IIRC
so perhaps if needed we will do a mixin layer perhaps in coming times

>
> Which begs the question, what is a go-1.18 directory doing there when
> we are at 1.17.8?

thats a typo I think 1.17.8 became 1.18 :)

>
> But from reading the recipe it seems to be intentional, so I'll move on :-)
>
> Steve
>
> > > On Tue, Apr 26, 2022 at 10:40 PM Alexander Kanavin
> > > <alex.kanavin@gmail.com> wrote:
> > > >
> > > > Do not version patch directories; we carry only one version of go.
> > > >
> > > > Signed-off-by: Alexander Kanavin <alex@linutronix.de>
> > > > ---
> > > >  meta/recipes-devtools/go/{go-1.18.inc => go-1.18.1.inc}       | 4 ++--
> > > >  .../{go-binary-native_1.18.bb => go-binary-native_1.18.1.bb}  | 4 ++--
> > > >  ...{go-cross-canadian_1.18.bb => go-cross-canadian_1.18.1.bb} | 0
> > > >  .../go/{go-cross_1.18.bb => go-cross_1.18.1.bb}               | 0
> > > >  .../go/{go-crosssdk_1.18.bb => go-crosssdk_1.18.1.bb}         | 0
> > > >  .../go/{go-native_1.18.bb => go-native_1.18.1.bb}             | 0
> > > >  .../go/{go-runtime_1.18.bb => go-runtime_1.18.1.bb}           | 0
> > > >  ...cmd-go-make-content-based-hash-generation-less-pedan.patch | 0
> > > >  ...0001-exec.go-do-not-write-linker-flags-into-buildids.patch | 0
> > > >  ...src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch | 0
> > > >  ...-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch | 0
> > > >  .../0004-ld-add-soname-to-shareable-objects.patch             | 0
> > > >  ...make.bash-override-CC-when-building-dist-and-go_boot.patch | 0
> > > >  .../0006-cmd-dist-separate-host-and-target-builds.patch       | 0
> > > >  .../0007-cmd-go-make-GOROOT-precious-by-default.patch         | 0
> > > >  meta/recipes-devtools/go/{go_1.18.bb => go_1.18.1.bb}         | 0
> > > >  16 files changed, 4 insertions(+), 4 deletions(-)
> > > >  rename meta/recipes-devtools/go/{go-1.18.inc => go-1.18.1.inc} (82%)
> > > >  rename meta/recipes-devtools/go/{go-binary-native_1.18.bb => go-binary-native_1.18.1.bb} (83%)
> > > >  rename meta/recipes-devtools/go/{go-cross-canadian_1.18.bb => go-cross-canadian_1.18.1.bb} (100%)
> > > >  rename meta/recipes-devtools/go/{go-cross_1.18.bb => go-cross_1.18.1.bb} (100%)
> > > >  rename meta/recipes-devtools/go/{go-crosssdk_1.18.bb => go-crosssdk_1.18.1.bb} (100%)
> > > >  rename meta/recipes-devtools/go/{go-native_1.18.bb => go-native_1.18.1.bb} (100%)
> > > >  rename meta/recipes-devtools/go/{go-runtime_1.18.bb => go-runtime_1.18.1.bb} (100%)
> > > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch (100%)
> > > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0001-exec.go-do-not-write-linker-flags-into-buildids.patch (100%)
> > > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch (100%)
> > > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch (100%)
> > > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0004-ld-add-soname-to-shareable-objects.patch (100%)
> > > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch (100%)
> > > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0006-cmd-dist-separate-host-and-target-builds.patch (100%)
> > > >  rename meta/recipes-devtools/go/{go-1.18 => go}/0007-cmd-go-make-GOROOT-precious-by-default.patch (100%)
> > > >  rename meta/recipes-devtools/go/{go_1.18.bb => go_1.18.1.bb} (100%)
> > > >
> > > > diff --git a/meta/recipes-devtools/go/go-1.18.inc b/meta/recipes-devtools/go/go-1.18.1.inc
> > > > similarity index 82%
> > > > rename from meta/recipes-devtools/go/go-1.18.inc
> > > > rename to meta/recipes-devtools/go/go-1.18.1.inc
> > > > index 54e241af10..64426471df 100644
> > > > --- a/meta/recipes-devtools/go/go-1.18.inc
> > > > +++ b/meta/recipes-devtools/go/go-1.18.1.inc
> > > > @@ -1,6 +1,6 @@
> > > >  require go-common.inc
> > > >
> > > > -FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go-1.18:"
> > > > +FILESEXTRAPATHS:prepend := "${FILE_DIRNAME}/go:"
> > > >
> > > >  LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> > > >
> > > > @@ -14,4 +14,4 @@ SRC_URI += "\
> > > >      file://0001-exec.go-do-not-write-linker-flags-into-buildids.patch \
> > > >      file://0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch \
> > > >  "
> > > > -SRC_URI[main.sha256sum] = "38f423db4cc834883f2b52344282fa7a39fbb93650dc62a11fdf0be6409bdad6"
> > > > +SRC_URI[main.sha256sum] = "efd43e0f1402e083b73a03d444b7b6576bb4c539ac46208b63a916b69aca4088"
> > > > diff --git a/meta/recipes-devtools/go/go-binary-native_1.18.bb b/meta/recipes-devtools/go/go-binary-native_1.18.1.bb
> > > > similarity index 83%
> > > > rename from meta/recipes-devtools/go/go-binary-native_1.18.bb
> > > > rename to meta/recipes-devtools/go/go-binary-native_1.18.1.bb
> > > > index 500bb4ddcc..da9f39f428 100644
> > > > --- a/meta/recipes-devtools/go/go-binary-native_1.18.bb
> > > > +++ b/meta/recipes-devtools/go/go-binary-native_1.18.1.bb
> > > > @@ -8,8 +8,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
> > > >  PROVIDES = "go-native"
> > > >
> > > >  SRC_URI = "https://dl.google.com/go/go${PV}.${BUILD_GOOS}-${BUILD_GOARCH}.tar.gz;name=go_${BUILD_GOTUPLE}"
> > > > -SRC_URI[go_linux_amd64.sha256sum] = "e85278e98f57cdb150fe8409e6e5df5343ecb13cebf03a5d5ff12bd55a80264f"
> > > > -SRC_URI[go_linux_arm64.sha256sum] = "7ac7b396a691e588c5fb57687759e6c4db84a2a3bbebb0765f4b38e5b1c5b00e"
> > > > +SRC_URI[go_linux_amd64.sha256sum] = "b3b815f47ababac13810fc6021eb73d65478e0b2db4b09d348eefad9581a2334"
> > > > +SRC_URI[go_linux_arm64.sha256sum] = "56a91851c97fb4697077abbca38860f735c32b38993ff79b088dac46e4735633"
> > > >
> > > >  UPSTREAM_CHECK_URI = "https://golang.org/dl/"
> > > >  UPSTREAM_CHECK_REGEX = "go(?P<pver>\d+(\.\d+)+)\.linux"
> > > > diff --git a/meta/recipes-devtools/go/go-cross-canadian_1.18.bb b/meta/recipes-devtools/go/go-cross-canadian_1.18.1.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-cross-canadian_1.18.bb
> > > > rename to meta/recipes-devtools/go/go-cross-canadian_1.18.1.bb
> > > > diff --git a/meta/recipes-devtools/go/go-cross_1.18.bb b/meta/recipes-devtools/go/go-cross_1.18.1.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-cross_1.18.bb
> > > > rename to meta/recipes-devtools/go/go-cross_1.18.1.bb
> > > > diff --git a/meta/recipes-devtools/go/go-crosssdk_1.18.bb b/meta/recipes-devtools/go/go-crosssdk_1.18.1.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-crosssdk_1.18.bb
> > > > rename to meta/recipes-devtools/go/go-crosssdk_1.18.1.bb
> > > > diff --git a/meta/recipes-devtools/go/go-native_1.18.bb b/meta/recipes-devtools/go/go-native_1.18.1.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-native_1.18.bb
> > > > rename to meta/recipes-devtools/go/go-native_1.18.1.bb
> > > > diff --git a/meta/recipes-devtools/go/go-runtime_1.18.bb b/meta/recipes-devtools/go/go-runtime_1.18.1.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-runtime_1.18.bb
> > > > rename to meta/recipes-devtools/go/go-runtime_1.18.1.bb
> > > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch b/meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-1.18/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > > rename to meta/recipes-devtools/go/go/0001-cmd-go-make-content-based-hash-generation-less-pedan.patch
> > > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch b/meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-1.18/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
> > > > rename to meta/recipes-devtools/go/go/0001-exec.go-do-not-write-linker-flags-into-buildids.patch
> > > > diff --git a/meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch b/meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-1.18/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
> > > > rename to meta/recipes-devtools/go/go/0001-src-cmd-dist-buildgo.go-do-not-hardcode-host-compile.patch
> > > > diff --git a/meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch b/meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-1.18/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > > > rename to meta/recipes-devtools/go/go/0003-allow-GOTOOLDIR-to-be-overridden-in-the-environment.patch
> > > > diff --git a/meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch b/meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-1.18/0004-ld-add-soname-to-shareable-objects.patch
> > > > rename to meta/recipes-devtools/go/go/0004-ld-add-soname-to-shareable-objects.patch
> > > > diff --git a/meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch b/meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-1.18/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > > > rename to meta/recipes-devtools/go/go/0005-make.bash-override-CC-when-building-dist-and-go_boot.patch
> > > > diff --git a/meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-1.18/0006-cmd-dist-separate-host-and-target-builds.patch
> > > > rename to meta/recipes-devtools/go/go/0006-cmd-dist-separate-host-and-target-builds.patch
> > > > diff --git a/meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch b/meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go-1.18/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > > > rename to meta/recipes-devtools/go/go/0007-cmd-go-make-GOROOT-precious-by-default.patch
> > > > diff --git a/meta/recipes-devtools/go/go_1.18.bb b/meta/recipes-devtools/go/go_1.18.1.bb
> > > > similarity index 100%
> > > > rename from meta/recipes-devtools/go/go_1.18.bb
> > > > rename to meta/recipes-devtools/go/go_1.18.1.bb
> > > > --
> > > > 2.30.2
> > > >
> > > >
> > > >
> > > >
> > >
> > >
> > >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#164971): https://lists.openembedded.org/g/openembedded-core/message/164971
> > Mute This Topic: https://lists.openembedded.org/mt/90726566/3617601
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [sakoman@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >

