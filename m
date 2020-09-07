Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.1766.1599498148881268003
 for <openembedded-core@lists.openembedded.org>;
 Mon, 07 Sep 2020 10:02:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=u1kQdrqi;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.50, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f50.google.com with SMTP id jw11so825183pjb.0
        for <openembedded-core@lists.openembedded.org>; Mon, 07 Sep 2020 10:02:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cAoPIcv8u/r68qrQ1gkNX5DEETs9JL2D/lW5U8oTocU=;
        b=u1kQdrqib1mSb/seoLSwU5sYSW67WO0UCLvqD/J7lGF4PUb1f+t6KuUR/3T8RsV0SJ
         +m35xcu/aII1cnJ0w1ECehMOuVJTj3UCGPqkaAulSjoHb952dVETfoKC6mxLEb0ImBFH
         l3GgAVjy4gT2AnXtTGf/3GkPCJyyRzhILuqt3YmLz6dXd6Qdlmo5FQSnsXLtua8HIUUL
         WGlN/OC3x5vqAF3SLhpqSLarXO8nLC5taH9HvVnvaz9H0+20z2iNSrT3GRfbhsQ2ouqE
         pPzzuhyITxtiS0/aDoqPXlc+KLAVA9NOKQA99oOFIlKOh1Bhtp6NnzNjrceeCWVN/K66
         B56w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=cAoPIcv8u/r68qrQ1gkNX5DEETs9JL2D/lW5U8oTocU=;
        b=EWcr/lZE6NowJGSEjyqSLE2xTJHzPHeVQOW/A9MeQUE1yplpS5CnXt1jGYF9GtQXcB
         09u18K7mgulXY+iLViELPbzPsflnZT7U3VPmhj+cw/oVIgQ5pKLhxJ8g2I2Hu1nJ3De0
         ALEQPeXnEsKRoBVFEGX+7dKVVlFCQ8kQznS6+AVClVA49zEPNPfZHmIic7AymOY/zydz
         +xxtHbsEU1kyc0LVnwBvoNuViIePYTkIt9TVZMmDfJx57HG4u2qexFGsbUnyVx/vQ1Sh
         XuzLYe55HvW2N6v8Z/RZVIutJJCcMRVFt8FDZH4YFOLYkzILf4CgdBffgdVBl2iQ93zE
         Wp4w==
X-Gm-Message-State: AOAM533x2HzrBkgUbmfj+CzhRLx6HcKmUjLlNIKlR3rqzcXMc6J5F89v
	fkxaT6a/+Cc8Z29cBMbnRlqAOJsTna3GkpIb
X-Google-Smtp-Source: ABdhPJz+xpVFQGDWpwJwD6B7JBs1dWl6tPtRK3OTjQ+4poHJ7Ydv0B6H+7RD6VoksP7pG4QYgclXzQ==
X-Received: by 2002:a17:902:8bc3:: with SMTP id r3mr19966208plo.238.1599498147620;
        Mon, 07 Sep 2020 10:02:27 -0700 (PDT)
Return-Path: <steve@sakoman.com>
Received: from octo.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id s8sm16525902pfm.180.2020.09.07.10.02.26
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2020 10:02:26 -0700 (PDT)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/18] Patch review
Date: Mon,  7 Sep 2020 07:01:59 -1000
Message-Id: <cover.1599495862.git.steve@sakoman.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Please review this next set of changes for dunfell and have comments back
by end of day Wednesday.

Passed a-full on autobuilder:

https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/1350

NOTE: json-c: Fix CVE-2020-12762 has a line longer than 988 characters and thus
breaks send-pull-request.  I've truncated that line and tagged it with a <snip>

The full patch is of course  available in the git repo linked below.

The following changes since commit 0d4d0df6084cce3c3d9051db88f3199a030d3352:

  linux-firmware: update 20200721 -> 20200817 (2020-09-01 05:45:54 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-nut
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-nut

Anibal Limon (1):
  recipes-kernel: linux-firmware add qcom-venus-{5.2,5.4} packages

Bruce Ashfield (1):
  kernel-yocto: checksum all modifications to available kernel fragments
    directories

Joshua Watt (1):
  oeqa: sdk: Capture stderr output

Khem Raj (3):
  json-c: Fix CVE-2020-12762
  util-linux: Allow update alternatives for additional apps
  json-glib: Backport a build fix with clang

Martin Jansa (1):
  devtool: expand SRC_URI when guessing recipe update mode

Michael Tretter (1):
  devtool: deploy-target: Fix size calculation for hard links

Nicolas Dechesne (1):
  linux-libc-headers: kernel headers are installed in
    STAGING_KERNEL_BUILDDIR

Rasmus Villemoes (1):
  cml1: Move find_cfgs() helper to cml1.bbclass

Richard Purdie (1):
  selftest/prservice: Improve test failure message

Ross Burton (2):
  package.bbclass: explode the RPROVIDES so we don't think the versions
    are provides
  insane: improve gnu-hash-style warning

Steve Sakoman (1):
  sanity.conf: update BB_MIN_VERSION to 1.46.0

Sumit Garg (1):
  insane: fix gnu-hash-style check

Vijai Kumar K (1):
  wic: misc: Add /bin to the list of searchpaths

Yann Dirson (1):
  package: get_package_mapping: avoid dependency mapping if renamed
    package provides original name

hongxu (1):
  sysstat: fix installed-vs-shipped QA Issue in systemd

 meta/classes/cml1.bbclass                     |  10 +
 meta/classes/insane.bbclass                   |   5 +-
 meta/classes/kernel-yocto.bbclass             |  16 ++
 meta/classes/package.bbclass                  |  18 +-
 meta/conf/sanity.conf                         |   2 +-
 meta/lib/oeqa/sdk/case.py                     |   2 +-
 meta/lib/oeqa/sdk/cases/assimp.py             |   2 +-
 meta/lib/oeqa/sdk/cases/buildcpio.py          |   2 +-
 meta/lib/oeqa/sdk/cases/buildepoxy.py         |   2 +-
 meta/lib/oeqa/sdk/cases/buildgalculator.py    |   2 +-
 meta/lib/oeqa/sdk/cases/buildlzip.py          |   2 +-
 meta/lib/oeqa/selftest/cases/prservice.py     |   4 +-
 meta/recipes-bsp/u-boot/u-boot.inc            |  10 -
 meta/recipes-core/busybox/busybox.inc         |  10 -
 meta/recipes-core/util-linux/util-linux.inc   |   3 +
 .../json-c/json-c/CVE-2020-12762.patch        | 231 ++++++++++++++++++
 meta/recipes-devtools/json-c/json-c_0.13.1.bb |   1 +
 meta/recipes-extended/sysstat/sysstat.inc     |   2 +-
 ...o-instead-of-cast-to-convert-pointer.patch |  33 +++
 .../json-glib/json-glib_1.4.4.bb              |   4 +-
 .../linux-firmware/linux-firmware_20200817.bb |   6 +-
 .../linux-libc-headers/linux-libc-headers.inc |   2 +-
 scripts/lib/devtool/deploy.py                 |   8 +-
 scripts/lib/devtool/standard.py               |   2 +-
 scripts/lib/wic/misc.py                       |   5 +-
 25 files changed, 341 insertions(+), 43 deletions(-)
 create mode 100644 meta/recipes-devtools/json-c/json-c/CVE-2020-12762.patch
 create mode 100644 meta/recipes-gnome/json-glib/json-glib/0001-scanner-use-macro-instead-of-cast-to-convert-pointer.patch

-- 
2.17.1

