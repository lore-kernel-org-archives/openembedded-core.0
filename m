Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A09FC433F5
	for <webhook@archiver.kernel.org>; Tue,  7 Dec 2021 17:36:35 +0000 (UTC)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com
 [209.85.160.169])
 by mx.groups.io with SMTP id smtpd.web10.282.1638898594549708365
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 09:36:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lfd2RCuf;
 spf=pass (domain: gmail.com, ip: 209.85.160.169,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f169.google.com with SMTP id v22so14991092qtx.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Dec 2021 09:36:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EkIIfPWauy4RD8t8mEamlgdGA0Yl6470H7bhtROMdfE=;
        b=lfd2RCufOcme1X+GC06D4EhhVRG1c5G/xnXuYx7bpEY+BuK8J+mK+o6weRTS6XryWU
         B46UrtdE0Ypynpmu9XCAg8+ShgxBngofB+gSQiti5gKp6vBNg9v0/IM/0XKDqqYfhWsa
         AxnK3MTmBsxb6jS+ush3ZbTS4gMobUeMLOTQthCGG3ZxrC4rXP8enMxYgRGQMLgipSyW
         AKsgX+fEjkYgcuWoJ9HinBw//0/5F/N/7znpHgqGn/IO36F3Ct6Jv1qBQiwEXzl/81Ss
         +UVw2pk1GxQFIQsGMCGb6qnWPPSFzkBOy/dUdvELnVvPPlAvrK8SYTaTZAcMo6Y5wGHW
         D3zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EkIIfPWauy4RD8t8mEamlgdGA0Yl6470H7bhtROMdfE=;
        b=CNFSWTTWFbEgciqoo8/hZyvge6p24ZanHkRh2S0+OUaFy4hySvGO6fCA0803KhAgVV
         h8WPG1vuMeTjd5DauHAOVA4XfkAp2+MTR+vOI8O6s4usKIiUSSHqfQMBpcFHRtqP7LTM
         MODxGjFKIA19TLuFFFu66xWzwpyxrd5dA2NytffUA2zblKPoPLBAagj2k2OSvjc2zpzP
         JCHxaGgyWrDVejptJ5jRuIu178YkwdawEv4Uo6N9kctruS62Ko7d0VNteZGRvRIILP+A
         baNd3fAMioAKj3eBOSBKZjIq41FSOy0kbCk9V9nnWRNI+ZDe1BNCmMPh3VGi9WRghM8C
         fptg==
X-Gm-Message-State: AOAM531JEL3Mzaxwa7rp0If3ZenLY7UyuVBdaQTQnABipeatbyUvvVqX
	pkBYupAQkOiydbdsnR3KErRCjg0AkL2aMX/uYvI=
X-Google-Smtp-Source: 
 ABdhPJz1mmGxHk6jbRXVcB9UE4eZCW2WSpPWaqZT+GUY09dYJF9Xn0TNZRWeshMXooqYAq9gHtq9znxTNxneqOz8rfs=
X-Received: by 2002:a05:622a:346:: with SMTP id
 r6mr712989qtw.185.1638898593601;
 Tue, 07 Dec 2021 09:36:33 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638895732.git.bruce.ashfield@gmail.com>
 <96df7ebc8b23eb2bf612b7f80115cb21b483756e.1638895732.git.bruce.ashfield@gmail.com>
In-Reply-To: 
 <96df7ebc8b23eb2bf612b7f80115cb21b483756e.1638895732.git.bruce.ashfield@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Dec 2021 09:36:07 -0800
Message-ID: 
 <CAMKF1sqXdesbNeQHc1_y9PpuBVH-dJDd3K-zztubzhEHb_9kvw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 7/7] kern-tools: bug fixes and kgit-gconfig
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Dec 2021 17:36:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159326

On Tue, Dec 7, 2021 at 8:52 AM Bruce Ashfield <bruce.ashfield@gmail.com> wrote:
>
> From: Bruce Ashfield <bruce.ashfield@gmail.com>
>
> Bumping yocto-kernel-tools to version v0.3, which comprises the following commits:
>
>     90598a5 tools: Makefile: add missing install file
>     330f9fa kgit-config: fix file mode
>     22b55cd kgit-config: cleanup error message
>     1e2a233 kgit-config: fix the "not found" message
>     e7fcb9a kgit-config: trim trailing whitespace
>     3cd14ce kgit-config: BSP template and auto meta-data creation
>     e56620c tools: introduce kgit-config
>     969b888 buckets: update to v5.14+
>     d220b06 Kconfiglib: add support for bare 'modules' keyword
>
> Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
> ---
>  meta/recipes-kernel/kern-tools/kern-tools-native_git.bb | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> index ef035aed23..018e34dfe6 100644
> --- a/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> +++ b/meta/recipes-kernel/kern-tools/kern-tools-native_git.bb
> @@ -8,9 +8,9 @@ LIC_FILES_CHKSUM = "file://tools/kgit;beginline=5;endline=9;md5=9c30e971d435e249
>
>  DEPENDS = "git-native"
>
> -SRCREV = "d220b063852245fdd16b9731a395ace525f932d6"
> +SRCREV = "90598a5fae1172e3f7782a1b02f7b7518efd32c8"
>  PR = "r12"

Drop PR perhaps ?

> -PV = "0.2+git${SRCPV}"
> +PV = "0.3+git${SRCPV}"
>
>  inherit native
>
> --
> 2.19.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159322): https://lists.openembedded.org/g/openembedded-core/message/159322
> Mute This Topic: https://lists.openembedded.org/mt/87568955/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

