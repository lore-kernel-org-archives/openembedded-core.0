Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id BB68665CCC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 15:16:45 +0000 (UTC)
Received: by pdjr16 with SMTP id r16so78774317pdj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=seDkWq0SyIj03DTHQcDHvEhN+ez+0TIFmGilV2PIbss=;
	b=zWtrgj8NT3Mx8Jau5NCUgNtVc/2QbFjYY2W7mrnePIRs+T7VmnUxBrdfI/tWWxTFh5
	sxX41Jog4CZLzIuzwFM5eCsCTRDRVMgvDu6SPNpcRVybf7wLgDd3eDc0ZnD+8lA8LiR2
	EKvMId46JrE6/6OPiMiAIid3Amm1ak9mb1BnL2vqZ9PWnw/NpiotLSTYPZd2b3KS24ME
	wpcyN5lIwAli0bb7olKsGS/0BiECoFSiZmFOmhogblJy8poxfUCf/DSFLUVHaL96l/Hk
	TSuWRSAUxs5A47UN2N3axwCr157vxpQUqxnXNQ1uyO5XlLSCIE7Wn8N+zfn1H5UykJY6
	+tHw==
X-Received: by 10.70.38.231 with SMTP id j7mr41136376pdk.146.1437232606173;
	Sat, 18 Jul 2015 08:16:46 -0700 (PDT)
Received: from bigIsland.kama-aina.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207]) by smtp.gmail.com with ESMTPSA id
	w10sm3760931pds.49.2015.07.18.08.16.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 18 Jul 2015 08:16:44 -0700 (PDT)
Received: by bigIsland.kama-aina.net (Postfix, from userid 1000)
	id 6DAE9FC12EE; Sat, 18 Jul 2015 08:16:35 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 Jul 2015 08:16:13 -0700
Message-Id: <16ba2d58bb2f540fcf37ddf4c11f715da2af07b3.1437232180.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
In-Reply-To: <cover.1437232180.git.akuster808@gmail.com>
References: <cover.1437232180.git.akuster808@gmail.com>
Subject: [PATCH 06/25] squashfs-tools: build and install unsquashfs as well
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
X-List-Received-Date: Sat, 18 Jul 2015 15:16:46 -0000

From: Martin Jansa <martin.jansa@gmail.com>

* it's useful for debugging corrupt squashfs images from mksquashfs

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
Signed-off-by: Armin Kuster <akuster@smtp.gmail.com>
---
 meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
index d36f0fe..19d555e1 100644
--- a/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
+++ b/meta/recipes-devtools/squashfs-tools/squashfs-tools_4.3.bb
@@ -27,11 +27,12 @@ SPDX_S = "${WORKDIR}/squashfs${PV}"
 EXTRA_OEMAKE = "MAKEFLAGS= LZMA_SUPPORT=1 LZMA_DIR=../.. XZ_SUPPORT=1 LZO_SUPPORT=1 LZ4_SUPPORT=1"
 
 do_compile() {
-        oe_runmake mksquashfs
+	oe_runmake mksquashfs unsquashfs
 }
 do_install () {
         install -d ${D}${sbindir}
         install -m 0755 mksquashfs ${D}${sbindir}/
+	install -m 0755 unsquashfs ${D}${sbindir}/
 }
 
 ARM_INSTRUCTION_SET = "arm"
-- 
1.9.1


