Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26162C7EE2E
	for <webhook@archiver.kernel.org>; Sun, 11 Jun 2023 14:32:27 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web10.37430.1686493942051322262
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jun 2023 07:32:22 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@sakoman-com.20221208.gappssmtp.com header.s=20221208 header.b=M1QUyRR4;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1b3c578c602so2005395ad.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 07:32:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20221208.gappssmtp.com; s=20221208; t=1686493941; x=1689085941;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cmzDAnDhc3HuWUundG8JlcNnWajG6aURBm7ImSSXAWU=;
        b=M1QUyRR4OuynxLl+gztT0iNm4TjLLUjaXlSeggGEhtLbbaltjP8FgaHVyWRO95OKfo
         nYgbraq4mnNemduh1FqskuXW/IT1BSCf71vbADNSzh1e5KC7gpix7wuPCnqmukkxZKSC
         mTRw1G7vt/ltkA6fVqgAW9Zu3bhpigidjDBApS544PjE/Ef1PfaueP71zXvIivxQUFiV
         csE+/8oLdIhABv9AaFFIjJfu71EmlQpD6YA09qvqYoQN2gV9SW0IS9j7MKhalnBwRPFI
         2qDvEEB2ApBAYdWFcegm+BBjUSxva93aSqbmvlLOxeBtGzGIhRDSb9NCuZ4x6D6DEBZM
         XO8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686493941; x=1689085941;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cmzDAnDhc3HuWUundG8JlcNnWajG6aURBm7ImSSXAWU=;
        b=KSFynxBM6945dv2GrAOsQBe7yJrILrjstzZLoIkYYjFtO72VtAqFqP5Hc7/5+Haf1t
         LqWYiWqF+qmvjRSRgi7cENFHqPtbS0j3gD8BODpx9b0s/yyjQnCO/QkF8l+jI9c5lq6p
         QVo1QJpF4+WUaCRhNPAEEefTttqviWr17tEHkK74aDt9aRHNCe2AsaR+VJDg9mo8UhUf
         mTF2upyG03GSJHMTwhXc0gpttaC386vy4Zuin8Kszo/qwopVaQNW10atPgrvVyvfIUTV
         rb+TCMmLjWGXLD0xTCn+/PKWMAfOG7fBzI2GhqBSI3HxkCx31bxgs714qodqWgCuugIC
         OB0A==
X-Gm-Message-State: AC+VfDwHzCqQi883bZYrLngCHQ5nHL94VZ7NifRTZpGv4iXVmXa5gFvz
	Wx1DvEWcC57ZuyuYz2Zr0BKt6wb8iqcHyvLeFZ0=
X-Google-Smtp-Source: ACHHUZ5hhIEAE1a/K8JInFJIfLohFvxjd8r8K3PLrrRWntn7TDOi7Jl10rFMIoilOnJsQ7GN5P7zww==
X-Received: by 2002:a17:902:e84e:b0:1ae:2c87:f771 with SMTP id t14-20020a170902e84e00b001ae2c87f771mr5640279plg.20.1686493940852;
        Sun, 11 Jun 2023 07:32:20 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-234-106-30.hawaiiantel.net. [72.234.106.30])
        by smtp.gmail.com with ESMTPSA id d12-20020a170902654c00b001ac4d3d3f72sm6509687pln.296.2023.06.11.07.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jun 2023 07:32:20 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A29909604A6; Sun, 11 Jun 2023 04:32:18 -1000 (HST)
Subject: OE-core CVE metrics for mickledore on Sun 11 Jun 2023 04:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 11 Jun 2023 04:32:18 -1000
Message-Id: <20230611143218.A29909604A6@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Jun 2023 14:32:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/182619

Branch: mickledore

New this week: 8 CVEs
CVE-2022-48502 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48502 *
CVE-2023-2002 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2002 *
CVE-2023-2598 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2598 *
CVE-2023-2650 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2650 *
CVE-2023-2985 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2985 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-32324 (CVSS3: 5.5 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32324 *
CVE-2023-34256 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34256 *

Removed this week: 2 CVEs
CVE-2022-44370 (CVSS3: 7.8 HIGH): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-44370 *
CVE-2023-0459 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0459 *

Full list:  Found 77 unpatched CVEs
CVE-2021-3714 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3714 *
CVE-2021-3864 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3864 *
CVE-2021-4336 (CVSS3: 9.8 CRITICAL): ninja:ninja-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4336 *
CVE-2022-0400 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0400 *
CVE-2022-1247 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-1247 *
CVE-2022-3219 (CVSS3: 3.3 LOW): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-3533 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3533 *
CVE-2022-3606 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3606 *
CVE-2022-36402 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-36402 *
CVE-2022-38096 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-38096 *
CVE-2022-3964 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3964 *
CVE-2022-3965 (CVSS3: 8.1 HIGH): ffmpeg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3965 *
CVE-2022-4543 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4543 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2022-48425 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48425 *
CVE-2022-48502 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-48502 *
CVE-2023-0330 (CVSS3: 6.0 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0330 *
CVE-2023-0465 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0465 *
CVE-2023-0466 (CVSS3: 5.3 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0466 *
CVE-2023-0615 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0615 *
CVE-2023-1255 (CVSS3: 5.9 MEDIUM): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1255 *
CVE-2023-1380 (CVSS3: 7.1 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1380 *
CVE-2023-1544 (CVSS3: 6.3 MEDIUM): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1544 *
CVE-2023-1611 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1611 *
CVE-2023-1855 (CVSS3: 6.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1855 *
CVE-2023-1859 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1859 *
CVE-2023-1916 (CVSS3: 6.1 MEDIUM): tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1916 *
CVE-2023-1972 (CVSS3: 6.5 MEDIUM): binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1972 *
CVE-2023-1989 (CVSS3: 7.0 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1989 *
CVE-2023-1990 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1990 *
CVE-2023-1998 (CVSS3: 5.6 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1998 *
CVE-2023-2002 (CVSS3: 6.8 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2002 *
CVE-2023-2124 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2124 *
CVE-2023-2156 (CVSS3: 7.5 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2156 *
CVE-2023-2162 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2162 *
CVE-2023-2194 (CVSS3: 6.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2194 *
CVE-2023-2235 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2235 *
CVE-2023-23039 (CVSS3: 5.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-23039 *
CVE-2023-2426 (CVSS3: 5.5 MEDIUM): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2426 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-24534 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24534 *
CVE-2023-24536 (CVSS3: 7.5 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24536 *
CVE-2023-24537 (CVSS3: 7.5 HIGH): go-binary-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24537 *
CVE-2023-24538 (CVSS3: 9.8 CRITICAL): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24538 *
CVE-2023-24539 (CVSS3: 7.3 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24539 *
CVE-2023-24540 (CVSS3: 9.8 CRITICAL): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24540 *
CVE-2023-25652 (CVSS3: 7.5 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-25652 *
CVE-2023-2598 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2598 *
CVE-2023-2609 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2609 *
CVE-2023-2610 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2610 *
CVE-2023-2650 (CVSS3: 7.5 HIGH): openssl:openssl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2650 *
CVE-2023-2804 (CVSS3: 6.5 MEDIUM): libjpeg-turbo:libjpeg-turbo-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2804 *
CVE-2023-28319 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28319 *
CVE-2023-28320 (CVSS3: 5.9 MEDIUM): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28320 *
CVE-2023-28321 (CVSS3: 7.5 HIGH): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28321 *
CVE-2023-28322 (CVSS3: 9.1 CRITICAL): curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28322 *
CVE-2023-28328 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28328 *
CVE-2023-28464 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28464 *
CVE-2023-28484 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28484 *
CVE-2023-28866 (CVSS3: 5.3 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28866 *
CVE-2023-2898 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2898 *
CVE-2023-29007 (CVSS3: 7.8 HIGH): git https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29007 *
CVE-2023-29400 (CVSS3: 7.3 HIGH): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29400 *
CVE-2023-29469 (CVSS3: 6.5 MEDIUM): libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-29469 *
CVE-2023-2985 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-2985 *
CVE-2023-30456 (CVSS3: 6.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30456 *
CVE-2023-30571 (CVSS3: 5.3 MEDIUM): libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30571 *
CVE-2023-30630 (CVSS3: 7.8 HIGH): dmidecode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30630 *
CVE-2023-30772 (CVSS3: 6.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-30772 *
CVE-2023-31436 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-31436 *
CVE-2023-32233 (CVSS3: 7.8 HIGH): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32233 *
CVE-2023-32324 (CVSS3: 5.5 MEDIUM): cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32324 *
CVE-2023-32681 (CVSS3: 6.1 MEDIUM): python3-requests https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-32681 *
CVE-2023-33203 (CVSS3: 6.4 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33203 *
CVE-2023-33204 (CVSS3: 7.8 HIGH): sysstat https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33204 *
CVE-2023-33288 (CVSS3: 4.7 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-33288 *
CVE-2023-34256 (CVSS3: 5.5 MEDIUM): linux-yocto https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-34256 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

