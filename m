Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QMkRf-0005lS-Nl
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 19:22:09 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 18 May 2011 10:18:55 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="3481934"
Received: from unknown (HELO localhost) ([10.255.12.192])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2011 10:18:55 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 May 2011 10:18:31 -0700
Message-Id: <47bd913c77f1eb9dec86fbdc2cd31ae365090f00.1305738598.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
References: <a1cda1da640a96baf3d45b7d4e9577b8b74efbd3.1305738598.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305738598.git.dvhart@linux.intel.com>
References: <cover.1305738598.git.dvhart@linux.intel.com>
Subject: [PATCH 11/15] create-pull-request: do not check certificate
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
X-List-Received-Date: Wed, 18 May 2011 17:22:10 -0000

From: Otavio Salvador <otavio@ossystems.com.br>

Some remotes can use HTTPS and we don't need to check the certificate
of the host so wget call is changed to avoid it.

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/create-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 202d99d..9dbd55a 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -112,7 +112,7 @@ esac
 # Perform a sanity test on the web URL. Issue a warning if it is not
 # accessible, but do not abort as users may want to run offline.
 if [ -n "$WEB_URL" ]; then
-	wget -q $WEB_URL -O /dev/null
+	wget --no-check-certificate -q $WEB_URL -O /dev/null
 	if [ $? -ne 0 ]; then
 		echo "WARNING: Branch '$BRANCH' was not found on the contrib git tree."
 		echo "         Please check your remote and branch parameter before sending."
-- 
1.7.1



