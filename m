Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f196.google.com (mail-pf1-f196.google.com
	[209.85.210.196])
	by mail.openembedded.org (Postfix) with ESMTP id 96A8679357
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 05:42:40 +0000 (UTC)
Received: by mail-pf1-f196.google.com with SMTP id p12-v6so4692305pfh.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 05 Sep 2018 22:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=WVPpSrfBruqh+refr/NxrevlPoiTCoyQmfcRL2DLSLk=;
	b=OpsvQesPYkPWOW319Gh4OtHpU4MpdFCT4xdWH0sb8tixBPAU155F7dZThsxLEig9Xl
	PgMOWO6h6wCKB1TAKEcVeUYn9tKnAaCzc1SxeArS+0mSou/nZXrRyiwbqAAB8XjnBxZi
	DtEzgMEn8/ExOfAmdS+xED8/eTwNZRILaTEFHJ5vKBvgbW2/fLYtLFdx2SJaYliiZzHM
	ibBpPqKLZUfc9Jadye63wOpiK70E+wHoZMgSA6J3l3lF9EH5gLCgQA++RylOjo4vWo6F
	HOklV1MSTefMG1SoezNpluEe3vQVaVORqj7jpPQ77exIU6KcVKlpWrpyH6/2CiIjPYI3
	OAWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=WVPpSrfBruqh+refr/NxrevlPoiTCoyQmfcRL2DLSLk=;
	b=doF62RgXDDZul9qcnQr6HLxQPrOTtYdpPP869Yk+esSZVt4F807/ZZDd0UrOCUb/dO
	D2eALWRaMo/C+vCls2ME4GpKDE1gcZv+cucs06uXf5ZIhfZVGa1wiwpzLZ5TfKhmMcCH
	m3QPzXixUrspR0/yJXp48Rxi1w7aCQGZET6eF8X7k9qJulHauAaaA4salE/B7FMd6bDe
	DpS08FFnkb37A+3mc+Y2AF63bS5Ts9tLKGClcCKnkjQ2rDb/zOLRE7i4nmnQCGQErpzS
	GCY3W26dYCye8bsK5vA7wj8ikOexO3H8TfyR4wIE45jeZ7KVcLtO67uFpcwH58mtG81g
	UmGA==
X-Gm-Message-State: APzg51CCSQVhsZXug0c5JVvETByfeAMS2r5nplnCuLEUvRK4cOZZgcB7
	Z4Yzmi/kFj36HAOUFfYJMAFfS/Um
X-Google-Smtp-Source: ANB0VdaBewS36i04ftHeh/DDuFHfCfdSlN+/71k72lihPevLx3L4runb3Lq3QcGEq6G0etTzw9EmrQ==
X-Received: by 2002:a62:398c:: with SMTP id u12-v6mr1210055pfj.9.1536212561164;
	Wed, 05 Sep 2018 22:42:41 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::71e7])
	by smtp.gmail.com with ESMTPSA id
	t86-v6sm5053267pfe.109.2018.09.05.22.42.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 05 Sep 2018 22:42:40 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Sep 2018 22:42:33 -0700
Message-Id: <cover.1536212473.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 0/1] gdb: Update to 8.2
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
X-List-Received-Date: Thu, 06 Sep 2018 05:42:40 -0000

gdb being a leaf package, this update is not as risky

The following changes since commit 5645d09328ddd5eedbce3ff7757337b5ef176ead:

  opkg: add strict package matching on removal patch (2018-09-05 20:29:33 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/master
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/master

Khem Raj (1):
  gdb: Update to 8.2

 .../gdb/{gdb-8.1.1.inc => gdb-8.2.inc}        |   5 +-
 ...ian_8.1.1.bb => gdb-cross-canadian_8.2.bb} |   0
 .../{gdb-cross_8.1.1.bb => gdb-cross_8.2.bb}  |   0
 .../0001-include-sys-types.h-for-mode_t.patch |   9 +-
 ...make-man-install-relative-to-DESTDIR.patch |   8 +-
 ...ux-nat-Define-_ABIO32-if-not-defined.patch |  26 ++--
 ...e-pt_regs-uapi_pt_regs-on-GLIBC-syst.patch |  14 +-
 ...port-for-Renesas-SH-sh4-architecture.patch | 139 +++++++++---------
 ...readline.a-when-using-disable-static.patch |  10 +-
 .../gdb/gdb/0007-use-asm-sgidefs.h.patch      |   8 +-
 ...-Use-exorted-definitions-of-SIGRTMIN.patch |  12 +-
 .../gdb/gdb/0009-Change-order-of-CFLAGS.patch |  10 +-
 ...10-resolve-restrict-keyword-conflict.patch |   8 +-
 ...> 0011-Fix-invalid-sigprocmask-call.patch} |  20 ++-
 ...ining-TRAP_HWBKPT-before-including-g.patch |  56 -------
 .../gdb/{gdb_8.1.1.bb => gdb_8.2.bb}          |   0
 16 files changed, 135 insertions(+), 190 deletions(-)
 rename meta/recipes-devtools/gdb/{gdb-8.1.1.inc => gdb-8.2.inc} (77%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.1.1.bb => gdb-cross-canadian_8.2.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.1.1.bb => gdb-cross_8.2.bb} (100%)
 rename meta/recipes-devtools/gdb/gdb/{package_devel_gdb_patches_120-sigprocmask-invalid-call.patch => 0011-Fix-invalid-sigprocmask-call.patch} (75%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/gdb-Fix-ia64-defining-TRAP_HWBKPT-before-including-g.patch
 rename meta/recipes-devtools/gdb/{gdb_8.1.1.bb => gdb_8.2.bb} (100%)

-- 
2.18.0


