Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23C86C38A2D
	for <webhook@archiver.kernel.org>; Wed, 26 Oct 2022 18:14:55 +0000 (UTC)
Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.11123.1666808094111746275
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Oct 2022 11:14:54 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=yMDBvShG;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.48, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f48.google.com with SMTP id d26so23573399eje.10
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 11:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LBuDUe0FKvS1Qzdw62vjWrU2emViRs5BHfKPxQXB9pg=;
        b=yMDBvShG/kcR+ZRgdxmt+aUC7VbEf3AcE0JSrHWOSC6wgWUgLomxgUDDRT5TRfQWiq
         J5ig37+HfR+lSGhSIu70h+llRn/us1+P0hGKgYPueM2xxAwXFfRleMu8P21QT0YqYT3G
         0mkxv9/ZS/EYzbZpMxStBtkV9CyeCerr5o0MVAIrbUir3g+UgqT8nCBajY0XrpsyGTdX
         /znEbRUa5Lu6s2mAhzu/FG+PGyIs3TlocnJJKxO6cbLTElrgha8LFG9vbwENU3+ZTGT9
         dQO0YnqxQloRzDr1654mQ4fdlfqqeNiWorVlvwaNCbHN50Pd3CLMMruN4diuznxPNiJo
         a0eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LBuDUe0FKvS1Qzdw62vjWrU2emViRs5BHfKPxQXB9pg=;
        b=R0ql9Uc/+5CYabaTIT3YLMdUIWmQJHN7hMxLR0ATpov9o1CjlFzIJVPDOiXhIJhw08
         og7A6RKrALSwAP9tDiRFZYAxaK7jLrSCcrpPW1dEPQmiSq3rl2KJjQV2/5zfjFLlhUuT
         GKzeA1whcYDMUzNNHjik60WoGaD8LaKDDiTWTTr0BLew12aCXMulolc+dBMGrnLIMlj8
         t6cqS2TQIegQNzQYZ/vhTlOcwYuhlmTIxrU5zfCdqAUKq5U/t5PDQO8MQrTOSzz3PMnk
         uEM2TJgr+GIbwBQSNEHLGeIOGOH1eeYe6In1yf2ZrP5SsUm955DZXxYrSTVJcQU/00cQ
         0oTQ==
X-Gm-Message-State: ACrzQf0HwT9Ya4MzZcCvr4SpwSLi/UmxJirGBaJLycSHi+c6FQJq4Ej3
	+NZA3mK21uOcgYa9vdY4A3LbrwPT4p2lhFatogO+eA==
X-Google-Smtp-Source: AMsMyM4tq/dKVle0eQFQ0QrtqDoAJ1VtgHOVsiLme3Sr0gU4xLhNvdT9GjcqAOv8TKki9SDM3ZnoEI58tivBV9kbl+c=
X-Received: by 2002:a17:907:7628:b0:7a7:45d4:ed9 with SMTP id
 jy8-20020a170907762800b007a745d40ed9mr15936283ejc.132.1666808092134; Wed, 26
 Oct 2022 11:14:52 -0700 (PDT)
MIME-Version: 1.0
References: <20221013084239.3461244-1-zhe.he@windriver.com>
In-Reply-To: <20221013084239.3461244-1-zhe.he@windriver.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 26 Oct 2022 08:14:41 -1000
Message-ID: <CAOSpxdaJFRK7d6pJJ+YjG=LZxY2PR2uy7QUaQBLQWajqVA509Q@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][PATCH] lttng-tools: Upgrade 2.13.4 -> 2.13.8
To: He Zhe <zhe.he@windriver.com>
Cc: openembedded-core@lists.openembedded.org, 
	"MacLeod, Randy" <Randy.MacLeod@windriver.com>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Oct 2022 18:14:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172169

Unfortunately I have to revert this patch since it is causing
consistent ptest failures on the autobuilder:

AssertionError: Failed ptests:
{'lttng-tools': ['kernel/test_callstack_11_-_Validate_userspace_callstack',

'kernel/test_userspace_probe_94_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_function',

'kernel/test_userspace_probe_95_-_Start_tracing_for_session_test_userprobe_elf_cxx_function',

'kernel/test_userspace_probe_96_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_function',

'kernel/test_userspace_probe_97_-_Validate_trace_for_event_userspace_probe_test_event',

'kernel/test_userspace_probe_100_-_Enable_kernel_userspace_probe_event_for_session_test_userprobe_elf_cxx_method',

'kernel/test_userspace_probe_101_-_Start_tracing_for_session_test_userprobe_elf_cxx_method',

'kernel/test_userspace_probe_102_-_Stop_lttng_tracing_for_session_test_userprobe_elf_cxx_method',

'kernel/test_userspace_probe_103_-_Validate_trace_for_event_userspace_probe_test_event']}

An example build:

https://autobuilder.yoctoproject.org/typhoon/#/builders/81/builds/4162

I've verified that this happens both with and without the recent
kernel version updates.

Sadly I must have somehow missed this in the initial testing (probably
because ptest failures are warning not errors)

Steve

On Wed, Oct 12, 2022 at 10:43 PM He Zhe <zhe.he@windriver.com> wrote:
>
> Signed-off-by: He Zhe <zhe.he@windriver.com>
> ---
>  .../lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb}      | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-kernel/lttng/{lttng-tools_2.13.4.bb => lttng-tools_2.13.8.bb} (98%)
>
> diff --git a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> similarity index 98%
> rename from meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> rename to meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> index 0ea4da05ce..0b6dfa48a4 100644
> --- a/meta/recipes-kernel/lttng/lttng-tools_2.13.4.bb
> +++ b/meta/recipes-kernel/lttng/lttng-tools_2.13.8.bb
> @@ -39,7 +39,7 @@ SRC_URI = "https://lttng.org/files/lttng-tools/lttng-tools-${PV}.tar.bz2 \
>             file://disable-tests.patch \
>             "
>
> -SRC_URI[sha256sum] = "565f3102410a53d484f4c8ff517978f1dc59f67f9d16f872f4357f3ca12200f6"
> +SRC_URI[sha256sum] = "b1e959579b260790930b20f3c7aa7cefb8a40e0de80d4a777c2bf78c6b353dc1"
>
>  inherit autotools ptest pkgconfig useradd python3-dir manpages systemd
>
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171691): https://lists.openembedded.org/g/openembedded-core/message/171691
> Mute This Topic: https://lists.openembedded.org/mt/94299823/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

