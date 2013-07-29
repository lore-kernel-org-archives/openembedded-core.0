Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f43.google.com (mail-wg0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id 18B7E6B1EB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 15:42:27 +0000 (UTC)
Received: by mail-wg0-f43.google.com with SMTP id z12so5048686wgg.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2013 08:42:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=BbJ9ixtss9UW4WviipOu2FBXy49ceXF3cfMHPF0KAVA=;
	b=pS1StNb0fHUDw+XyvdxczB7/jMlI4hGeUVuBbvbSwpbhZw3jy+XQfqWt1LBVFVA4AX
	FlE+p1LCr7cu0cUqWOoX/vfG+iSBIXpgBLMRnT452eJ4zPr/QsI1netn3adf7HhHJHf5
	3Bo2+Abbgib3C5PSbHlSUFXPzk+cW1dIk7hKQDamERC3Fp7UTy+104P+SdX7ch97ToVy
	493vNeCKbWVx8wgCR7qd4Rku3iu3gzxK1B9JooK5Cz4e6/SdBuGRPB9Qfiqw5eyVhcv9
	ALFXmYPnygbJ22LUrnkoFzD+gaZwjJsFOb8ZoFFgizCVSYUHgP/ooCtei5YOxP9gnJ82
	Xypg==
X-Received: by 10.194.121.132 with SMTP id lk4mr43927638wjb.25.1375112548012; 
	Mon, 29 Jul 2013 08:42:28 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id o10sm23316552wiz.5.2013.07.29.08.42.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 29 Jul 2013 08:42:27 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jul 2013 16:42:23 +0100
Message-Id: <1375112543-27194-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
X-Gm-Message-State: ALoCoQn2LOuGXoscBglKAIkzoL5oe6IyzufoXf1WbQKlwY+fe31Id/1GC6QHtW7f+Z+aU3CDHsP2
Subject: [PATCH] qemu: remove unused SDL variable
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
X-List-Received-Date: Mon, 29 Jul 2013 15:42:29 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-devtools/qemu/qemu.inc |    4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 77045df..c43f1ef 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -13,10 +13,6 @@ BBCLASSEXTEND = "native nativesdk"
 # QEMU_TARGETS is overridable variable
 QEMU_TARGETS ?= "arm i386 mips mipsel mips64 mips64el ppc sh4 x86_64"
 
-SDL ?= ""
-SDL_class-native ?= ""
-SDL_class-nativesdk ?= ""
-
 SRC_URI = "\
     file://powerpc_rom.bin \
     file://no-strip.patch \
-- 
1.7.10.4


