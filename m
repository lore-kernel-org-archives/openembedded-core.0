Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
 by mx.groups.io with SMTP id smtpd.web12.8178.1601806566947609928
 for <openembedded-core@lists.openembedded.org>;
 Sun, 04 Oct 2020 03:16:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=tGZwcRR0;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.47, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f47.google.com with SMTP id b17so3542500pji.1
        for <openembedded-core@lists.openembedded.org>; Sun, 04 Oct 2020 03:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=utQQU7rbPLCbHrGcH4uV6QNwmbZVq1rELkvUKykiC6I=;
        b=tGZwcRR0UQBAgEWaryBxJMHoQi1sOAGzQ2MKvQI/IKQz+x0DqS4AGB/RmbPCwaP85A
         OBtDG/hOz3n02WTg2ysboDxsjv47i3C9Smzeecz7Ho28SfBgEScSnmM0m4+RBEeg0UGQ
         doD3+pMgosJL0SJ8+3j+qh+ElRPKNP4m4Ln6fhGlVJN5pqIPJa0OR8AOaBv10IQfZdA/
         qtNsn0TfuV8CWQ8t6o/2RIhiSAvfscP81MOAGrkMltxVzP1O+UrNxv5xuLBDYmkLL9Ys
         lqWeUkixwGzwZ8Brj69hzBKA7zL9MTJXuDHM2RxxFEm7Hcrr3Xr8Vzbwi/fslYTwYl1X
         bvCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=utQQU7rbPLCbHrGcH4uV6QNwmbZVq1rELkvUKykiC6I=;
        b=sNVKAsSxYZKTair/ZElRNIomEf58yv+a4qAyokx+NEU2Y3WCbHiIvjI8LTdzf7qsqH
         K/KCuzGRno2dL0fr0FhyJ35ho/atx4oIfUpBg949eGHyzDcey42r92SdMSC2sJjY4OvT
         kHLypBpumLIjyF/3fkPIj8kpeXUy7vJJ6MKu++7W0PcvMh/qvEfvffUiIJq+bEHOGQ1M
         CMWC63bEZIXWWzyC8Gqq1UCJN4cnhCnDTKmA1QWR3l9/Gl9+YFYjEVaUd4O7fl+w/qEy
         o3lykCkq7d7WD7xkqPSMSn4+bQd/LaLiqoorfTZmyp2d/WEx97CibuUW4NttJiRyXo+5
         ruVA==
X-Gm-Message-State: AOAM5302MJSv45TFcdWWP2YqC+1yatFS9+O3SIv4mZE5TnNFpRiKIpCJ
	nY+IxOFUxOgbXBSgYwXnw/G2wZ1+Qrqu5hWrRzg=
X-Google-Smtp-Source: ABdhPJxQ8fcIz5+nhaCwnF7XsC+R/ser7dJFCLejgdPvpjszxDmcF48HbuuPwXGicA9VaQdb2EbOPg==
X-Received: by 2002:a17:90a:6741:: with SMTP id c1mr11045270pjm.6.1601806565744;
        Sun, 04 Oct 2020 03:16:05 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id y12sm7177474pga.53.2020.10.04.03.16.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2020 03:16:04 -0700 (PDT)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 3312E96033C; Sun,  4 Oct 2020 00:15:55 -1000 (HST)
Subject: OE-core CVE metrics for dunfell on Sun 04 Oct 2020 12:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201004101555.3312E96033C@nuc.router0800d9.com>
Date: Sun,  4 Oct 2020 00:15:55 -1000 (HST)

Branch: dunfell

New this week:

Removed this week:
CVE-2019-10216: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-10216 *

Full list:  Found 148 unpatched CVEs
CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-6425: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6425 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2014-8166: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-8166 *
CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
CVE-2015-8666: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8666 *
CVE-2016-1568: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-1568 *
CVE-2016-2391: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2391 *
CVE-2016-2857: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2857 *
CVE-2016-2858: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-2858 *
CVE-2016-4001: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4001 *
CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
CVE-2016-4020: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4020 *
CVE-2016-4614: libxml2 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4614 *
CVE-2016-4952: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4952 *
CVE-2016-4964: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4964 *
CVE-2016-5105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5105 *
CVE-2016-5106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5106 *
CVE-2016-5107: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5107 *
CVE-2016-5126: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5126 *
CVE-2016-5238: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5238 *
CVE-2016-5337: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5337 *
CVE-2016-5338: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-5338 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2016-6351: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6351 *
CVE-2016-6489: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6489 *
CVE-2016-6490: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6490 *
CVE-2016-6833: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6833 *
CVE-2016-6834: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6834 *
CVE-2016-6835: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6835 *
CVE-2016-6836: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6836 *
CVE-2016-6888: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6888 *
CVE-2016-7116: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7116 *
CVE-2016-7155: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7155 *
CVE-2016-7156: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7156 *
CVE-2016-7157: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7157 *
CVE-2016-7170: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7170 *
CVE-2016-7421: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7421 *
CVE-2016-7422: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7422 *
CVE-2016-7423: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7423 *
CVE-2016-7466: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7466 *
CVE-2016-7994: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7994 *
CVE-2016-7995: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-7995 *
CVE-2016-8576: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8576 *
CVE-2016-8577: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8577 *
CVE-2016-8578: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8578 *
CVE-2016-8667: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8667 *
CVE-2016-8668: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8668 *
CVE-2016-8669: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8669 *
CVE-2016-8909: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8909 *
CVE-2016-8910: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-8910 *
CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
CVE-2016-9102: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9102 *
CVE-2016-9103: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9103 *
CVE-2016-9104: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9104 *
CVE-2016-9105: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9105 *
CVE-2016-9106: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9106 *
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
CVE-2017-6386: virglrenderer-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2017-6386 *
CVE-2018-1000041: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000041 *
CVE-2018-1000205: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-1000205 *
CVE-2018-10844: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10844 *
CVE-2018-10845: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10845 *
CVE-2018-10846: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-10846 *
CVE-2018-12433: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12433 *
CVE-2018-12437: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-12617: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12617 *
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *
CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
CVE-2018-18073: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18073 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2018-19665: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-19665 *
CVE-2018-21232: re2c https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-21232 *
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-18276: bash https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-18276 *
CVE-2019-20175: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20175 *
CVE-2019-20334: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20334 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-20907: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20907 *
CVE-2019-6290: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6290 *
CVE-2019-6291: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6291 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-8343: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-8343 *
CVE-2020-10648: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10648 *
CVE-2020-10713: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-10713 *
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
CVE-2020-14308: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14308 *
CVE-2020-14309: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14309 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-14311: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14311 *
CVE-2020-14346: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14346 *
CVE-2020-14361: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14361 *
CVE-2020-14362: xserver-xorg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14362 *
CVE-2020-14363: libx11 https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14363 *
CVE-2020-15469: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15469 *
CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
CVE-2020-15704: ppp https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15704 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15706: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15706 *
CVE-2020-15707: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15707 *
CVE-2020-15778: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15778 *
CVE-2020-15859: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15859 *
CVE-2020-15900: ghostscript-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15900 *
CVE-2020-16092: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-16092 *
CVE-2020-24553: go-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24553 *
CVE-2020-25219: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25219 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
CVE-2020-8432: u-boot https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-8432 *
