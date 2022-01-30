Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE07C433EF
	for <webhook@archiver.kernel.org>; Sun, 30 Jan 2022 14:04:47 +0000 (UTC)
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com
 [209.85.166.177])
 by mx.groups.io with SMTP id smtpd.web12.18807.1643551486235138045
 for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 06:04:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=Nknjai05;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.177,
 mailfrom: steve@sakoman.com)
Received: by mail-il1-f177.google.com with SMTP id z18so693223ilp.3
        for <openembedded-core@lists.openembedded.org>;
 Sun, 30 Jan 2022 06:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=rTTCCFefC29Ilkw7/brAeHzIoRFwpMG1FRZomXMGIcU=;
        b=Nknjai05LryIBEZfDNCtqz19b6CCZR5ycdvc32vWihJsOPck5NqkBcmZJ05Gkjoej6
         /FpE+ATVhhtrL/3xaUPnDJBN6EzhKnloS7TBndAYoUvplQaknpgap6YcCP7BVeKSKBbL
         Fsif7Pa+BAhuUEbu6IdvHM9WP1Z823Ha5XRh9ylekn/MCvXc+3RMRIlTk0jHRvMTgD0H
         Acj2yLD5ya4psxUO+Qamm/rgdb8bFX5FumoS2KvJNeDB5CnUt0fb5aaufWJE5r3xeTMA
         Rj3/fUZSWKo/t+blbC2yo0/7WFY7vg9bDqBlqOHr837MaXrtAe5SWIKA+6sJvarkpI/D
         vX5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=rTTCCFefC29Ilkw7/brAeHzIoRFwpMG1FRZomXMGIcU=;
        b=e692ZA0/Atnw67OPUJMGKuWa8sSTk9b1VVUxpuKLFZ/d1Of7WHFQBP/pRExeuhfv7X
         xtzCZYcom5NCJoZ3/yNMNKgXoDI05jN7AwnjR9ftaiZNxGWm0sbFL/1UQlm7y4klaTck
         JsDWLg1Y8lAmix16H5jsmDuV3qj7nJ5IrZeKtVadPRUQgxP1WRzqjvTiNM1T+rvX7j34
         kV6AsehdjlX++zDVgU4jGRxXGNWawL+vWfBJYJCXYcvoeyTzCcaGSKa9HjIA4Bwo5KrU
         fvJXevbtZtwEXRXeSzS+NQoYS9UijuM73R+mNX+UzJ0RnRaaac+2M9lYklfGs4zr/8O1
         sUyw==
X-Gm-Message-State: AOAM531FxexTRd3zny7dUXT4T4xoXtrwFjmQcEAw5ZN0dDWENvgX5+vu
	qp0NtGS1/xq164tau3KGuWVtRypJWvzIlw3z
X-Google-Smtp-Source: 
 ABdhPJwOKPiie/AsNtpX+C5XJb4XXneM9WjkAQZVQ3ks/GYUNiCoqRzb1mfVzConopSdqrsGbxkOqQ==
X-Received: by 2002:a05:6e02:144d:: with SMTP id
 p13mr10617624ilo.47.1643551484959;
        Sun, 30 Jan 2022 06:04:44 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 f4sm3658818iow.53.2022.01.30.06.04.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Jan 2022 06:04:44 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 86A41962C21; Sun, 30 Jan 2022 04:04:41 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 30 Jan 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220130140441.86A41962C21@nuc.router0800d9.com>
Date: Sun, 30 Jan 2022 04:04:41 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 30 Jan 2022 14:04:47 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161108

Branch: master

New this week: 6 CVEs
CVE-2022-0261: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0261 *
CVE-2022-0318: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0318 *
CVE-2022-0319: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0319 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23852: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23852 *

Removed this week: 1 CVEs
CVE-2022-22844: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22844 *

Full list:  Found 11 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2022-0261: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0261 *
CVE-2022-0318: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0318 *
CVE-2022-0319: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0319 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23852: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23852 *

