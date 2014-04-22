Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 2954265D75
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Apr 2014 23:49:40 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 22 Apr 2014 16:49:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,907,1389772800"; d="scan'208";a="497712245"
Received: from unknown (HELO swold-linux.bigsur.com) ([10.255.12.182])
	by orsmga001.jf.intel.com with ESMTP; 22 Apr 2014 16:49:40 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Apr 2014 16:49:28 -0700
Message-Id: <9b1d8b63b1abc2b19c567de5c29e5834efe09f8f.1398210385.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
In-Reply-To: <cover.1398210385.git.sgw@linux.intel.com>
References: <cover.1398210385.git.sgw@linux.intel.com>
Subject: [PATCH 06/10] msmtp: update to 1.4.32
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
X-List-Received-Date: Tue, 22 Apr 2014 23:49:40 -0000

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-extended/msmtp/{msmtp_1.4.31.bb => msmtp_1.4.32.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-extended/msmtp/{msmtp_1.4.31.bb => msmtp_1.4.32.bb} (82%)

diff --git a/meta/recipes-extended/msmtp/msmtp_1.4.31.bb b/meta/recipes-extended/msmtp/msmtp_1.4.32.bb
similarity index 82%
rename from meta/recipes-extended/msmtp/msmtp_1.4.31.bb
rename to meta/recipes-extended/msmtp/msmtp_1.4.32.bb
index 57942ed..1ef8547 100644
--- a/meta/recipes-extended/msmtp/msmtp_1.4.31.bb
+++ b/meta/recipes-extended/msmtp/msmtp_1.4.32.bb
@@ -12,8 +12,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 SRC_URI = "http://sourceforge.net/projects/msmtp/files/msmtp/${PV}/${BPN}-${PV}.tar.bz2 \
           "
 
-SRC_URI[md5sum] = "792ac0ffa30dc95ea1889a548128186d"
-SRC_URI[sha256sum] = "247af9a95fa22f506e85109fc4268a5d91ca03af9b17eebcc1e46b7cd64c225f"
+SRC_URI[md5sum] = "aa60e22211118f222470439cea60f795"
+SRC_URI[sha256sum] = "2bf0c5c7e78f9905f48de235a75111a1a88238793043bbeae00360b22f1a5f88"
 
 inherit gettext autotools update-alternatives
 
-- 
1.8.3.1


