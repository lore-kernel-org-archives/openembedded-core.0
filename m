Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5415C433EF
	for <webhook@archiver.kernel.org>; Sun,  9 Jan 2022 18:05:10 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web12.20652.1641751509701407190
 for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 10:05:09 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=4NLZfsZt;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176,
 mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id w7so10141455plp.13
        for <openembedded-core@lists.openembedded.org>;
 Sun, 09 Jan 2022 10:05:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=subject:from:to:message-id:date;
        bh=VUjB3SIRcJlqm9H2rwXLeq2l6JnwkywqVMueO8i2glk=;
        b=4NLZfsZtv53UszAFpjP5/6z9qdMnHBQkaxQEQnvxoGfvYQp6fAU+tQVJBr8UN1uIfA
         a839G4nAH9igv2vUcirFVW0blaQh6kOtFl7IZIpWVnZvlAEeY7bqdQSfz4ZwhLOxTHZP
         4/TA3pAmga3ycsCMB9WjH0SGBOEEfDi2BknJiuKKIqPLzC5OOS/QpZcDn6EsQMCA+CG1
         i5Jx8XCF/UHta3ab1n1oIy/Ro0w5tJs08dj9ec5w5Rk/SyTa2LPy8cNAeq1Vs/7un/AB
         KE5GjRuOSAplDavS5SkBsMojdvD5HG/J4H7guPQyNXOB7k9t+tutciTnF4V69U5AYRBa
         DCMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=VUjB3SIRcJlqm9H2rwXLeq2l6JnwkywqVMueO8i2glk=;
        b=3eta3mSmZ70/XxpDRQMIKHYqDYQzUw8Y4Ob+ZD/wJJRzd/wwN9nt+h/M3fenyr1RoY
         6Oid3BOPfNOJNfxCiybz1jIjJGu9uCAXfKjoz3kfqgEgSKAXZakb4Fst1FO3anflDsIM
         RKK49uGx56qX/O5CE27hUxjEvrbswOBCnT9L9E7CZZHnD68kVm33BGkM6dm3uLRH7RdH
         AODYAQylyN5BR8qe8P7XJFVJ1c7nBswcMO02Erg8EsowrfYkX+ObIS91vZ4TLzvlBOwO
         2plHRHvK8h0mY1oX/yZSqhhK6dW6HXmdHovD0lBQJaUFPFbeWD/1u45EO9OKWKgAC94S
         OxIw==
X-Gm-Message-State: AOAM533Lgvtsct1My3UoIgOW+vIF1zTUWFgcF+h6uiZfm9mKrKRWUANL
	FaZ4rABQp66d8sbIKBsZP3Bo0EZP6q5FP1jvRg4=
X-Google-Smtp-Source: 
 ABdhPJwqiqbjzRSS9iwo4+iktHEh7BY62HKTLejl+QZFA9K6c3DmaqXnKUiGd+W7bZuMxDHwiVJVnA==
X-Received: by 2002:a17:90a:c70b:: with SMTP id
 o11mr15660935pjt.143.1641751508432;
        Sun, 09 Jan 2022 10:05:08 -0800 (PST)
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 om10sm6687177pjb.13.2022.01.09.10.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Jan 2022 10:05:08 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id AC276962C7D; Sun,  9 Jan 2022 08:05:05 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 09 Jan 2022 08:00:01 AM HST
FROM: steve@sakoman.com
To: 
 <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20220109180505.AC276962C7D@nuc.router0800d9.com>
Date: Sun,  9 Jan 2022 08:05:05 -1000 (HST)
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 09 Jan 2022 18:05:10 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160284

Branch: master

New this week: 7 CVEs
CVE-2011-4613: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4613 *
CVE-2013-6424: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6424 *
CVE-2020-25697: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25697 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *

Removed this week: 0 CVEs

Full list:  Found 17 unpatched CVEs
CVE-2011-4613: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2011-4613 *
CVE-2013-6424: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6424 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-18974: nasm:nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-18974 *
CVE-2020-25697: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25697 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-36976: libarchive:libarchive-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-4136: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4136 *
CVE-2021-4166: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4166 *
CVE-2021-4173: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4173 *
CVE-2021-4192: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4192 *
CVE-2021-4193: vim https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-4193 *
CVE-2021-45078: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45078 *
CVE-2021-45085: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45085 *
CVE-2021-45086: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45086 *
CVE-2021-45087: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45087 *
CVE-2021-45088: epiphany https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-45088 *

