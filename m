Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f46.google.com (mail-pg0-f46.google.com [74.125.83.46])
	by mail.openembedded.org (Postfix) with ESMTP id 11F6474902
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 May 2018 06:32:00 +0000 (UTC)
Received: by mail-pg0-f46.google.com with SMTP id e1-v6so1138785pga.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 23:32:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=5BhoyWgJGIUZYq945dLtUjpfCmAeE6F+e3cKtj5h+As=;
	b=Obsc4ELpC2UnLmg2ZtcVome4ONUyUG+aUL4rHJOqQ2pndW/YQsNqtAWHLmVLlx0KdW
	xGezG2dGzUYihbp521XyBoXLi/FZHx9kKK6Y0h2WE84yRchmHVBNQ60AycQR0lRJNwFf
	C5gqpcvLBqd/pnTW+h8NFma4ucqY0bGydaLq1MgwHpgwHN/Qe9xbN6z6ulXAiWfb6GU0
	TpEOocoVuorBGgr4nIn1ps8puqYXgL4i61aWPfE0idGWBSNLlt9SOOx457kEcYJ3zU0p
	AxWngAtVp1DNLYkm5OjlWfxN/E2fXnrluBPwMY3dIed5PEYMf/85dmXJGvTV9vUlHn+J
	D7JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=5BhoyWgJGIUZYq945dLtUjpfCmAeE6F+e3cKtj5h+As=;
	b=lZ/s8oBnCav70mxmHeFdSuQJSezlMDaPrgVjRPANVSyoOFb5hOMJ7gNws4PoOEz8kZ
	JEXfm/3+vJGpHwMXsBBdBLkiXMEp8SY5vUyTaeTOOVnwUrz4hcmi00GMI2dUMfIa3D+S
	ADmjqFNeCD1RoMyjuIMnD83rWZOczGxakSM+Yl/fESTbU29Q8YP4JATHKtR6/jO5MPyG
	Wkc1MQyXVRsQRaFMMIIETR7FWreHowKtTqUGTpU+b0bHt5EgHdi3hJqiKKbZ4asI3ghK
	4VQMl6w8nRYzqBB9IyZBIwsQHJezyl9SGe6BvmU2n++2uIhUwtBt24ln5lmqRGtoYZUa
	JHXA==
X-Gm-Message-State: ALKqPweaslqQJL98Ub2tog2tJuumuFRE4d32UG3dZx3OmTf/2bw693B6
	DpFoIO+14yS5yO4qOxNy6aCK1A==
X-Google-Smtp-Source: AB8JxZq/ZGEnI+jGb8eoh/yr8+7JvguHWj2G3SUHFpAExQaYC+Unx73glxkQunUhPqYqLsywowXsfw==
X-Received: by 2002:a62:230b:: with SMTP id
	j11-v6mr18393794pfj.177.1526452321725; 
	Tue, 15 May 2018 23:32:01 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::c68])
	by smtp.gmail.com with ESMTPSA id
	i72-v6sm3027371pfe.22.2018.05.15.23.32.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 May 2018 23:32:01 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 May 2018 23:31:52 -0700
Message-Id: <cover.1526452205.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.17.0
Subject: [PATCH 0/4] gdb upgrade and misc fixes to enable gcc8
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
X-List-Received-Date: Wed, 16 May 2018 06:32:01 -0000

The following changes since commit 9611485bba03ef77ff31121e3b1da7cd57990c3e:

  patchreview: don't disable malformed SoB check (2018-05-15 10:00:33 +0100)

are available in the Git repository at:

  git://git.openembedded.org/openembedded-core-contrib kraj/pu
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=kraj/pu

Khem Raj (3):
  gdb: Upgrade to 8.1 release
  ovmf: Fix build with gcc8
  musl: Make dev package rdep on staticdev

Ross Burton (1):
  python2: Fix build with gcc8

 meta/conf/distro/include/tcmode-default.inc   |   2 +-
 meta/recipes-core/musl/musl_git.bb            |   2 +-
 ....makefile-add-Wno-stringop-truncatio.patch |  73 +++++++++
 ...ols-header.makefile-add-Wno-restrict.patch | 104 ++++++++++++
 ....makefile-revert-gcc-8-Wno-xxx-optio.patch |  55 +++++++
 ...-silence-false-stringop-overflow-war.patch |  65 ++++++++
 meta/recipes-core/ovmf/ovmf_git.bb            |   4 +
 .../gdb/{gdb-8.0.1.inc => gdb-8.1.inc}        |   5 +-
 ...ian_8.0.1.bb => gdb-cross-canadian_8.1.bb} |   0
 .../{gdb-cross_8.0.1.bb => gdb-cross_8.1.bb}  |   0
 .../0001-include-sys-types.h-for-mode_t.patch |  12 +-
 ...port-for-Renesas-SH-sh4-architecture.patch | 153 ++++++++----------
 ...0012-Unbreak-GDBserver-build-for-x32.patch | 101 ------------
 .../gdb/{gdb_8.0.1.bb => gdb_8.1.bb}          |   2 +
 .../python/python-native_2.7.14.bb            |   1 +
 .../python/python/fix-gc-alignment.patch      |  43 +++++
 meta/recipes-devtools/python/python_2.7.14.bb |   1 +
 17 files changed, 429 insertions(+), 194 deletions(-)
 create mode 100644 meta/recipes-core/ovmf/ovmf/0001-BaseTools-header.makefile-add-Wno-stringop-truncatio.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0002-BaseTools-header.makefile-add-Wno-restrict.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0003-BaseTools-header.makefile-revert-gcc-8-Wno-xxx-optio.patch
 create mode 100644 meta/recipes-core/ovmf/ovmf/0004-BaseTools-GenVtf-silence-false-stringop-overflow-war.patch
 rename meta/recipes-devtools/gdb/{gdb-8.0.1.inc => gdb-8.1.inc} (85%)
 rename meta/recipes-devtools/gdb/{gdb-cross-canadian_8.0.1.bb => gdb-cross-canadian_8.1.bb} (100%)
 rename meta/recipes-devtools/gdb/{gdb-cross_8.0.1.bb => gdb-cross_8.1.bb} (100%)
 delete mode 100644 meta/recipes-devtools/gdb/gdb/0012-Unbreak-GDBserver-build-for-x32.patch
 rename meta/recipes-devtools/gdb/{gdb_8.0.1.bb => gdb_8.1.bb} (86%)
 create mode 100644 meta/recipes-devtools/python/python/fix-gc-alignment.patch

-- 
2.17.0


