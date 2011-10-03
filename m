Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1RAigB-0005A2-7J
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Oct 2011 15:35:35 +0200
Received: by mail-bw0-f47.google.com with SMTP id 11so5356292bke.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Oct 2011 06:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=HVT9r7EOMpLXLsOiaRW+ebpMPaG3a1gq8++GLxE69bk=;
	b=gR2Nu5LlpSHBFIb/dRlU3OGe0rwdZy4fkq776jOVhsGTrJ9opTeQ1VGjj4Bk2p7EoM
	pvVMCQoUeGjLSSUYDdW10WVj79A5zp87Hgdgb/7mM9PAs+s6ppqIdofX/s7dvi4WUGq6
	luVofn/AvXicb/ejh7m4D6YGB02iWEZy3R7Rg=
Received: by 10.204.139.68 with SMTP id d4mr9690460bku.90.1317648605171;
	Mon, 03 Oct 2011 06:30:05 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id e14sm13242395bka.0.2011.10.03.06.30.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Oct 2011 06:30:04 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  3 Oct 2011 15:28:39 +0200
Message-Id: <341e5ea902976677d9d7d70c79a22e0d264c91d6.1317648041.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
References: <5fa396a1acd9897ae22dbec57c1fb36a7a0223ac.1317648040.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1317648040.git.Martin.Jansa@gmail.com>
References: <cover.1317648040.git.Martin.Jansa@gmail.com>
Subject: [PATCHv2 08/30] xserver-xf86-dri-lite: remove old git recipe
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Oct 2011 13:35:35 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-xserver/xserver-xf86-dri-lite_git.bb      |   25 --------------------
 1 files changed, 0 insertions(+), 25 deletions(-)
 delete mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb b/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
deleted file mode 100644
index 066ff13..0000000
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-dri-lite_git.bb
+++ /dev/null
@@ -1,25 +0,0 @@
-require xserver-xf86-dri-lite.inc
-
-LIC_FILES_CHKSUM = "file://COPYING;md5=74df27b6254cc88d2799b5f4f5949c00"
-
-SRCREV = "6689e8add183835274a70ee013e5d3bc8023681f"
-PE = "1"
-PR = "r1"
-PV = "1.10+git${SRCPV}"
-
-PROTO_DEPS += "xf86driproto dri2proto"
-
-DEPENDS += "font-util"
-
-RDEPENDS_${PN} += "xkeyboard-config"
-
-SRC_URI = "git://anongit.freedesktop.org/git/xorg/xserver;protocol=git;branch=master \
-           file://crosscompile.patch; \
-           file://fix_macros1.patch;"
-
-# Misc build failure for master HEAD
-SRC_URI += "file://fix_open_max_preprocessor_error.patch;"
-
-EXTRA_OECONF += "--enable-dri --enable-dri2 --enable-dga"
-
-S = "${WORKDIR}/git"
-- 
1.7.7



