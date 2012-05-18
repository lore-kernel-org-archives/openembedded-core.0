Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SVOAc-0000XG-U1
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 16:28:43 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 18 May 2012 07:18:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="145583541"
Received: from unknown (HELO swold-mobl.amr.corp.intel.com) ([10.255.13.139])
	by orsmga002.jf.intel.com with ESMTP; 18 May 2012 07:18:23 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 18 May 2012 17:18:12 +0300
Message-Id: <aa07d4eed59c4358a6f1ede305e3e5d452b5fa3f.1337350637.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
In-Reply-To: <cover.1337350637.git.sgw@linux.intel.com>
References: <cover.1337350637.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 2/9] multilib.conf: Added multilib support for kmod.
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
X-List-Received-Date: Fri, 18 May 2012 14:28:43 -0000

From: Lianhao Lu <lianhao.lu@intel.com>

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
1.7.7.6



