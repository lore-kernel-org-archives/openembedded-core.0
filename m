Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E52E1C6FD1F
	for <webhook@archiver.kernel.org>; Sun, 12 Mar 2023 12:03:42 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web11.65050.1678622617079351421
 for <openembedded-core@lists.openembedded.org>;
 Sun, 12 Mar 2023 05:03:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=ZQXDDaW3;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.174, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f174.google.com with SMTP id a2so10112419plm.4
        for <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 05:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112; t=1678622616;
        h=message-id:date:user-agent:to:from:subject:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rrGbYV863wGWQLFs2Wh2UmpsIqnbEx8UGJKhWBJ+4cM=;
        b=ZQXDDaW3gPemeKM40Mi/eNJnTx6CIS/eFoZRIDafB0lbwtbHUf2hg2O8VfncfnPJVq
         UVgi4dVILePqaObb7wQGT/sqVseTYqqFSpka2fZKVc/QuLcFeNtzdEpr9/Hq5xLnDJo0
         egOtD6XTL1WW5jmrMEjKmirbkbb4Q/WVTLgG0WCB8Vrx5bVpR7aGvLdveMBqRNVlpxaq
         q++414az6PnuI+WbQYXw06C79sjAol7n1798YJcahqogGtdBj2BhUVeoY0z7l96+uxgg
         RF4ZLolV1qDon5U5K9yGV3Ruc+aARDkJYpTY+Sn/JMw1AEr0RXOahVMkHcR+u31XOgyF
         CAGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678622616;
        h=message-id:date:user-agent:to:from:subject:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rrGbYV863wGWQLFs2Wh2UmpsIqnbEx8UGJKhWBJ+4cM=;
        b=njr6+LbAsloUVMkzd3bDUTKTXT11Xo+4cuxiFttWbbKpgAy8cToZDsU/MkktYK9p2m
         xHB4xKUGhEj1fEDPKNEHS6ESbgjfYiHJmrQ4UIXU8AJLTC2j5kZeme6JLS8+aqQeEXxp
         GVaR7bl2VxD98uy0WVnkDUbuwtrB3CWQEnQwZRwNV5gSDKpCoRDUomQqmau9ExvHHzZm
         oCvcrwRF+qhtvuaN62olDzfz0Hi+6CIo5FsLe/tENbE4qVLhTny+JlHn8JCCejxkPeDD
         m7vEiC2ittTMBSZrr7WegwwlAqrl3eE9rz7wwGI9lY0zhYEgfAyLKEGn1FWhRPhbSYN/
         b5Rw==
X-Gm-Message-State: AO0yUKU26+W57LzbJ/51OMBqxtNLxVOtOVHryfXXMeLZmRHVH82dEHdw
	18Y3Va6lr32/6qMXdS4XgCnepj+6Oyt51FzA+do=
X-Google-Smtp-Source: AK7set+GXiHNAVol1xtprVA9uj6Gi4pJIWyEP3Xmdy0BROFinWfcZksghQF0DR++NZdFjYyq+0N5Dg==
X-Received: by 2002:a17:902:da8f:b0:19e:9807:de4a with SMTP id j15-20020a170902da8f00b0019e9807de4amr31662776plx.57.1678622615930;
        Sun, 12 Mar 2023 05:03:35 -0700 (PDT)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id kf3-20020a17090305c300b0019c91989a1csm2719730plb.300.2023.03.12.05.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Mar 2023 05:03:35 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id C8B419603CF; Sun, 12 Mar 2023 02:03:33 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 12 Mar 2023 02:00:01 AM HST
FROM: steve@sakoman.com
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
User-Agent: mail (GNU Mailutils 3.14)
Date: Sun, 12 Mar 2023 02:03:33 -1000
Message-Id: <20230312120333.C8B419603CF@nuc.router0800d9.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 12 Mar 2023 12:03:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178382

Branch: master

New this week: 3 CVEs
CVE-2023-1127 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1127 *
CVE-2023-1170 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1170 *
CVE-2023-1175 (CVSS3: 7.3 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1175 *

Removed this week: 2 CVEs
CVE-2016-15024 (CVSS3: 5.5 MEDIUM): shadow:shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-15024 *
CVE-2023-26081 (CVSS3: 7.5 HIGH): epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-26081 *

Full list:  Found 7 unpatched CVEs
CVE-2005-1796 (CVSS3: N/A): ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2005-1796 *
CVE-2022-3219 (CVSS3: 5.5 MEDIUM): gnupg:gnupg-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-3219 *
CVE-2022-4055 (CVSS3: 7.4 HIGH): xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-4055 *
CVE-2022-46456 (CVSS3: 6.1 MEDIUM): nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-46456 *
CVE-2023-1127 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1127 *
CVE-2023-1170 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1170 *
CVE-2023-1175 (CVSS3: 7.3 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2023-1175 *

For further information see: https://autobuilder.yocto.io/pub/non-release/patchmetrics/

