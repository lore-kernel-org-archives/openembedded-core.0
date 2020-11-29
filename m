Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
 by mx.groups.io with SMTP id smtpd.web10.47643.1606670701420751014
 for <openembedded-core@lists.openembedded.org>;
 Sun, 29 Nov 2020 09:25:01 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=TrC41sXw;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.181, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f181.google.com with SMTP id s63so8498611pgc.8
        for <openembedded-core@lists.openembedded.org>; Sun, 29 Nov 2020 09:25:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:message-id:date;
        bh=s80META1b2jUCGpRpPMBqDeUjX3lHqIYZxXUaXYjMdg=;
        b=TrC41sXwgC4qzwTj5F27+p+RAAVyVtk0ijZNuVkJ2sbeyV7XIpsDsb7DV+K9ya5151
         zyzK+yPFMRxQpKP50pc6/ZYSZEz940J+kwAba2uvvRp3Fa3yeWh+hURuumkEZJwaF32u
         NrvQbEDqFScNnkc10m6emywt/nlBUip+BGs7ZQOtR+ypCPUp48MWZXeI5PN2MliUkHnp
         do7M3LWaxELrRwDSI3nMVzebDh156BDf9ZVvbYYl3c38FrdDuQzGK2sIf1HfZBsDToD1
         /s6IxdUTFUY5k6pyIGkLJ7lLopFPJ5cBUyqueSzeCa/LltAc0f180/ZlaUAKUIUvu3PI
         p1LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:message-id:date;
        bh=s80META1b2jUCGpRpPMBqDeUjX3lHqIYZxXUaXYjMdg=;
        b=QC75pT6sirBwoo/1sDfxppfOvEPDPEelfSEgkAVYC7X3cNQ+D/W+neJMTqa/aKzQvA
         r+GkhXs4ZX1OXV3/D1bh/Q8cYtBks2FC0WFuWoeFYBwc6JDjuFdI0AVP5O45kwzsdJ1O
         3mTDutWkUKC1s1HU3aeyBKOeD6OnSsx5pnZQLUpFegWqWcPCgMa3t7JKGLJqIfDDa0qy
         VbxGwrrbA3f9pl7Dq1zKepvjRuL/g+sdfigk1+cg5Ul0ucpWKnfMBAYRsnmagXuwq7Gr
         5xB176PPY+awghP6Z8UuxnspgLBC6bqA/KqfaCBGLdY+yansyqkOSH0cYat26P3LE676
         O6TQ==
X-Gm-Message-State: AOAM530BsNAkFcVv7Yl9kXeQaZxT3Bf5m4kaCoh7Y8012ZjduXEkqWVf
	2uq+4g66K/7bsd+HzTIT89aJwPHPwW8m9ahG
X-Google-Smtp-Source: ABdhPJzuuU9oNG/lT+43Ii8yPU0hn7aNeCKJc1rcmgxplW98gdKCOlGsHSFiSDjHeJNzJZYDQIJB6A==
X-Received: by 2002:a17:90a:4dc8:: with SMTP id r8mr21516514pjl.1.1606670700354;
        Sun, 29 Nov 2020 09:25:00 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from nuc.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id kx12sm18715210pjb.50.2020.11.29.09.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Nov 2020 09:24:58 -0800 (PST)
Received: by nuc.router0800d9.com (Postfix, from userid 1000)
	id 4C3AB960251; Sun, 29 Nov 2020 07:24:56 -1000 (HST)
Subject: OE-core CVE metrics for master on Sun 29 Nov 2020 07:15:01 AM HST
From: "Steve Sakoman" <steve@sakoman.com>
To: <steve@sakoman.com>,<openembedded-core@lists.openembedded.org>,<yocto-security@lists.yoctoproject.org>
X-Mailer: mail (GNU Mailutils 3.7)
Message-Id: <20201129172456.4C3AB960251@nuc.router0800d9.com>
Date: Sun, 29 Nov 2020 07:24:56 -1000 (HST)

Branch: master

New this week:

Removed this week:
CVE-2018-6553: cups https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-6553 *
CVE-2020-15523: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15523 *
CVE-2020-24352: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-24352 *
CVE-2020-26154: libproxy https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-26154 *
CVE-2020-27619: python3-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-27619 *
CVE-2020-28362: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28362 *
CVE-2020-28366: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28366 *
CVE-2020-28367: go https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-28367 *

Full list:  Found 43 unpatched CVEs
CVE-2013-0800: cairo https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-0800 *
CVE-2013-4235: shadow-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4235 *
CVE-2013-4342: xinetd https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-4342 *
CVE-2013-6629: ghostscript https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-6629 *
CVE-2013-7381: libnotify https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2013-7381 *
CVE-2015-7313: tiff https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-7313 *
CVE-2015-8345: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8345 *
CVE-2015-8619: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2015-8619 *
CVE-2016-4002: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-4002 *
CVE-2016-6328: libexif https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-6328 *
CVE-2016-9101: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2016-9101 *
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
CVE-2018-12437: openssl https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12437 *
CVE-2018-12438: libgcrypt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-12438 *
CVE-2018-13410: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13410 *
CVE-2018-13684: zip https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-13684 *
CVE-2018-18438: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2018-18438 *
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
CVE-2020-15705: grub-native https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15705 *
CVE-2020-15863: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-15863 *
CVE-2020-1752: glibc https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-1752 *
CVE-2020-25742: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25742 *
CVE-2020-25743: qemu https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-25743 *
CVE-2020-3810: apt https://web.nvd.nist.gov/view/vuln/detail?vulnId=CVE-2020-3810 *
