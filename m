Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 0139A784EA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Nov 2017 01:58:49 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id b79so3144225pfk.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Nov 2017 17:58:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=6kum5FTqbXGVonQtpURqHq2JT7jjPCNTjpRqV+pakRU=;
	b=MlN9nyhy8WU7+XglMOu1gRqmhn2hQ9XMx8hSs+LIfC63yzPAQKxGJR+of/wo5X+vyZ
	fD0egNEswLIRehDAV73lyujm1sW6kDUiDg42UXtJYsMywU1uUMrNEWDYYXKRz+1uzDCl
	eBiKScXYu28uhiznkL1zB0Hv99y1mVxPdza54UK0UJI1CDDFxMXoOHE9EXtftB3njwBq
	2RuXgYsvMsC2KPDSMmmVP2JqXSAhPscG/0IuKxGWoNQ0OwCsVVjbZxSD9/hOWH8yGpyf
	mrPVlF0sDGs4wkgUdmd1E4q1BaEJWYcU3XNUqF4Xvy6yGdqhFfSuwhHgtmVD4MnsHHUp
	OP4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=6kum5FTqbXGVonQtpURqHq2JT7jjPCNTjpRqV+pakRU=;
	b=F0Pa0XtF3MNah8TDkwIqJr4YdgugdAXppVoikTtbe1v2EOFiHrh74ZiTvLiMTY7dKb
	TD+QCvZ6fdd/Smfd86y1WWNZQurbSM61f1jXovmGBlCd096xUNQqUizCthkWOvAPuM+v
	MKopzg5Vp/QjyrFD81mXQM+TOSMsFLkeESFJzj0AtWjbh66TpP0M59n/IvhOwHAfdmS4
	7KqWtjbkTBc4bhh6YCMoRZK2zHUwOBuP07d82Yg81wKosauSGxcy1wG+RCXwe/mIUdNd
	wgXtQZqFpvrtWMciEjCsX0ld0xxSqFNrY4OD11ryTTUemWphDbiAH0g2iiabyc/GEj4c
	ZmLQ==
X-Gm-Message-State: AJaThX7C0d4nXGj8aWlJzQT9eExnR62fRvrmcl8IR8osSWkZNNoPZy7b
	TlA/fCaCmVTOK4gjDTCa8jrtoQ==
X-Google-Smtp-Source: ABhQp+QJKkm19gQzNF34RsC921Ysye158oW6Vpz6umxCe75fjkzB72nYrUQ6NSvxgBccAoaE1+91vA==
X-Received: by 10.99.114.30 with SMTP id n30mr1552364pgc.129.1510192730324;
	Wed, 08 Nov 2017 17:58:50 -0800 (PST)
Received: from localhost.localdomain ([2601:646:8882:b8c::a4a])
	by smtp.gmail.com with ESMTPSA id
	c185sm10074935pfb.112.2017.11.08.17.58.49
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 08 Nov 2017 17:58:49 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  8 Nov 2017 17:58:40 -0800
Message-Id: <cover.1510192517.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.15.0
Subject: [PATCH 0/5] Misc fixes predominantly for musl
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
X-List-Received-Date: Thu, 09 Nov 2017 01:58:49 -0000

upgrade musl past 1.1.18 release
fix armv5 codegen issue seen with gcc7 while compiling kernel
fix systemd for musl/64-bit
make binutils SRC_URI overridable
Fix go with PIE/musl

The following changes since commit 3717c76eb24217c14a22f72fdd8732923729dee8:

  gcc: fix miscompilation on mips64 (2017-11-08 22:23:45 +0000)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (5):
  binutils: Convert SRC_URI and SRCREV to weak defines
  go: Fix build with PIE on musl
  systemd: Fix build with musl/mips64
  musl: Update to 1.1.18
  gcc7/gcc6: Fix unaligned STRD issue on ARM

 meta/recipes-core/musl/musl_git.bb                 |   4 +-
 .../0001-Use-uintmax_t-for-handling-rlim_t.patch   |  89 ++++++++++
 meta/recipes-core/systemd/systemd_234.bb           |   1 +
 meta/recipes-devtools/binutils/binutils-2.29.inc   |   5 +-
 meta/recipes-devtools/gcc/gcc-6.4.inc              |   1 +
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch | 194 +++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-7.2.inc              |   1 +
 ...5-suppress-32-bit-aligned-ldrd-strd-peeph.patch | 194 +++++++++++++++++++++
 meta/recipes-devtools/go/go-1.9.inc                |   3 +
 .../go/go-1.9/default-buildmode-pie.patch          |  18 ++
 .../go/go-1.9/set-external-linker.patch            | 111 ++++++++++++
 11 files changed, 617 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-Use-uintmax_t-for-handling-rlim_t.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.4/0057-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0051-ARM-PR-82445-suppress-32-bit-aligned-ldrd-strd-peeph.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/default-buildmode-pie.patch
 create mode 100644 meta/recipes-devtools/go/go-1.9/set-external-linker.patch

-- 
2.15.0


