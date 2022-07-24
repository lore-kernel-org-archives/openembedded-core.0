Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82810C43334
	for <webhook@archiver.kernel.org>; Sun, 24 Jul 2022 12:02:50 +0000 (UTC)
Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com
 [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.15804.1658664167602962675
 for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 05:02:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=myzGqVHk;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id pc13so8002875pjb.4
        for <openembedded-core@lists.openembedded.org>;
 Sun, 24 Jul 2022 05:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=0mEjjR1m5HyJ0RD3kYxpn1LGs1sUKX/kZ3WBXGoJXR4=;
        b=myzGqVHk27CIRDvzaUuAxhvibyyDfANLAT6DQXnFh0bUJYtfC6eSY4+xyISsVJvM7s
         6S9It1GNBXQ0bzyj/a38GeFLdUgx2LhR0A4oKy38Ysaf+W7buQlsIXeNjhjFb5XPxbVb
         j24JJja35cdNWYXhlBEJGJBzrl/sHwhBqCE4SOtJoaHBxqTWax05ts8o8zVt7n4+9RDB
         PSmQI0dalulqJvu+S103gO4KjsMyfOsr9NWE+woRBJ0OP/kfpqq0eOPnvgG/otjjZxgJ
         oCm/MHrKo9HUnrGOyD0tH0pxLlU7/dSEF5o9Hfe+0sL4abEMdwn8Dsq3uVO0YpbV9l2Z
         Xgbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=0mEjjR1m5HyJ0RD3kYxpn1LGs1sUKX/kZ3WBXGoJXR4=;
        b=w/2SVnaebIAm/1hXpuYZ2dvNS4wKS6KX5zyOtnBkejXEVWgvemDhIA/cf4a/rLSEKn
         sGljZ2DKWUvyO8+xMJDqOgXLpvJ3mu1AoOveg99qNfybQfZ3y2uGz3KC8WU4prsnUr95
         /eIcRLlJMx2ATrO62GuN3SR5vkQgG+TjgSTzkZH869sBKhUbh0ol5Rp1rK7+6EE+8WkJ
         pP75gQ1AVk7aItws6Wi1USznL3494wm8WloFUpcypnyZTcTFPEkguDjJuzAO+1v7XGgL
         HyKhKX3J3A62i+2CwCwh03SuSPS+Gt5UVEJSfil5E2K54TttdbY4UjC6P2/hCzE5b0TY
         NJLg==
X-Gm-Message-State: AJIora/BUowyeC5liYJUWsHe50dnvfTrl8u/ziGcSdbj8XbEcq8u8CiK
	s4cTsi7s3+ZBuPOARcXBGwSVYllQFN2u2AoP
X-Google-Smtp-Source: 
 AGRyM1vxQInqbsThFt0VV+a5cePED5fISfLDo4WlZRn7FCyd/cM7+ba5+x/VKbrm/3AJo64hwqJDdw==
X-Received: by 2002:a17:903:124f:b0:16b:8167:e34e with SMTP id
 u15-20020a170903124f00b0016b8167e34emr8064342plh.52.1658664164503;
        Sun, 24 Jul 2022 05:02:44 -0700 (PDT)
Received: from nuc.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net.
 [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id
 a7-20020a1709027e4700b0016d150c6c6dsm7066447pln.45.2022.07.24.05.02.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Jul 2022 05:02:37 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id BDF67962535; Sun, 24 Jul 2022 02:02:33 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 24 Jul 2022 02:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220724120233.BDF67962535@nuc.router0800d9.com>
Date: Sun, 24 Jul 2022 02:02:33 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 24 Jul 2022 12:02:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/168452

Branch: master

New this week: 2 CVEs
CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *

Removed this week: 1 CVEs
CVE-2022-33099 (CVSS3: 7.5 HIGH): lua:lua-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-33099 *

Full list:  Found 7 unpatched CVEs
CVE-2022-2288 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2288 *
CVE-2022-2289 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2289 *
CVE-2022-2304 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2304 *
CVE-2022-2343 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2343 *
CVE-2022-2344 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2344 *
CVE-2022-2345 (CVSS3: 7.8 HIGH): vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-2345 *
CVE-2022-35414 (CVSS3: 8.8 HIGH): qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2022-35414 *


