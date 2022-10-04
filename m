Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099B1C433F5
	for <webhook@archiver.kernel.org>; Tue,  4 Oct 2022 14:21:48 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web12.11247.1664893297890752416
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 07:21:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=7kQliAEQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.49,
 mailfrom: steve@sakoman.com)
Received: by mail-ej1-f49.google.com with SMTP id kg6so13877257ejc.9
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Oct 2022 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=l361h8tMqxHv3AnOLtJgjdtdnEpTH61BwZNt1oOxm/g=;
        b=7kQliAEQDaf/zJt/r5BRm50oUkSs2gg1MmFKHjjBSMH7SWBXHzTp0vq4AMs1YQyDB6
         fMq/z7Kql2j3anRMGZ6JVd5tDLPEu5Ewj1R0FBY2XXP9bSjDqJel5ETfPzn1HkxiXe48
         7b67nUs635j9JFGF6vqiIg+88dsEPdVfOnSNWEpQmOEJJjo554iFRzQ3htkvj3zUK4Ik
         I5hcZ/e0AL6gh7RtiXXRuEdtTjgSQKUPXH/b2ISbDXUUsOaL/fYk0UTdK2OHVtnD1wIu
         5sklygI5yZ9ZBZoIulYKLjwsHrrUQNrBfEQLPG8fsnr1xlNcak7fHM4b7r4s/KsKuG7C
         kzYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=l361h8tMqxHv3AnOLtJgjdtdnEpTH61BwZNt1oOxm/g=;
        b=jraarlEhDANVk9ul5L321eCd2n+w4VoxnF9en+R2v88y4Vp66SYjlUamAKpNmtPp4d
         d5Qm+wCKL3KuMAk3Qk+5iOr2fj+7aPBTnDDp7JkHZ56yP1DZzqqhJKrWzLFMGWvGo3JK
         fJZBMAQlE8rX2eR1XBmtDjjZztbcRjz5XFy1ElJspdKtkFRC9h+p5l25GxH4Jp2vYql/
         7zN8BUeLUC2LFACDwKbHWxssFEcbNl/Ba+n++YKVinLWADlA5CTjfb/YICS55pDlPxO5
         sFAnHtYYOUTqQXrmlaVMlCL+8qM16ZusJdGPUhenL8CAcU5aXKdT9bm5kmXt58490Bdo
         7haA==
X-Gm-Message-State: ACrzQf0scizdH2Hcf36uhBZn5d5veo8HXHOS1LAHihSELf6Z51jlTBqS
	DWP2LVxT2o0/BHm0ExJLYxzqPbheKogVmBjVFeO9OQ==
X-Google-Smtp-Source: 
 AMsMyM7efJZZSGorWYUpaW+e2o8/P+OuTourfaI2wgv2yeZgv0Xb0OQ1LrCMrTn2NDy4fMQVZPmaUUczmdUKO8axPqo=
X-Received: by 2002:a17:907:86ab:b0:781:f150:84e4 with SMTP id
 qa43-20020a17090786ab00b00781f15084e4mr18977870ejc.435.1664893295898; Tue, 04
 Oct 2022 07:21:35 -0700 (PDT)
MIME-Version: 1.0
References: <20221004071151.2920751-1-jay.shen.teoh@intel.com>
In-Reply-To: <20221004071151.2920751-1-jay.shen.teoh@intel.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Tue, 4 Oct 2022 04:21:25 -1000
Message-ID: 
 <CAOSpxdapxsxYR+YAUNnYWmQStsEhhZpgC6BdrhLT4JfDZZYpBg@mail.gmail.com>
Subject: Re: [OE-core][kirkstone][Patch] vim: Upgrade 9.0.0541 -> 9.0.0614
To: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Oct 2022 14:21:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171399

This should be taken for master first before I can cherry-pick to
kirkstone!  Copying Alex so he can add it to the master queue.

Steve

On Mon, Oct 3, 2022 at 9:11 PM Teoh, Jay Shen <jay.shen.teoh@intel.com> wrote:
>
> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
>
> Including fixes for :
> CVE-2022-3278
> CVE-2022-3296
> CVE-2022-3297
> CVE-2022-3324
> CVE-2022-3352
>
> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> ---
>  meta/recipes-support/vim/vim.inc | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-support/vim/vim.inc b/meta/recipes-support/vim/vim.inc
> index 5ff60f8495..0710f6afbf 100644
> --- a/meta/recipes-support/vim/vim.inc
> +++ b/meta/recipes-support/vim/vim.inc
> @@ -20,8 +20,8 @@ SRC_URI = "git://github.com/vim/vim.git;branch=master;protocol=https \
>             file://no-path-adjust.patch \
>             "
>
> -PV .= ".0541"
> -SRCREV = "ee7c8d999beb847457f768757b1bdcd76391c1f4"
> +PV .= ".0614"
> +SRCREV = "ef976323e770315b5fca544efb6b2faa25674d15"
>
>  # Remove when 8.3 is out
>  UPSTREAM_VERSION_UNKNOWN = "1"
> --
> 2.37.3
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#171375): https://lists.openembedded.org/g/openembedded-core/message/171375
> Mute This Topic: https://lists.openembedded.org/mt/94108902/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

