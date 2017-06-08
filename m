Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 65A5077D1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 13:19:34 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id C5E5620A47
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:19:35 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 08 Jun 2017 09:19:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:message-id
	:references:subject:to:x-me-sender:x-me-sender:x-sasl-enc
	:x-sasl-enc; s=fm1; bh=QxeM5X0Z98UOWaPTJF1u91qvLsKImqurfG6z0Nuii
	jI=; b=FJGxgamdcLnrhOzuHDgYiEdhvePzrx8vXDdmetwYNtT256rJG1TthBy+Z
	EKGOgjaoYNMbCuvLu7Kby7aPGf+FTVkBA/wOHWIHbPXeOhXPcquv6OZnhP2XIfgA
	kUhDA+hkTh6a8XReh06EIigyPPSbiFwi/K6C3c2v1MJ0k5g2IEhR5wXYHxAWVb7T
	FNpi2OfFBs8GEgsHHsnRD3z/w9hyr+V4EKkDwEGtQ9UHwVZlo9zcT5lCieAvGyMZ
	v3cQdU8OadDW9ecKio6rPvTtxdHWEMfeZfvl4IGNDfY169yjvqgPxUUkWDHAifIq
	AYZmTGEyFrrDV8HcTsbc7NYRg6yCw==
X-ME-Sender: <xms:5045WQTDFD3N_165u-soWGRydEA2gNSnmT0Hu8sPzWUlJydRbL7Ysw>
X-Sasl-enc: 6KVRtY6ufiY3lPFNb2pA5/GF5fqRF3J2mEQrmqAXdE5P 1496927975
Received: from localhost.localdomain (unknown [192.40.95.39])
	by mail.messagingengine.com (Postfix) with ESMTPA id 46C4D7E7B1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Jun 2017 09:19:35 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu,  8 Jun 2017 16:19:27 +0300
Message-Id: <c5e0170bfe88eab6fa953d64221e9a9043c7bd08.1496927857.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.1496927857.git.tanuk@iki.fi>
References: <cover.1496927857.git.tanuk@iki.fi>
Subject: [PATCH 1/3] alsa-lib: 1.1.3 -> 1.1.4.1
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
X-List-Received-Date: Thu, 08 Jun 2017 13:19:34 -0000

Changelogs:
http://alsa-project.org/main/index.php/Changes_v1.1.3_v1.1.4
http://alsa-project.org/main/index.php/Changes_v1.1.4_v1.1.4.1

Dropped backported patch 0001-ucm-parser-needs-limits.h.patch.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 .../alsa-lib/0001-ucm-parser-needs-limits.h.patch  | 33 ----------------------
 .../{alsa-lib_1.1.3.bb => alsa-lib_1.1.4.1.bb}     |  5 ++--
 2 files changed, 2 insertions(+), 36 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.3.bb => alsa-lib_1.1.4.1.bb} (87%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
deleted file mode 100644
index 4edaf4d961..0000000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-ucm-parser-needs-limits.h.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From 005ac9d2fa000912c8fb8257020a0471b1c6176c Mon Sep 17 00:00:00 2001
-From: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Date: Wed, 21 Dec 2016 19:46:34 -0300
-Subject: [PATCH] ucm: parser needs limits.h
-
-It's using PATH_MAX which is defined there, otherwise the build fails on
-musl libc.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
-
-Upstream-Status: Accepted [expected in 1.1.4]
-
-Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
----
- src/ucm/parser.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/ucm/parser.c b/src/ucm/parser.c
-index c98373a9..f520abc5 100644
---- a/src/ucm/parser.c
-+++ b/src/ucm/parser.c
-@@ -32,6 +32,7 @@
- 
- #include "ucm_local.h"
- #include <dirent.h>
-+#include <limits.h>
- 
- /** The name of the environment variable containing the UCM directory */
- #define ALSA_CONFIG_UCM_VAR "ALSA_CONFIG_UCM"
--- 
-2.11.0
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb
similarity index 87%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb
index 191a0367de..947f7d69e1 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.3.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.4.1.bb
@@ -11,10 +11,9 @@ BBCLASSEXTEND = "native nativesdk"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
-           file://0001-ucm-parser-needs-limits.h.patch \
 "
-SRC_URI[md5sum] = "eefe5992567ba00d6110a540657aaf5c"
-SRC_URI[sha256sum] = "71282502184c592c1a008e256c22ed0ba5728ca65e05273ceb480c70f515969c"
+SRC_URI[md5sum] = "29fa3e69122d3cf3e8f0e01a0cb1d183"
+SRC_URI[sha256sum] = "91bb870c14d1c7c269213285eeed874fa3d28112077db061a3af8010d0885b76"
 
 inherit autotools pkgconfig
 
-- 
2.11.0


