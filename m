Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D033C433EF
	for <webhook@archiver.kernel.org>; Sun,  7 Nov 2021 15:33:11 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com
 [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web12.32257.1636299190075702599
 for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 07:33:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=n0AhE6Iy;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id
 n11-20020a17090a2bcb00b001a1e7a0a6a6so6895190pje.0
        for <openembedded-core@lists.openembedded.org>;
 Sun, 07 Nov 2021 07:33:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=q0CfySvfHNv1yGLRGvtF4RVCksJ9t1YRdfPWkbxPYlc=;
        b=n0AhE6IyveRciQMEtnbi4LQotcidF6gvBg2oYiuvvHIOgNdlS82/KjoGlXkdCs9QUH
         R6/wKx5Z37zL3fHOsayhUG+Ka+1rRbr8zNoe+8lR0QiCHaPU3z+ivf2ZDE0IHwYHzEHn
         CZR4rlwZcZiWkBrHacrDFAAxQcmaZl0KJPvTI7aRvrCk9DXlDh44JgSjLhEcDtg0g2l+
         RtGUbPyAMUxzmCZiFzO4J8NToT7UF0V2bpOW72Xu6x35S8ImDTsXCs4Ub46liDCeOG2O
         1lr/YockOUFrkuYUlVP6OedEdXdck//5ojmjh/MmI1I4f73o8XK/Cq63bAc5O5uhx+cb
         ghkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=q0CfySvfHNv1yGLRGvtF4RVCksJ9t1YRdfPWkbxPYlc=;
        b=kvbGhfrP6by4yZvzvYkCL9rJMpX6iA4i0UKDGgkR70mDbEPA3N4z7GbJRr5y3LWWiT
         SwgKd0/33GzgoCNY7SS6s1juyWJHXhKsXQf1jI5Tk4O7wFTFGGifdyqorlJ3iqtB4n1Y
         3Z6L0lxHlcVRy4BDuMmyQaOqYHY3buaf4vcPlgXMYy8pdD0oLxahV/5dBJTJ9C6N0a7l
         iEhMqYxsvmvB+kwQSWCIk7V3/yBOw8OS6c4gp48zww3BpzxQWWasGv6CRD1MJhUndJzL
         14JwBaRypAJEN346+IzSRPu9yEy4FO8Dk81xnIwMoEhk+OtZ8UvBfOr620UsslX/KX3c
         5g3g==
X-Gm-Message-State: AOAM532IIhrat9/RiTtCKBNJcXlA6y4voDwQFjvK4XYZU+PNVf9AMzyy
	eJJ09QgzUFF1S0R9SNrboiGgu2xy/OMbO+jh/LU=
X-Google-Smtp-Source: 
 ABdhPJyWXg4Ox2bNUVviSI8TeiTx4UZgc1kojoMkbFqCzNJAwg68K8e6wOE+q9YrUDEPjlpIjNruGw==
X-Received: by 2002:a17:90a:6b4d:: with SMTP id
 x13mr45730464pjl.208.1636299188654;
        Sun, 07 Nov 2021 07:33:08 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 f3sm4844223pfg.167.2021.11.07.07.33.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Nov 2021 07:33:08 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 382399602FC; Sun,  7 Nov 2021 05:33:06 -1000 (HST)
Subject: OE-core CVE metrics for honister on Sun 07 Nov 2021 05:30:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20211107153306.382399602FC@nuc.router0800d9.com>
Date: Sun,  7 Nov 2021 05:33:06 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 07 Nov 2021 15:33:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157952

Branch: honister

New this week: 2 CVEs
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-3903: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3903 *

Removed this week: 0 CVEs

Full list:  Found 18 unpatched CVEs
CVE-2016-20012: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-20012 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-25219: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25219 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-3713: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3713 *
CVE-2021-3796: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3796 *
CVE-2021-38297: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38297 *
CVE-2021-3872: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3872 *
CVE-2021-3875: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3875 *
CVE-2021-3903: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3903 *
CVE-2021-39537: ncurses:ncurses-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-39537 *
CVE-2021-41617: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-41617 *
CVE-2021-42762: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-42762 *

