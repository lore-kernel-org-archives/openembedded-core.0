Return-Path: <oleg.zhurakivskyy@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id B10AD606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 13:01:40 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 12 Feb 2015 05:01:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.09,565,1418112000"; d="scan'208";a="665383328"
Received: from ozhuraki.fi.intel.com ([10.237.67.31])
	by fmsmga001.fm.intel.com with ESMTP; 12 Feb 2015 05:01:39 -0800
From: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Feb 2015 15:01:36 +0200
Message-Id: <1423746097-4198-2-git-send-email-oleg.zhurakivskyy@intel.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
References: <1423746097-4198-1-git-send-email-oleg.zhurakivskyy@intel.com>
Subject: [PATCH 1/2] libedit: Add recipe
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
X-List-Received-Date: Thu, 12 Feb 2015 13:01:40 -0000

Signed-off-by: Oleg Zhurakivskyy <oleg.zhurakivskyy@intel.com>
---
 meta/recipes-core/libedit/libedit_0.52.bb | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)
 create mode 100644 meta/recipes-core/libedit/libedit_0.52.bb

diff --git a/meta/recipes-core/libedit/libedit_0.52.bb b/meta/recipes-core/libedit/libedit_0.52.bb
new file mode 100644
index 0000000..d1b1ff5
--- /dev/null
+++ b/meta/recipes-core/libedit/libedit_0.52.bb
@@ -0,0 +1,22 @@
+SUMMARY = "Editline Library"
+
+DESCRIPTION = "Editline is a command line editor library that provides \
+generic line editing, history, and tokenization functions, similar \
+to those found in GNU Readline."
+
+HOMEPAGE = "http://thrysoee.dk/editline/"
+SECTION = "libs"
+LICENSE ="BSD-3-Clause"
+
+DEPENDS = "ncurses"
+
+LIC_FILES_CHKSUM = "file://COPYING;md5=1e4228d0c5a9093b01aeaaeae6641533 \
+	 file://src/editline/readline.h;beginline=3;endline=30;md5=e53a11ef54ae0dedee96693404b299d4"
+
+inherit autotools
+
+S = "${WORKDIR}/libedit-20141029-3.1"
+
+SRC_URI = "http://thrysoee.dk/editline/libedit-20141030-3.1.tar.gz"
+SRC_URI[md5sum] = "5f18e63346d31b877cdf36b5c59b810b"
+SRC_URI[sha256sum] = "9701e16570fb8f7fa407b506986652221b701a9dd61defc05bb7d1c61cdf5a40"
-- 
2.1.0


