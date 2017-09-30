Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E07BC77B99
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Sep 2017 03:15:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v8U3FIYZ026474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Sep 2017 20:15:18 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 29 Sep 2017 20:15:17 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sat, 30 Sep 2017 11:21:01 +0800
Message-ID: <3f42742ec658e2dc0188344af046cf2c8f07585e.1506741561.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <cover.1506741561.git.Qi.Chen@windriver.com>
References: <cover.1506741561.git.Qi.Chen@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1] ffmpeg: upgrade to 3.3.4
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
X-List-Received-Date: Sat, 30 Sep 2017 03:15:17 -0000
Content-Type: text/plain

Upgrade ffmpeg to version 3.3.4. Version 3.3.4 is a bug fix version, and
there's no new feature added.

Compared to version 3.3.3, there are 57 new commits. These 57 commits are
either bug fix or small tweaks.

Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
---
 meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.3.bb => ffmpeg_3.3.4.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/ffmpeg/{ffmpeg_3.3.3.bb => ffmpeg_3.3.4.bb} (97%)

diff --git a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
similarity index 97%
rename from meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb
rename to meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
index b4de973..57e0ac0 100644
--- a/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.3.bb
+++ b/meta/recipes-multimedia/ffmpeg/ffmpeg_3.3.4.bb
@@ -27,8 +27,8 @@ SRC_URI = "https://www.ffmpeg.org/releases/${BP}.tar.xz \
            file://mips64_cpu_detection.patch \
            file://0001-build-fix-for-mips.patch \
           "
-SRC_URI[md5sum] = "743dc66ebe67180283b92d029f690d0f"
-SRC_URI[sha256sum] = "d2a9002cdc6b533b59728827186c044ad02ba64841f1b7cd6c21779875453a1e"
+SRC_URI[md5sum] = "e14a0200c78ce5c918427e57cd406a0d"
+SRC_URI[sha256sum] = "98b97e1b908dfeb6aeb6d407e5a5eacdfc253a40c2d195f5867ed2d1d46ea957"
 
 # Build fails when thumb is enabled: https://bugzilla.yoctoproject.org/show_bug.cgi?id=7717
 ARM_INSTRUCTION_SET = "arm"
-- 
1.9.1


