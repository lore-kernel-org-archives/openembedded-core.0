Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 8E7B360DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:39 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712239"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:27 -0700
Message-Id: <db84b0123ef1434809a5752719d24959938db202.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 05/10] mc: update to 4.8.12
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:39 -0000

Remove the disable-samba since it's been renamed to vfs_smb and disabled
by default.

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/mc/{mc_4.8.10.bb => mc_4.8.12.bb} | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-extended/mc/{mc_4.8.10.bb => mc_4.8.12.bb} (92%)

diff --git a/meta/recipes-extended/mc/mc_4.8.10.bb b/meta/recipes-extended/mc/mc_4.8.12.bb
similarity index 92%
rename from meta/recipes-extended/mc/mc_4.8.10.bb
rename to meta/recipes-extended/mc/mc_4.8.12.bb
index 511771a..9a43949 100644
--- a/meta/recipes-extended/mc/mc_4.8.10.bb
+++ b/meta/recipes-extended/mc/mc_4.8.12.bb
@@ -8,12 +8,12 @@ RDEPENDS_${PN} = "ncurses-terminfo"
 
 SRC_URI = "http://www.midnight-commander.org/downloads/${BPN}-${PV}.tar.bz2"
 
-SRC_URI[md5sum] = "eb4bdc23abd4fdfa14911d53d65c8186"
-SRC_URI[sha256sum] = "5f4166fe78fbf4b42f51ed526ca7f79fea8c77d04355c2b97d4df2a6bd2a1b1a"
+SRC_URI[md5sum] = "a64c426364bfaee56b628f6c0738aade"
+SRC_URI[sha256sum] = "1054fcc27a488771cbe5b85d7c10135fa1cd1b7682a19930d44b51a023e39396"
 
 inherit autotools gettext pkgconfig
 
-EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x --without-samba"
+EXTRA_OECONF = "--with-screen=ncurses --without-gpm-mouse --without-x"
 
 FILES_${PN}-dbg += "${libexecdir}/mc/.debug/"
 
-- 
1.8.3.1


