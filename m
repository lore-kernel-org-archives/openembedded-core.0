Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
 by mx.groups.io with SMTP id smtpd.web12.1070.1613605915951422724
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Feb 2021 15:51:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20150623.gappssmtp.com header.s=20150623 header.b=sQIQPmrQ;
 spf=softfail (domain: sakoman.com, ip: 209.85.215.179, mailfrom: steve@sakoman.com)
Received: by mail-pg1-f179.google.com with SMTP id z21so8549pgj.4
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Feb 2021 15:51:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsNzoj361n3wNB/jRiin/ow/9Y6zswIcbL3CQMjbx+w=;
        b=sQIQPmrQw6RA3/xBTcJ163tDLH+NkCEtqXGYbxOGpL4ZBSXMXvmqj2PhHpCgrVNeK1
         6wn8PtzYP/ECTysueVygVdwK2f3S2D5cmtIOsxtG3w31dbDAWtW4QZubiFTJDYLZYK50
         4uTDlE2QccjLZNYG47/LpNpOuNGQjtG542hxOWPUyiApqDDX5PSz7fw60mozrEc5J6ZP
         KaQTr+1HbxB6m3ZnZfZRNWi8jXjTRaZt3j9LocLApZCO6+IfikLR+4ScKo+BuQwU34i5
         0na9biKYPWTQntGmNHi101rAMzd+9MEY+O4wc7phYDHIun5zBo677Rqr9b0j5N+gomZL
         WTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=qsNzoj361n3wNB/jRiin/ow/9Y6zswIcbL3CQMjbx+w=;
        b=STGKl4QcUpiclvJpm+OloqOPPxPS2JBBOO0+TCJo44nU+KYCGR0vxHoh9bZtgRB4pr
         9XIqIicKXa3YRGXFzyjDNIUAFr80sF7DSI/pj14lUUxjnUvVhRvhQFDp3TFV0PMooL0Y
         YF4I+VM1zjhxwEORtaDSy9MOVfxxvwu3AHR4lzOYGL3vXb+2015kHwp/R4f/VUyMXpU8
         xahOWYlu/5PVDC2542oD/rLPQbBEQ9Mr1KJ9Yjn1J6UH8nBkcJvS20WNgSHpVZWIA48J
         NRnlGYWQRlqOaeisZaSDNifMUqyD0lM1IeEwUa+RtlYjXPUYRfz/OcAOntEbwDVq6VC3
         twgw==
X-Gm-Message-State: AOAM533UyWNGu55V70Y+URpjsmaK7Su3NPFxCBfmwwH6NxEHbajhNGjf
	7hNgIozoWNZvqisvRzvVx9n77eTd7vPaQtP72wI=
X-Google-Smtp-Source: ABdhPJwzLLVBYNvsHZH8uveJTJg/aICoFvllE4Wv8EXaZodnJjFys6GPvHmARD/rbrkp9ElbOYnNfA==
X-Received: by 2002:aa7:9e89:0:b029:1d2:7d49:9bac with SMTP id p9-20020aa79e890000b02901d27d499bacmr1610459pfq.21.1613605914699;
        Wed, 17 Feb 2021 15:51:54 -0800 (PST)
Return-Path: <steve@sakoman.com>
Received: from hexa.router0800d9.com (rrcs-66-91-142-162.west.biz.rr.com. [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id x1sm3938523pgj.37.2021.02.17.15.51.53
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Feb 2021 15:51:54 -0800 (PST)
From: "Steve Sakoman" <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 00/17] Pull request (cover letter only)
Date: Wed, 17 Feb 2021 13:51:43 -1000
Message-Id: <cover.1613599416.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The following changes since commit 9efabaff73090b08233b4fcef22142b9ac0c11aa:

  wic/selftest: test_permissions also test bitbake image (2021-02-09 06:12:09 -1000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib stable/dunfell-next
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=stable/dunfell-next

Alexander Kanavin (6):
  p11-kit: upgrade 0.23.20 -> 0.23.21
  python3: split python target configuration into own class
  python3-pycairo: use python3targetconfig
  distutils3-base.bbclass: use python3targetconfig
  meta: drop _PYTHON_SYSCONFIGDATA_NAME hacks
  gpgme: use python3targetconfig

Dorinda (1):
  oe-pkgdata-util: Check if environment script is initialized

Jon Mason (1):
  gcc-9.3.inc: Fix potential runtime crash

Khem Raj (1):
  python3targetconfig.bbclass: Make py3 dep and tasks only for target
    recipes

Lee Chee Yang (1):
  p11-kit: upgrade 0.23.21 -> 0.23.22

Martin Jansa (1):
  image_types.bbclass: tar: use posix format instead of gnu

Michael Halstead (1):
  uninative: Upgrade to 2.10

Richard Purdie (3):
  image_types: Ensure tar archives are reproducible
  opkg: Fix build reproducibility issue
  opkg: Fix patch glitches

saloni (2):
  libgcrypt: Whitelisted CVEs
  libcroco: Added CVE

 meta/classes/distutils3-base.bbclass          |   2 +-
 meta/classes/image_types.bbclass              |   2 +-
 meta/classes/python3native.bbclass            |   2 -
 meta/classes/python3targetconfig.bbclass      |  17 ++
 meta/classes/scons.bbclass                    |   3 -
 meta/conf/distro/include/yocto-uninative.inc  |   8 +-
 meta/lib/oe/prservice.py                      |   4 -
 meta/recipes-core/glib-2.0/glib.inc           |   4 -
 meta/recipes-devtools/gcc/gcc-9.3.inc         |   1 +
 ...-PR-tree-optimization-97236-fix-bad-.patch | 119 +++++++++++
 .../opkg/opkg/sourcedateepoch.patch           |  24 +++
 meta/recipes-devtools/opkg/opkg_0.4.2.bb      |   1 +
 .../python/python3-pycairo_1.19.0.bb          |   2 +-
 meta/recipes-graphics/mesa/mesa.inc           |   5 -
 meta/recipes-support/gpgme/gpgme_1.13.1.bb    |   2 +-
 .../libcroco/files/CVE-2020-12825.patch       | 192 ++++++++++++++++++
 .../libcroco/libcroco_0.6.13.bb               |   3 +
 .../libgcrypt/libgcrypt_1.8.5.bb              |   3 +
 ...{p11-kit_0.23.20.bb => p11-kit_0.23.22.bb} |   7 +-
 scripts/oe-pkgdata-util                       |   3 +
 20 files changed, 375 insertions(+), 29 deletions(-)
 create mode 100644 meta/classes/python3targetconfig.bbclass
 create mode 100644 meta/recipes-devtools/gcc/gcc-9.3/0001-Backport-fix-for-PR-tree-optimization-97236-fix-bad-.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/sourcedateepoch.patch
 create mode 100644 meta/recipes-support/libcroco/files/CVE-2020-12825.patch
 rename meta/recipes-support/p11-kit/{p11-kit_0.23.20.bb => p11-kit_0.23.22.bb} (75%)

-- 
2.25.1

