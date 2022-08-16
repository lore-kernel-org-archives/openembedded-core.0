Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E881EC2BB41
	for <webhook@archiver.kernel.org>; Tue, 16 Aug 2022 07:39:36 +0000 (UTC)
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by mx.groups.io with SMTP id smtpd.web11.12812.1660635567049062329
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 00:39:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=I47NDt5Y;
 spf=pass (domain: gmail.com, ip: 209.85.167.51,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-lf1-f51.google.com with SMTP id u3so13674263lfk.8
        for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Aug 2022 00:39:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=WNFMjnK4YnivMbBgxFdjKyr7DRdTOOyiogXkxjg4U0I=;
        b=I47NDt5YQzU2wRQLVPCTJjrBel01qMezw1e7ZUvj3DY6VyRfqj8UsxLM9v5rTtleRV
         cR8n+uyk9kc74uG5I8hShQFZ92a83rHG61VDFnMYDABnvMZrLrSkybFSUBQoQycvcq/s
         8qFl2anHYrZLKc4TjhHpS+vvv67z23QeXXElLNG7OOakqhPr8r6FDrOFujgLAfVRCExQ
         acK+82P3sZ+ZdCOKshy+cgroMqOvLeRIsQWMZUeJsVo28mhvJ4ZH4Hlvwyh8ujpodj1k
         1NFbKbBszCOFC7snNinMOWNK1WjA/JtqOSffBSV+Zzn9G0/b+fvNzBIU+H4Ey/qQNtIF
         p4Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=WNFMjnK4YnivMbBgxFdjKyr7DRdTOOyiogXkxjg4U0I=;
        b=1BnOF0zEvVtqfDurgiB2QL6EdPVjLw7GjgzkhV8J/ZmXyHX9Hl73hM6A8AqJTs0o+P
         rMUw9IQR3RbWYvZo5vsXCjJLBhe8dLlPTthrgLZgiMoq08pkbRYXsqkopqDhtr9Jort2
         b6LRRw8u+LVpKCOISqbkBkpr6GAi79adZHGSnbDWi1HNjvJtwfh/9wqRpDiz66Du9ZPG
         WJ6PvrWYX3MzrqoGALrm7Pbr+btvB5fIXUzQylClhDIU+Z+QsvO2tj2rr0lzU8LEfIwb
         /uT3a98iUxSIoMGeFz2k7RmBJTFMDVRS/GstI8pg3I3WPudzePFvt+vkjrVbuZGXCtTJ
         rh9g==
X-Gm-Message-State: ACgBeo1+iXXbkhsfEfrh2Ry3u6FkH6IyB5v1ag+ANj6eGdjxk26JxvmO
	B/92KrYF5CyVJAiqZFYhWLVx6HX/9PNlxlTOAM0=
X-Google-Smtp-Source: 
 AA6agR7i/cZpmWIXsc2hD3MnKOeHYb5PIGC7C5WkvW0eMqTFedIldbXREZImLd4A/gI2a9ioZ9jKhZrDq+6rhqWbOeQ=
X-Received: by 2002:ac2:4832:0:b0:48b:1899:b364 with SMTP id
 18-20020ac24832000000b0048b1899b364mr6987989lft.534.1660635565161; Tue, 16
 Aug 2022 00:39:25 -0700 (PDT)
MIME-Version: 1.0
References: <20220816033005.2700801-1-raj.khem@gmail.com>
 <20220816033005.2700801-5-raj.khem@gmail.com>
In-Reply-To: <20220816033005.2700801-5-raj.khem@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 16 Aug 2022 09:39:13 +0200
Message-ID: 
 <CANNYZj9wJFxRzEDQMpJ5CxRbx4Si5Se91YWn9bZ=TTr+NmCFgw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 5/6] spirv-tools,spirv-headers: Update to
 1.3.224.0
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 16 Aug 2022 07:39:36 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169427

This version isn't tagged, so where does 1.3.224 come from? Maybe it's
better to leave at 1.3.216+SRCPV?

Akex

On Tue, 16 Aug 2022 at 05:30, Khem Raj <raj.khem@gmail.com> wrote:
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.0.bb}  | 0
>  .../spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} | 2 +-
>  2 files changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-graphics/spir/{spirv-headers_1.3.216.0.bb => spirv-headers_1.3.224.0.bb} (100%)
>  rename meta/recipes-graphics/spir/{spirv-tools_1.3.216.0.bb => spirv-tools_1.3.224.0.bb} (96%)
>
> diff --git a/meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-headers_1.3.224.0.bb
> similarity index 100%
> rename from meta/recipes-graphics/spir/spirv-headers_1.3.216.0.bb
> rename to meta/recipes-graphics/spir/spirv-headers_1.3.224.0.bb
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> similarity index 96%
> rename from meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
> rename to meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> index eb907326c43..cfea28a6efe 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.3.216.0.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.224.0.bb
> @@ -7,7 +7,7 @@ SECTION = "graphics"
>  LICENSE  = "Apache-2.0"
>  LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>
> -SRCREV = "c94501352d545e84c821ce031399e76d1af32d18"
> +SRCREV = "5e61ea2098220059e89523f1f47b0bcd8c33b89a"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
>  PE = "1"
>  UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
> --
> 2.37.2
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#169419): https://lists.openembedded.org/g/openembedded-core/message/169419
> Mute This Topic: https://lists.openembedded.org/mt/93052351/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

