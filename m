Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web09.10323.1625411004589343849
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 08:03:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QhJyGQsH;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id 22-20020a17090a0c16b0290164a5354ad0so12829004pjs.2
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jul 2021 08:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=Oh/xd83dh/J4BzSrIH+0mWHdgwsSkem8jJRM+1qW21A=;
        b=QhJyGQsHEILIU/RSQouJ1w7x/4wajKTa6XN2dyJA/Bx5Q5HHq9L6HRv68kksy29P5/
         qvsikHwJ1iLmVAHm2cNvgSuGzqvflHMr5xc7Z0QKl5F4dnGJNIKjhE+GQIbGdjj0YZfM
         s4rbbx5BdxzECQkGm/hhnjJO5iVBohVPryVvE175qZVpUg0ERk+48YV1LT3kOQ/ZgGTG
         Rao2mSZB427g7xUnnxSLEQG7YZviFhZV9BYjE+SK7yPR1a1/rcuywjLa9b2R9PxWeZYr
         hmrS79ggGk21k6Zcu18stkzpdz3eSYw0ETcYsdD0JVEZ/YyiORx47q6Hj8rmdoOP43IA
         +oqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=Oh/xd83dh/J4BzSrIH+0mWHdgwsSkem8jJRM+1qW21A=;
        b=Jw0U2aaxMla1HErbJDgm0bc9+Xp6A/+y70k8X4MtL2t107Mp/XBlPsWVIcp2Q05qro
         RLQWa7cl8MZUtJ0jNNRVWHgvhA0Yo9JtMfmSAPPILOfDCZRJlFeUxwKXkva0c8RZOX3j
         N7EwttlFQT/8Tr8/FfjDGxfd99RAsv/PoZqrlReMM3ZO+4DGZZyB2VbR/ilYGzvo3XXG
         lyg8zbmMNgl8/8SJlNmfwnDX73SoYGSGVJHKHhujbUzyT1DRhMn0D3PaQfC0/NzKhdTo
         yyZb+aWPLATCf+lHK/4o2MIev7XC2Wt0t0lA39nqb3ZuKwZzHEjiltpoVrKdbatjV8JO
         WLpg==
X-Gm-Message-State: AOAM531OI0jRGvGHm0Yzkdi+yUUWyEn8/O4rdX7kHsxs1QHdtJ3LX8K2
	TFoX1lcm/eBVFjlWkeOGVC+qCYPnFrLyiWwJric=
X-Google-Smtp-Source: ABdhPJzgG6+UpH8Vb96Gp/7+XeVROglPegxw7xulimIiph1rJ+DCARnlDIolqk2kNYBEYDJWC6CqCA==
X-Received: by 2002:a17:90b:4b8d:: with SMTP id lr13mr10258305pjb.89.1625411003493;
        Sun, 04 Jul 2021 08:03:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id f17sm9452270pfe.181.2021.07.04.08.03.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 08:03:23 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id B24D596033A; Sun,  4 Jul 2021 05:03:14 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 04 Jul 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210704150314.B24D596033A@nuc.router0800d9.com>
Date: Sun,  4 Jul 2021 05:03:14 -1000 (HST)

Branch: hardknott

New this week: 0 CVEs

Removed this week: 0 CVEs

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
