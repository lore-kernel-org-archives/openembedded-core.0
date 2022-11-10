Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B163AC4332F
	for <webhook@archiver.kernel.org>; Thu, 10 Nov 2022 20:44:10 +0000 (UTC)
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.1062.1668113048468806008
 for <openembedded-core@lists.openembedded.org>;
 Thu, 10 Nov 2022 12:44:08 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PBiLh7oR;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id v81so3085898oie.5
        for <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 12:44:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vs69DNkwIMSm1ZPnD6rgXn2RVvas3sTgS9u6qlrYxwQ=;
        b=PBiLh7oRP+N5yJY2anz33awbri7k1CktGeXAZg+MlAusyhyZJ8lddMfn0f33q43MOJ
         K8xV5urDcjmQVFYF8ps4rn0XgmZTPTiN0gCZ6JH3/e5vQ6uxtaCjNkucKFbEU95t7Dut
         BCp/Q4Fu2pbHhjn3wP+Qa/NXJ3l34rxVwGdBh5HXSpWQZZPKfEsfbQQLsLl6FQAL6S/f
         t9OC4gxWgVlAjG1JPLRUjAKNG1g0z5mBU92urIcxj+ew+8WFW+BWWyAjeytt+dHuIFUg
         kRgrZwadQ2BySNVdZkfA95NkwktddAsaP5YQBvMXlJFbrAvnWSkhjazj0lfLOLqUCkTV
         aAQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vs69DNkwIMSm1ZPnD6rgXn2RVvas3sTgS9u6qlrYxwQ=;
        b=1qcg7Kgu2YlCvYByugXnSDURSY+eyw8RAvKKEIe0dJudDXjf00JuAJ8XmI/mvz7jC9
         4GBBA1HwxkxCSturSL3KfQRMygS3AYx2KffjfS0mGElP8pa+HmAlJMBDPeqhOYRv8oZ6
         jofdCzco9Z9tzmXPfvanFR/uK9S/M/iwr8+KXtEPmupLxbyjCe/Td4VNXDRqrBljV4mz
         geuyuTuna3q/kQzCYfdeI2skzIrsJSM1R3aagqK7FqqgUxjG3yrppaPvsC0625COLkNp
         zlf+heBH1Al35k4Q7YZp7Sa5N7Kd5GUptG2R06s12Tey/akJcpOl/GjoB8E/8E1LV26E
         QILg==
X-Gm-Message-State: ACrzQf2RRzSbk4F5ep6H8cpq0JSXDGbcnUBpjU0QqJzTgHbmQYEzZsJo
	/+Amt9mwvNwIm6t09cPA1D3CYBhx4l/mgpciMAM=
X-Google-Smtp-Source: AMsMyM68HXWJ7mVkDhOverUlE3n1xLWurERhckoHEiQOr1oobNIUTTp30iRL6ZCybmUeIxqulswbXiKNB0kWdomUT40=
X-Received: by 2002:a54:4004:0:b0:359:d852:616d with SMTP id
 x4-20020a544004000000b00359d852616dmr1998153oie.55.1668113047485; Thu, 10 Nov
 2022 12:44:07 -0800 (PST)
MIME-Version: 1.0
References: <20221110204232.12768-1-jorcrous@amazon.com> <20221110204232.12768-2-jorcrous@amazon.com>
In-Reply-To: <20221110204232.12768-2-jorcrous@amazon.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 10 Nov 2022 12:43:41 -0800
Message-ID: <CAMKF1srJzvGaRObtXvNJPKKO6VnRAX8HUxQZfjtFbe9cpNTWsw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] spirv-tools: Correctly set the prefix in
 exported cmake packages
To: jorcrous@amazon.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 10 Nov 2022 20:44:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173109

On Thu, Nov 10, 2022 at 12:42 PM Jordan Crouse via
lists.openembedded.org <jorcrous=amazon.com@lists.openembedded.org>
wrote:
>
> spirv-tools exports Cmake packages.  When they are installed the
> INTERFACE_LINK_LIBRARIES variable is not correctly updated to use
> _IMPORT_PREFIX like the other variables. This may have something to do with
> the path to the sysroot being different than the source path.
>
> The existing recipe recognizes that the sysroot path made it through to the
> install and tries to get rid of it, but this just ends up with dependent
> tools looking in vain for /usr/lib/librt.so.
>
> Replace the INTERFACE_LINK_LIBRARIES value in SPIRV-ToolsTarget.cmake with
> "${IMPORT_PREFIX}/lib".
>
> Signed-off-by: Jordan Crouse <jorcrous@amazon.com>
> ---
>
>  meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
> index ea47796543..fdc9c9225a 100644
> --- a/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
> +++ b/meta/recipes-graphics/spir/spirv-tools_1.3.231.1.bb
> @@ -10,6 +10,8 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=3b83ef96387f14655fc854ddc3c6bd57"
>  SRCREV = "eb0a36633d2acf4de82588504f951ad0f2cecacb"
>  SRC_URI = "git://github.com/KhronosGroup/SPIRV-Tools.git;branch=master;protocol=https"
>  PE = "1"
> +PR = "r1"

We no longer bump the PR manually. So this is not needed.

> +
>  UPSTREAM_CHECK_GITTAGREGEX = "sdk-(?P<pver>\d+(\.\d+)+)"
>  S = "${WORKDIR}/git"
>
> @@ -25,9 +27,10 @@ EXTRA_OECMAKE += "\
>  "
>
>  do_install:append:class-target() {
> -    # reproducibility: remove build host path
> +    # Properly set _IMPORT_PREFIX in INTERFACE_LINK_LIBRARIES so that dependent
> +    # tools can find the right library
>      sed -i ${D}${libdir}/cmake/SPIRV-Tools/SPIRV-ToolsTarget.cmake \
> -        -e 's:${STAGING_DIR_HOST}::g'
> +        -e 's:INTERFACE_LINK_LIBRARIES.*$:INTERFACE_LINK_LIBRARIES "\$\{_IMPORT_PREFIX\}/lib":'
>  }
>
>  # all the libraries are unversioned, so don't pack it on PN-dev
> --
> 2.37.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#173108): https://lists.openembedded.org/g/openembedded-core/message/173108
> Mute This Topic: https://lists.openembedded.org/mt/94945230/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

