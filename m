Return-Path: <meier.dennis@siemens.com>
X-Greylist: delayed 664 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 17 Jun 2014 13:31:41 UTC
Received: from david.siemens.de (david.siemens.de [192.35.17.14])
	by mail.openembedded.org (Postfix) with ESMTP id DF0736FF60
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 13:31:41 +0000 (UTC)
Received: from mail3.siemens.de (localhost [127.0.0.1])
	by david.siemens.de (8.14.3/8.14.3) with ESMTP id s5HDKbuc010394
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jun 2014 15:20:37 +0200
Received: from localhost.localdomain ([139.16.79.180])
	by mail3.siemens.de (8.14.3/8.14.3) with ESMTP id s5HDKbZh032299;
	Tue, 17 Jun 2014 15:20:37 +0200
From: Dennis Meier <meier.dennis@siemens.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jun 2014 15:16:53 +0200
Message-Id: <1403011013-29977-1-git-send-email-meier.dennis@siemens.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] populate_sdk_base: add auto-completion in setup
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
X-List-Received-Date: Tue, 17 Jun 2014 13:31:51 -0000

Signed-off-by: Dennis Meier <meier.dennis@siemens.com>
---
 meta/classes/populate_sdk_base.bbclass |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/classes/populate_sdk_base.bbclass b/meta/classes/populate_sdk_base.bbclass
index 35d837d..1182425 100644
--- a/meta/classes/populate_sdk_base.bbclass
+++ b/meta/classes/populate_sdk_base.bbclass
@@ -173,9 +173,8 @@ if [ $verbose = 1 ] ; then
 	set -x
 fi
 
-printf "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): "
 if [ "$target_sdk_dir" = "" ]; then
-	read target_sdk_dir
+	read -e -p "Enter target directory for SDK (default: $DEFAULT_INSTALL_DIR): " target_sdk_dir
 	[ "$target_sdk_dir" = "" ] && target_sdk_dir=$DEFAULT_INSTALL_DIR
 else
 	echo "$target_sdk_dir"
-- 
1.7.10.4


