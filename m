Return-Path: <raj.khem@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id DF52B78F3F
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 17:23:37 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id f6-v6so5957487plo.1
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 10:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=XLZxHT/UWsq+84vZlRyFk6tme9NLFp9bP5KGpKyefxc=;
	b=SMEeYkdtF7JLY6aKOsUCPTIlAsNbOhI2Hdm+wX9FBzGd0looITyWMIaPMKZDo+wJHb
	ruWYZEWm6smGFsVqv2fPwaSFZ6hI65VKZqovxRdamvOP1xBRxtFDt+sENa87PvOeLHYp
	xd45+dJc/P7e9YEGUSnZeOpf2r2YIHJXvRZRTe/KLxrfJsBLDlp68YQFepRbooeu1c6u
	bOJq5RTkdjo1JYMiHtB1xqkuAsAbOpOvxma1uPNy3W7GjBg4f+dYGFuqH444oqd+01Sm
	aem2Ni3JrT85B4P3JnTIqtzkJ2sLaZr/SeQx2Ji4MwEX8SL0JAklEKTcvsM2Bshk3i4p
	w01A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=XLZxHT/UWsq+84vZlRyFk6tme9NLFp9bP5KGpKyefxc=;
	b=hdzwK8uAfHvj6m+OUUXSJPHYX62PCQKiHyvsGqV3/37t4P15OlSO0Jb1yUMmsxHHoO
	Zwrpru4eNZipWA9l3ziozPUvtQCu0Nqb+mZhGFPLqkQaAfL1NnN8m9U93jDA0u6SC+T9
	grTRYFAkGFx65e7NIoFQGn9Ofpa+M/fRL6EujT7eU4Wdfnn2KoDiYx1Kj5WKBJNq3ais
	JeFcEsaLwMMrYB3bFjmAL3Jyuh4RQRJavzksoYWOug8N9+i6ZgsPcDSF4yH4SxOtVjVF
	LGJvxekpt1cZKt66hM1f+rkkROHfZjNk5rNQ0PuZzfT8ljpgp/iPQDDSLCgw7r1Ari/r
	v1eA==
X-Gm-Message-State: AOUpUlEC2qdDZbHqdCNOV6UxhVIHrR5iUZ0stKoABsUURAX1uNAVb9zT
	ZbJfMovWl+gA/AUrrsqk8DJSWRqm
X-Google-Smtp-Source: AA+uWPwi5A+W783ZNMEpDjW8ghVis/gDoRdC0qcFhE9CLgPvKERucLiHOXd4RgJ1VEguSmivU5HXtQ==
X-Received: by 2002:a17:902:ab94:: with SMTP id
	f20-v6mr41976223plr.231.1534699418606; 
	Sun, 19 Aug 2018 10:23:38 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	o21-v6sm11208349pfa.54.2018.08.19.10.23.37
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 19 Aug 2018 10:23:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 19 Aug 2018 10:23:29 -0700
Message-Id: <cover.1534699224.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2 0/9] Use llvmpile for mesa on x86/x86-64
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
X-List-Received-Date: Sun, 19 Aug 2018 17:23:38 -0000

This series fixes llvm build to support multilib configurations
Adds dos2unix bbclass to core from meta-oe
Fixes ppc security flags world builds

v2:
Upgrade binutils and gdb
Fix libidb2 cross build issue when build host == target host

The following changes since commit 007ef1f468110b2698a27ea9a6d43fed5a0a9fc2:

  kernel-devsrc: restructure for out of tree (and on target) module builds (2018-08-19 16:33:41 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/master
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/master

Khem Raj (9):
  mesa: Enable gallium-llvm on x86 and x86_64
  powerpc: Remove pie flags from compiler cmdline
  llvm: Point llvm-config to one built with llvm-native
  dos2unix.bbclass: Move to oe-core
  llvm: Use YOCTO_ALTERNATE_MULTILIB_NAME environment variable in
    llvm-config
  mesa: Define YOCTO_ALTERNATE_MULTILIB_NAME to consider multilib names
  binutils: Update past 2.31.1 release
  gdb: Upgrade to 8.1.1
  libidn2: Fix libunistring detection

 meta/classes/dos2unix.bbclass                 | 14 ++++++
 meta/conf/distro/include/security_flags.inc   |  7 +--
 .../binutils/binutils-2.31.inc                |  2 +-
 .../gdb/{gdb-8.1.inc => gdb-8.1.1.inc}        |  4 +-
 ...ian_8.1.bb => gdb-cross-canadian_8.1.1.bb} |  0
 .../{gdb-cross_8.1.bb => gdb-cross_8.1.1.bb}  |  0
 .../gdb/{gdb_8.1.bb => gdb_8.1.1.bb}          |  0
 ...-llvm-allow-env-override-of-exe-path.patch | 47 ++++++++++++++++---
 meta/recipes-devtools/llvm/llvm_git.bb        |  4 +-
 meta/recipes-extended/libidn/libidn2_2.0.5.bb |  4 ++
 meta/recipes-graphics/cairo/cairo.inc         |  3 +-
 meta/recipes-graphics/mesa/mesa.inc           |  4 ++
 12 files changed, 72 insertions(+), 17 deletions(-)
 create mode 100644 meta/classes/dos2unix.bbclass
 rename meta/recipes-devtools/gdb/{gdb-8.1.inc => gdb-8.1.1.inc} (89%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.1.bb => gdb-cross-canadian_8.1.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.1.bb => gdb-cross_8.1.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb_8.1.bb => gdb_8.1.1.bb} (100%)

-- 
2.18.0


