Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
 by mx.groups.io with SMTP id smtpd.web09.10021.1625409245310252198
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Jul 2021 07:34:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=11UqTTpw;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.169, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f169.google.com with SMTP id w22so10390377pff.5
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Jul 2021 07:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=VinXd1d22gQegCSdcuJsTYQJb10WUeQhSEuqMn4jb3Q=;
        b=11UqTTpwzNguVN38RTnQPP+EFQX4TpcWlg6KYgSn9keaFOMdNwHtmTIR5ixFVDiccI
         i8m6J2d5uJpCgz1P+kH2siePuzGcBeyH++P4mDLf6F7yYXuLnU29YUsZMTrKDI1VOKy9
         d7+YE59TA6OT7JA2d8PTdttuquUQZwNhE0NJ4ffZ6dQdyyB/TjTMjDUSzYrJrVBorfbI
         WA8HMPCtFJrOCx6kY4beZGuare7tkOUnSnfuZg6RhVWBAbzTtb+NLrL7sdmadlTW2Eej
         M2zryszK5EmxRCTgR6deyFFY/t3izwKEGHBObFcgsRWj5PO4gMym4ExudSkZJ/i6Ojn3
         i0sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=VinXd1d22gQegCSdcuJsTYQJb10WUeQhSEuqMn4jb3Q=;
        b=SuxGlHmJv0h1jvqwnw1awWHAadD+oT9YOl13YpnHLKM6CjY6HO5mStJK3NtnxnQigA
         afReOumk89fNfi+fMG5vw/yhGvm+QZdbkY8s9OOG3fbe0+oQdkcFNleeYZHE4N1P+Ynr
         sw1QAcOWHoh8+z7G9z2unq+6VLsJ2RlgivOWpkg3khcwyvoKf/m2zp/EiudiKv7hh4bT
         UIaIEMp1rwfkRf8QABR+06nMn74Nf1Rqlu5J3JFfteb1G8+8345dIkP+wKt5Lr6LSGRm
         VSMcAN7FU5WTWLFU1HLSa6Fm7i+BAtOA4GBiXRbIknLdrFy+P+hOWpdFn8roLhYFQtGL
         Kwkw==
X-Gm-Message-State: AOAM533qQDJnzMLwrilGCZ/TF3/XYBvK/AKX+PKiitSvk/g4y3iIoEeg
	ObPp909k7jH2W26VIRsru2SR76NloVU392/HYMk=
X-Google-Smtp-Source: ABdhPJyj8UP1z0ZZT6zYAbWMGK1rOMsTx4pJkVCtLOW1DmFSaWTYbpL6wuiLgKHwlukDqWEBnE9wDA==
X-Received: by 2002:a63:4e4d:: with SMTP id o13mr10642470pgl.361.1625409244101;
        Sun, 04 Jul 2021 07:34:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([172.243.4.16])
        by smtp.gmail.com with ESMTPSA id y1sm10963382pgr.70.2021.07.04.07.34.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jul 2021 07:34:03 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3A9E896033A; Sun,  4 Jul 2021 04:33:54 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 04 Jul 2021 04:30:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20210704143354.3A9E896033A@nuc.router0800d9.com>
Date: Sun,  4 Jul 2021 04:33:54 -1000 (HST)

Branch: dunfell

New this week: 19 CVEs
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-22897: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22897 *
CVE-2021-22898: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22898 *
CVE-2021-25217: dhcp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25217 *
CVE-2021-31525: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-33194: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33560: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33560 *
CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-3522: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3522 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
CVE-2021-3588: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3588 *

Removed this week: 5 CVEs
CVE-2013-0340: expat:expat-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0340 *
CVE-2021-20227: sqlite3:sqlite3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20227 *
CVE-2021-23336: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-23336 *
CVE-2021-3426: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3426 *
CVE-2021-3518: libxml2:libxml2-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3518 *

Full list:  Found 81 unpatched CVEs
CVE-2018-21232: re2c:re2c-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2019-12067: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-12067 *
CVE-2019-6293: flex:flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2020-12829: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12829 *
CVE-2020-13253: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13253 *
CVE-2020-13754: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13754 *
CVE-2020-13791: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-13791 *
CVE-2020-14372: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14372 *
CVE-2020-15469: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15705: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15859: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-16590: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16590 *
CVE-2020-16591: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16591 *
CVE-2020-16593: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16593 *
CVE-2020-16599: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16599 *
CVE-2020-17380: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-17380 *
CVE-2020-25632: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25632 *
CVE-2020-25647: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25647 *
CVE-2020-25742: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-27661: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27661 *
CVE-2020-27748: xdg-utils https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27748 *
CVE-2020-27749: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27749 *
CVE-2020-27779: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27779 *
CVE-2020-27821: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27821 *
CVE-2020-29510: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29510 *
CVE-2020-29623: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-29623 *
CVE-2020-35503: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35503 *
CVE-2020-35504: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35504 *
CVE-2020-35505: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35505 *
CVE-2020-35506: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-35506 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2021-0129: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-0129 *
CVE-2021-1765: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1765 *
CVE-2021-1789: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1789 *
CVE-2021-1799: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1799 *
CVE-2021-1801: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1801 *
CVE-2021-1870: webkitgtk https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-1870 *
CVE-2021-20181: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20181 *
CVE-2021-20221: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20221 *
CVE-2021-20225: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20225 *
CVE-2021-20233: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20233 *
CVE-2021-20240: gdk-pixbuf:gdk-pixbuf-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20240 *
CVE-2021-20255: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20255 *
CVE-2021-20266: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20266 *
CVE-2021-20294: binutils:binutils-cross-testsuite:binutils-cross-x86_64:binutils-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20294 *
CVE-2021-20305: nettle:nettle-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-20305 *
CVE-2021-22897: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22897 *
CVE-2021-22898: curl:curl-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-22898 *
CVE-2021-25217: dhcp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-25217 *
CVE-2021-27097: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27097 *
CVE-2021-27138: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27138 *
CVE-2021-27218: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27218 *
CVE-2021-27219: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27219 *
CVE-2021-27918: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-27918 *
CVE-2021-28041: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28041 *
CVE-2021-28153: glib-2.0:glib-2.0-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-28153 *
CVE-2021-29921: python3:python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-29921 *
CVE-2021-31525: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31525 *
CVE-2021-3156: sudo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3156 *
CVE-2021-31879: wget https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-31879 *
CVE-2021-3200: libsolv https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3200 *
CVE-2021-33194: go:go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33194 *
CVE-2021-33560: libgcrypt:libgcrypt-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33560 *
CVE-2021-33574: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-33574 *
CVE-2021-3409: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3409 *
CVE-2021-3416: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3416 *
CVE-2021-3418: grub:grub-efi:grub-efi-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3418 *
CVE-2021-3421: rpm:rpm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3421 *
CVE-2021-3445: libdnf https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3445 *
CVE-2021-3468: avahi https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3468 *
CVE-2021-3497: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3497 *
CVE-2021-3498: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3498 *
CVE-2021-3507: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3507 *
CVE-2021-3522: gstreamer1.0 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3522 *
CVE-2021-3527: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3527 *
CVE-2021-3544: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3544 *
CVE-2021-3545: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3545 *
CVE-2021-3546: qemu:qemu-native:qemu-system-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3546 *
CVE-2021-3588: bluez5 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2021-3588 *
