Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <lianhao.lu@intel.com>) id 1SUx95-0006NU-SF
	for openembedded-core@lists.openembedded.org;
	Thu, 17 May 2012 11:37:20 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 17 May 2012 02:27:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="167517748"
Received: from llu-piketon.sh.intel.com (HELO localhost) ([10.239.36.120])
	by fmsmga002.fm.intel.com with ESMTP; 17 May 2012 02:27:18 -0700
From: Lianhao Lu <lianhao.lu@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 May 2012 17:25:07 +0800
Message-Id: <97eed2b1a205de3e92d1a84471c34457b6482025.1337246557.git.lianhao.lu@intel.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <932f6592281b43603354b0b41ff4e292548190c7.1337246557.git.lianhao.lu@intel.com>
References: <932f6592281b43603354b0b41ff4e292548190c7.1337246557.git.lianhao.lu@intel.com>
In-Reply-To: <cover.1337246557.git.lianhao.lu@intel.com>
References: <cover.1337246557.git.lianhao.lu@intel.com>
Subject: [PATCH 2/3] multilib.conf: Added multilib support for kmod.
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
X-List-Received-Date: Thu, 17 May 2012 09:37:20 -0000

Signed-off-by: Lianhao Lu <lianhao.lu@intel.com>
---
 meta/conf/multilib.conf |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/meta/conf/multilib.conf b/meta/conf/multilib.conf
index f60a890..9fc5a90 100644
--- a/meta/conf/multilib.conf
+++ b/meta/conf/multilib.conf
@@ -470,6 +470,7 @@ BBCLASSEXTEND_append_pn-mktemp = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-mobile-broadband-provider-info = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-module-init-tools-cross = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-module-init-tools = " ${MULTILIBS}"
+BBCLASSEXTEND_append_pn-kmod = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-modutils-initscripts = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-mpeg2dec = " ${MULTILIBS}"
 BBCLASSEXTEND_append_pn-mpfr = " ${MULTILIBS}"
-- 
1.7.0.4



