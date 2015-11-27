Return-Path: <mcrowe@brightsign.biz>
Received: from relay.appriver.com (relay.appriver.com [207.97.230.34])
	by mail.openembedded.org (Postfix) with ESMTP id 996C66012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Nov 2015 15:27:40 +0000 (UTC)
Received: from [86.30.112.98] (HELO elite.brightsign)
	by relay.appriver.com (CommuniGate Pro SMTP 6.1.2)
	with ESMTP id 647168443; Fri, 27 Nov 2015 10:27:40 -0500
Received: from chuckie.brightsign ([172.30.1.25] helo=chuckie)
	by elite.brightsign with esmtp (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a2Kvx-000Eit-UG; Fri, 27 Nov 2015 15:27:37 +0000
Received: from mac by chuckie with local (Exim 4.84)
	(envelope-from <mcrowe@brightsign.biz>)
	id 1a2Kvx-00088S-Rb; Fri, 27 Nov 2015 15:27:37 +0000
From: Mike Crowe <mac@mcrowe.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Nov 2015 15:27:35 +0000
Message-Id: <1448638055-30909-1-git-send-email-mac@mcrowe.com>
X-Mailer: git-send-email 2.1.4
Cc: Mike Crowe <mac@mcrowe.com>
Subject: [PATCH] orc: Upgrade 0.4.23 -> 0.4.24
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
X-List-Received-Date: Fri, 27 Nov 2015 15:27:44 -0000

Signed-off-by: Mike Crowe <mac@mcrowe.com>
---
 meta/recipes-devtools/orc/{orc_0.4.23.bb => orc_0.4.24.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/orc/{orc_0.4.23.bb => orc_0.4.24.bb} (83%)

diff --git a/meta/recipes-devtools/orc/orc_0.4.23.bb b/meta/recipes-devtools/orc/orc_0.4.24.bb
similarity index 83%
rename from meta/recipes-devtools/orc/orc_0.4.23.bb
rename to meta/recipes-devtools/orc/orc_0.4.24.bb
index d4257c3..4fa311f 100644
--- a/meta/recipes-devtools/orc/orc_0.4.23.bb
+++ b/meta/recipes-devtools/orc/orc_0.4.24.bb
@@ -4,8 +4,8 @@ LICENSE = "BSD-2-Clause & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://COPYING;md5=1400bd9d09e8af56b9ec982b3d85797e"
 
 SRC_URI = "http://gstreamer.freedesktop.org/src/orc/orc-${PV}.tar.xz;name=orc"
-SRC_URI[orc.md5sum] = "72e0612ace54d77aa2f7a006348ee81a"
-SRC_URI[orc.sha256sum] = "767eaebce2941737b43368225ec54598b3055ca78b4dc50c4092f5fcdc0bdfe7"
+SRC_URI[orc.md5sum] = "9e793ec34c0e20339659dd4bbbf62135"
+SRC_URI[orc.sha256sum] = "338cd493b5247300149821c6312bdf7422a3593ae98691fc75d7e4fe727bd39b"
 
 inherit autotools pkgconfig
 
-- 
2.1.4


