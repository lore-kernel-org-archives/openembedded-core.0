Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 198E8C10F1B
	for <webhook@archiver.kernel.org>; Wed, 21 Dec 2022 17:16:25 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.web11.24392.1671642982365646355
 for <openembedded-core@lists.openembedded.org>;
 Wed, 21 Dec 2022 09:16:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=jU7r4ADu;
 spf=softfail (domain: sakoman.com, ip: 209.85.218.51, mailfrom: steve@sakoman.com)
Received: by mail-ej1-f51.google.com with SMTP id fc4so38291501ejc.12
        for <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 09:16:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wIUHLKD848c3mJLECDIhfvrj0GKOF7osrN4h86sZFmY=;
        b=jU7r4ADuGNCRtVaZyMby7R7es6bERpJCsjPWfA7388yv0QnX+lQYVOFkbxd/9ynNVO
         9m2oBWCSRB8w26aLCEiN549g/28TEANbv7kMFIF4YXi106PwMnpk63n9LqVLsRDp1Hxq
         2ojmjwWR+wP+dV/dtEbiiGK79Fa3qqgSNzoNgHkDy1+ZnegtkDQVvN+Mf4L3OuY2sLWo
         vSsqRS8sCE/2TsJzc/S8eAUHVASIUlUhsYbjqx+jMGblpXZnx1WKlCmMXnddbPmqST8Y
         G0MbvE/6WWYXVd+VVPZ/h87WjiXNOqvZq3hnc6ZTL+FsmPekCmqWAEsvQsjLiE7JGoeM
         JCuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wIUHLKD848c3mJLECDIhfvrj0GKOF7osrN4h86sZFmY=;
        b=q6Q4lzeFCnAuNu2pLcQLs1qYBYnWyMohotTnw4iQuj8jmCDPdrRbjOtsis5S9e45xI
         /084dyx2QznHgEOf1KG9D0c7Sjg23TGG0tgfbI/f3bH4Ihqxe2ceko/aPKbNi8puQZ/a
         xnAwg/bfsKrcisOKDWKGrQz7HOIyJIniawWGawiNFBfL4f1siTRzJVVyFNF0CGIDZNh1
         QiJhsbI9tmfr17U3FfBVT4Ain1QXwJlEibX5tGGEjSXT2T5RBCPrV8OsDH5WrbeGLyyZ
         jWhnK/2pxaTrSCfmkifO1j56S15BTz54Tmz3zGrzbzL4HtAtdiHr9aODXPkan0O9PkZ4
         GcLg==
X-Gm-Message-State: AFqh2kpR/XexmwsZu3+gfO22tpyE9SRKUa8dyNBI/vToy0XoRxh9A0Yp
	CtC7Gi8cb+tXSGGja4SSRLosASpZIVqLKUkzDWGHsA==
X-Google-Smtp-Source: AMrXdXu7I1vDrNd3zKvmY0PjvloA4QGKx5JyHatMccjYGPrjkFEPnhkC2ULO0jr1zbL44IoxOBg1qV+3oAiZ1wdUjJo=
X-Received: by 2002:a17:906:dd1:b0:7c4:f90e:186e with SMTP id
 p17-20020a1709060dd100b007c4f90e186emr169071eji.357.1671642980625; Wed, 21
 Dec 2022 09:16:20 -0800 (PST)
MIME-Version: 1.0
References: <20221221070914.20166-1-ranjitsinhrathod1991@gmail.com>
In-Reply-To: <20221221070914.20166-1-ranjitsinhrathod1991@gmail.com>
From: Steve Sakoman <steve@sakoman.com>
Date: Wed, 21 Dec 2022 07:16:08 -1000
Message-ID: <CAOSpxdYNSe0TGrBs__XyvErhXZVOmca1LXxzrfP1DiViFSaMBw@mail.gmail.com>
Subject: Re: [OE-Core][dunfell][PATCH] curl: Correct LICENSE from MIT to curl
To: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
Cc: openembedded-core@lists.openembedded.org, 
	Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 21 Dec 2022 17:16:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174924

This patch results in build errors:

stdio: WARNING: curl-7.69.1-r0 do_populate_lic: curl: No generic
license file exists for: curl in any provider
stdio: WARNING: core-image-sato-1.0-r0 do_rootfs: The license listed
curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-dev-1.0-r0 do_rootfs: The license
listed curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-dev-1.0-r0 do_rootfs: The license
listed curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-dev-1.0-r0 do_rootfs: The license
listed curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: The license
listed curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: The license
listed curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-sdk-1.0-r0 do_rootfs: The license
listed curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-sdk-ptest-1.0-r0 do_rootfs: The
license listed curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-sdk-ptest-1.0-r0 do_rootfs: The
license listed curl was not in the licenses collected for recipe curl
stdio: WARNING: core-image-sato-sdk-ptest-1.0-r0 do_rootfs: The
license listed curl was not in the licenses collected for recipe curl

On Tue, Dec 20, 2022 at 9:09 PM Ranjitsinh Rathod
<ranjitsinhrathod1991@gmail.com> wrote:
>
> From: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
>
> LICENSE for curl is set to MIT which is wrong and proper license is
> 'curl'
>
> I check below link and the line "Curl and libcurl are licensed under
> the license below, which is inspired by MIT/X, but not identical." says
> that the license is identical to MIT but actual license is identical
> from the file "meta/files/common-licenses/curl"
> Link: https://curl.se/docs/copyright.html
>
> Also, I do not find the MIT license text in the entire source-code
>
> (From OE-Core rev: 34b228bd3a80a74bf4d84ef7ee362f4ab1e3a466)
>
> Conflicts:
> meta/recipes-support/curl/curl_7.86.0.bb
> This is due to version change of curl and also due to MIT and
> MIT-open-group license variant
>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinh.rathod@kpit.com>
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
> (cherry picked from commit 4a246e06cb62efff8bfd20cdf3dde31e24f9b711)
> Signed-off-by: Ranjitsinh Rathod <ranjitsinhrathod1991@gmail.com>
> ---
>  meta/recipes-support/curl/curl_7.69.1.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta/recipes-support/curl/curl_7.69.1.bb b/meta/recipes-support/curl/curl_7.69.1.bb
> index 31aa9d7185..49287b2e3d 100644
> --- a/meta/recipes-support/curl/curl_7.69.1.bb
> +++ b/meta/recipes-support/curl/curl_7.69.1.bb
> @@ -6,7 +6,7 @@ HTTP post, SSL connections, proxy support, FTP uploads, and more!"
>  HOMEPAGE = "http://curl.haxx.se/"
>  BUGTRACKER = "http://curl.haxx.se/mail/list.cgi?list=curl-tracker"
>  SECTION = "console/network"
> -LICENSE = "MIT"
> +LICENSE = "curl"
>  LIC_FILES_CHKSUM = "file://COPYING;md5=2e9fb35867314fe31c6a4977ef7dd531"
>
>  SRC_URI = "https://curl.haxx.se/download/curl-${PV}.tar.bz2 \
> --
> 2.25.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174901): https://lists.openembedded.org/g/openembedded-core/message/174901
> Mute This Topic: https://lists.openembedded.org/mt/95802470/3620601
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [steve@sakoman.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

