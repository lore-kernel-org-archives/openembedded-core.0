Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 196C6C4321E
	for <webhook@archiver.kernel.org>; Sun, 27 Nov 2022 13:02:23 +0000 (UTC)
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
 by mx.groups.io with SMTP id smtpd.web11.91202.1669554141578426162
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Nov 2022 05:02:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=RHpFgRDY;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.41, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f41.google.com with SMTP id x13-20020a17090a46cd00b00218f611b6e9so7932649pjg.1
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 05:02:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j+D7ESm2Lx07BuYlMGf2pzS6NTX9b4uRWeFSd28SuXI=;
        b=RHpFgRDYqjJdpAVD1ETampljVE2wLqTjsDwNQc9nlNAxls2XCAr2EshD0Ubzbl7Nrv
         qcGatK4WGEQ3/P29bF8nuinAaFVuwodZ8MUUh+81YrOSL3RCWTTkulG9JD2iW2et3WfC
         Y7XOyBZeas7gxdhotALRNUfCXwTd/KaJw21ksWvKkIAk+6wGyC0GGqgyJvHHxanfmsnn
         KhrO/aX+q6C4QIxmx6U945WvFwdTnb4CEKegvPgNTxZ7Y2RCA2ICenLi6FvQFerxOec6
         3xphDRjxC6gPtQO83jXfkn24InH9pPxFh45QFXo9DVmTOO+rcHfUqcMlaaR6MZxLXCbT
         pkIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j+D7ESm2Lx07BuYlMGf2pzS6NTX9b4uRWeFSd28SuXI=;
        b=1MQOiddqGd5D37ad81Q8WLl/wVIFXrRI400X38gYOmvVhNzRPqThYL3+RpjQTtNT6h
         yfrUDYX7qXnhmiD8BS2Hxo5rfZuyZOm+gME9JT2yCKGQjghxodWyfihCXH7j/I5pEPyc
         1K7+U+bl39ZFXaKPJA17UvmbrgVc3UI4MxN/ulix5znrWXd0OA9V/AKjNjCHYhehA8ow
         1wobJf2teZMWXYobvHWDlbeB3Bpk88eG77NeuyMaHVPeOp7m/qDf6B8YtoyuWlJslJUs
         th/X7UXCdCsyng/1TeluF+jrjZiz16n9VnRctv5CxQESsKj1DymSlqnPeeUVRSNfhM2H
         bHFw==
X-Gm-Message-State: ANoB5pkTnEsekBGLMhbdU6UyMieKwMPCWdPUE+l2a2wFEcxNMtJGHfu3
	boLFToP/cd5P6wCWTnbFa+AyUiSn8viLnhmUR5o=
X-Google-Smtp-Source: AA0mqf62Y3PXkYvFc1RWDMicCy/aj3u+kScek2Hhhr/p19JWiublsas3GJCARySGXAKqYCEhokEHsg==
X-Received: by 2002:a17:90a:d145:b0:211:7e51:9d65 with SMTP id t5-20020a17090ad14500b002117e519d65mr53775651pjw.220.1669554140455;
        Sun, 27 Nov 2022 05:02:20 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id b21-20020a631b15000000b0046ae5cfc3d5sm5115109pgb.61.2022.11.27.05.02.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Nov 2022 05:02:19 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 233A89602F7; Sun, 27 Nov 2022 03:02:18 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 27 Nov 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221127130218.233A89602F7@nuc.router0800d9.com>
Date: Sun, 27 Nov 2022 03:02:18 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 27 Nov 2022 13:02:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173841

Branch: kirkstone

New this week: 0 CVEs

Removed this week: 0 CVEs

Full list:  Found 26 unpatched CVEs
CVE-2021-35937 (CVSS3: 6.4 MEDIUM): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35937 *
CVE-2021-35938 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35938 *
CVE-2021-35939 (CVSS3: 7.8 HIGH): rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35939 *
CVE-2021-36369 (CVSS3: 7.5 HIGH): dropbear https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36369 *
CVE-2022-2868 (CVSS3: 8.1 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2868 *
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3550 (CVSS3: 8.8 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 6.5 MEDIUM): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3570 (CVSS3: 5.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

