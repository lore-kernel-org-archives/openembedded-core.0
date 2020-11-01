Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web11.18201.1604252031387413532
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Nov 2020 09:33:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=BLy1C9ii;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id fh11so2162019pjb.5
        for <openembedded-core@lists.openembedded.org>; Sun, 01 Nov 2020 09:33:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=sbTQz0GplMZ9qOUCuWsDb0hyVf4jjE3Q14lklkpKlRk=;
        b=BLy1C9iiz2BMjZ6KKR6csIszBauzuWsNZ2DTldK1k8uyagBuDrf62K5rWUn8lIgR+e
         Dn1iZ704hR+EgfIpVlxEPr413pVuUp+9+N68xNurBRNL6TFtalaBoYw7oIEauP60hkp0
         IzwZcE0swBY4PnORckfK683TgwwFp0PHeQ27hx3jXkIJykHAkQ6Intc4/HkSMBgKWnQr
         0E6EkgRK3r98BT50d9ISVHXn0c3XzDOFZL5/6Y274FQ13mYl+O/2bTwEHiRUp7yLxneD
         QDxQpX8Q6Yzyb6aH/6iAETqjPjV4cuWhWHnhX8+EnpyJLOkrgrDATAh3nSCPItxOAivB
         OGpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=sbTQz0GplMZ9qOUCuWsDb0hyVf4jjE3Q14lklkpKlRk=;
        b=coOzpiEjmsO8HPAurot6KT2cAeBVTpn9JrymEvaiHDkXd1GV0Gn0Qo2OIuyIigfzSZ
         lMlIxtG410cIXnkSRs9t0kCvtHRnpmyaGxdjAmFy2BRj0qUSQmuei079cYGJz3c9rM61
         cq0Qmjc3Dy7H1NGiU4ftz9cK/mh6J2JbedyZ0cITgNo1+mOILM6eIGbza7XsaZdHB7OB
         cozfzF/4xHQK5301+FZx/ELWr/OOxtCeJgDsp6k0ONoYl2HYgK9hSHgHeN27xjBsT2lk
         jEud67BZHW+0+L2xyAFFfWsxhK3UKpDzVXNx496j3lZdhK00a8wS1sDjigb3t0NHAAae
         Srpg==
X-Gm-Message-State: AOAM533QECDpSZo6uimYu7H1o/gCGfJ/gk5dZr7SHIGPKHpzplF0vxFJ
	+lzAxBMCe50hHmrDZXSrGP8LeyMW4hT+BI2U
X-Google-Smtp-Source: ABdhPJxns+1/YElXcecwl5/kStYdyB7MLyO5OBBiDVyRl1DENhmYTABsCkU8IsSwUdTpijw3vv6C/A==
X-Received: by 2002:a17:90a:ed87:: with SMTP id k7mr13394067pjy.127.1604252030365;
        Sun, 01 Nov 2020 09:33:50 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id 30sm11192431pgl.45.2020.11.01.09.33.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2020 09:33:49 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 48B619603CF; Sun,  1 Nov 2020 07:33:47 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 01 Nov 2020 07:30:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201101173347.48B619603CF@nuc.router0800d9.com>
Date: Sun,  1 Nov 2020 07:33:47 -1000 (HST)

Branch: dunfell

New this week:
CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *

Removed this week:
CVE-2014-8166: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8166 *
CVE-2020-10713: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10713 *
CVE-2020-25219: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25219 *
CVE-2020-26116: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26116 *

Full list:  Found 90 unpatched CVEs
CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
CVE-2016-9596: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9596 *
CVE-2016-9598: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9598 *
CVE-2016-9907: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9907 *
CVE-2016-9908: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9908 *
CVE-2016-9911: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9911 *
CVE-2016-9912: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9912 *
CVE-2016-9921: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9921 *
CVE-2016-9923: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9923 *
CVE-2017-3139: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-3139 *
CVE-2017-5957: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-5957 *
CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2018-19665: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665 *
CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-20175: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20175 *
CVE-2019-20334: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6290: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290 *
CVE-2019-6291: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-8343: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343 *
CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
CVE-2020-11022: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11022 *
CVE-2020-11023: jquery https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-11023 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-12829: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
CVE-2020-13253: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13434: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13434 *
CVE-2020-13435: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13435 *
CVE-2020-13630: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13630 *
CVE-2020-13631: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13631 *
CVE-2020-13632: sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13632 *
CVE-2020-13645: glib-networking https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13645 *
CVE-2020-13754: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-14145: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14145 *
CVE-2020-14150: bison-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14150 *
CVE-2020-14308: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
CVE-2020-14309: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
CVE-2020-14310: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-14311: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
CVE-2020-15705: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15706: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
CVE-2020-15707: grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
CVE-2020-24553: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553 *
CVE-2020-25613: ruby https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25613 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
CVE-2020-27153: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27153 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
