Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1R0zUz-00037I-1E
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Sep 2011 19:31:49 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.68,339,1312182000"; d="scan'208";a="49562723"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.39])
	by fmsmga002.fm.intel.com with ESMTP; 06 Sep 2011 10:26:27 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  6 Sep 2011 10:26:24 -0700
Message-Id: <26c566ec509393d6a441b0bf8cca4c4b4d621767.1315329511.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
In-Reply-To: <cover.1315329511.git.sgw@linux.intel.com>
References: <cover.1315329511.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 4/5] gettext: use included libxml and libcroco
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Sep 2011 17:31:49 -0000

[YOCTO #1400]

By using the included libxml and libcroco, we do not create additional
on this core library. There was an ordering issue that when one library
was not built, but gettext detected the other library a compliation would
fail, this will force it to always use the included libraries.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-core/gettext/gettext_0.18.1.1.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-core/gettext/gettext_0.18.1.1.bb b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
index 9ec851e..2c0b2f8 100644
--- a/meta/recipes-core/gettext/gettext_0.18.1.1.bb
+++ b/meta/recipes-core/gettext/gettext_0.18.1.1.bb
@@ -5,7 +5,7 @@ SECTION = "libs"
 LICENSE = "GPLv3"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
-PR = "r2"
+PR = "r3"
 DEPENDS = "libxml2-native gettext-native virtual/libiconv ncurses expat"
 DEPENDS_virtclass-native = "libxml2-native"
 PROVIDES = "virtual/libintl virtual/gettext"
@@ -36,6 +36,8 @@ EXTRA_OECONF += "--without-lispdir \
                  --without-emacs \
                  --without-cvs \
                  --without-git \
+                 --with-included-libxml \
+                 --with-included-libcroco \
                 "
 
 acpaths = '-I ${S}/gettext-runtime/m4 \
-- 
1.7.6



