Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5670C433F5
	for <webhook@archiver.kernel.org>; Wed,  4 May 2022 14:24:18 +0000 (UTC)
Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com
 [209.85.219.172])
 by mx.groups.io with SMTP id smtpd.web12.11.1651674257730790499
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 07:24:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jCBFMYj2;
 spf=pass (domain: gmail.com, ip: 209.85.219.172,
 mailfrom: bruce.ashfield@gmail.com)
Received: by mail-yb1-f172.google.com with SMTP id r11so2634859ybg.6
        for <openembedded-core@lists.openembedded.org>;
 Wed, 04 May 2022 07:24:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AxQee0ifQmA6GoAwFFjybhHHZMNuRrUA7wYV3nZAFBI=;
        b=jCBFMYj2pn7Imx1GjwBrLau0xMW6o2KB2pDhk9lS97a6zHzqOyg9m56S2j+G11geHl
         vnIZ+b0EW/HuyFotFc3dzBybt1Xt8jzHvHx5eA5iFs7nHngytiCmZ9H7tsJrIf1OGyBu
         WlHtCGV4RXUgAXf0g992FXVaMXFzHnBwGQWGiPnSHUxVKhU18njIc7SMzxqUAWWBalaN
         YnX9dXdnZ48ETjcCb6goH8mYGZ7LXBF6jTMFBZ1De/KsCDBL9/ivKvd3u7eY49fho5qs
         e8wX9Dycpey33mAhFlcyoZzgbNuSTDynfbk3phymVhYxMzkchhsqyr7JVFoNUbDcyc9w
         plkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AxQee0ifQmA6GoAwFFjybhHHZMNuRrUA7wYV3nZAFBI=;
        b=Lcl5r8510KIl0AgixyTFekqRrRMbJJEoqy1n7GXXe1YrrgpdP46Bb06D0+U8qzXfuZ
         HTfRj8hQmCgdMXkpkRSa8Yq9uia6wmG6h7EQLlqk2UIYbBX7O3p4rgbSeKTexU75Tqn9
         jcooSs9ACd3YgHLDPwPs+xvdd3Aancq38jGUbg297t+hYV4UobLyZAkQIOfNJIV3kTVU
         ZnOynjyClxAdpkMv9HEHH76ClfpA6lI5qm3l+JydyyIL/gt73XH0KH2ClcaGi86hYOZB
         DZCL6U6kRPqDLuFLCJbyzELiua2TGVHKhnJaipnAqRskV1Y7ByjoZm6lDTOCk3JxJrwI
         QRlw==
X-Gm-Message-State: AOAM533m9zYrJZDW+ZUtja6bX1abei8X7awdu0mvG8wFSrNmj0rrEZC8
	bXVvwU4IBGI+a7yerT7GAvS4fjdgMjwvVQWhTAE=
X-Google-Smtp-Source: 
 ABdhPJzKlcV+QpTiyWddb73PBoez+u224mz6TGC7Ua+6cl5ylQhZPrnIcHSRO7aJDF5f846/NGnqdhmPuVf6d9aRexw=
X-Received: by 2002:a25:3795:0:b0:648:fa25:5268 with SMTP id
 e143-20020a253795000000b00648fa255268mr18836263yba.153.1651674256898; Wed, 04
 May 2022 07:24:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220504140956.4373-1-jdmason@kudzu.us>
In-Reply-To: <20220504140956.4373-1-jdmason@kudzu.us>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 4 May 2022 10:24:05 -0400
Message-ID: 
 <CADkTA4M8bqvWeo7ghPF_rJjVOFGHxdvpkqtveAntW055p490vw@mail.gmail.com>
Subject: Re: [PATCH] qemuarmv5: use arm-versatile-926ejs KMACHINE
To: Jon Mason <jdmason@kudzu.us>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 04 May 2022 14:24:18 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/165221

On Wed, May 4, 2022 at 10:09 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> Use the Arm Versatile 926 kernel configs to get this machine working
> again.
>

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

> Signed-off-by: Jon Mason <jdmason@kudzu.us>
> ---
>  meta/conf/machine/qemuarmv5.conf | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/conf/machine/qemuarmv5.conf b/meta/conf/machine/qemuarmv5.conf
> index 2dad504c9932..abdae5f36182 100644
> --- a/meta/conf/machine/qemuarmv5.conf
> +++ b/meta/conf/machine/qemuarmv5.conf
> @@ -15,7 +15,7 @@ QB_MACHINE = "-machine versatilepb"
>  QB_KERNEL_CMDLINE_APPEND = "vmalloc=256"
>  QB_GRAPHICS = "-device virtio-gpu-pci"
>  QB_OPT_APPEND = "-device qemu-xhci -device usb-tablet -device usb-kbd"
> -PREFERRED_VERSION_linux-yocto ??= "5.15%"
>  QB_DTB = "${@oe.utils.version_less_or_equal('PREFERRED_VERSION_linux-yocto', '4.7', '', 'zImage-versatile-pb.dtb', d)}"
>
> -KMACHINE:qemuarmv5 = "qemuarm"
> +PREFERRED_VERSION_linux-yocto ??= "5.15%"
> +KMACHINE:qemuarmv5 = "arm-versatile-926ejs"
> --
> 2.30.2
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

