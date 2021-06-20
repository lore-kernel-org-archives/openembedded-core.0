Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
 by mx.groups.io with SMTP id smtpd.web11.34483.1624201464209961684
 for <openembedded-core@lists.openembedded.org>;
 Sun, 20 Jun 2021 08:04:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=QW8SRP9M;
 spf=softfail (domain: sakoman.com, ip: 209.85.167.179, mailfrom: steve@sakoman.com)
Received: by mail-oi1-f179.google.com with SMTP id w127so17091222oig.12
        for <openembedded-core@lists.openembedded.org>; Sun, 20 Jun 2021 08:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=6DcaYLM2HLuOnCnLOlLPqfy4wR2rqC46v5NORIFd1Ek=;
        b=QW8SRP9MCg0rWZma32z+uIwT8bPFd+Fx/sl9qBK1xA7PZoVw9B+Ck86EUFMU5hS2gr
         K4q/wLS0dtjHiIK5OVp8Xt8kERSmxsJB8n5GXF4hi4nEGfBWgGXrMt5WJmGS+lt+fugd
         ZySbz/AHru6pooQKZskrTkD1TQw0YxkQH3FbaGLU1hK3qTTdQ0R0bJEUx5QZIap3n0WX
         3uyLlsGY1PctDyEXJ9sWdosoCvDGhgzm8WjaBhsx+qz+ezjuyUTOqV6Il9bD+RXI+3sb
         Gst3dNYGdK7G+dMOjVCCKH0dOLggPQkzKGbo1AeNFSwBqigedpXu217wiPIPz7CGQCOz
         ENbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=6DcaYLM2HLuOnCnLOlLPqfy4wR2rqC46v5NORIFd1Ek=;
        b=Q8IG1TcRgwRp7f0rVhmD3AyK1sNgAdeXOk2VSKuhM1n1ym17oYSpQp0L9eEScm8Efr
         UtWTX77FY/UihypsOJf3ejHHcU4X/zFVcFhxVCQQZEn7WQUdiBTNd5dAehmwBYktAVJF
         Xzc+U9S1G+XCYi4HYJpqBL68NpNDxaYoTU/lImllT3zgBmORn1awC4+d9C6N6BNwrBLx
         x1JY4SEVLJMTkbkSWig0Dxg53hRVURyQSokOc8Cu3X6l+/TsVsvJ7opZvmFANkPy3xzs
         auLGy4fPlICsuBgSnZmc5e7mZ/hJIKicfpyXpyBAsD0fEHSpwO4vSZF+Y3oqKeDpRtNk
         YD0g==
X-Gm-Message-State: AOAM531DvdgphrtL2MPrY2vu4uPABd/7HBD9k/XJr/vpvAb+YgumV6Eq
	iTj3IXRd8g2Eg+SlMXy12YnyEsi/cjKQTiZdeaw=
X-Google-Smtp-Source: ABdhPJxma1xvtECHXLd0h5CRSf1c+Ecaerpe5JG6Ps+q/dF69av40/F8FSn1K9muOYTHXVCld+fjPw==
X-Received: by 2002:aca:d9c1:: with SMTP id q184mr3336449oig.178.1624201463042;
        Sun, 20 Jun 2021 08:04:23 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id w17sm3095866oif.44.2021.06.20.08.04.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Jun 2021 08:04:22 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id DC362960348; Sun, 20 Jun 2021 05:04:13 -1000 (HST)
Subject: OE-core CVE metrics for hardknott on Sun 20 Jun 2021 05:00:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210620150413.DC362960348@nuc.router0800d9.com>
Date: Sun, 20 Jun 2021 05:04:13 -1000 (HST)

Branch: hardknott

New this week: 11 CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-31525: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31535: libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31535 *
CVE-2021-33194: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33560: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33560 *
CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *

Removed this week: 1 CVEs
CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *

Full list:  Found 31 unpatched CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20196: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20196 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-22876: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22876 *
CVE-2021-22890: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22890 *
CVE-2021-31525: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-31535: libx11:libx11-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31535 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-33194: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33477: rxvt-unicode https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33477 *
CVE-2021-33560: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33560 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
