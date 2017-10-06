Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id EEF3B62134
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Oct 2017 00:50:45 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id b11so7813566pgn.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Oct 2017 17:50:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=AEeAC4SILszHMu9thtkdG14GOrHmHmeUkOCf+iZs2DI=;
	b=seZfUzfDLUHY7TeB+wp/06JW5BIgPQ9tDl3zPPDfeqhblqfh1cIwv8qGFuy7T2rCFH
	f9ZPivAKbkS08HZ2fN3mOpphCWMCLsOsJ+IWb8OCwWzNl1h1oJEDjDVYWrX9FSRfFdUY
	OD1mQNxhKpiqYaeZLRVcKELngM6YXdVRv7fXA/PJFfBlloIHJuaShEWytgwD5biOFr1h
	7ZUdAfysMtA5YwrX4Z1d5Uw2+2JBsmMyCJrQo6qp85z76sgtwb+Omd3IvUOc2+o0Q+sX
	NeXGXiYRClL6i3cysKA/UQ+vYBpooXaWazVXleqy56wKRuMmjjUqiYGzXD/Fp//YLFVx
	cEzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=AEeAC4SILszHMu9thtkdG14GOrHmHmeUkOCf+iZs2DI=;
	b=Dlt+Q7edEBdjLJ8/pjj17SoKBhqqH05cpCtz6Z5bde7IQdUrAnemuxn04OIvAk6nH+
	1otfttOp1XdYL0yaVh6nLaz9xEWXmInbnsZ7wz8xXEXeDQG4GyfwU+2yqey/vkJy0Z6T
	YoVJbSx1tQSQ4HZrpq9Rbzn6UqkXEJsafSTtUSML66RJvZ4fCREJ/DfYR4iSRgBzTuNN
	NJ/oCk0J6Jg63+BMJHX4+O4v7PfzJ0pADQ30VokHNhbF8MCyEJBLKSItVV2PfuLxvE3P
	dy4K8TpXoVwlqf+GZqJlK1SiF+iSjo26j5sjoDQfwkQQ5Xkd24dpO6ZF0mR9fODXv7pC
	VaeQ==
X-Gm-Message-State: AMCzsaW9FoeBZTiVxnbjd2iTpm+hGBBEu2t60GBRsdO3DHNmS8zH2v9v
	qbob3KBzspWOIsCgHwz3M3mimw==
X-Google-Smtp-Source: AOwi7QAALeb4alOrZ5uqutdXsREdWDJ6emqyUFPW7b28L8ggUd9KUlmwSNK8b/vg7tdszhqjCAYZmA==
X-Received: by 10.98.44.143 with SMTP id s137mr445066pfs.268.1507251046937;
	Thu, 05 Oct 2017 17:50:46 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::1f76])
	by smtp.gmail.com with ESMTPSA id y16sm289727pfl.99.2017.10.05.17.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 05 Oct 2017 17:50:45 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Oct 2017 17:50:36 -0700
Message-Id: <cover.1507250774.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.2
Subject: [PATCH 00/10] Add foundation for riscv architecture
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
X-List-Received-Date: Fri, 06 Oct 2017 00:50:46 -0000

riscv is new cool kid in town. This pull request enables
base infrastructure to support riscv32 and riscv64 profiles
full architecture and qemu port is in meta-riscv
https://github.com/kraj/meta-riscv

These changes are being rapidly upstreamed, eventually we
might have a very thin layer

The following changes since commit abf2e9526a11bcb51b71b90a7b76bd33af656494:

  systemd-serialtty: allow empty package (2017-09-26 11:07:36 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/riscv
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/riscv

Khem Raj (10):
  site: Add riscv32 and riscv64
  insane: Add entries for riscv 32bit/64bit
  siteinfo: Define data for riscv32 and riscv64
  kernel-arch.bbclass: Add riscv to kernel arch map
  runqemu: Add riscv support for qemu machines
  binutils: Convert SRC_URI and SRCREV to weak defines
  gcc: Backport fix for a segfault on riscv
  gcc-runtime: Disable libitm on riscv
  elfutils: Fix missing library on linker cmdline
  openssl: Add support for riscv32/riscv64

 meta/classes/insane.bbclass                        |  4 ++
 meta/classes/kernel-arch.bbclass                   |  3 +-
 meta/classes/siteinfo.bbclass                      |  6 +++
 meta/recipes-connectivity/openssl/openssl10.inc    |  6 +++
 .../recipes-connectivity/openssl/openssl_1.1.0f.bb |  6 +++
 meta/recipes-devtools/binutils/binutils-2.29.inc   |  5 ++-
 meta/recipes-devtools/elfutils/elfutils_0.170.bb   |  1 +
 ...0001-libasm-may-link-with-libbz2-if-found.patch | 39 +++++++++++++++++
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 ...le-non-legitimate-address-in-riscv_legiti.patch | 50 ++++++++++++++++++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc          |  2 +
 meta/site/riscv32-linux                            |  4 ++
 meta/site/riscv64-linux                            |  4 ++
 scripts/runqemu                                    |  4 ++
 14 files changed, 132 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/elfutils/files/0001-libasm-may-link-with-libbz2-if-found.patch
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/0050-RISC-V-Handle-non-legitimate-address-in-riscv_legiti.patch
 create mode 100644 meta/site/riscv32-linux
 create mode 100644 meta/site/riscv64-linux

-- 
2.14.2


