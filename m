Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
 by mx.groups.io with SMTP id smtpd.web09.10697.1628435053246388098
 for <openembedded-core@lists.openembedded.org>;
 Sun, 08 Aug 2021 08:04:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=gnHJjsG1;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.177, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f177.google.com with SMTP id n16so19942894oij.2
        for <openembedded-core@lists.openembedded.org>; Sun, 08 Aug 2021 08:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=8FDR9bz6HRUNgJEjNiFsLcLQrmLeVODB4bE3wf3isC0=;
        b=gnHJjsG1uez6ca0gQBeJEj0x2IG5we4YtfKlOB1KsmtcXHvObEXudlv23gTusjiZOk
         lZPehSZEIfvipOxmElcOwl4igy3mZ2jfcZ/Hn41cEoaRsw1t+gwJwDApwIjjspa+RnfJ
         ySKfVScvhuMv5ms4BTeklyFDQllmisR7rhI8Y6IgypcKZ6XbsKR2urBaEUrrgf/11w50
         Cura2UYsx5ARjXlCM3Y6ORWhdYOUgP/Horwb+mVJ/jITBkI+jxuuV3UJFONVfHTyu8E+
         y24VrjoEnZd7z0BinBtOe7b+dW8L6CAOQ82fadMH/rRvKrPsBCerXOQ59v/QzZ9mJvQk
         8yEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=8FDR9bz6HRUNgJEjNiFsLcLQrmLeVODB4bE3wf3isC0=;
        b=Wj4Bw14P8DfomJfSn/BpRSg/1qtpQ6Op5ysz8tfbGharX9mztwpWwDaC7pe+z800CK
         kypHQvO7BoCOERBs9kwiPjq4Hoq82Nk/0OtmC7g3xPXV8kVhUVlP29clS+EtU4sDRS0v
         oO72bYday+tI2TGfnPplQ/6OT3saBCwFIIX+HN4uOZ5bbaHC1Wx4EontPee2ut08DDJY
         p60zz6i8x4thMClEWZT/vHhQbmGmn1h1MMfXxQmRz2JrcYYwUzr3hlBc3imCUu5Fcn5N
         bzoolaskvEiT1dUhXE+gevKV0uXZngJuJUypTb4hgPkWdmLnA1W0LjE/8WHC4gPteK1G
         vPZA==
X-Gm-Message-State: AOAM531f/UDd+QNc651IjPZAlmacpMpBILqQczLyUn8Nh0MdeTsXVc0X
	dnD4QMVgE4FqvZoblHLpqX1FmiIpRsKYNwM8
X-Google-Smtp-Source: ABdhPJwqXRNmRTHoUjYMuE+Z5vXJZXWIumwQfg/UIOHIZltPXsZAUfWAVZRZZsJ/wPzfC20GgUGyJw==
X-Received: by 2002:aca:5f86:: with SMTP id t128mr7879000oib.166.1628435052050;
        Sun, 08 Aug 2021 08:04:12 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id s184sm2742657oig.25.2021.08.08.08.04.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Aug 2021 08:04:11 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id E2B47960387; Sun,  8 Aug 2021 05:04:02 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 08 Aug 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210808150402.E2B47960387@nuc.router0800d9.com>
Date: Sun,  8 Aug 2021 05:04:02 -1000 (HST)

Branch: hardknott

New this week: 1 CVEs
CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *

Removed this week: 1 CVEs
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *

Full list:  Found 29 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-25051: aspell https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-25051 *
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
CVE-2021-31810: ruby:ruby-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31810 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-34558: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-34558 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-35331: tcl:tcl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35331 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
CVE-2021-35942: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-35942 *
CVE-2021-36976: libarchive https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-36976 *
