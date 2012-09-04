Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T90OI-00036w-Ci
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Sep 2012 23:10:34 +0200
Received: by wgbdr1 with SMTP id dr1so4848098wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Sep 2012 13:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JgTpubJ0DZUI3PvvTd29LLelrWCuP7/zf4ywn6HNPF8=;
	b=JavcbV58IbFC330O0WMpqkMzlgFEkv4yLXMiaLWy2vNwpxOD7PdfFKifx2QMeXAfP7
	Q3XhnAkpGEdNOnPC4yUdbQajIlOv/bOjrv9Pq2BJMKlSsmhQzLaowXtIs81204u+o41+
	9wT9j7c3zW2lU9X6jMvoCjzzEMzSUXdwTE1rTnc6z1/ts6ogfhcjD3dS8xwnb4ZXWvKm
	YrAh4LA0VpM2hG78tM4pxC0R76Wzq4fNg9HNgBWH3w2bhQlfEfBP6ze0+NCICbp/ZG3e
	mbJlmYyJ+a2BttEyfFVWFDVsqatubOwGEhRU5lHN9FFCIkwQoHKnZyeU3vaWv+BLxVpB
	vozA==
Received: by 10.216.136.95 with SMTP id v73mr7875682wei.2.1346792292210;
	Tue, 04 Sep 2012 13:58:12 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id r9sm39510151wia.2.2012.09.04.13.58.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 04 Sep 2012 13:58:10 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Sep 2012 22:58:36 +0200
Message-Id: <1346792317-26563-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.12
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] packagegroup-core-x11: add upgrade path from meta-oe task-x11*
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 04 Sep 2012 21:10:34 -0000

From: Paul Eggleton <paul.eggleton@linux.intel.com>

This recipe was structured in order to replace task-x11 from meta-oe,
which it hopefully can now that a runtime upgrade path is in place.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../recipes-graphics/packagegroups/packagegroup-core-x11.bb | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
index 3704521..e306c08 100644
--- a/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
+++ b/meta/recipes-graphics/packagegroups/packagegroup-core-x11.bb
@@ -3,7 +3,7 @@
 #
 
 LICENSE = "MIT"
-PR = "r36"
+PR = "r37"
 
 inherit packagegroup
 
@@ -39,3 +39,14 @@ RDEPENDS_${PN}-utils = "\
     xset \
     xrandr \
     "
+
+# Allow replacing task-x11* in meta-oe
+RPROVIDES_${PN} = "task-x11"
+RREPLACES_${PN} = "task-x11"
+RCONFLICTS_${PN} = "task-x11"
+RPROVIDES_${PN}-xserver = "task-x11-server task-xserver"
+RREPLACES_${PN}-xserver = "task-x11-server"
+RCONFLICTS_${PN}-xserver = "task-x11-server"
+RPROVIDES_${PN}-utils = "task-x11-utils"
+RREPLACES_${PN}-utils = "task-x11-utils"
+RCONFLICTS_${PN}-utils = "task-x11-utils"
-- 
1.7.12



