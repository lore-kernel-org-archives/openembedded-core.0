Return-Path: <mikko.rapeli@linaro.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58C28C6FD1D
	for <webhook@archiver.kernel.org>; Fri, 17 Mar 2023 12:01:38 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web10.17363.1679054493744791241
 for <openembedded-core@lists.openembedded.org>;
 Fri, 17 Mar 2023 05:01:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linaro.org header.s=google header.b=xSuwyJ71;
 spf=pass (domain: linaro.org, ip: 209.85.167.46, mailfrom: mikko.rapeli@linaro.org)
Received: by mail-lf1-f46.google.com with SMTP id b10so4969519lfb.9
        for <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 05:01:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1679054492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RYOqukYmbtYzASP+gDWH9ot6gGSjZBia29V4wSB5TTc=;
        b=xSuwyJ71QfDXBW02L+vb1PbbsiML6CeWDoIA9z4cYeQAT9eccFN7ItCagTnlMO5y9t
         ZhMsxrgZLkt7qTQXgfPqg/s4kmvBhxOwAce+zXOAolGuUyDEza7S6N/kIex51rDMnvj2
         UFJeHtFt+q5GfKtwupDkfjh7IXxHb48nwfqbgub1xYgTm6fMOe4lMT/QZkrAjexBQP18
         qXH5FLuZI2mBYTa+xca8SlLsKScOLchiWmWn1wEJVPOHFOAv/DHF8K9O1sSntbQBsoqA
         9pV6rBUt/IrhqauPz2wc2tyJybNyG28CbI10CvksbrMt5oEF4Uxysh9NLwxRMG3gVFO8
         ia6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679054492;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RYOqukYmbtYzASP+gDWH9ot6gGSjZBia29V4wSB5TTc=;
        b=UxuWK+3R6Va1PEzDpZHY1ZuXnxj1eUw6Z0kXdemiM1H+0KTK7tZsgoSx/tlK/YK519
         Yi5NLcoFiv+B6ndCtycHL40mUgIwBaguA85f/P2HYyuI9qgf3pcdRosHo9aAGIv1PdN9
         5H8ckZzMa1n4XydKrF3nuaFSps98xomhKb/u0jmOfDsJf/YTFGbmqEw3rZJiqPxrYFLd
         w6Sc5qJeUpY4DfrJOyYPSRoWHA7BCRN4Hqq/BSLYpjRlWC94D+Y5VoI80EvWIP4JYtRF
         jJJtsBXFGlI9klzMpRnv00Ogp5JfyJi+HrYEtIBXTsKPeEjPJ9H7J3UVE9Y1QIAvEnGc
         DL3A==
X-Gm-Message-State: AO0yUKVIM0UL6BbPE0j8w/Tme4vtDw3toINRPAxjrUEfPirV8tpFpV50
	Xb0j4YJy29Y6xhyUVEu6qMw+dg==
X-Google-Smtp-Source: AK7set/Z4eiN+Dm36ddX220N4cV468ehRIWclFspwNpGYyZny1kCRKaEWb69U6anE/Funv9tAtEd4g==
X-Received: by 2002:ac2:560b:0:b0:4dc:7e7a:a72f with SMTP id v11-20020ac2560b000000b004dc7e7aa72fmr4101626lfd.16.1679054491617;
        Fri, 17 Mar 2023 05:01:31 -0700 (PDT)
Received: from nuoska (dc7g6tyjby-d304c4945t-3.rev.dnainternet.fi. [2001:14ba:16cb:a800:e107:c77f:6058:ee33])
        by smtp.gmail.com with ESMTPSA id b8-20020ac25628000000b004dc7fae3cfcsm343595lff.75.2023.03.17.05.01.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 05:01:31 -0700 (PDT)
Date: Fri, 17 Mar 2023 14:01:29 +0200
From: Mikko Rapeli <mikko.rapeli@linaro.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Jerome Forissier <jerome.forissier@linaro.org>,
	openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] e2fsprogs: switch from master to debian/master
 branch to fix compatibility
Message-ID: <ZBRWmcQjRoq631S8@nuoska>
References: <20230317100923.3295331-1-mikko.rapeli@linaro.org>
 <CANNYZj_RVtE=Ud1Tmcr5H0_zQZS_SK+5CT1ro4oanudVdTfBWQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANNYZj_RVtE=Ud1Tmcr5H0_zQZS_SK+5CT1ro4oanudVdTfBWQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 17 Mar 2023 12:01:38 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178751

Hi,

On Fri, Mar 17, 2023 at 11:39:23AM +0100, Alexander Kanavin wrote:
> This doesn’t seem right. We should not give special privileges to tooling
> from any particular host distro. If you need to manipulate images, build
> e2fsprogs-native and run that.

This is about ext4 images breaking compatibility with older versions of
tooling used manipulate the images. For Debian the upstream maintainers
and Debian package maintainers agreed to keep the backwards
compatibility for longer time. I think that makes sense for yocto too.

While I agree that using e2fsprogs-native is a solution too, I also
agree that a lot of users are using non-yocto e2fsprogs when e.g.
flashing images to target HW. Breaking compatibility can quite simply be
avoided and upstream will maintain this branch. Win win from my point of
view.

Cheers,

-Mikko

> Alex
> 
> On Fri 17. Mar 2023 at 10.09, Mikko Rapeli <mikko.rapeli@linaro.org> wrote:
> 
> > From: Jerome Forissier <jerome.forissier@linaro.org>
> >
> > When trying to use e2fsck <= 1.47.0 on the root filesystem (for example,
> > to resize a partition after copying the image to a USB stick on a
> > computer running current Ubuntu [22.04] or Debian), an error is
> > reported:
> >
> >  e2fsck 1.46.5 (30-Dec-2021)
> >  /dev/sdb2 has unsupported feature(s): FEATURE_C12
> >  e2fsck: Get a newer version of e2fsck!
> >
> > This has been discussed in [2] and a fix was made for use by
> > Debian-based distros in [3]. Let's pick that version.
> >
> > Link: [1] https://gitlab.com/Linaro/trusted-reference-stack/trs/-/issues/1
> > Link: [2] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1031622
> > Link: [3]
> > https://git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git/commit/?h=debian/master&id=1181f164c48574a4813bfa203dbd7b4123154021
> >
> > Binary compatibility of generated ext4 file system images is important
> > so it's better to use the "debian/master" branch.
> >
> > Signed-off-by: Jerome Forissier <jerome.forissier@linaro.org>
> > Signed-off-by: Mikko Rapeli <mikko.rapeli@linaro.org>
> > ---
> >  meta/recipes-devtools/e2fsprogs/e2fsprogs.inc                   | 2 +-
> >  .../e2fsprogs/{e2fsprogs_1.47.0.bb => e2fsprogs_1.47.0-2.bb}    | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.47.0.bb =>
> > e2fsprogs_1.47.0-2.bb} (99%)
> >
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > index f41a5d0b4e..2f54896e8c 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs.inc
> > @@ -19,7 +19,7 @@ LIC_FILES_CHKSUM =
> > "file://NOTICE;md5=d50be0580c0b0a7fbc7a4830bbe6c12b \
> >  SECTION = "base"
> >  DEPENDS = "util-linux attr autoconf-archive"
> >
> > -SRC_URI = "git://
> > git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=master"
> > +SRC_URI = "git://
> > git.kernel.org/pub/scm/fs/ext2/e2fsprogs.git;branch=debian/master"
> >  S = "${WORKDIR}/git"
> >
> >  inherit autotools gettext texinfo pkgconfig multilib_header
> > update-alternatives ptest
> > diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> > similarity index 99%
> > rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> > index 2620610903..9bf89ba0c4 100644
> > --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0.bb
> > +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.47.0-2.bb
> > @@ -10,7 +10,7 @@ SRC_URI:append:class-native = " \
> >             file://quiet-debugfs.patch \
> >             "
> >
> > -SRCREV = "f4c9cc4bedacde8408edda3520a32d3842290112"
> > +SRCREV = "1181f164c48574a4813bfa203dbd7b4123154021"
> >  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
> >
> >  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
> > --
> > 2.34.1
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#178747):
> > https://lists.openembedded.org/g/openembedded-core/message/178747
> > Mute This Topic: https://lists.openembedded.org/mt/97669707/1686489
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> > alex.kanavin@gmail.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
> >

