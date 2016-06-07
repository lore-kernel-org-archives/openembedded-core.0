Return-Path: <jussi.kukkonen@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id F17547713A
	for <openembedded-core@lists.openembedded.org>;
	Tue,  7 Jun 2016 08:48:33 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP; 07 Jun 2016 01:48:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,432,1459839600"; d="scan'208";a="823174541"
Received: from theory.fi.intel.com ([10.237.72.196])
	by orsmga003.jf.intel.com with ESMTP; 07 Jun 2016 01:48:23 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  7 Jun 2016 11:47:39 +0300
Message-Id: <e35725aa589ac7ce98ec4ad7f6d0fb26a2611f37.1465288175.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
References: <7e2909e70b87ffcf2c752bd6ac326ef256bdc1b2.1465288175.git.jussi.kukkonen@intel.com>
In-Reply-To: <cover.1465288174.git.jussi.kukkonen@intel.com>
References: <cover.1465288174.git.jussi.kukkonen@intel.com>
Subject: [PATCH 21/37] gtk-immodules-cache: Support both GTKs at same time
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
X-List-Received-Date: Tue, 07 Jun 2016 08:48:34 -0000

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 meta/classes/gtk-immodules-cache.bbclass | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/classes/gtk-immodules-cache.bbclass b/meta/classes/gtk-immodules-cache.bbclass
index c099cd3..3a4634c 100644
--- a/meta/classes/gtk-immodules-cache.bbclass
+++ b/meta/classes/gtk-immodules-cache.bbclass
@@ -15,7 +15,8 @@ if [ "x$D" != "x" ]; then
             ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-2.0')} \
                 $IMFILES > $D${libdir}/gtk-2.0/2.10.0/immodules.cache 2>/dev/null &&
                 sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
-        elif [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
+        fi
+        if [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
             IMFILES=$(ls $D${libdir}/gtk-3.0/*/immodules/*.so)
             ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-3.0')} \
                 $IMFILES > $D${libdir}/gtk-3.0/3.0.0/immodules.cache 2>/dev/null &&
@@ -40,7 +41,8 @@ if [ "x$D" != "x" ]; then
             ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-2.0')} \
                 $IMFILES > $D${libdir}/gtk-2.0/2.10.0/immodules.cache 2>/dev/null &&
                 sed -i -e "s:$D::" $D${libdir}/gtk-2.0/2.10.0/immodules.cache
-        elif [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
+        fi
+        if [ -x $D${bindir}/gtk-query-immodules-3.0 ]; then
             IMFILES=$(ls $D${libdir}/gtk-3.0/*/immodules/*.so)
             ${@qemu_run_binary(d, '$D', '${bindir}/gtk-query-immodules-3.0')} \
                 $IMFILES > $D${libdir}/gtk-3.0/3.0.0/immodules.cache 2>/dev/null &&
-- 
2.1.4


