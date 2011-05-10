Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QJfVH-0001SZ-UT
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 07:29:04 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 May 2011 22:26:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.64,345,1301900400"; d="scan'208";a="744876591"
Received: from unknown (HELO localhost) ([10.255.12.75])
	by orsmga001.jf.intel.com with ESMTP; 09 May 2011 22:26:20 -0700
Message-Id: <c39772b4f91de2286b4dbbc46c5fc39e2a6b5933.1305004776.git.sgw@linux.intel.com>
In-Reply-To: <cover.1305004776.git.sgw@linux.intel.com>
References: <cover.1305004776.git.sgw@linux.intel.com>
Old-Date: Mon, 2 May 2011 19:09:14 +0000
Date: Mon, 09 May 2011 22:26:20 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 14/30] scripts/oe-setup-builddir: fix typo
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
X-List-Received-Date: Tue, 10 May 2011 05:29:04 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
 scripts/oe-setup-builddir |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/oe-setup-builddir b/scripts/oe-setup-builddir
index 2f8a064..7fefc52 100755
--- a/scripts/oe-setup-builddir
+++ b/scripts/oe-setup-builddir
@@ -60,7 +60,7 @@ if [ "x" = "x$OECORELOCALCONF" ]; then
 fi
 if ! (test -r "$BUILDDIR/conf/local.conf"); then
 cat <<EOM
-You had no conf/local.conf file. This configuration file has therefore beend 
+You had no conf/local.conf file. This configuration file has therefore been
 created for you with some default values. You may wish to edit it to use a 
 different MACHINE (target hardware) or enable parallel build options to take 
 advantage of multiple cores for example. See the file for more information as 
-- 
1.7.1.1



