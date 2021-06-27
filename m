Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
 by mx.groups.io with SMTP id smtpd.web12.6100.1624806218554198181
 for <openembedded-core@lists.openembedded.org>;
 Sun, 27 Jun 2021 08:03:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TjtHVwf8;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.49, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f49.google.com with SMTP id z3-20020a17090a3983b029016bc232e40bso8651341pjb.4
        for <openembedded-core@lists.openembedded.org>; Sun, 27 Jun 2021 08:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=udItMUJprulg9km+m1YGraLumo4cdgGtD0T2ZY/OlWw=;
        b=TjtHVwf88gS4/lNqZAndLvOVAsMckcawQTRygxbytnpOSNDzbwkHbRIb3X8wuaWz8f
         1Fi4mdidUnfhgvAZ8ERoXpWLcivgaMWWnRz/qG1xRRhgzkrNgD0E3Z2wd5LFtAI0XGUl
         xMltER1PMGPbx4G+jUVzMnvgniQaevlYGV94Jj3rAJgPn1h/UUYjzi154WhjfJjLRtF7
         Fq+SaV3Ns9uaKU4YglDnbRypL6TzlS9Iq8TAT3l/5jO+qw7vQwSWlrAYYLBkTN4uaLZH
         BjuwxFBfra/ojRBylfZn+MiKfCzdYjAqPtMkYexIA2kW+J50CeVgV9xtwlMGxYyfk7lU
         jYcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=udItMUJprulg9km+m1YGraLumo4cdgGtD0T2ZY/OlWw=;
        b=CfxgODqrAt51Xr08U8FljoqTxXIV18M4jShaCtPahfsd5FPrPc3VAR5AlM2qILy6p1
         XeWTe1t3csy30sL9cv3Ee19byA+KWf+VBuje68FnjqYnrjt0S1dYR7Q7fESAolO0AE7Z
         JOkVf1rAY9uQ5dTRYbPiw7mzhxVllOkMxXxqzqWVS0IXT936TIYHCfYHhXE5PjWaQZjC
         1sS8Sxl72wdd84agoIg11JuFJ3a/jUzZHz/jrpom9ASkzMtwDaAIGaMerWxTJvnay0Vb
         FaUglp0BVw753XpFVi1D4gHrMqcAfHOaS3ZqdVQDaZqZQsvVFhHHTqR5eyKYNm0Ph1Yl
         q+VQ==
X-Gm-Message-State: AOAM530oXQ5t6XXm+Z9blssGirdy5zDtfcCuOj4FuUIjWAjiJn1hN58j
	zmZAyUQBP0c30M88vVPuYxNZR5+2RobRaHfrY+E=
X-Google-Smtp-Source: ABdhPJzLvB5vANjns+wubLB1McDJCNEAiqaqoW6IKN5eKyzZd1Alc5jeEbQCOCeTwhUHSNiji6ii2w==
X-Received: by 2002:a17:90a:4490:: with SMTP id t16mr32577705pjg.183.1624806217555;
        Sun, 27 Jun 2021 08:03:37 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id gd16sm110179pjb.9.2021.06.27.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Jun 2021 08:03:37 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B0DBE960334; Sun, 27 Jun 2021 05:03:27 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 27 Jun 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210627150327.B0DBE960334@nuc.router0800d9.com>
Date: Sun, 27 Jun 2021 05:03:27 -1000 (HST)

Branch: hardknott

New this week: 3 CVEs
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-22897: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22897 *
CVE-2021-22898: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22898 *

Removed this week: 3 CVEs
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-22890: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22890 *
CVE-2021-31535: libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31535 *

Full list:  Found 31 unpatched CVEs
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
CVE-2021-22897: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22897 *
CVE-2021-22898: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22898 *
CVE-2021-22901: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22901 *
CVE-2021-31525: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33477: rxvt-unicode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33477 *
CVE-2021-33560: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33560 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
