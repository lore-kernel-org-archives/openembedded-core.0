Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 58387C433EF
	for <webhook@archiver.kernel.org>; Tue,  4 Jan 2022 16:25:53 +0000 (UTC)
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com
 [209.85.222.182])
 by mx.groups.io with SMTP id smtpd.web12.8870.1641313551855353550
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 08:25:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RLSdgzDB;
 spf=pass (domain: gmail.com, ip: 209.85.222.182,
 mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f182.google.com with SMTP id e25so29642410qkl.12
        for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Jan 2022 08:25:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4+hGb3JgXFA4vYtVCJXIBdghXEeZ+9zBtuYH6McESsw=;
        b=RLSdgzDB7dcC45t74d49xEgtxO5hhqgNyjAXajvm1c4pfspXDJGJp7J5ukWoF2srqd
         SoEWs4mAuyIcbhskWUbjLD2d9ZsiBAKem09r+rmfSwP2sAo8QE+pVwxM85tU3mCIElv3
         2niA05s52ohwzvuHRydhkGTNt3UVoDLykOUt94Lg9iXI/jQz1Du84rVU+rtmtIc4jywc
         eBBXrl3tGU2Rmip3y2XCUtX/Wfv9UbZLSVfgmxfXwA/UNK0oy3GnKlLZ9ktl6+aJc//o
         WmOje5qOS++VAneg+u6z4fYyZRlYJPKS2MyvqumcSWvlSfb87Nb4tGp2QYTbGgP1XRQB
         FoOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4+hGb3JgXFA4vYtVCJXIBdghXEeZ+9zBtuYH6McESsw=;
        b=Zu41a6Wl+TRyzlwlnPS6wOb6Zi5ZLkjrWFBrwtrW6IoF9BsE87Ot4rUJRv1Gh/l46P
         I6geFLzGg3RMQnCmTQDz3u0Ox9Gsl635MEbyMMSDipV6JMu456pSm6W+MuVhyFIK/6fs
         fDzUpjXf/YOWsL9/FNR0U9wjowDsjyLhUDj4uyNCHkOhHClEhAooStbjOWBAWQHeBMuK
         0jzSxM84PnyIHNzc+YEUGMe7z4ugeGifqyfHxWOM1XkGqiwQOlqRtHzbYSzs7+XBTwKk
         Z+Pax5miL0hC8mC67AbZKA6txFID6PTQ6zcSyZ22nH3BDZvhToNxO/kkhoXV6xk5Vfoa
         wXIw==
X-Gm-Message-State: AOAM531cr5pAWyd9XicCZTHBDPJ4MRrWE6SSJQxNNutUkrIEdP95QVwW
	megkbVMFIMObxIe0aRUnhMwcMGHefgDSglk55H8=
X-Google-Smtp-Source: 
 ABdhPJwQMqXr2oru3WRxJTz6SmPS7Ji2Lcay8+pr9rkV5WuA72JgHa13G4MfDfBVQEeHC4DrcSg24qF0kcN3A6Wrexo=
X-Received: by 2002:a05:620a:1496:: with SMTP id
 w22mr35790237qkj.463.1641313550860;
 Tue, 04 Jan 2022 08:25:50 -0800 (PST)
MIME-Version: 1.0
References: <20220104141625.1369719-1-richard.purdie@linuxfoundation.org>
 <20220104141625.1369719-4-richard.purdie@linuxfoundation.org>
In-Reply-To: <20220104141625.1369719-4-richard.purdie@linuxfoundation.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 4 Jan 2022 08:25:24 -0800
Message-ID: 
 <CAMKF1srhkx5ghPB=Kn+vrFAXdOsL-7Vw0XHjbVwNX3-2iMCaLA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 4/4] webkitgtk: Add reproducibility fix
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 04 Jan 2022 16:25:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160169

On Tue, Jan 4, 2022 at 6:16 AM Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> When the date rolled from one year to another this highlighted a reproducibility
> issue. This could be better fixed by using SOURCE_DATE_EPOCH from the environment
> but I'm not sure how you do that in ruby. Help from someone with that knowledge
> to submit that upstream very welcome.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> ---
>  .../webkit/webkitgtk/reproducibility.patch    | 22 +++++++++++++++++++
>  meta/recipes-sato/webkit/webkitgtk_2.34.2.bb  |  1 +
>  2 files changed, 23 insertions(+)
>  create mode 100644 meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
>
> diff --git a/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
> new file mode 100644
> index 00000000000..e866a1a193a
> --- /dev/null
> +++ b/meta/recipes-sato/webkit/webkitgtk/reproducibility.patch
> @@ -0,0 +1,22 @@
> +Injection a year based on the current date isn't reproducible. Hack this
> +to a specific year for now for reproducibilty and to avoid autobuilder failures.
> +
> +The correct fix would be to use SOURCE_DATE_EPOCH from the environment and
> +then this could be submitted upstream, sadly my ruby isn't up to that.
> +
> +Upstream-Status: Pending [could be reworked]
> +Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> +
> +Index: webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +===================================================================
> +--- webkitgtk-2.34.2.orig/Source/JavaScriptCore/generator/GeneratedFile.rb
> ++++ webkitgtk-2.34.2/Source/JavaScriptCore/generator/GeneratedFile.rb
> +@@ -25,7 +25,7 @@ require 'date'
> + require 'digest'
> +
> + $LICENSE = <<-EOF
> +-Copyright (C) #{Date.today.year} Apple Inc. All rights reserved.
> ++Copyright (C) 2021 Apple Inc. All rights reserved.

perhaps eliminating the year completely is better.

> +
> + Redistribution and use in source and binary forms, with or without
> + modification, are permitted provided that the following conditions
> diff --git a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> index a9b151e3c3c..aa071395227 100644
> --- a/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> +++ b/meta/recipes-sato/webkit/webkitgtk_2.34.2.bb
> @@ -18,6 +18,7 @@ SRC_URI = "https://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
>             file://reduce-memory-overheads.patch \
>             file://musl-lower-stack-usage.patch \
>             file://0001-Fix-build-without-opengl-or-es.patch \
> +           file://reproducibility.patch \
>             "
>
>  SRC_URI[sha256sum] = "584677d6e7cae12e27cdcc8e05b4cf73b54849a24afc3d7a40cec91016deff00"
> --
> 2.32.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160165): https://lists.openembedded.org/g/openembedded-core/message/160165
> Mute This Topic: https://lists.openembedded.org/mt/88190252/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

