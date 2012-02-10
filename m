Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Rvlyb-0001XA-F2
	for openembedded-core@lists.openembedded.org;
	Fri, 10 Feb 2012 09:37:05 +0100
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga102.fm.intel.com with ESMTP; 10 Feb 2012 00:28:57 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="116213852"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.14.208])
	by fmsmga001.fm.intel.com with ESMTP; 10 Feb 2012 00:28:57 -0800
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2012 00:28:41 -0800
Message-Id: <3767f26c90087b8768c3333af10d846caea84614.1328862318.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.6.5
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
In-Reply-To: <cover.1328862318.git.sgw@linux.intel.com>
References: <cover.1328862318.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 06/20] powerpc64-linux: Update cached autoconf values for libpcap on powerpc64
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
X-List-Received-Date: Fri, 10 Feb 2012 08:37:05 -0000

From: Matthew McClintock <msm@freescale.com>

Without this fix, libpcap will fail to build on powerpc64

Signed-off-by: Matthew McClintock <msm@freescale.com>
---
 meta/site/powerpc64-linux |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/meta/site/powerpc64-linux b/meta/site/powerpc64-linux
index a49c717..2b147d7 100644
--- a/meta/site/powerpc64-linux
+++ b/meta/site/powerpc64-linux
@@ -31,4 +31,5 @@ screen_cv_sys_sockets_nofs=${screen_cv_sys_sockets_nofs=no}
 screen_cv_sys_sockets_usable=${screen_cv_sys_sockets_usable=yes}
 screen_cv_sys_terminfo_used=${screen_cv_sys_terminfo_used=yes}
 
-
+# libpcap
+ac_cv_linux_vers=${ac_cv_linux_vers=2}
-- 
1.7.6.5



