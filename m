Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
 by mx.groups.io with SMTP id smtpd.web08.7860.1626015805968886826
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Jul 2021 08:03:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gRDXrwR4;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.45, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f45.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so8937744pjo.3
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Jul 2021 08:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=gUM/CxfRURQexZ3ifYKerZQ8EAHJt4ZaxEd+xLNDhzU=;
        b=gRDXrwR4+qOGyEhelyteTizqShsUqhUg9oYSFKAFlYwClrKVYFAhOHCaAjbsfAkvmE
         ZZqR9kKr+lOFwbswx3e1Tnhbcp5cpUB9pb5yXkt4hrvz3eUDX/omSk9cdQFdjggKqGvG
         +vRh2KO7kVhmirijSaIMoZ3F8C4lOq7IFZmYmr8AxbFSJ3SRiEckX7dO4klS9vtoA4QK
         eu9IGjUsFr+ZhVDM5u+VZ2tMWspaH7XpSw+VazVKOmKKftoUsmdDMWiNOIvtgD7KD+l+
         dS4uQ6vjJ7XDmUBlQ35gmd54uR99WpkrrboUEOz/Hg0MUJNudqR+5i+Xw7Eaj1s/aQOf
         ocYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=gUM/CxfRURQexZ3ifYKerZQ8EAHJt4ZaxEd+xLNDhzU=;
        b=YBwtVChmp94LUCpg4NtoSUKpcEl2NDoRyKZJBzBmJO8zl2cNMCN/pxEtfFOrkRwW9I
         MH4lymMDyBRuQYuH55TxSF9/atDD730WGjiGhCRaC5ZKZGfvruwBGVgbPtnsKbFlGb18
         lwb/I7w55/YyfS0/llRcRdaVo1ENMYpsmHEAOs8okbDUYsozPoBClNMwm8hug/djTjLj
         9dOIIcY2/kv4NLa7q2TDyHoLuGKMBKiB4X8iCayYdCD+jUVO9of6NbyDcBpavp18xfFz
         vcDh83bAlHa8d2WFnNz8jGdKwNoZZCmy37DRzCrP3T/HrOhfc34gDxQ0rqUDgjXNgP/0
         D3DA==
X-Gm-Message-State: AOAM533Fu01oJBCmuYdWmz5VjLgCm7qK4kSXSy+8zC/gbP7CPzSp//F8
	PN2DzfOMNisoT3THKDdf6kYkA/foQ8icdwfT
X-Google-Smtp-Source: ABdhPJx6NZUOqNV5VJzngGf3ohppu4h3w0MWvkJ789CDYfLhKAvfeJnJF/qTuLxiNY56iaZL9MaHtQ==
X-Received: by 2002:a17:902:7b8c:b029:129:5733:2e3b with SMTP id w12-20020a1709027b8cb029012957332e3bmr39630806pll.4.1626015804746;
        Sun, 11 Jul 2021 08:03:24 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id q24sm14179680pgk.32.2021.07.11.08.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Jul 2021 08:03:24 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B1A3A960365; Sun, 11 Jul 2021 05:03:21 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 11 Jul 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210711150321.B1A3A960365@nuc.router0800d9.com>
Date: Sun, 11 Jul 2021 05:03:21 -1000 (HST)

Branch: hardknott

New this week: 1 CVEs
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *

Removed this week: 2 CVEs
CVE-2021-33560: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33560 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *

Full list:  Found 30 unpatched CVEs
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
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
