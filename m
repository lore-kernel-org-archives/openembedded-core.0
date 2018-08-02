Return-Path: <Mingli.Yu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 25F6B71A0F
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 01:18:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w721Ix6B001232
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Aug 2018 18:18:59 -0700 (PDT)
Received: from ala-lpggp2.wrs.com (147.11.105.123) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.399.0;
	Wed, 1 Aug 2018 18:18:50 -0700
From: <mingli.yu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 18:18:50 -0700
Message-ID: <20180802011850.53434-1-mingli.yu@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Subject: [PATCH] ffmpeg: Upgrade to 4.0.2
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
X-List-Received-Date: Thu, 02 Aug 2018 01:18:59 -0000
Content-Type: text/plain

From: Mingli Yu <mingli.yu@windriver.com>

Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
---
 .../ffmpeg/{ffmpeg_4.0.bb => ffmpeg_4.0.2.bb}                 | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_4.0.bb => ffmpeg_4.0.2.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
index e105ea2c00..57731e81e6 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_4.0.2.bb
@@ -26,8 +26,8 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
 SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            "
-SRC_URI[md5sum] = "1cc9e8cb027b9fd4c54f598f51002c19"
-SRC_URI[sha256sum] = "ed945daf40b124e77a685893cc025d086f638bc703183460aff49508edb3a43f"
+SRC_URI[md5sum] = "ae0bfdf809306a212b4f0e6eb8d1c75e"
+SRC_URI[sha256sum] = "a95c0cc9eb990e94031d2183f2e6e444cc61c99f6f182d1575c433d62afb2f97"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET_armv4 = "arm"
-- 
2.17.1


