Return-Path: <mcrowe@brightsign.biz>
Received: from inbound.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 0A6FA6BA1D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 09:17:40 +0000 (UTC)
Received: from [86.30.57.232] (HELO elite.brightsigndigital.co.uk)
	by inbound.appriver.com (CommuniGate Pro SMTP 5.4.4)
	with ESMTPS id 374751895; Tue, 01 Apr 2014 05:17:40 -0400
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WUup4-00036n-JG; Tue, 01 Apr 2014 10:17:34 +0100
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WUup4-0004tj-I6; Tue, 01 Apr 2014 10:17:34 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  1 Apr 2014 10:16:15 +0100
Message-Id: <1396343775-18753-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.8.5.3
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] cmake-native: Depend on ncurses-native too
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
X-List-Received-Date: Tue, 01 Apr 2014 09:17:47 -0000

cmake detects the presence of curses automatically during configure so
cmake-native must also depend on ncurses-native to stop it being removed
from the sysroot during the build.

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
index 08b2c02..8d93b9a 100644
--- a/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake-native_2.8.12.2.bb
@@ -2,7 +2,7 @@ require cmake.inc
 inherit native
 
 # Using cmake's internal libarchive, so some dependencies are needed
-DEPENDS += "bzip2-native zlib-native"
+DEPENDS += "bzip2-native zlib-native ncurses-native"
 
 SRC_URI += "file://cmlibarchive-disable-ext2fs.patch"
 
-- 
1.8.5.3


