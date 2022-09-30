Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2182BC433F5
	for <webhook@archiver.kernel.org>; Fri, 30 Sep 2022 13:29:39 +0000 (UTC)
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
 [209.85.167.180])
 by mx.groups.io with SMTP id smtpd.web09.5588.1664544576897779286
 for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 06:29:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Awv+Jw58;
 spf=pass (domain: gmail.com, ip: 209.85.167.180,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f180.google.com with SMTP id m130so4706947oif.6
        for <openembedded-core@lists.openembedded.org>;
 Fri, 30 Sep 2022 06:29:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=rA9qW1YXQR7vVE0maLgZQ/IH7iRVHuhvtAIiTW9VvpM=;
        b=Awv+Jw586LMgaPRN7rzovh3DFrdocl7kEU9Mq7cDS9D8h6oTrAymK2pKfm8NRG5zJn
         E2oszv0f3CgaucWpPsIdf9ML0hWofaHEnpYdNYjJKK8lzAk0qk26Z1aEnqC6QoZExxSt
         /qHHwEjTEITEjovLmrSpDUJJ//3jCd8PJmL8agPlasmQJZbcEFgsjWk3Fqcb/VMiTZ7W
         gtdvc5DrZLKMfc0iJw8ws0u6SMhose+k2RioKYF7v1blTVM+2bnzxfldg7fFIQC9rquQ
         8VzG2NBjU+QzTbpI0dVT+/N7pg0+WEODBCT6/T6aQIt5VPRy4LQgVCwJNYLbHrGwPpsJ
         YMsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=rA9qW1YXQR7vVE0maLgZQ/IH7iRVHuhvtAIiTW9VvpM=;
        b=AGebH/V+8T5JCNWrsxoldDEeuiYKulQjYU/ULHY5LjxZgzGKUyrC4lqIiE+4ICmZ7C
         UDo36QAEjWWpN0fqG+Ww9RNdFra1KvHXOMpkPQoy7zoIwcuGLD55F40ooRQksATs/UkO
         yGaPE5R6ZYrs73b5dfWWT2oiB6LyTtNLihpqZfEbAM6V9yV66UugpEBIjK5ZixTO6f0W
         VQ3AqnRXfyXvqAUmKF16XO31R4ZWsn5057/9htLfmmuRoO7Av3Ah9XqZKV7U90HwRKYS
         HrU1f2VK0lnihitM2xKtj36s4CA9eUj/pKW2AWk+byWCriUlUatSFaWg4ob5gkMxtlSC
         ACLg==
X-Gm-Message-State: ACrzQf2wNdq91cDobOKvnmCha4Kz2hM1xO9JywzSjcpNTKN9ygD7Pe0O
	q5C9Jjd1OhAeFN3AnRpTzaZIIy+gwez8wNvY2pM=
X-Google-Smtp-Source: 
 AMsMyM6BeS3V7PFe6/4rvb3t7XL+Lo2kkq6Til3cx1zykHJ5NXa1DPQdtlJOHd73d+YT+vI7o0P05IY0xDfuJUJl5UA=
X-Received: by 2002:a05:6808:2390:b0:350:5c6b:5ef9 with SMTP id
 bp16-20020a056808239000b003505c6b5ef9mr3943718oib.96.1664544575950; Fri, 30
 Sep 2022 06:29:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220930032339.172935-1-jdmason@kudzu.us>
In-Reply-To: <20220930032339.172935-1-jdmason@kudzu.us>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Fri, 30 Sep 2022 09:29:24 -0400
Message-ID: 
 <CADkTA4M+ps4QFqL1SDEfFCwF4+_wnxZ67A8KxjvVKZCu2AGwoQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] linux-yocto: add entries for machine features
To: Jon Mason <jdmason@kudzu.us>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 30 Sep 2022 13:29:39 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171221

On Thu, Sep 29, 2022 at 11:23 PM Jon Mason <jdmason@kudzu.us> wrote:
>
> Most machine features have corresponding kernel config fragments, but
> only a few have an entry in the kernel recipe to be automatically added.
> Adding the majority of them here.
>
> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/recipes-kernel/linux/linux-yocto.inc | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc b/meta/recipes-kernel/linux/linux-yocto.inc
> index 7ea661e138d9..23ae0b4260c2 100644
> --- a/meta/recipes-kernel/linux/linux-yocto.inc
> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
> @@ -33,7 +33,12 @@ KERNEL_LD:append:arc = " ${TOOLCHAIN_OPTIONS}"
>
>  KERNEL_FEATURES:append:qemuall=" features/debug/printk.scc"
>
> +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'bluetooth', 'features/bluetooth/bluetooth.scc', '', d)}"
> +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'efi', 'cfg/efi.scc', '', d)}"
> +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'ext2', 'cfg/fs/ext2.scc', '', d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'numa', 'features/numa/numa.scc', '', d)}"
> +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'pci', 'features/pci/pci.scc', '', d)}"
> +KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'rtc', 'cfg/timer/rtc.scc', '', d)}"
>  KERNEL_FEATURES:append = " ${@bb.utils.contains('MACHINE_FEATURES', 'vfat', 'cfg/fs/vfat.scc', '', d)}"

The concept of this is ok, but there are some non-obvious details that
need to be considered.

There's a really old enhancement in bugzilla about doing a better job
of integration between machine, kernel and distro features:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=2267

One issue is that this should generate warnings if the config values
don't make it into the final .config. otherwise they aren't really a
useful mapping of machine -> kernel features (we don't want
"just-in-case" configuration). Obviously the linux-yocto config audit
can warn on things like this, but the fragments need to be tagged as
required (hardware) for that to happen.  Which they won't currently be
if specified this way. I'd need to do some tooling work to make that
happen.

Another detail is that KERNEL_FEATURES are applied last. Which means
they can override / enable things that a BSP configuration doesn't
want and could have even explicitly disabled, used different values,
etc.

A proper BSP configuration is already a definition with a curated set
of options, and in a linux-yocto flow, that is typically the first and
last word on the values. doing a lot of BSP configuration via machine
features spreads the logic out to multiple places, which can be a
challenge to track down later. The fact that these map to the
centralized fragments is really good (since while the enablement might
be distributed and spread over recipe space, the actual options are
centralized), but it makes jumping off from a kernel-cache BSP or one
of the qemu references harder, as these will keep showing up .. when
you might not want them.

Yes, we can argue that machine's shouldn't set features that they
don't want to support, but that doesn't cover all of the complications
and potential issues.

If we want to start dabbling with this, these should be a little bit
more opt-in, and be specific to the qemu machines we define (versus
just appending to KERNEL_FEATURES). As for opt-in, I'd suggest
something like an image or machine feature in the spirit of
"DYNAMIC_CONFIG" or "ENABLE_MACHINE_FEATURES", and when that is set,
we do the mapping.

Bruce


>
>  # A KMACHINE is the mapping of a yocto $MACHINE to what is built
> --
> 2.30.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171203): https://lists.openembedded.org/g/openembedded-core/message/171203
> Mute This Topic: https://lists.openembedded.org/mt/94009766/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

