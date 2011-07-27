Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QlyuT-00028m-8R
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Jul 2011 09:52:06 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 27 Jul 2011 00:47:34 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,275,1309762800"; d="scan'208";a="31949365"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.14.61])
	by azsmga001.ch.intel.com with ESMTP; 27 Jul 2011 00:47:34 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 27 Jul 2011 00:47:15 -0700
Message-Id: <80b7d3ce0caf3c83f174cbe5339e7df3120ac637.1311752531.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
In-Reply-To: <cover.1311752531.git.sgw@linux.intel.com>
References: <cover.1311752531.git.sgw@linux.intel.com>
Subject: [Consolidated & Tested 25/35] x86_64-linux siteinfo: Add bash info
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
X-List-Received-Date: Wed, 27 Jul 2011 07:52:07 -0000

From: Tom Rini <tom_rini@mentor.com>

Taken from oe.dev

Signed-off-by: Tom Rini <tom_rini@mentor.com>
---
 meta/site/x86_64-linux |    5 +++++
 1 files changed, 5 insertions(+), 0 deletions(-)

diff --git a/meta/site/x86_64-linux b/meta/site/x86_64-linux
index ba6e57c..076e5b6 100644
--- a/meta/site/x86_64-linux
+++ b/meta/site/x86_64-linux
@@ -89,6 +89,11 @@ ac_cv_lib_m_sin=${ac_cv_lib_m_sin=yes}
 
 #orbit
 libIDL_cv_long_long_format=ll
+
+# bash
+bash_cv_func_sigsetjmp=${bash_cv_func_sigsetjmp=present}
+
+# ORBit2
 ac_cv_alignof_CORBA_boolean=1
 ac_cv_alignof_CORBA_char=1
 ac_cv_alignof_CORBA_double=8
-- 
1.7.3.4



