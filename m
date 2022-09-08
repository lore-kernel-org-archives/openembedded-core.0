Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 130D5ECAAD5
	for <webhook@archiver.kernel.org>; Thu,  8 Sep 2022 05:31:09 +0000 (UTC)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com
 [209.85.160.49])
 by mx.groups.io with SMTP id smtpd.web12.1964.1662615063009605253
 for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 22:31:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=R43yxrOh;
 spf=pass (domain: gmail.com, ip: 209.85.160.49, mailfrom: raj.khem@gmail.com)
Received: by mail-oa1-f49.google.com with SMTP id
 586e51a60fabf-12803ac8113so8304173fac.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 07 Sep 2022 22:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=KdW3+dBnhIoBy6jj3wX4WfizJ/AzUvuOlrtrnTqTnZg=;
        b=R43yxrOh1gP/+9IV9mGaWhl1IHjnCrimhi3MNPVbi+ArQjf6+r1Ahq5OGRyhk+vMhG
         xkNsScwr9kieI2aeRBuxhz4yNmGqo+RHYVxhfrlJL66Ihc4mey53sdAygdW6PkGDMDY7
         TFpB68BOnHmsNd1pFD7Cq5KKiGQXG1pP1xX9NLuBSlBRwEm3q+0UEqNjQD445Qk97B5Y
         etD63JcVGiwF4PylcNZ1nOaPwZtaeEC3J6HvqUh/o+59r48gJzLPgM/DlYqL+sO/jOR2
         Qwnp/gyHeFtG02e21Yez1iEq4Yl8rn6JrK/9c+DVc/xKdquSmj/ezKX2Pjn5n0PnuX0X
         jWPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=KdW3+dBnhIoBy6jj3wX4WfizJ/AzUvuOlrtrnTqTnZg=;
        b=PISO+eY6jdGDouCDfqkozpHC+yInLAgNgdw4TCf7W+1ziJ9f0msUuhfYAIeEn4XI80
         ZpSVCDjFJFlcDduAGGcYniKRG5cudqKUuC05p51NtihJa/k9Tf4YKn8xbQBa+3R5qzCb
         x+pbohDyhCwro63iVP/41Ny1Uan0BYpREHZOlpfH+9dVVDGpHSKwFUuxAWLqwNg/HriO
         3kfpuLVH/0esnoE41ElJsayw9iSdr8F5EleM+DmETmWrMOAt6wTMqvhNWgKdYM/lNFXO
         9KDvkqmo9HH7zSpH3Orb8u3F7qT5/EZ7CRiAnR78juvumiF6tpS//RruPaCoqXjczpIW
         3Giw==
X-Gm-Message-State: ACgBeo3SLyjaHAloxdERpzrXi1oUsrNJVI38cyVb4E4rqJWE+V8L4TQz
	z6a1JnCFdMlwi3Do4Y30dXNHDpgg/B7GefKM4z4=
X-Google-Smtp-Source: 
 AA6agR70keZUr5pmNAbGYWyfoCVgiAqfxqI/1aA2BW7wL61cjOZossRBHxS/lYo+8EsXfzLr1AHr40JKy2T5FCIR1WY=
X-Received: by 2002:a05:6870:b00b:b0:127:2d3d:3c16 with SMTP id
 y11-20020a056870b00b00b001272d3d3c16mr964317oae.262.1662615062174; Wed, 07
 Sep 2022 22:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20220903092100.3544874-1-raj.khem@gmail.com>
 <468d4b98-b086-c5db-281d-678c21522492@windriver.com>
 <CAMKF1sqBszEhk9GwnQJ_496Vpki5JftokgUfSJPBcYyp_TNnNg@mail.gmail.com>
 <4af7cd6a-117a-d952-7701-3c5000d81936@windriver.com>
In-Reply-To: <4af7cd6a-117a-d952-7701-3c5000d81936@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Sep 2022 22:30:35 -0700
Message-ID: 
 <CAMKF1srQ3SpD+=kFQfAnhhVm4zkiwKPXXcbEkghusLQ6BRDZBQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] webkitgtk: Update to 2.6.37
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Sep 2022 05:31:09 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170449

https://patchwork.yoctoproject.org/project/oe-core/patch/20220908021846.2245323-1-raj.khem@gmail.com/

On Wed, Sep 7, 2022 at 9:16 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Hi Khem,
>
> On 9/8/22 10:19, Khem Raj wrote:
> > [Please note: This e-mail is from an EXTERNAL e-mail address]
> >
> > On Wed, Sep 7, 2022 at 6:43 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
> >>
> >>
> >> Fail to build on beaglebone-yocto.
> >>
> >> /build/tmp-glibc/work/cortexa8hf-neon-wrs-linux-gnueabi/webkitgtk/2.36.7-r0/webkitgtk-2.36.7/Source/W
> >> ebCore/platform/graphics/filters/FELighting.h:72:41: error:
> >> 'LightingData' does not name a type
> >>      72 |     inline void platformApplyNeon(const LightingData&, const
> >> LightSource::PaintingData&);
> >>         |                                         ^~~~~~~~~~~~
> >>
> >
> > there is a proposed patch upstream. I have taken that and applied. The
> > patch is on ml.
> > while you are at it. Please test that patch out and report if the
> > issue is solved.
>
> Which patch is supposed to resolve the issue on the mail list?
>
> Thanks,
>
> >
> >> Thanks,
> >>
> >> On 9/3/22 17:21, Khem Raj wrote:
> >>> [Please note: This e-mail is from an EXTERNAL e-mail address]
> >>>
> >>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >>> ---
> >>>    .../webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb}        | 3 +--
> >>>    1 file changed, 1 insertion(+), 2 deletions(-)
> >>>    rename meta/recipes-sato/webkit/{webkitgtk_2.36.6.bb => webkitgtk_2.36.7.bb} (98%)
> >>>
> >>> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> >>> similarity index 98%
> >>> rename from meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
> >>> rename to meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> >>> index 37b977f9ba..026e24ae39 100644
> >>> --- a/meta/recipes-sato/webkit/webkitgtk_2.36.6.bb
> >>> +++ b/meta/recipes-sato/webkit/webkitgtk_2.36.7.bb
> >>> @@ -16,8 +16,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
> >>>               file://reproducibility.patch \
> >>>               file://0001-When-building-introspection-files-do-not-quote-CFLAG.patch \
> >>>               "
> >>> -
> >>> -SRC_URI[sha256sum] = "1193bc821946336776f0dfa5e0dca5651f1e57157eda12da4721d2441f24a61a"
> >>> +SRC_URI[sha256sum] = "0c260cf2b32f0481d017670dfed1b61e554967cd067195606c9f9eb5fe731743"
> >>>
> >>>    inherit cmake pkgconfig gobject-introspection perlnative features_check upstream-version-is-even gtk-doc
> >>>
> >>> --
> >>> 2.37.3
> >>>
> >>>
> >>>
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>> Links: You receive all messages sent to this group.
> >>> View/Reply Online (#170267): https://lists.openembedded.org/g/openembedded-core/message/170267
> >>> Mute This Topic: https://lists.openembedded.org/mt/93436476/3618448
> >>> Group Owner: openembedded-core+owner@lists.openembedded.org
> >>> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [mingli.yu@windriver.com]
> >>> -=-=-=-=-=-=-=-=-=-=-=-
> >>>

