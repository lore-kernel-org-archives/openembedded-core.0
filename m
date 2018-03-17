Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 869327886C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Mar 2018 03:40:32 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e3so4833835pga.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 20:40:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=H3GH2mdXVFwWoKyy0SVeEuxfwIYVJtWFjCdoqp81M8Q=;
	b=gBjgtuUOBMXH2ehFt4kZlm5801MZ7/jfbxdPzDjjGBaLZw4mYUxQfGjDBKMlHFrory
	T3Ctnw/+u9FEY19lu9/pe8IYpaeEHY7YHbGxstc38GK0KjfVPI8vOsvCBa2A1zq8nJK9
	6eaAr1xnAnLcAuZYWVCJBGlkPmNkl2sjkEU0+rhFjBOzdrRJtZ2WZT4E1DjXq9ADfdbS
	qEgq+LHedCUSsXQUv3cx9DhpmBQfi+H/m1eiAizPBCQE64vmj3P5DU+Pu4J7jT0dngCt
	tAgJXTcUPFRVkWIknvoUY/lHpwGWrokX8/VBkpi06NafJvMZGYTbpPeVWSP3gnQVUTxM
	Al/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=H3GH2mdXVFwWoKyy0SVeEuxfwIYVJtWFjCdoqp81M8Q=;
	b=sf7Yb/YhwvGvs2HlJnRO+Ue6YluL1QICMj+s8X1aPNLJAE67eBIW/gIbo9SJELJSOK
	DtCqRbG0ABFCTb5iGDLujtsK4XO6mEIc/maxbK5AMBhnwJ+I9b/P+8ZF3CG9yr/mQxlF
	AWzbXmV26GamgNqNiT5kAJBJdLBeG4+BTsR1KIckS/ZNP4FVXot3ZirM+34cR82D4S9J
	pdNavJFgXvkTjJFgw2slH3BPMdv72adLxBN8Ggm1Zv22eCV9O/+FkpkK+2cQmPzD6wFu
	swbpGgZVT6o6cNzCexQtzDs/Pbv0FgR2iKXZ0nTER91g0z063YLJDRGqlNGzLqLdzFyE
	3QSg==
X-Gm-Message-State: AElRT7F8nJn77gj1dynWjhWQh1dATGgDI2AZSJoiGm3tcrICP/z+CFVM
	UAugdclXzyaw9PQo7k5/g/VPmQ==
X-Google-Smtp-Source: AG47ELspZgkb1lIRHy1B0kTF/0FiUlkHxYT6IcigamJbJg5t6PmfN7GxWPic4cXtCaxzMctmq2GM9g==
X-Received: by 10.101.69.75 with SMTP id x11mr3373366pgr.69.1521258033450;
	Fri, 16 Mar 2018 20:40:33 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	n27sm17776442pgc.40.2018.03.16.20.40.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 16 Mar 2018 20:40:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 16 Mar 2018 20:40:23 -0700
Message-Id: <cover.1521257828.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
Subject: [PATCH 0/5] RISC-V Build fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 17 Mar 2018 03:40:32 -0000

These packages were failing to build for qemuriscv64 world build
Some fixes are common, some are backports and some are already
submitted to respective upstream

The following changes since commit c94271d87d16323f920891344642f76dfb3c994f:

  buildperf: measure the size of core-image-sato rootfs (2018-03-16 03:42:03 -0700)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/riscv64-fixes-3
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/riscv64-fixes-3

Khem Raj (5):
  gcc: Do not use --with-linker-hash-style if LINKER_HASH_STYLE is empty
  mtd-utils: Explicitly add pthread options to cflags
  x264: Use updated gnu-config artifacts
  python-numpy: Fix build for riscv64
  dpkg: Backport riscv support

 .../0001-arch-Add-support-for-riscv64-CPU.patch    |  54 ++++++++
 .../dpkg/dpkg/glibc2.5-sync_file_range.patch       |  21 +++-
 meta/recipes-devtools/dpkg/dpkg_1.18.24.bb         |   1 +
 meta/recipes-devtools/gcc/gcc-7.3.inc              |   2 +-
 meta/recipes-devtools/mtd/mtd-utils_git.bb         |   2 +
 .../files/0001-npy_cpu-Add-riscv-support.patch     |  28 +++++
 .../python-numpy/files/riscv64/_numpyconfig.h      |  32 +++++
 .../python-numpy/files/riscv64/config.h            | 139 +++++++++++++++++++++
 .../recipes-devtools/python-numpy/python-numpy.inc |   5 +
 meta/recipes-multimedia/x264/x264_git.bb           |   2 +
 10 files changed, 280 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/0001-arch-Add-support-for-riscv64-CPU.patch
 create mode 100644 meta/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
 create mode 100644 meta/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
 create mode 100644 meta/recipes-devtools/python-numpy/files/riscv64/config.h

-- 
2.16.2


