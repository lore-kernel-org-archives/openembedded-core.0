Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id D00536F242
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Apr 2014 16:04:35 +0000 (UTC)
Received: from [86.30.57.232] (HELO elite.brightsigndigital.co.uk)
	by relay.appriver.com (CommuniGate Pro SMTP 6.0.8)
	with ESMTPS id 375352211; Wed, 02 Apr 2014 12:04:35 -0400
Received: from chuckie.brightsign ([172.30.1.25])
	by elite.brightsigndigital.co.uk with esmtp (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WVNeP-0008Af-Qp; Wed, 02 Apr 2014 17:04:29 +0100
Received: from mac by chuckie.brightsign with local (Exim 4.80)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1WVNeP-0003uv-Po; Wed, 02 Apr 2014 17:04:29 +0100
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  2 Apr 2014 17:04:12 +0100
Message-Id: <1396454652-15016-2-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 1.8.5.3
In-Reply-To: <1396454652-15016-1-git-send-email-mac@mcrowe.com>
References: <CAMKF1spGE3gUM3gtkJOOeWJfc_6ekOa4XP7d=1tJEaMdQr+yvQ@mail.gmail.com>
	<1396454652-15016-1-git-send-email-mac@mcrowe.com>
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH 2/2] cmake: Remove dependency on ncurses
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
X-List-Received-Date: Wed, 02 Apr 2014 16:04:36 -0000

Commit 2adc9a3f1f1db284f7d91193ad77b3524e0e0d2c stopped ccmake being built
and that is the only part of cmake that relies on curses so we might as
well stop depending on it.

(Tested with a poisoned curses.h to prove that it is unused even if
present.)

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/cmake/cmake_2.8.12.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
index 52c3b32..30ae61e 100644
--- a/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
+++ b/meta/recipes-devtools/cmake/cmake_2.8.12.2.bb
@@ -2,7 +2,7 @@ require cmake.inc
 
 inherit cmake
 
-DEPENDS += "curl expat zlib libarchive ncurses"
+DEPENDS += "curl expat zlib libarchive"
 
 SRC_URI += "file://dont-run-cross-binaries.patch"
 
-- 
1.8.5.3


