Return-Path: <drew_moseley@mentor.com>
Received: from relay1.mentorg.com (relay1.mentorg.com [192.94.38.131])
	by mail.openembedded.org (Postfix) with ESMTP id 7A97C6F877
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Mar 2014 18:18:37 +0000 (UTC)
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1WTEsv-000562-VA from drew_moseley@mentor.com 
	for openembedded-core@lists.openembedded.org;
	Thu, 27 Mar 2014 11:18:37 -0700
Received: from NA1-MAIL.mgc.mentorg.com ([147.34.98.181]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Thu, 27 Mar 2014 11:18:37 -0700
Received: from sb-ubuntu-1204-64bit.alm.mentorg.com ([134.86.97.83]) by
	NA1-MAIL.mgc.mentorg.com with Microsoft SMTPSVC(6.0.3790.3959); 
	Thu, 27 Mar 2014 11:18:37 -0700
From: Drew Moseley <drew_moseley@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 27 Mar 2014 14:18:31 -0400
Message-Id: <1395944311-12301-1-git-send-email-drew_moseley@mentor.com>
X-Mailer: git-send-email 1.7.9.5
X-OriginalArrivalTime: 27 Mar 2014 18:18:37.0587 (UTC)
	FILETIME=[F9010E30:01CF49E8]
Subject: [PATCH] zisofs-tools-native: Add missing dependency on zlib-native
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
X-List-Received-Date: Thu, 27 Mar 2014 18:18:37 -0000

Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
---
 .../zisofs-tools/zisofs-tools-native_1.0.8.bb      |    2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
index 1501307..5ea2bfb 100644
--- a/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
+++ b/meta/recipes-devtools/zisofs-tools/zisofs-tools-native_1.0.8.bb
@@ -12,6 +12,8 @@ SRC_URI = "http://pkgs.fedoraproject.org/repo/pkgs/zisofs-tools/zisofs-tools-${P
 SRC_URI[md5sum] = "2d0ed8c9a1f60b45f949b136f9be1f6c"
 SRC_URI[sha256sum] = "ae4e53e4914934d41660248fb59d3c8761f1f1fd180d5ec993c17ddb3afd04f3"
 
+DEPENDS = "zlib-native"
+
 inherit native
 
 do_install() {
-- 
1.7.9.5


