Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
 by mx.groups.io with SMTP id smtpd.web11.45500.1597677125639328103
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Aug 2020 08:12:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=w8V5OfKh;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.195, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f195.google.com with SMTP id bh1so7662719plb.12
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Aug 2020 08:12:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=nkTxC/lvgiT9K7j05I6U9hKMn890JgBS/I9aJB58mUA=;
        b=w8V5OfKhG9PVcUhcsG2ZbhvvFHMlVtQBVa52R6x2iYRNW9OSHT1lntJES3aDhBK0TB
         aMYGCblnBQODhHg2fq6vnVefOIKXoEKEp25+R8B4+fw+G07XpAH105RWTZBYgBHuT2rE
         PW1imEaViqQuPqi1xvQxz1iBSSppaAtCYRpJbX3g90hWX73n1yEfF93LyNNkeLpkQRv9
         kwMtx7CYrt6QYgU9bFiyhHFHEQmQf4KJABB2lHmYuGq3GiWw++bfFWuURMfdk4wE2QTp
         hIY+KFlPejSf+VkIQPiR05qtAALk5t3FI2EjRf0Jy+e0CHYHpDrXFtF+NXMbw55clCcx
         dM6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=nkTxC/lvgiT9K7j05I6U9hKMn890JgBS/I9aJB58mUA=;
        b=XHYc1i+9qa9hWoedaLwthSz3ic9Zyv2ejZyvuAjWVcrL+qsHTnspk1Z2zo6jIJwCaP
         Fe1I+HFjB6incP5B0gbKiyIW6a3K24Hs+kV2qTtG3sOuI8R9u/NUFNb5AOio+M5est8x
         z+KFna9CixRJdDpfd8KlcUUXVrASDU7QQtXIqHidtTlUaNsD0nolVYxy2ClAkLDBbUF2
         4Tj3fMvHx0y7EkgmFiDM4ydiVy5juWaQtkJQZDYnkt+tztZFgQQYtEZWdFltAOhlwoJH
         ki4qSxErxNmoOzZpXoQRRjuAUvT89J1+iWfr0kzUg5wnwZABpq0ZQUCOAuMaB5k8FceH
         QK+g==
X-Gm-Message-State: AOAM533eJqIwLsHyC+kh2Yzu6YpQeenSKN9c3lh6xde/vI4vRE20f0rY
	OPoUjricNn6jXRCnsXDDvB4ustOl4/LTZM950oY=
X-Google-Smtp-Source: ABdhPJxk9NB4UE6ZBHqUTJ+fDnCAyt5ymPR6PPSJ0AIqWxonem6WCzQ7a7FKqjZSkPwoXMvxe95SYA==
X-Received: by 2002:a17:90a:4988:: with SMTP id d8mr12307417pjh.132.1597677124407;
        Mon, 17 Aug 2020 08:12:04 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id w15sm19547363pjk.13.2020.08.17.08.12.03
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2020 08:12:03 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 0/7] Patch review
Date: Mon, 17 Aug 2020 05:11:44 -1000
Message-Id: <cover.1597676744.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1

Please review this next set of patches for dunfell and have comments back
by end of day Wednesday.

Passed a-full on autobuilder (other than 500 server error posting report for qemumips-alt):

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1265

The following changes since commit b95d6aeafb70765e22d2e1254e749a48f508d489:

  uninative: Handle PREMIRRORS generically (2020-08-09 09:26:54 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Bruce Ashfield (3):
  linux-yocto-rt/5.4: update to rt32
  linux-yocto/5.4: update to v5.4.56
  linux-yocto/5.4: update to v5.4.57

Khem Raj (4):
  glibc: Bring in CVE fixes and other bugfixes from 2.31 release branch
  gcc-9.3.inc: Mark CVE-2019-15847 as fixed
  go: update 1.14.4 -> 1.14.6
  go: Upgrade to 1.14.7

 meta/recipes-core/glibc/glibc-version.inc     |   2 +-
 .../glibc/0016-Add-unused-attribute.patch     |  31 ---
 .../glibc/glibc/CVE-2020-6096.patch           | 112 ----------
 .../glibc/glibc/CVE-2020-6096_2.patch         | 194 ------------------
 meta/recipes-core/glibc/glibc_2.31.bb         |   5 +-
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   2 +
 meta/recipes-devtools/go/go-1.14.inc          |   5 +-
 .../linux/linux-yocto-rt_5.4.bb               |   6 +-
 .../linux/linux-yocto-tiny_5.4.bb             |   8 +-
 meta/recipes-kernel/linux/linux-yocto_5.4.bb  |  22 +-
 10 files changed, 24 insertions(+), 363 deletions(-)
 delete mode 100644 meta/recipes-core/glibc/glibc/0016-Add-unused-attribute.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096.patch
 delete mode 100644 meta/recipes-core/glibc/glibc/CVE-2020-6096_2.patch

-- 
2.17.1

