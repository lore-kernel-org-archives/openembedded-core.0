Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id E949F6011A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Nov 2015 05:32:29 +0000 (UTC)
Received: by igbxm8 with SMTP id xm8so4638144igb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Nov 2015 21:32:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=K/Pmw+Y/ANNVs4ZmeUqN135nkCteruRWbepNxFBKfz4=;
	b=uBB8a8I78spXmkqv+gsosZXSnoAEjMhnTn5f8XOWCMpDkTVVOlluo0QVyAHhQGJi/A
	PxAfBzYPBSV9rFUi6K7DsqiqG1eATGFW8QzXg5vBeAn+oCAzh6u24oOLms3400AujIWu
	V3opTjH4MTuiZfo1SHG/LFiK9h6e9vq2m3m4A0PzNmKSSOAQ/aNcUniOovsljyaIEO2T
	w8i6f53VTuHKc+xDLDCslkbHmHRtot4qj6Fls4rrlQ7rRiok8mGeMmJd0dd9NIyTwyNn
	bNPMmeXxjLKbtLPFKtJxfnt1zFg1e5BTT7ih9q7f5CUMgB4aaV3afge3wTx29txsCDex
	HTsw==
X-Received: by 10.50.78.194 with SMTP id d2mr68161igx.72.1447997549626;
	Thu, 19 Nov 2015 21:32:29 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 19sm4734514iop.42.2015.11.19.21.32.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 19 Nov 2015 21:32:28 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 19 Nov 2015 21:32:21 -0800
Message-Id: <1447997541-11466-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] libxml2: remove legacy LDFLAGS += "-ldl" workaround
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
X-List-Received-Date: Fri, 20 Nov 2015 05:32:33 -0000

libxml2 is able to find libdl.so on its own.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-core/libxml/libxml2.inc | 2 --
 1 file changed, 2 deletions(-)

diff --git a/meta/recipes-core/libxml/libxml2.inc b/meta/recipes-core/libxml/libxml2.inc
index 1c3c37d..d14aacf 100644
--- a/meta/recipes-core/libxml/libxml2.inc
+++ b/meta/recipes-core/libxml/libxml2.inc
@@ -55,8 +55,6 @@ export BUILD_SYS
 export STAGING_LIBDIR
 export STAGING_INCDIR
 
-export LDFLAGS += "-ldl"
-
 python populate_packages_prepend () {
     # autonamer would call this libxml2-2, but we don't want that
     if d.getVar('DEBIAN_NAMES', True):
-- 
1.9.1


