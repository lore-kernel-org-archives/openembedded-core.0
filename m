Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.18523.1627225463410840179
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Jul 2021 08:04:23 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=Hr3JJ7w5;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id gv20-20020a17090b11d4b0290173b9578f1cso10741422pjb.0
        for <openembedded-core@lists.openembedded.org>; Sun, 25 Jul 2021 08:04:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=NW2N+nAQ+AiH/v+pDDbuwgWcnud7w9XKOQdEorbuH2I=;
        b=Hr3JJ7w5WwF6T/9qBmL2dv3dpDinmD9vM/2FGEgbLjpXSX3MiOlwaZPejc8h5cIr85
         kBTGcGaoWg9LYvEt+o59r4R6gp1xLQB4DLP+PNZgla0O31sayAV2yAWvmoLJDvqaJ4ne
         0PeG3odFd6axOF7aB9wX7fr7GN5yvlkJSkFF6V8R1u02IFsm5syrSLFy6SQ6SX4oh6S3
         Hz/9EC4tH9ocqXLD8LOJHcQ1jCgmlceRWUJq8VHUmcfnG+i6YoPD3XQbrM0jAvbwfRLc
         Z2Xlt5U3NELFBr3zQqnrWE5pJQn9wibh4+Bb8yxLvz9NOrAT0x1rFKiv5XAHdP98mny1
         CgzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=NW2N+nAQ+AiH/v+pDDbuwgWcnud7w9XKOQdEorbuH2I=;
        b=rbiMxnI+xTk5Gn7ToqGMkjREbkDCHVs1JUdJwxHuuvtwgbCx91dNs5dWrbb8jIrGqr
         2IByrwonxJngfSZMied6GQ0J7jPrMOsu52LBlAzRXn7wPChAu7BpKosJ//Y6xt9Mshxu
         vzx2OsLTUPk2doQcCuVNbOdoKuPEavO/2K5+3V9tczW4v2+VpeqJpiGutNIRZXxhLh2/
         aGm1m8BO49H3kHkLJQWlgb8p2h1GFJ34Ej1nkc6UFDAiyrIwD3gO7H/2mg4g8bHmgC1b
         eKG/S47jPs0j+bOkWaeVllhkNCPODudMCd3kYPpq9iC0gyL7/9c7yne3wub/23PtTV2T
         FVJA==
X-Gm-Message-State: AOAM532pOS4xIAA5n/tvaRsRg4fYWb8FavQdfp3i2VmevjJxHx1qnxQQ
	9FajKSkgT5EMYZ8lOnTwC/vX9sHDFLvAV42X
X-Google-Smtp-Source: ABdhPJwPYHcVYnkcrH4VTLN4EhisebNAGFGiNpuB2TT5AI0/m4YQUlon81fu3hkr9iK8ENobI8zlbA==
X-Received: by 2002:a63:a1c:: with SMTP id 28mr13768620pgk.445.1627225462285;
        Sun, 25 Jul 2021 08:04:22 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 10sm38209415pjc.41.2021.07.25.08.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Jul 2021 08:04:21 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 9391E960318; Sun, 25 Jul 2021 05:04:19 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 25 Jul 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210725150419.9391E960318@nuc.router0800d9.com>
Date: Sun, 25 Jul 2021 05:04:19 -1000 (HST)

Branch: hardknott

New this week: 0 CVEs

Removed this week: 5 CVEs
CVE-2021-22897: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22897 *
CVE-2021-22898: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22898 *
CVE-2021-31525: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-33194: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33477: rxvt-unicode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33477 *

Full list:  Found 26 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22901: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22901 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
CVE-2021-36217: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36217 *
