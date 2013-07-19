Return-Path: <net147@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 08A176AA6F
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 06:17:23 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so3877836pdi.30
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 23:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=yqotCG0pVo1+gKcJt3qYlBNegYzftpTGm2S2SAeb+ac=;
	b=ZcrqaB33b7luhvMNhLSBpgcmcZkdJLWF/0Kjs0mCnEMEPPIZ45knkS85+G7c9e2m2x
	crlnfytxGMTh85rK2qZ1bHYZWiSjNRdPoFhXzpeukpqQpI38C7YQjMSV4Dgb1zG9mwFx
	9OQfFegzyVlgQrQMWeKO+uEN8QzQUHgt2nElkfcUc2tNboGqmsnUFPaufJs4VCygtaKa
	Glyup2ptgNySSh7ndsL26jkQEIkjQUhRzuutLGmVavj05ptM/kP+bmi+AuwLYRC+oWZO
	dPRk9/0HmWh4efLvmtDVUX9iKb4C5jiyStA7dKs3rfZlSsQxQ/vjc1aMcailThMDx0Ma
	R5vw==
X-Received: by 10.66.246.66 with SMTP id xu2mr16795005pac.134.1374214643986;
	Thu, 18 Jul 2013 23:17:23 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ue9sm20715801pab.7.2013.07.18.23.17.22
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 23:17:23 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2013 16:33:00 +1000
Message-Id: <1374215580-16784-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] mesa: use LLVM 3.3 by default
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
X-List-Received-Date: Fri, 19 Jul 2013 06:17:23 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/mesa/mesa.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index ada1170..65c2770 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -53,7 +53,7 @@ GALLIUMDRIVERS = "swrast"
 PACKAGECONFIG[gallium]      = "--with-gallium-drivers=${GALLIUMDRIVERS}, --without-gallium-drivers"
 PACKAGECONFIG[gallium-egl]  = "--enable-gallium-egl, --disable-gallium-egl"
 PACKAGECONFIG[gallium-gbm]  = "--enable-gallium-gbm, --disable-gallium-gbm"
-MESA_LLVM_RELEASE ?= "3.2"
+MESA_LLVM_RELEASE ?= "3.3"
 PACKAGECONFIG[gallium-llvm] = "--enable-gallium-llvm --with-llvm-shared-libs, --disable-gallium-llvm, llvm${MESA_LLVM_RELEASE}"
 export WANT_LLVM_RELEASE = "${MESA_LLVM_RELEASE}"
 
-- 
1.8.3.2


