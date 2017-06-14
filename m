Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com
	[209.85.192.175])
	by mail.openembedded.org (Postfix) with ESMTP id 9CED4783A6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 15:23:43 +0000 (UTC)
Received: by mail-pf0-f175.google.com with SMTP id l89so1851280pfi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Jun 2017 08:23:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Ctq5UgEmecwvr4R7WbvxFafUEqan5yfhTGC5/XMmMVc=;
	b=RGMV3tWnmYOd5PkfQRu299pT9+A0LFmZ2ksgMWXHEUBelogbM7d600CjXG8rIqgGYw
	uMfNexLcBbRd2/lZ6EEBoaKqoDntAoawISG9/4zkoxIJu/eEPTZOQrQfqOpU+9/H7noF
	VE+FaDuNzpalNS6bjmbryZEcRuRWSswOMoc8ct2FKMvA5aoG8DFytRc+nGa17cT0rSe2
	NYHEGanIgmsYxEj7TOdhaVXw+YXAuWJLFFk3o81Lld8PwhSNFHJibyPmp/TJ4V04EwPn
	Nnbne3V0Q3qesfRhNjnbR4pIOubNzli/TkIrXJ8xj8xsQo5EDm6TqWVLCmhPKKT+qlD2
	sfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Ctq5UgEmecwvr4R7WbvxFafUEqan5yfhTGC5/XMmMVc=;
	b=aYfeDkPeT53zs5gnhUCTomWimrWIcXkAqfg959XqPjQJaoQzLPKGTBdqu4uThdSo2u
	QBm+0hvj6o+YSglm6lzjvDm7skB179bqzKQ9DwDaInt8YxbX+LhHvyPD7waqQL3/mzyH
	ckDoXTNvxIrvCKsFVp8iQircdNME5uGRWnGfwNWJd3oUZ28mz/T3QpLXC3ZoYz+SWzdG
	bJTvW5MxGqXQOygFwAIHGaEd3jhMeH3v4DdiH1D3ZE8qZ7RZ6rarYqk/taYnRuMJHLAu
	2RmVb5Yw9i8W5WJeruc74Km0BpFYmS5AwvcLnmcTAwLzHVlfXY8JdVB4YH+HRD3NHh2k
	gSjQ==
X-Gm-Message-State: AKS2vOyEsMFypAlNCTqJDuuGhjMzAo+wYRKUj86H1FNOa8GSn6mTR2bP
	cd0VmFF1d/OBvIRi
X-Received: by 10.84.233.130 with SMTP id l2mr694891plk.212.1497453824530;
	Wed, 14 Jun 2017 08:23:44 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::264a])
	by smtp.gmail.com with ESMTPSA id i2sm502948pfe.89.2017.06.14.08.23.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 14 Jun 2017 08:23:43 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 14 Jun 2017 08:23:23 -0700
Message-Id: <332b26d3b81ceb83fe3d6eda1a0476ad80156808.1497453168.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.1
In-Reply-To: <cover.1497453168.git.raj.khem@gmail.com>
References: <cover.1497453168.git.raj.khem@gmail.com>
Subject: [PATCH 04/10] ffmpeg: Upgrade to 3.3.2 stable
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
X-List-Received-Date: Wed, 14 Jun 2017 15:23:43 -0000

* Fix mips/mips64 along the way, it was broken in 3.3 as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../ffmpeg/ffmpeg/0001-build-fix-for-mips.patch    | 44 ++++++++++++++++++++++
 .../ffmpeg/{ffmpeg_3.3.bb => ffmpeg_3.3.2.bb}      |  5 ++-
 2 files changed, 47 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.bb => ffmpeg_3.3.2.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
new file mode 100644
index 0000000000..3f8224aa07
--- /dev/null
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg/0001-build-fix-for-mips.patch
@@ -0,0 +1,44 @@
+From f34c567045bea5a7ded9bcfa8e785cfd24cc7dde Mon Sep 17 00:00:00 2001
+From: Shivraj Patil <shivraj.patil@imgtec.com>
+Date: Tue, 4 Apr 2017 18:56:01 +0530
+Subject: [PATCH] build fix for mips
+
+Signed-off-by: Shivraj Patil <shivraj.patil@imgtec.com>
+Signed-off-by: Ronald S. Bultje <rsbultje@gmail.com>
+---
+Upstream-Status: Backport
+
+ libavcodec/mips/hevcpred_init_mips.c | 3 ++-
+ libavcodec/mips/hevcpred_msa.c       | 2 +-
+ 2 files changed, 3 insertions(+), 2 deletions(-)
+
+diff --git a/libavcodec/mips/hevcpred_init_mips.c b/libavcodec/mips/hevcpred_init_mips.c
+index 331cfac115..e987698d66 100644
+--- a/libavcodec/mips/hevcpred_init_mips.c
++++ b/libavcodec/mips/hevcpred_init_mips.c
+@@ -18,7 +18,8 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+-#include "libavcodec/hevc.h"
++#include "config.h"
++#include "libavutil/attributes.h"
+ #include "libavcodec/mips/hevcpred_mips.h"
+ 
+ #if HAVE_MSA
+diff --git a/libavcodec/mips/hevcpred_msa.c b/libavcodec/mips/hevcpred_msa.c
+index 6a3b2815fd..963c64c861 100644
+--- a/libavcodec/mips/hevcpred_msa.c
++++ b/libavcodec/mips/hevcpred_msa.c
+@@ -18,7 +18,7 @@
+  * Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+  */
+ 
+-#include "libavcodec/hevc.h"
++#include "libavcodec/hevcdec.h"
+ #include "libavutil/mips/generic_macros_msa.h"
+ #include "hevcpred_mips.h"
+ 
+-- 
+2.13.1
+
diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
index c2b570e85c..f4bb2ba1f5 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.2.bb
@@ -25,9 +25,10 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
+           file://0001-build-fix-for-mips.patch \
           "
-SRC_URI[md5sum] = "368f1fff4bdadaf2823934cc0aadd71d"
-SRC_URI[sha256sum] = "599e7f7c017221c22011c4037b88bdcd1c47cd40c1e466838bc3c465f3e9569d"
+SRC_URI[md5sum] = "d6c09c84e3d0d9ca8a51f481da660603"
+SRC_URI[sha256sum] = "1998de1ab32616cbf2ff86efc3f1f26e76805ec5dc51e24c041c79edd8262785"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
2.13.1


