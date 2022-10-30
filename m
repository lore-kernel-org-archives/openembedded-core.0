Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF120C38A02
	for <webhook@archiver.kernel.org>; Sun, 30 Oct 2022 13:32:44 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.8146.1667136757752309608
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Oct 2022 06:32:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=p/MV+7Tl;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id 192so8577934pfx.5
        for <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 06:32:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=date:message-id:to:from:subject:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lXzidnSTshRu0SwuJZaHf72vElHRZJITaV79ndn2VE0=;
        b=p/MV+7Tl9bysxOYd9Ga8OSO++pCeVGzji8rS6AFz0cunzfQ/mJRaR12ZvcqSfrvQ1I
         Jk/BM8M0W0Vhp1nPPWeVnst2t3+onZOxTdQ0R3Z6reTL9AscjmBvWTOvNN9m2dyeN/20
         BHdoUK/BwFcyhZOF8mGkbqVQwapoTLUA0bhkZsRgFOTcvtsTGTRins/EJnY5dTQVkLs9
         1t8mXHMwUWF6QxzBTLiZgLpJFL8bkfMZV+CjaoP9tuCNKKQgd6fQk6B4jNw63DeTXsCl
         YFV2J9xQBKJI5R4w8aUErUnIj7bJuA190M6f0ED2alJynrPf9ElCFpS8dBJoKm8dcQQL
         4dxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=date:message-id:to:from:subject:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lXzidnSTshRu0SwuJZaHf72vElHRZJITaV79ndn2VE0=;
        b=6/iVTbEd6sfjoXvOErRGaSoHQomDuRv/gFgUBUY0FjkS2XK/J8UOZNbjrGoIvequWY
         xZRh+JEI79y68z+FUQrstU6/lVqYXYIVMz1SKgNgQDTgKijsnuI4d58PXKAPrv2dVQvD
         4Vs1FIQA2qVp2PROIFatZ7HH75q+O6/LyBwggiAQx6MxkKcfBDHo8s/yNoJkbjQ0gOPO
         heeoVE9RX1JtsX5Bnw8VDtinskABera1wD4kzqmDfcdEcq39/NHfhdTcxZ4Bp5UXoVX5
         GberhTv3Jbl9HzkUYl2NwIYTXX7uuUdi2ounVtlJvsbTWTTOTFSLkQE24oMeerJozxqL
         57Fw==
X-Gm-Message-State: ACrzQf2bYo2wMeKlIrWukFYt3ynwfrmuuEeMTjEi3vCDdFCae7vaQHvK
	l9L/Vp9hjdL+9lwFnsoxEwIZtF2+gYOTbbRj
X-Google-Smtp-Source: AMsMyM4+cq7lJNpZ6wA+ctZIUzlXTu1St9NddZbDuIXxgjyk9sSLzwSV3lwoy4b0tazKdRI+KhPckQ==
X-Received: by 2002:a05:6a00:1a04:b0:52a:d4dc:5653 with SMTP id g4-20020a056a001a0400b0052ad4dc5653mr9418849pfv.69.1667136756514;
        Sun, 30 Oct 2022 06:32:36 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id z28-20020aa79e5c000000b00565c860bf83sm2627266pfq.150.2022.10.30.06.32.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Oct 2022 06:32:36 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 2C8EB96219F; Sun, 30 Oct 2022 03:32:34 -1000 (HST)
Subject: OE-core CVE metrics for langdale on Sun 30 Oct 2022 03:30:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20221030133234.2C8EB96219F@nuc.router0800d9.com>
Date: Sun, 30 Oct 2022 03:32:34 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Oct 2022 13:32:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/172281

Branch: langdale

New this week: 1 CVEs
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *

Removed this week: 1 CVEs
CVE-2022-3555 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3555 *

Full list:  Found 20 unpatched CVEs
CVE-2022-2879 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2879 *
CVE-2022-2880 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2880 *
CVE-2022-3165 (CVSS3: 6.5 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3165 *
CVE-2022-3352 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3352 *
CVE-2022-3358 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3358 *
CVE-2022-3550 (CVSS3: 9.8 CRITICAL): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3550 *
CVE-2022-3551 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3551 *
CVE-2022-3553 (CVSS3: 7.5 HIGH): xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3553 *
CVE-2022-3554 (CVSS3: 7.5 HIGH): libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3554 *
CVE-2022-3570 (CVSS3: 9.8 CRITICAL): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3570 *
CVE-2022-3597 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3597 *
CVE-2022-3598 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3598 *
CVE-2022-3599 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3599 *
CVE-2022-3626 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3626 *
CVE-2022-3627 (CVSS3: 6.5 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3627 *
CVE-2022-3705 (CVSS3: 7.5 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3705 *
CVE-2022-39253 (CVSS3: 5.5 MEDIUM): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39253 *
CVE-2022-39260 (CVSS3: 8.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-39260 *
CVE-2022-41715 (CVSS3: 7.5 HIGH): go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-41715 *
CVE-2022-43680 (CVSS3: 7.5 HIGH): expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-43680 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

