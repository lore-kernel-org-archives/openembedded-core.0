Return-Path: <jussi.kukkonen@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id CF1F576970
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Aug 2015 19:12:28 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2015 12:12:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.15,655,1432623600"; d="scan'208";a="782158010"
Received: from theory.fi.intel.com ([10.237.72.51])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2015 12:12:28 -0700
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Aug 2015 22:13:56 +0300
Message-Id: <65f10f6264c7a8d751c5d0a56a38c920e02236b2.1439318387.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1439318387.git.jussi.kukkonen@intel.com>
References: <cover.1439318387.git.jussi.kukkonen@intel.com>
Subject: [PATCH 1/4] openssh: Upgrade 6.8p1 -> 6.9p1
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
X-List-Received-Date: Tue, 11 Aug 2015 19:12:29 -0000

6.9p1 is primarily a bugfix release.

Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
---
 .../openssh/{openssh_6.8p1.bb => openssh_6.9p1.bb}                    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-connectivity/openssh/{openssh_6.8p1.bb => openssh_6.9p1.bb} (97%)

diff --git a/meta/recipes-connectivity/openssh/openssh_6.8p1.bb b/meta/recipes-connectivity/openssh/openssh_6.9p1.bb
similarity index 97%
rename from meta/recipes-connectivity/openssh/openssh_6.8p1.bb
rename to meta/recipes-connectivity/openssh/openssh_6.9p1.bb
index b00ef6f..3529c86 100644
--- a/meta/recipes-connectivity/openssh/openssh_6.8p1.bb
+++ b/meta/recipes-connectivity/openssh/openssh_6.9p1.bb
@@ -24,8 +24,8 @@ SRC_URI = "ftp://ftp.openbsd.org/pub/OpenBSD/OpenSSH/portable/openssh-${PV}.tar.
 
 PAM_SRC_URI = "file://sshd"
 
-SRC_URI[md5sum] = "08f72de6751acfbd0892b5f003922701"
-SRC_URI[sha256sum] = "3ff64ce73ee124480b5bf767b9830d7d3c03bbcb6abe716b78f0192c37ce160e"
+SRC_URI[md5sum] = "0b161c44fc31fbc6b76a6f8ae639f16f"
+SRC_URI[sha256sum] = "6e074df538f357d440be6cf93dc581a21f22d39e236f217fcd8eacbb6c896cfe"
 
 inherit useradd update-rc.d update-alternatives systemd
 
-- 
2.1.4


