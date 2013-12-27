Return-Path: <kmsywula@ecsmtp.ir.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AD4D260D8A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Dec 2013 17:30:42 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 27 Dec 2013 09:26:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.95,561,1384329600"; d="scan'208";a="458478448"
Received: from irvmail001.ir.intel.com ([163.33.26.43])
	by orsmga002.jf.intel.com with ESMTP; 27 Dec 2013 09:30:42 -0800
Received: from irsswdev001.ir.intel.com (irsswdev001.ir.intel.com
	[163.33.195.157])
	by irvmail001.ir.intel.com (8.14.3/8.13.6/MailSET/Hub) with ESMTP id
	rBRHUfIB018788; Fri, 27 Dec 2013 17:30:41 GMT
Received: from irsswdev001.ir.intel.com (localhost [127.0.0.1])
	by irsswdev001.ir.intel.com with ESMTP id rBRHUfeC028279;
	Fri, 27 Dec 2013 17:30:41 GMT
Received: (from kmsywula@localhost)
	by irsswdev001.ir.intel.com with œ id rBRHUfVv028275;
	Fri, 27 Dec 2013 17:30:41 GMT
From: krzysztof.m.sywula@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Dec 2013 17:30:34 +0000
Message-Id: <1388165434-28242-1-git-send-email-krzysztof.m.sywula@intel.com>
X-Mailer: git-send-email 1.7.12.2
Subject: [PATCH] Adding irssi 0.8.16-rc1 recipe
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
X-List-Received-Date: Fri, 27 Dec 2013 17:30:43 -0000

From: Krzysztof Sywula <krzysztof.m.sywula@intel.com>

---
 meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb

diff --git a/meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb b/meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
new file mode 100644
index 0000000..478db18
--- /dev/null
+++ b/meta/recipes-connectivity/irssi/irssi_0.8.16-rc1.bb
@@ -0,0 +1,11 @@
+DESCRIPTION = "Irssi is ncurses IRC client"
+LICENSE = "GPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=55fdc1113306167d6ea2561404ce02f8"
+
+SRC_URI = "http://irssi.org/files/irssi-0.8.16-rc1.tar.gz"
+
+SRC_URI[md5sum] = "769fec4df8e633c583c411ccd2cd563a"
+SRC_URI[sha256sum] = "bb6c0125db30b697f80837941c17372b7484c64d57a6920b8bfa7ee3def92de3"
+
+DEPENDS = "glib-2.0 ncurses"
+inherit autotools
-- 
1.7.12.2


