Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 81C90744AE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 19:25:35 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id y10-v6so4892222pfn.8
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Aug 2018 12:25:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=n2xZ4ElATl+KGq8WZc2lypoo8oaMHpIw0yQdGOWSeWc=;
	b=hLkYuiagViyZ+EfWlve6YTkH4bCOimYtrSeAcOmx+s/Szd26KTY5dzDaxnvat4Lpcl
	XQZlZmp4iXDyrTgkE3vKUHKy5ltBHtnvgGVjUJBIgskVbpIH0Wb/D6Nb4dlBIvvJ2T4K
	lVEBBHNibY0nHhsQIFp4TgRysgMmp/8OWGqxvlkEewykYU6DkJmdukk7/C6BO1tkv39N
	TyXXfioOgUYlJbcXNx0TVWo+W1S0nW1EvKq4UZDqXE6Pt30/DwBKoQRLQb8Vy79LwO9O
	71yzk1QtqeEREetaXnawn5kpT7XP4BUcZ45a7bZE9I7GqC/wj9oboYh8qsj4Vdmo1om4
	qB8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=n2xZ4ElATl+KGq8WZc2lypoo8oaMHpIw0yQdGOWSeWc=;
	b=M1QmZ68XezHRzjpKFOOK/thPoHQu7Br68srHSyr2MR4/qhSm5xtAHJg8iUTA26PZW7
	SFbPfE/ZEEA4wgtXDZFllfR2Kkz/Cu454KvsBIVIbf8GtvLSTWVwdH9LsJYisqGrRNbg
	feHLPm0Ls4n859cNDvSX9uU/ul2r0szeQiwB6ioHeBN5Hy5bNGQ/rNZ4Sv3NAfFU0dZN
	QUgIBat/ZGttEYWQGtTUo0y3oJbhXnR7UyTwJz29aPuMKyZt082T37z4OsMVze8OiiN/
	2PoONU90KPSEZ1RoT0RXJgnksKp2Rr0bsbvCR8CW7v0rux12mp0hxAbeyHUFUSItKVFw
	vb4Q==
X-Gm-Message-State: AOUpUlHIwxiLRRlFEf9lKXfoagv2XSp5X75G02ZNtyWm5VDXb3BHOwu1
	4El3K5quAYPLxPpjXBuYguWVtlHQ
X-Google-Smtp-Source: AA+uWPz3jtEQTrhauWXm76DlXnjybs+bZ6rvFXYwJc9nPUHYnaeUhc8L+HynH43zEyHW4D02f52Z/Q==
X-Received: by 2002:a65:64d7:: with SMTP id
	t23-v6mr37994644pgv.207.1534620336258; 
	Sat, 18 Aug 2018 12:25:36 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	q5-v6sm6200811pgv.61.2018.08.18.12.25.35
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Aug 2018 12:25:35 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Aug 2018 12:25:28 -0700
Message-Id: <cover.1534620189.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH 0/6] Use llvmpile for mesa on x86/x86-64
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
X-List-Received-Date: Sat, 18 Aug 2018 19:25:35 -0000

This series fixes llvm build to support multilib configurations
Adds dos2unix bbclass to core from meta-oe
Fixes ppc security flags world builds

The following changes since commit 176e50fb177dc40e439700d5f3f838dd7eaaa427:

  runtime selftest: limit kernel hw bp arches (2018-08-16 22:40:06 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/master
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/master

Khem Raj (6):
  mesa: Enable gallium-llvm on x86 and x86_64
  powerpc: Remove pie flags from compiler cmdline
  llvm: Point llvm-config to one built with llvm-native
  dos2unix.bbclass: Move to oe-core
  llvm: Use YOCTO_ALTERNATE_MULTILIB_NAME environment variable in
    llvm-config
  mesa: Define YOCTO_ALTERNATE_MULTILIB_NAME to consider multilib names

 meta/classes/dos2unix.bbclass                 | 14 ++++++
 meta/conf/distro/include/security_flags.inc   |  7 +--
 ...-llvm-allow-env-override-of-exe-path.patch | 47 ++++++++++++++++---
 meta/recipes-devtools/llvm/llvm_git.bb        |  4 +-
 meta/recipes-graphics/cairo/cairo.inc         |  3 +-
 meta/recipes-graphics/mesa/mesa.inc           |  4 ++
 6 files changed, 65 insertions(+), 14 deletions(-)
 create mode 100644 meta/classes/dos2unix.bbclass

-- 
2.18.0


