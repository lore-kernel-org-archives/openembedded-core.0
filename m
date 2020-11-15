Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
 by mx.groups.io with SMTP id smtpd.web12.22479.1605460690321855677
 for <openembedded-core@lists.openembedded.org>;
 Sun, 15 Nov 2020 09:18:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=PTBMZ6ql;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.172, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f172.google.com with SMTP id t21so4319047pgl.3
        for <openembedded-core@lists.openembedded.org>; Sun, 15 Nov 2020 09:18:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=vtrbEIdyP5JBe5PhoToOz5gtKBHiCb3HZYYgm78NbjI=;
        b=PTBMZ6ql40togk2zngIBCOUqXrTLU+C/5oR+CdxxqHIsBpeHBCpsp/+cvgyEYJOU04
         2kyngq0BCe8auUc8Q07lz7duA95H4IPmilbFhGYjCdIF27vHfjqxdTsUnhQOJCEz9w68
         NOi5MH8RBnbuYyj3+Jcfvd1OvUGgxZdgBdH85rGccaK3rzNFQpdRg+UiSBck7HXJf9Z0
         CfMsc706DJFPKJHl8lOTP01bWZHIKsrlpFQ8pp0eyXU3po9k9ZB4iBsIdPe4ZoEgKyEJ
         4mO5J3GusWjwjpGqMV+VtvWq9H4G+ksw9bVBY0uc0+ewEdHDHX+ysH1EiM2ZAEKQMnYn
         tsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=vtrbEIdyP5JBe5PhoToOz5gtKBHiCb3HZYYgm78NbjI=;
        b=K6mG+HWkYVlPlbdTCzxi9eShE+vE5u9pIaEXYXpKZdpOzAyUOL/9RbV1n/phscOWIH
         bq5gUkGB7/4WOBJbciEw+CBxqsWouxJ1Zy0+s223kK16A6oaHmkH7WrYLGNrlR9RpSnX
         2dTOkP18n3v1X5hCQrn7J57e9siF6fAnMXImTtLMzLuRzVw81HoE4otFoyJEQIS3Wk1R
         58Wtf5yZgvOejysUfG/Je+Lx2pC50XHmmSexbve6GV5GO5kRPRPR3qrr0Qy8blRskq4J
         jQ7pA0YmdKdr2s6KgPMcmvQH6hp0y+Ekreysskhxx2mbv7d3UPOQ6cBvEgQt1TC7t8ek
         kU6Q==
X-Gm-Message-State: AOAM533ZJR8fflS14f0SZiKaxsWLaI9G97l0RJyKsA8Dc59vepWaP2/C
	QN/faHXeyaTItu+OADeuJqNNmHW0nb51nhxS
X-Google-Smtp-Source: ABdhPJwpW2nl67mdVE18LTzkjRNv8TtAqFRhutYzWAa9zddbzINIqFjmgWU/bI8HYPbgUoTiO3vgag==
X-Received: by 2002:aa7:95a6:0:b029:155:336c:3494 with SMTP id a6-20020aa795a60000b0290155336c3494mr10234107pfk.17.1605460689294;
        Sun, 15 Nov 2020 09:18:09 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com ([99.197.43.113])
        by smtp.gmail.com with ESMTPSA id w13sm15873367pfd.49.2020.11.15.09.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2020 09:18:08 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id D3F58960317; Sun, 15 Nov 2020 07:17:57 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 15 Nov 2020 07:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201115171757.D3F58960317@nuc.router0800d9.com>
Date: Sun, 15 Nov 2020 07:17:57 -1000 (HST)

Branch: master

New this week:

Removed this week:
CVE-2012-4564: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-4564 *
CVE-2014-9278: openssh https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2014-9278 *
CVE-2018-16517: nasm-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16517 *

Full list:  Found 55 unpatched CVEs
CVE-2012-6094: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2012-6094 *
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
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
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-16868: gnutls https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16868 *
CVE-2018-16869: nettle https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-16869 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2019-1010022: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010022 *
CVE-2019-1010023: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010023 *
CVE-2019-1010024: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010024 *
CVE-2019-1010025: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-1010025 *
CVE-2019-14865: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-14865 *
CVE-2019-20446: librsvg https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20446 *
CVE-2019-20633: patch-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-20633 *
CVE-2019-6293: flex-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6293 *
CVE-2019-6470: bind https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2019-6470 *
CVE-2020-12825: libcroco https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-12825 *
CVE-2020-14310: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-14310 *
CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
