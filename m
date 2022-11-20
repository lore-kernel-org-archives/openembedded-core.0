Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEBE6C4332F
	for <webhook@archiver.kernel.org>; Sun, 20 Nov 2022 13:04:29 +0000 (UTC)
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web11.11901.1668949468563584418
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Nov 2022 05:04:28 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=4xVUPQcJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.169, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f169.google.com with SMTP id k7so8340478pll.6
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 05:04:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4m8T5otetcq8NLFwQs4/ZSO62XOqhq3+O1+3SP8i/UE=;
        b=4xVUPQcJYR59q1esfU0Gp8xqHtCPw49FnsSVipGO6sZ0q3nPULeLU1crU2pU3IdOJA
         xwqb/b5oAmmwf3byCzU4rVGNlSKd0d4f39bqjI2kMz6W2DMPlgdXsg6RGTQmQrJzc6oC
         kV3lGcReV6Bz7deleY1EAe9COT/8qP/+p+ThiA6cYpnC0d4zSkarM0Z5uA5h+5slFoiL
         5Xl/pm5q/t/KC+MuYSEkrLtP8zp8cXnRvNdqcVu3bR3/IEdZUpNuoNum8XxfEk4WV9BY
         MkAhadyX2b6/UWZjG0k1xh0yvE8caOawKRMrsIQI1xqHZmwo4PjWvSd5NSjwhB5g8arU
         SVGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4m8T5otetcq8NLFwQs4/ZSO62XOqhq3+O1+3SP8i/UE=;
        b=vaKa720E2YigE8CDjsM/L8WfkWCdJRKWXXrXuWzph9IT/c6OpDJoZOkkNQ+9ggV5WH
         j+gsXgJsHMMfLntA03Kv0ujRbXXb15jmpou4dZpSeHuQfZ2LwGCZ9Q2neS7gZoIgOiLf
         E2C0jbH1JdB8USdMq+E90qgfP4ftVAK4qcUxDEXiAn8RXLcb8khTjYbVM4NOdlIO6gc8
         Z1H0ndzj9ORoYc8GQD5bb3fHQJlwqUDosxvR5STHGhBTNdimccsrOYDF0oft9WK73F7K
         z10FUQIU3nGarOxgn7S9esTNSKErmcs8miwcP6kZH9UGvb15A6V8VfVahDLGqEPU7S0l
         86FA==
X-Gm-Message-State: ANoB5plSptvUQbgIxaL7kf4qmKejWJSt40C9z//NYjbM5531PbWvgBBz
	5nnoRuGDbEZKsD0k01ZiNk6Wu5x8m4HTfo4GcA0=
X-Google-Smtp-Source: AA0mqf6Bd4iYI1PUzML4+SjuAcEKL74W5MBBi/U4T44oTEezyCiOl/hEWY2xYIgL6VWZ60BFxZaIIQ==
X-Received: by 2002:a17:90a:d681:b0:213:d08f:a455 with SMTP id x1-20020a17090ad68100b00213d08fa455mr22445789pju.130.1668949467358;
        Sun, 20 Nov 2022 05:04:27 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id c65-20020a621c44000000b0056bcd7e1e04sm6598914pfc.124.2022.11.20.05.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 05:04:26 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id EB2E69602C3; Sun, 20 Nov 2022 03:04:24 -1000 (HST)
Subject: OE-core CVE metrics for kirkstone on Sun 20 Nov 2022 03:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221120130424.EB2E69602C3@nuc.router0800d9.com>
Date: Sun, 20 Nov 2022 03:04:24 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 20 Nov 2022 13:04:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/173581

Branch: kirkstone

New this week: 1 CVEs
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *

Removed this week: 1 CVEs
CVE-2022-3165 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3165 *

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
CVE-2022-3570 (CVSS3: 7.8 HIGH): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-3872 (CVSS3: 8.6 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3872 *
CVE-2022-39377 (CVSS3: 9.8 CRITICAL): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39377 *
CVE-2022-3970 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3970 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-41716 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41716 *
CVE-2022-42915 (CVSS3: 9.8 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42915 *
CVE-2022-42916 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42916 *
CVE-2022-42919 (CVSS3: 7.8 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-42919 *
CVE-2022-43995 (CVSS3: 7.1 HIGH): sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43995 *
CVE-2022-45061 (CVSS3: 7.5 HIGH): python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-45061 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

