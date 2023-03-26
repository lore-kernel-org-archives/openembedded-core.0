Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B3CCC74A5B
	for <webhook@archiver.kernel.org>; Sun, 26 Mar 2023 12:03:23 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.8189.1679832201180627636
 for <openembedded-core@lists.openembedded.org>;
 Sun, 26 Mar 2023 05:03:21 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=LPDA/Irv;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id le6so5909381plb.12
        for <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 05:03:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1679832200;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHNlGIqYsPXKB/MKqkR2x4UeRhCYKrkUUhn0RTCjxSc=;
        b=LPDA/IrvsXWWy3BWJTG2NGfPLN6lj+YMvN+jg9Iv7+/4tUXOA+Yp6AoMsWUcpB5uKx
         EMkLFYrLXpimCotfkz2jSLCsMJuTQhz7DDKYpVc7ocHTqTc+riSYzLO4Dnx9Dxl0N2pW
         vxWTjmLKN4Hqn3NKtcAqQlBmk6UogPbktVltyTVSXt4P0/52mcs0VpFN7Xx85AM7FTP1
         iQ9uvQULSFZ0EwFFWxlABWZYCOIEqlo1QOxejB1dC80qwhBi6Q9U6J6/S94uxHcTse3T
         vBreU0V2agF3y2iWVa9uN8W2gANlWJ4O3jdo9h55ZuYx7Nb1qJalAznqbrmbLdKD8wNV
         nH+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679832200;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHNlGIqYsPXKB/MKqkR2x4UeRhCYKrkUUhn0RTCjxSc=;
        b=8I87gLpvsbP3DykW+nK+I7Z8Te2/PFrVSIoJf/ahcD+Qx6WgaTGcslzJYw7harew9/
         ExaI9qVXMwaq81F1Jc1EroSUl/lYhtVGqwVVWlMRxMx/zclQLP/+BWvOJiBqVr+VU+v2
         Thfpgilo0KAbZRrhDpG0A6D2cqRQy1A3JhkxXfPJNi+nJhXrgtM0HTZUjYXadS1BtxUd
         unHtLJMUb4aj/BA2c+cZihSQ5euxdOtBMg7ZELP8ecsNQkySS4lj+EPqXziOLRoBVoRQ
         zH83yDkPWMCo0QFyyCSgGlwtTL+7cmUAgqwHgL2MA9Z5tRzn88WoaISBvPSxKkvpNYnO
         2i5w==
X-Gm-Message-State: AAQBX9fTomBXIeCpORLeNcr5WqoJlPfAwO9CWvJUEHC45xZIFiXQdPYi
	mNslW0EQneow9tw9QBdS5DznG3BwijWLmKPINC4=
X-Google-Smtp-Source: AKy350aysyR8VQWkp6TO/G3YwE2dF+cYgfU8JGa/IRg794jWQ31s7H5OrvWd/pMRBFG+EU0Nto7CMw==
X-Received: by 2002:a17:903:18b:b0:19e:8267:9590 with SMTP id z11-20020a170903018b00b0019e82679590mr10218560plg.41.1679832200128;
        Sun, 26 Mar 2023 05:03:20 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-4-112.hawaiiantel.net. [72.253.4.112])
        by smtp.gmail.com with ESMTPSA id g7-20020a170902934700b0019d397b0f18sm17202894plp.214.2023.03.26.05.03.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Mar 2023 05:03:19 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id E1C1F9604A9; Sun, 26 Mar 2023 02:03:17 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 26 Mar 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 26 Mar 2023 02:03:17 -1000
Message-Id: <20230326120317.E1C1F9604A9@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 26 Mar 2023 12:03:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/179117

Branch: master

New this week: 1 CVEs
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *

Removed this week: 0 CVEs

Full list:  Found 7 unpatched CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-0330 (CVSS3: 9.8 CRITICAL): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-0330 *
CVE-2023-24532 (CVSS3: 5.3 MEDIUM): go:go-binary-native:go-cross-core2-64:go-runtime https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-24532 *
CVE-2023-28531 (CVSS3: 9.8 CRITICAL): openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-28531 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

