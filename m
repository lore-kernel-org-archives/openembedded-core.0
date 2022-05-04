Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481DCC433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 15:47:29 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web09.1193.1651679247251432285
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 08:47:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lh1iHM0w;
 spf=pass (domain: gmail.com, ip: 209.85.167.46,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id w19so3035126lfu.11
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 08:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2T/skDTbf7d98dkBC/zYPHkh938XAVfu+sd8gCT8O4s=;
        b=lh1iHM0wobF5kl4ChsrYsJkzKDo6bFVbo/nV1EnHeGlCPK6Tz4KTWH+DrUC6QeJTlr
         e1VVgkWobQdpr25GLDyKazXliWhNXqh3CAdJDolV9oEAkhTxm+YORzcBq8o7jw4E2b4l
         qfy+3BKj8AtLo/SnWWWuM2C7rEYN84d0/Ttre89RKGvQ1viLb2nGUq7PqEgb/BhQFOPA
         kGwefO5i24NJFGFQGKQy2zeVlSNGq3UiLDV5ZwVxBnfepVMbq/Pt2EahuYd4GjaWT33C
         rSB5e/nxAcUoA7z+gx6EGMBgnAnqwHmWuETy/8vTl4yfpr4W/GH5WpxLIY2M1MaTtYvr
         JTsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2T/skDTbf7d98dkBC/zYPHkh938XAVfu+sd8gCT8O4s=;
        b=LcKOKk391uksSVHJn5CUTCwkqrMB+ettgTM3T2VMApkIAkdvy8LDHROUAf21fTwZsf
         vfHxdiV1+Cr46hw8UOH9e9fD4/3Y15+BtC4B6agFABy2b1SaOpuaBtvlqpB/ilGVTsTH
         mawWcpb3uXk6g5klm+WPW9V/Sw90UKWNii75cvujOA69IxEqEYhTfVxKo83P17KpXJ7m
         dfoBdolJaTHC5dIKZ+ApdUlyFodA+4mIFPPoDGP/nIHfo1G0RoiGWqZc1iO/WkOYffI0
         s7OsoSjskZ5IWH/8iZrMmSs5QBxDzbHUnYBIb7x3N5LhXQRa2IKBUQBujhdqvgf2MPQu
         K4PQ==
X-Gm-Message-State: AOAM531THGfgaMovih18YZ98/OHzC1AQrncsokAMNubwUHb+Z9ai0Cq8
	S52/wEVrdFM0eye6dksU5h9tGx9KErU5xLY3PyQ=
X-Google-Smtp-Source: 
 ABdhPJz7i8fXejYWIFj/6FYRQbuz4jXsEVi82wSdld6bMClC6hleT4sx/SOU9OG6DDsx7CZzi71bPbIgUUVerB34qko=
X-Received: by 2002:a05:6512:3052:b0:472:7f8:f344 with SMTP id
 b18-20020a056512305200b0047207f8f344mr14996751lfb.380.1651679245318; Wed, 04
 May 2022 08:47:25 -0700 (PDT)
MIME-Version: 1.0
References: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
 <1649011392-28818-5-git-send-email-wangmy@fujitsu.com>
 <Yk2I88BgEuWXpapX@mail.local>
In-Reply-To: <Yk2I88BgEuWXpapX@mail.local>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 May 2022 17:47:14 +0200
Message-ID: 
 <CANNYZj_68KhoDdiq+Hc=4JtVdrJW8tCnbw4pcQrG0D4HMui1Jw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: upgrade 2.13.4 -> 2.13.6
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>,
	Francis Deslauriers <francis.deslauriers@efficios.com>
Cc: wangmy <wangmy@fujitsu.com>,
 OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 15:47:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165223

I have fixed the test_userspace_probe fails, and obtained slightly
more detailed logs for the test_callstack:

not ok 11 - Validate userspace callstack
FAIL: kernel/test_callstack 11 - Validate userspace callstack
#   Failed test 'Validate userspace callstack'
#   in ./kernel/test_callstack:test_user_callstack() at line 80.
# Kernel callstack test

Line 80 in ./tests/regression/kernel/test_callstack is:

        "$BABELTRACE_BIN" "$TRACE_PATH" | grep $EVENT_NAME |
./"$PARSE_CALLSTACK" --user "$TEST_APP_USERSPACE" $USER_CS_EXPECTED
        ok $? "Validate userspace callstack"

I have obtained the failing TRACE_PATH output, and attached it to this
upstream bug:
https://bugs.lttng.org/issues/1353

To unblock the update I'll add a patch that disables the failing test.

Alex


On Wed, 6 Apr 2022 at 14:35, Alexandre Belloni via
lists.openembedded.org
<alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
>
> Hello,
>
> Last time I tried that, we got new ptest failures:
>
> {'lttng-tools': ['kernel/test_callstack_11_-_Validate_userspace_callstack',
>                  'kernel/test_userspace_probe_94_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_function',
>                  'kernel/test_userspace_probe_95_-_Start_tracing_for_session_test_userprobe_elf_cxx_function',
>                  'kernel/test_userspace_probe_96_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_function',
>                  'kernel/test_userspace_probe_97_-_Validate_trace_for_event_userspace_probe_test_event',
>                  'kernel/test_userspace_probe_100_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_method',
>                  'kernel/test_userspace_probe_101_-_Start_tracing_for_session_test_userprobe_elf_cxx_method',
>                  'kernel/test_userspace_probe_102_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_method',
>                  'kernel/test_userspace_probe_103_-_Validate_trace_for_event_userspace_probe_test_event']}
>
> Did you have a look at and fix those?
>
> On 04/04/2022 02:43:12+0800, wangmy wrote:
> > Changelog:
> > =========
> > Fix: hide symbols erroneously exported in 2.13.5
> >
> > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > ---
> >  .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb}      | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb} (98%)
> >
> > diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> > similarity index 98%
> > rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> > rename to meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> > index 0ea4da05ce..d40d0a2dd0 100644
> > --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> > +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> > @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
> >             file://disable-tests.patch \
> >             "
> >
> > -SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
> > +SRC_URI[sha256sum] = "1d52d249437b3f7ba23a45a22c3e26dde006a5da10e96753952084a98e0523e3"
> >
> >  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
> >
> > --
> > 2.25.1
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
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#164080): https://lists.openembedded.org/g/openembedded-core/message/164080
> Mute This Topic: https://lists.openembedded.org/mt/90287422/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

