Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85916C433EF
	for <webhook@archiver.kernel.org>; Sun, 16 Jan 2022 14:04:30 +0000 (UTC)
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com
 [209.85.214.172])
 by mx.groups.io with SMTP id smtpd.web09.33304.1642341869515814056
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:04:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=gpKfSSR6;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.172,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f172.google.com with SMTP id c6so9158600plh.6
        for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Jan 2022 06:04:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=Y2BhoIqj71Owji8fNQLAZX4iZk6j9lAQiSHZ2Xm8dLY=;
        b=gpKfSSR6QM0B1KlBG9AmCrzVUM2tmbAF+FAHbaMyZE1Dc5zrWYPgow+qbITSyBXFO9
         tuDH2vCuyuTPYUpw4PqPDojq2Ton9FWE/+o0tBFTPKKpxRKsw3y1L2Lq3eJC5DPXxxEo
         ZNKw1A41kySDRunzNq81Hn2PsJdUvuvHqC61KpOPdaLgbkVPmQcZZ47q4Wy4WbR/kTX8
         Q23TRiOzCg4LVLYvXJQbUxrbabNEz0lnvKPMhTgKc0hIF8PSLveyiC6llrjjZQA8ncmD
         1Efq+CHhYtY1fOETGmPcGTVcs1E5xBpOU6JjHFbzcpKQcwXdF3MYs8GX9/CUi0QI5E/2
         7eYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Y2BhoIqj71Owji8fNQLAZX4iZk6j9lAQiSHZ2Xm8dLY=;
        b=cGc6MJKSdq8rswlV2Ryw/lRHycjYXBw2vC9hk0pSHce5ok2iDZcJxpObME1XUpcMW8
         2w6B/AEz93yNxrtBhp9t07ZVYSTrXFy7+6Fvq8cTb/B+BXR80fUYNa0Y/Mz4IgtOYOzQ
         6sERhLHaDoDjJIce4syA38LoXVrGZC6aL2rt+Hyc6CaOhvhYSnrhE2lYM0IzTN4OaozT
         iTGxxcv2B+EKplugsplYr8pbsF3zUactSQ4sHVoFVznfjgl3xMLCbXm7uKkTNMj//CDH
         zQJ//Qoi3utCvCFf2d/dN/4zbAFYfvv9edpshthMjMnnciNYY655TEombkzeoJErVmK+
         Ou4g==
X-Gm-Message-State: AOAM533+lhyq05wAfnSjkcdC9KnbEdGSV03VrhMFBsIY6laD9kXIIG3T
	z40v/BCVaZRo32ULj1ZQXGgIdTqnDI2e105Psto=
X-Google-Smtp-Source: 
 ABdhPJz8cUm21Sr++tMZCS4f8nWViAWNHlcpQj7XmB5uQURTz8jbnmy57wpQV69aZlEPUyW5TWMHgg==
X-Received: by 2002:a17:903:11d1:b0:149:57d1:acc6 with SMTP id
 q17-20020a17090311d100b0014957d1acc6mr18279368plh.134.1642341868090;
        Sun, 16 Jan 2022 06:04:28 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 ls7sm4824286pjb.54.2022.01.16.06.04.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Jan 2022 06:04:27 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id A2F989604F5; Sun, 16 Jan 2022 04:04:24 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 16 Jan 2022 04:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220116140424.A2F989604F5@nuc.router0800d9.com>
Date: Sun, 16 Jan 2022 04:04:24 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Jan 2022 14:04:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160606

Branch: master

New this week: 13 CVEs
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-45960: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45960 *
CVE-2021-46143: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46143 *
CVE-2022-0128: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0128 *
CVE-2022-0156: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0156 *
CVE-2022-0158: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0158 *
CVE-2022-22707: lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22707 *
CVE-2022-22822: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22822 *
CVE-2022-22823: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22823 *
CVE-2022-22824: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22824 *
CVE-2022-22825: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22825 *
CVE-2022-22826: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22826 *
CVE-2022-22827: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22827 *

Removed this week: 7 CVEs
CVE-2011-4613: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4613 *
CVE-2013-6424: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6424 *
CVE-2020-25697: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25697 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

Full list:  Found 23 unpatched CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4187: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4187 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45960: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45960 *
CVE-2021-46143: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-46143 *
CVE-2022-0128: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0128 *
CVE-2022-0156: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0156 *
CVE-2022-0158: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-0158 *
CVE-2022-22707: lighttpd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22707 *
CVE-2022-22822: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22822 *
CVE-2022-22823: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22823 *
CVE-2022-22824: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22824 *
CVE-2022-22825: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22825 *
CVE-2022-22826: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22826 *
CVE-2022-22827: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-22827 *

