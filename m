Return-Path: <peter.kjellerstedt@axis.com>
Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
	by mail.openembedded.org (Postfix) with ESMTP id 47193731AF
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Nov 2019 10:08:15 +0000 (UTC)
IronPort-SDR: lGiQgA96qYXz4dSaRS6FL1m2RI7FYXNNTaOewSMRgiL92fjezaLAIkpEUF9ohWhu2lB1k2K8gN
	0+c80qi33liWIPcKg7zDeALAlFZimAd6rH/Y1KtmhP/KO0cgrKu6pVhb6VwpVi6VkqPR5be+JS
	pg8k+ZBYT1PnpALgb6SNk1zNh6SZdIAVNZ73000zv4bihv+C15UdtvPC2UAOiNYKvvy1bFo+QU
	G6CQL2oXK2Iok4aW97lZ6dXSHpWXD+DYYwYWktTsY5s0s2msg/I6acakRrkDz1bCwKOoGpASxm
	5Aw=
X-IronPort-AV: E=Sophos;i="5.69,241,1571695200"; 
   d="scan'208";a="2785844"
X-Axis-User: NO
X-Axis-NonUser: YES
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Nov 2019 11:08:10 +0100
Message-Id: <20191125100813.24338-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH 1/4] alsa-lib: Trim the text part used for the license file checksum
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
X-List-Received-Date: Mon, 25 Nov 2019 10:08:16 -0000
Content-Transfer-Encoding: 8bit

This avoids including irrelevant information when calculating the
license checksum.

License-Update: Trim the text part used for the license file checksum
Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb b/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
index 2c63ee7522..ba7e978dbe 100644
--- a/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
+++ b/meta/recipes-multimedia/alsa/alsa-lib_1.1.9.bb
@@ -4,7 +4,7 @@ BUGTRACKER = "http://alsa-project.org/main/index.php/Bug_Tracking"
 SECTION = "libs/multimedia"
 LICENSE = "LGPLv2.1 & GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=a916467b91076e631dd8edb7424769c7 \
-                    file://src/socket.c;md5=dd1bc7f44872690224d89c1a9806e495;beginline=1;endline=26 \
+                    file://src/socket.c;md5=285675b45e83f571c6a957fe4ab79c93;beginline=9;endline=24 \
                     "
 
 SRC_URI = "https://www.alsa-project.org/files/pub/lib/${BP}.tar.bz2"
-- 
2.21.0


