Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <constantinx.musca@intel.com>) id 1U0D6N-0008N8-41
	for openembedded-core@lists.openembedded.org;
	Tue, 29 Jan 2013 16:28:02 +0100
Received: from azsmga002.ch.intel.com ([10.2.17.35])
	by azsmga101.ch.intel.com with ESMTP; 29 Jan 2013 07:12:11 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.84,561,1355126400"; d="scan'208";a="196280520"
Received: from costin-desktop (HELO localhost.localdomain) ([10.237.105.152])
	by AZSMGA002.ch.intel.com with ESMTP; 29 Jan 2013 07:11:45 -0800
From: Constantin Musca <constantinx.musca@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 Jan 2013 17:12:35 +0200
Message-Id: <5d57cc606c52cd59a33fc4d495267be8bb2692fa.1359470548.git.constantinx.musca@intel.com>
X-Mailer: git-send-email 1.7.11.7
In-Reply-To: <cover.1359470548.git.constantinx.musca@intel.com>
References: <cover.1359470548.git.constantinx.musca@intel.com>
In-Reply-To: <cover.1359470548.git.constantinx.musca@intel.com>
References: <cover.1359470548.git.constantinx.musca@intel.com>
Subject: [PATCH v4 2/3] multilib.conf: add TARGET_ARCH & TARGET_SYS to MULTILIB_SAVE_VARNAME
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 Jan 2013 15:28:05 -0000

Signed-off-by: Constantin Musca <constantinx.musca@intel.com>
---
 meta/conf/multilib.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index 97b53ec..8f03661 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -2,7 +2,7 @@
 baselib = "${@d.getVar('BASE_LIB_tune-' + (d.getVar('DEFAULTTUNE', True) or 'INVALID'), True) or 'lib'}"
 
 MULTILIB_VARIANTS = "${@extend_variants(d,'MULTILIBS','multilib')}"
-MULTILIB_SAVE_VARNAME = "DEFAULTTUNE"
+MULTILIB_SAVE_VARNAME = "DEFAULTTUNE TARGET_ARCH TARGET_SYS"
 
 MULTILIBS ??= "multilib:lib32"
 
-- 
1.7.11.7



