Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EA84C433EF
	for <webhook@archiver.kernel.org>; Sun, 19 Dec 2021 15:33:05 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com
 [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web10.17694.1639927983911410447
 for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Dec 2021 07:33:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=vW4OwHue;
 spf=softfail (domain: sakoman.com, ip: 209.85.166.42,
 mailfrom: steve@sakoman.com)
Received: by mail-io1-f42.google.com with SMTP id p23so10198565iod.7
        for <openembedded-core@lists.openembedded.org>;
 Sun, 19 Dec 2021 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=fXjrU2/zXWYfp3NqNkmEGLonuaRBusgbX0t//pf8+9U=;
        b=vW4OwHuea4VTMe185u3QRkyZY2bfv5jCk66tKpjcwgH5jFkG68WptLC1DR4ORfEXwQ
         Vf/5D3UicamIi4dzHXmGJMDrJfkDp7obla4P3CapRMknBUXAbvFAZFvTdNlG9kRbvGKX
         yrTRfu3xEjcfm6ftAoHHmrTLBbv9ztLGbrIDJryYhquS1DuqMz+hddDUN/CyuFbsfmTD
         3+3ePLo58eUYWMcxw7giqJWKMPzxOfLoBg24BES67V5z+I0FScyBIuanydU+dEDzxeEZ
         HaujlSMQgNMtkffrFYdweXIeQ3coX283ZtpWNaXUnZBrqQAJrWdHqXG0nQZDQVYGb/NV
         87sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=fXjrU2/zXWYfp3NqNkmEGLonuaRBusgbX0t//pf8+9U=;
        b=pXcxtJTkntY4wIAV3BIbt8Gp+vGvgCcOudzi6xzvu66mDhoAF+jWZ0R3Yyy66aP/+e
         f2UKMgOzOsV3OVdrEGsQ3Yv1TN6TuhTbmf7nGOzPt/aZTSS1QQbHwujUg/cuWGCUqGrx
         4tzOvuFkzUcV/4nQp5bhTgwvikDLECzIogRZo0XxLkCIqOxbcUBSbcxlOuU+1J+0xsPZ
         06O3tXPVhWVpaiRZ/szugqbVyDQ543YhUDcDjeusTcv0NlAu6hFLogVBSP/yrKfxdLZ/
         vjp6PkNXbSm6i7v7F7EfyhUNTyPAHrT+lX5tYiKKezZ6Hv5zm9EmRw3AE8kuChZkQ45l
         GXog==
X-Gm-Message-State: AOAM531s+NkuO+qP28mkZCCwZ3Fn/pf8WIFg+XNHOpr5S0XiGdr3zoG/
	Wema35Pdo4Am7b6SCvuADvUsE6o4nym1IrtQ
X-Google-Smtp-Source: 
 ABdhPJy2ub1TLM6ohcNUuRnG+WdISsyCh4bGm2BZtU88PXHghOB4XoiXt4cpXAd9/ug9Et44Niy21g==
X-Received: by 2002:a02:b90a:: with SMTP id v10mr3581695jan.36.1639927982676;
        Sun, 19 Dec 2021 07:33:02 -0800 (PST)
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id
 x7sm7661063ilq.86.2021.12.19.07.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Dec 2021 07:33:02 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 23FA5962C6A; Sun, 19 Dec 2021 05:32:53 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 19 Dec 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211219153253.23FA5962C6A@nuc.router0800d9.com>
Date: Sun, 19 Dec 2021 05:32:53 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 19 Dec 2021 15:33:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159849

Branch: honister

New this week: 4 CVEs
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

Removed this week: 11 CVEs
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-37322: gcc:gcc-cross-x86_64:gcc-runtime:gcc-sanitizers:gcc-source-11.2.0:libgcc:libgcc-initial https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-37322 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3927: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3927 *
CVE-2021-3928: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3928 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-3973: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3973 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-41771: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41771 *
CVE-2021-41772: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41772 *
CVE-2021-43618: gmp:gmp-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43618 *

Full list:  Found 19 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3974: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3974 *
CVE-2021-3984: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3984 *
CVE-2021-4019: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4019 *
CVE-2021-4069: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4069 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *
CVE-2021-43400: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-43400 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

