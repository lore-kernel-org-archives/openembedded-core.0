Return-Path: <lizj@suika.fct.css.fujitsu.com>
Received: from fgwmail5.fujitsu.co.jp (fgwmail5.fujitsu.co.jp [192.51.44.35])
	by mail.openembedded.org (Postfix) with ESMTP id 4634D60842
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 02:02:37 +0000 (UTC)
Received: from m2.gw.fujitsu.co.jp (unknown [10.0.50.72])
	by fgwmail5.fujitsu.co.jp (Postfix) with ESMTP id 3D5F93EE1A3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:38 +0900 (JST)
Received: from smail (m2 [127.0.0.1])
	by outgoing.m2.gw.fujitsu.co.jp (Postfix) with ESMTP id 2F01445DD78
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:38 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (s2.gw.fujitsu.co.jp [10.0.50.92])
	by m2.gw.fujitsu.co.jp (Postfix) with ESMTP id 1A24845DE4D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:38 +0900 (JST)
Received: from s2.gw.fujitsu.co.jp (localhost.localdomain [127.0.0.1])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id 0E5B21DB8038
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:38 +0900 (JST)
Received: from suika.fct.css.fujitsu.com (mikan.fct.css.fujitsu.com
	[10.24.14.129])
	by s2.gw.fujitsu.co.jp (Postfix) with ESMTP id C0FB01DB802C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Sep 2013 11:02:37 +0900 (JST)
Received: by suika.fct.css.fujitsu.com (Postfix, from userid 506)
	id 5E5E9180C60; Mon, 16 Sep 2013 11:02:36 +0900 (JST)
From: Li Zhijian <lizhijian@cn.fujitsu.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 Sep 2013 11:02:33 +0900
Message-Id: <1379296954-30892-1-git-send-email-lizhijian@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH 1/2] kbd: Fix coding sytle
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
X-List-Received-Date: Mon, 16 Sep 2013 02:02:38 -0000

Signed-off-by: Li Zhijian <lizhijian@cn.fujitsu.com>
---
 meta/recipes-core/kbd/kbd_1.15.2.bb |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/kbd/kbd_1.15.2.bb b/meta/recipes-core/kbd/kbd_1.15.2.bb
index 79ea468..c5cb66a 100644
--- a/meta/recipes-core/kbd/kbd_1.15.2.bb
+++ b/meta/recipes-core/kbd/kbd_1.15.2.bb
@@ -12,7 +12,8 @@ RCONFLICTS_${PN} = "console-tools"
 
 PR = "r4"
 
-SRC_URI="${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
+SRC_URI = "${KERNELORG_MIRROR}/linux/utils/kbd/kbd-1.15.2.tar.bz2"
+
 SRC_URI[md5sum] = "e850eb91e4d3b94b194efe8e953204c5"
 SRC_URI[sha256sum] = "b3602d191eef7a6a8317fc3cd231efa40a89ac235dce57a77cac825a2a21eba6"
 
-- 
1.7.1


