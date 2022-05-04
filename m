Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3FE9C433EF
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 16:51:56 +0000 (UTC)
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by mx.groups.io with SMTP id smtpd.web11.522.1651683114086914139
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 09:51:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=bANtW8vs;
 spf=pass (domain: gmail.com, ip: 209.85.208.172,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lj1-f172.google.com with SMTP id q14so2400289ljc.12
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 09:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xhr02YHa4BXiBNEMejxmSabc12iEns4t0jCxuYj3lC8=;
        b=bANtW8vs5u9YPpeNnynUm1LiPEJb84qkWaRfFr8w5TYzVUWlEuxbbPbcNlIloBIVDb
         W/1Dd3oB4u07eKoQsTmafuuxhGkiZ0ndNrBYPECxoCLdM5p1WAqFdgfgnxTzC/pyaHHo
         TqrJnzCRGHmlrpE60DMcIqHdv11dcD+a1fNlMuVR7Q1mNiuH5axtC2eMWDbwPqglshwp
         B3yH2bPwqIgEr92A2xBYj/Iml0BWxMrJrz4+ltxCRjx+QxCp6cnd+en3nGuKS24/B4IB
         39Slrt3qIGW1milrT0uPDZKKFlk2SuBmhKJ5pOYMUCgLrPSfg7JyJA5u3At1Z/Rscopz
         y+Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xhr02YHa4BXiBNEMejxmSabc12iEns4t0jCxuYj3lC8=;
        b=6zH8twCNi/4XHINOei4oXerDKqHAbpnut53Z89+8q5KT+DDY5eKdLi+b9g1yXB3V5l
         tbV/pYyJFt4PZ7ZW5iIO5ZxVY7HkqYBYnVuNH/bQppMkMn7hKv0yeV2nd5BTNCwxQfnw
         /EXln7CIcchEIm9IQDnkvaTOllDeHMXnqPycI0fBCKj0jqYVmTqnS9YMKZooSRXdp6Id
         P1QO2A+L6Su0KO/yTB4bC0zOsdOK4EgG1ViXZKMduT/f0277EmcQdLAwufRmcF5CNjw3
         q8d0iVJHVZBX1GymDMzpaF5+vIdJJDCbBowg96Z+r7k4CKG7ORxPIccGG/7dsBhGeDFG
         UeIw==
X-Gm-Message-State: AOAM533R3yQhyJ3szOXewVcr7mbqmz/mpqIVfjOdPW2ovHDyDM8YOJX/
	2s+p3FSi7wCjFJYHiF/phdwiVia3djlc/Qyx6TU=
X-Google-Smtp-Source: 
 ABdhPJyxohY/QiE8aUK/F79WYvmE4UKRIVcxSHemmwgWy2KAATkSUZw338fHKsZ6lVXh46NX9yWojQLVABkKKOMmy1g=
X-Received: by 2002:a2e:824b:0:b0:24d:c247:c928 with SMTP id
 j11-20020a2e824b000000b0024dc247c928mr13380626ljh.68.1651683112083; Wed, 04
 May 2022 09:51:52 -0700 (PDT)
MIME-Version: 1.0
References: <1649011392-28818-1-git-send-email-wangmy@fujitsu.com>
 <1649011392-28818-5-git-send-email-wangmy@fujitsu.com>
 <Yk2I88BgEuWXpapX@mail.local>
 <16EBF18662E1746B.16118@lists.openembedded.org>
In-Reply-To: <16EBF18662E1746B.16118@lists.openembedded.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 4 May 2022 18:51:40 +0200
Message-ID: 
 <CANNYZj9oYY8pjcyAyLPJJYpivUaxDpBOxGh79cu239s0uDNryg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] lttng-tools: upgrade 2.13.4 -> 2.13.6
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Jonathan Rajotte <jonathan.rajotte-julien@efficios.com>,
	Francis Deslauriers <francis.deslauriers@efficios.com>,
 wangmy <wangmy@fujitsu.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 16:51:56 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165225

The issue was that we used a stripped binary where a non-stripped one
is expected. I have corrected this, so the problem was on our side.
Version update patch will be coming in a few.

Alex

On Wed, 4 May 2022 at 17:47, Alexander Kanavin via
lists.openembedded.org <alex.kanavin=gmail.com@lists.openembedded.org>
wrote:
>
> I have fixed the test_userspace_probe fails, and obtained slightly
> more detailed logs for the test_callstack:
>
> not ok 11 - Validate userspace callstack
> FAIL: kernel/test_callstack 11 - Validate userspace callstack
> #   Failed test 'Validate userspace callstack'
> #   in ./kernel/test_callstack:test_user_callstack() at line 80.
> # Kernel callstack test
>
> Line 80 in ./tests/regression/kernel/test_callstack is:
>
>         "$BABELTRACE_BIN" "$TRACE_PATH" | grep $EVENT_NAME |
> ./"$PARSE_CALLSTACK" --user "$TEST_APP_USERSPACE" $USER_CS_EXPECTED
>         ok $? "Validate userspace callstack"
>
> I have obtained the failing TRACE_PATH output, and attached it to this
> upstream bug:
> https://bugs.lttng.org/issues/1353
>
> To unblock the update I'll add a patch that disables the failing test.
>
> Alex
>
>
> On Wed, 6 Apr 2022 at 14:35, Alexandre Belloni via
> lists.openembedded.org
> <alexandre.belloni=bootlin.com@lists.openembedded.org> wrote:
> >
> > Hello,
> >
> > Last time I tried that, we got new ptest failures:
> >
> > {'lttng-tools': ['kernel/test_callstack_11_-_Validate_userspace_callstack',
> >                  'kernel/test_userspace_probe_94_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_function',
> >                  'kernel/test_userspace_probe_95_-_Start_tracing_for_session_test_userprobe_elf_cxx_function',
> >                  'kernel/test_userspace_probe_96_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_function',
> >                  'kernel/test_userspace_probe_97_-_Validate_trace_for_event_userspace_probe_test_event',
> >                  'kernel/test_userspace_probe_100_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_method',
> >                  'kernel/test_userspace_probe_101_-_Start_tracing_for_session_test_userprobe_elf_cxx_method',
> >                  'kernel/test_userspace_probe_102_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_method',
> >                  'kernel/test_userspace_probe_103_-_Validate_trace_for_event_userspace_probe_test_event']}
> >
> > Did you have a look at and fix those?
> >
> > On 04/04/2022 02:43:12+0800, wangmy wrote:
> > > Changelog:
> > > =========
> > > Fix: hide symbols erroneously exported in 2.13.5
> > >
> > > Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
> > > ---
> > >  .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb}      | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.6.bb} (98%)
> > >
> > > diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> > > similarity index 98%
> > > rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> > > rename to meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> > > index 0ea4da05ce..d40d0a2dd0 100644
> > > --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> > > +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.6.bb
> > > @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
> > >             file://disable-tests.patch \
> > >             "
> > >
> > > -SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
> > > +SRC_URI[sha256sum] = "1d52d249437b3f7ba23a45a22c3e26dde006a5da10e96753952084a98e0523e3"
> > >
> > >  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
> > >
> > > --
> > > 2.25.1
> > >
> >
> > >
> > >
> > >
> >
> >
> > --
> > Alexandre Belloni, co-owner and COO, Bootlin
> > Embedded Linux and Kernel engineering
> > https://bootlin.com
> >
> >
> >
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165223): https://lists.openembedded.org/g/openembedded-core/message/165223
> Mute This Topic: https://lists.openembedded.org/mt/90287422/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

