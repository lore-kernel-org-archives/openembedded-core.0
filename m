Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 746E1C433EF
	for <webhook@archiver.kernel.org>; Sun,  6 Feb 2022 14:04:27 +0000 (UTC)
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com
 [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web11.8874.1644156266600747362
 for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 06:04:26 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aiv8tidJ;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id
 h20-20020a17090adb9400b001b518bf99ffso17839736pjv.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 06 Feb 2022 06:04:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=bZASVsmT4x8riC2ljnG/IDvzv1jQYaHCV/fesX7lmvA=;
        b=aiv8tidJR9NvGnpFWj8Qy5o4Pci1yANLJ3NgUHEkZQtpxeUSOL17/O/VMqXXDMKO9/
         zKqes8UnSnfX+PeB7/TydkgnUrCS+0JxpWdFzroKZpCBZ8Q+AlqvhywylXacFkls0VZD
         SzKOStopIg/VaQBK+mTxM3FpXyTwXQKlfRJe+V/w4DPEtAIEN8DpAOTSM8huZ7/U9PKg
         NhLrGaFsM6Si4aVvHfHgqjjB+j1RAEwi9Mr6DLTb4GBEd9yNIVqOtTqWW7CUN9tEcqaN
         yeWXrmk3fE26Y3QsqFnqZRAboYlImZDtsDLE5hGnpspMJiytLXOImQhtXgy2riWU9bVj
         S6IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=bZASVsmT4x8riC2ljnG/IDvzv1jQYaHCV/fesX7lmvA=;
        b=GQy4a7idflXiC2uNHYOPUFTTpSoR6ohCihtULDF1jWwHbYIuHDyHAj+pAPIOLPcB35
         8Y8ivohoGQ4+d1eAfPTePj4Uk3OpPRgxVy16CmuRw4klqfYNe+r4q6+bz8izY6fTGVAb
         3Vx23XgK2ChAOqYsw4xtFMxamM1zgPT71MTK00erc8DCiLEOQTuTGaJGItTsbgwOvVEB
         WMY3rRQaoGMTYs7nGCBA3miNkGLS2pLXAb9CJKDdlZ68/+exfQCndMNM11V8rXUk4EXW
         8/PTmTNW8DzOF2RYryXXOhatfJHZTnh/zHCXKMSemMC2ztd49ND9ScyEaonPldaErZ1k
         1ynA==
X-Gm-Message-State: AOAM530OqlCmdL/p6562gNrHDZK9MlhcQP5qs+iWul1J/9nMXomzc+aK
	AsG/jOIA65sy6al3xWRChasphgRoytiOYt7p
X-Google-Smtp-Source: 
 ABdhPJxO4K3sPC9Z40OHZqxtWAldBPCId7698ALaF6ecTkbrQjnJONGj53/W9IF1b+Wiwu20wz5JHQ==
X-Received: by 2002:a17:90b:4a0a:: with SMTP id
 kk10mr9156766pjb.208.1644156265205;
        Sun, 06 Feb 2022 06:04:25 -0800 (PST)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 19sm18225631pjb.42.2022.02.06.06.04.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Feb 2022 06:04:24 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id C7DFF962C30; Sun,  6 Feb 2022 04:04:21 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 06 Feb 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220206140421.C7DFF962C30@nuc.router0800d9.com>
Date: Sun,  6 Feb 2022 04:04:21 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 06 Feb 2022 14:04:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161398

Branch: master

New this week: 3 CVEs
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *

Removed this week: 7 CVEs
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2022-0261: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0261 *
CVE-2022-0318: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0318 *
CVE-2022-0319: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0319 *
CVE-2022-23303: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23303 *
CVE-2022-23304: wpa-supplicant https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23304 *
CVE-2022-23852: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-23852 *

Full list:  Found 7 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-44647: lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-44647 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2022-0443: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0443 *

