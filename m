Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
 by mx.groups.io with SMTP id smtpd.web09.4575.1630249441229932955
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Aug 2021 08:04:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=qq2Q6Gm4;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.173, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f173.google.com with SMTP id r2so10871283pgl.10
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Aug 2021 08:04:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=r6qF0Bb4IrY2O0OTApbhsGs40gEOMHs//y6ToUPrByI=;
        b=qq2Q6Gm4g/Tj1UaAkqSeP4sejAm/lbgdMTTUU2es4TNriNCFkL6DOJwWxNryA6SYca
         Fav9oRrDI6oK9XTvc5QUw57qA50yoXM4W/g4+GoLUp9H5R5X0kLIBLQj+6tUld5PFQ37
         /lUZqIc9nhyhm/wGKyHu1/hFWg/aKsJ+kgCInyK1TxEm8F+Ls5CnZUtYFPRlNGXKdc/T
         9rfYM4sAYRMBdJwxnb+zcgf/1pPc/UKCon8298bDLo6sCtUvvqS3FwsWm67sZkOmnovl
         a0PWAJupB++hfcSzFd0VHBBgg5Bj6F9CBnXvb+vZlSo+OMfZFIqkW+GRVvKc61glv5PP
         z8MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=r6qF0Bb4IrY2O0OTApbhsGs40gEOMHs//y6ToUPrByI=;
        b=aG8IDubDH5/u/rG5nexx6MPc4XTzfEAIUIoLEF2C5DNo0UDllVAJ5m6rLqK8spJUp9
         KjDhiA1p84K2+DTqE0xPUQTCD/6lqO9D7izH57q4lzXiqkQLIwt2t+PNJxs4gXvA3fxN
         tnsi+er4mAXdmp17A6FkNugx+5MHfffnozMbz+3MJ3UMe3jqDbEUWWdVsaY2wmIKnj2T
         Of6beValTcLqniqsoIRW8U4HNIdW7i3oymfQ+AA5Zvwm/Fl2S01DuQxdVFCwMIm536l5
         GHfdq5TJxk5ghT2YSAIip5JFvv38SmllnCUDaoPl5lYlLzihrSNk/ioWeDt/Qvcz4Vo0
         jcrg==
X-Gm-Message-State: AOAM530zJstlFejzHNUOujOh+Ah65ecf0sgmEEmeYcrPgweG0EhM1SxM
	BRyrMK+z5cBuAYorY+oTBOPHR4Gt1tiUQq8R
X-Google-Smtp-Source: ABdhPJwHvV32fGLgtLx6jgf+pJpm9tsRRKq0F6AZ6kNRVVEk/lfVRUa/vdXnrk7JcVvi5CQJCo7CCw==
X-Received: by 2002:a63:1b45:: with SMTP id b5mr17354944pgm.302.1630249439763;
        Sun, 29 Aug 2021 08:03:59 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id v63sm13638677pgv.59.2021.08.29.08.03.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Aug 2021 08:03:59 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 64262960302; Sun, 29 Aug 2021 05:03:50 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 29 Aug 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210829150350.64262960302@nuc.router0800d9.com>
Date: Sun, 29 Aug 2021 05:03:50 -1000 (HST)

Branch: hardknott

New this week: 0 CVEs

Removed this week: 4 CVEs
CVE-2021-32803: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32803 *
CVE-2021-32804: tar https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32804 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-36221: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36221 *

Full list:  Found 27 unpatched CVEs
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
CVE-2021-22922: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22922 *
CVE-2021-22923: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22923 *
CVE-2021-29923: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29923 *
CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-32066: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-32066 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3682: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3682 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
CVE-2021-38185: cpio https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-38185 *
