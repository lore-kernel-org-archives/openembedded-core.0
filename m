Return-Path: <tanuk@iki.fi>
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com
	[66.111.4.26])
	by mail.openembedded.org (Postfix) with ESMTP id 1AA7B7712D
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 17:02:23 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.nyi.internal (Postfix) with ESMTP id 4BB2A20D67
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:11 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute1.internal (MEProxy); Mon, 06 Jun 2016 12:56:11 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=date:from:in-reply-to:in-reply-to
	:message-id:references:references:subject:to:x-sasl-enc
	:x-sasl-enc; s=smtpout; bh=yr8Lpp3j/pxUA2KFPMT2qS/I1hU=; b=QdJEb
	pGNFAAKIN8h1GLQIYwh6BF5Yj3PAgqZ2kkS0gt2UPL5ATIWs0HTXNApgMGHkFJod
	NA2KCWyyQVvk/9WtLepZV6NIvRpCCr2ETZItrF2BJOL1WcusXQyAs22e34rGpjz4
	6XmvyMnHxPB/zY/tD8d3MBGPXiH3jG67w7M6ig=
X-Sasl-enc: wzKQbnSajVn7JJTfC3zVuKv5RUyxjNRNJWaUMhLgVgDh 1465232170
Received: from laptop.tanuk.dy.fi (a88-113-211-72.elisa-laajakaista.fi
	[88.113.211.72])
	by mail.messagingengine.com (Postfix) with ESMTPA id C5A4AF2022
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Jun 2016 12:56:10 -0400 (EDT)
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Mon,  6 Jun 2016 19:55:56 +0300
Message-Id: <158145930b713fb1a58e47bab8f9b9565aec3bb5.1465231939.git.tanuk@iki.fi>
X-Mailer: git-send-email 2.8.1
In-Reply-To: <cover.1465231939.git.tanuk@iki.fi>
References: <cover.1465231939.git.tanuk@iki.fi>
In-Reply-To: <cover.1465231939.git.tanuk@iki.fi>
References: <cover.1465231939.git.tanuk@iki.fi>
Subject: [PATCH 2/4] alsa-lib: 1.1.0 -> 1.1.1
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
X-List-Received-Date: Mon, 06 Jun 2016 17:02:24 -0000

Release notes:
http://alsa-project.org/main/index.php/Changes_v1.1.0_v1.1.1

Dropped upstreamed patch
0001-topology-Add-missing-include-sys-stat.h.patch.

Updated "Upstream-Status" of accepted patch
0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch.

Rebased avoid-including-sys-poll.h-directly.patch.

Signed-off-by: Tanu Kaskinen <tanuk@iki.fi>
---
 ...fix-appl-pointer-not-correct-when-mmap_co.patch |  2 +-
 ...1-topology-Add-missing-include-sys-stat.h.patch | 35 ----------------------
 .../avoid-including-sys-poll.h-directly.patch      |  2 +-
 .../alsa/{alsa-lib_1.1.0.bb => alsa-lib_1.1.1.bb}  |  5 ++--
 4 files changed, 4 insertions(+), 40 deletions(-)
 delete mode 100644 meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch
 rename meta/recipes-multimedia/alsa/{alsa-lib_1.1.0.bb => alsa-lib_1.1.1.bb} (89%)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
index 9fd69f3..bb2f82b 100755
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
+++ b/meta/recipes-multimedia/alsa/alsa-lib/0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch
@@ -9,7 +9,7 @@ which cause the avail_update()'s result wrong.
 This patch move the snd_pcm_mmap_appl_forward() to the place when
 snd_pcm_mmap_commit() is successfully returned.
 
-Upstream-Status: Submitted [https://patchwork.kernel.org/patch/8760881/]
+Upstream-Status: Accepted [expected in 1.1.2]
 
 Signed-off-by: Shengjiu Wang <shengjiu.wang@freescale.com>
 Signed-off-by: Takashi Iwai <tiwai@suse.de>
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch b/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch
deleted file mode 100644
index 0ead0cd..0000000
--- a/meta/recipes-multimedia/alsa/alsa-lib/0001-topology-Add-missing-include-sys-stat.h.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 3f1dba9a821b53b42001605f9a126a958804884f Mon Sep 17 00:00:00 2001
-From: Takashi Iwai <tiwai@suse.de>
-Date: Mon, 9 Nov 2015 13:37:26 +0100
-Subject: [PATCH] topology: Add missing include sys/stat.h
-
-Necessary for proper definitions of S_IRUSR & co. Otherwise it
-results in compile errors with old glibc and uclibc:
-  parser.c: In function 'snd_tplg_build_file':
-  parser.c:262: error: 'S_IRUSR' undeclared (first use in this function)
-  parser.c:262: error: (Each undeclared identifier is reported only once
-  parser.c:262: error: for each function it appears in.)
-
-Upstream-Status: Backport
-
-Signed-off-by: Takashi Iwai <tiwai@suse.de>
-Signed-off-by: Maxin B. John <maxin.john@intel.com>
----
- src/topology/parser.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/topology/parser.c b/src/topology/parser.c
-index 80a0ae0..18bb9c7 100644
---- a/src/topology/parser.c
-+++ b/src/topology/parser.c
-@@ -16,6 +16,7 @@
-            Liam Girdwood <liam.r.girdwood@linux.intel.com>
- */
- 
-+#include <sys/stat.h>
- #include "list.h"
- #include "tplg_local.h"
- 
--- 
-2.4.0
-
diff --git a/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch b/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
index 161619b..b8b1cb6 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
+++ b/meta/recipes-multimedia/alsa/alsa-lib/avoid-including-sys-poll.h-directly.patch
@@ -73,7 +73,7 @@ index b429f5d..e05898f 100644
 +#include <poll.h>
  #include <sys/types.h>
  #include <errno.h>
- #include <linux/types.h>
+ #if defined(__linux__)
 diff --git a/src/control/control.c b/src/control/control.c
 index 4a28cf6..071c5db 100644
 --- a/src/control/control.c
diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.1.bb
similarity index 89%
rename from meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
rename to meta/recipes-multimedia/alsa/alsa-lib_1.1.1.bb
index cff3d01..4fb7cca 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.0.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.1.bb
@@ -17,11 +17,10 @@ ARM_INSTRUCTION_SET = "arm"
 SRC_URI = "ftp://ftp.alsa-project.org/pub/lib/${BP}.tar.bz2 \
            file://Check-if-wordexp-function-is-supported.patch \
            file://avoid-including-sys-poll.h-directly.patch \
-           file://0001-topology-Add-missing-include-sys-stat.h.patch \
            file://0001-pcm_plugin-fix-appl-pointer-not-correct-when-mmap_co.patch \
 "
-SRC_URI[md5sum] = "69515ca73c3c4a212ef45160dea846c1"
-SRC_URI[sha256sum] = "dfde65d11e82b68f82e562ab6228c1fb7c78854345d3c57e2c68a9dd3dae1f15"
+SRC_URI[md5sum] = "881060d2c568f7f49db82c58df2f9ddc"
+SRC_URI[sha256sum] = "8ac76c3144ed2ed49da7622ab65ac5415205913ccbedde877972383cbc234269"
 
 inherit autotools pkgconfig
 
-- 
2.8.1


