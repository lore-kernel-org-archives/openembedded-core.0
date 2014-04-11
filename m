Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 886BE65EF2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Apr 2014 15:55:07 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP; 11 Apr 2014 08:55:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,842,1389772800"; d="scan'208";a="511542557"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by fmsmga001.fm.intel.com with ESMTP; 11 Apr 2014 08:54:47 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.160])
	by linux.intel.com (Postfix) with ESMTP id C32B26A4083;
	Fri, 11 Apr 2014 08:54:29 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 11 Apr 2014 18:54:54 +0300
Message-Id: <1397231695-19060-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] scripts/send-error-report: use the official server as the default
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
X-List-Received-Date: Fri, 11 Apr 2014 15:55:10 -0000

Now that we have an YP instance of the error report web interface [1],
that should be set as the default instead of localhost.

[1] http://git.yoctoproject.org/cgit/cgit.cgi/error-report-web/

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 8eea3cf..3734b61 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -77,4 +77,4 @@ if __name__ == '__main__':
     elif len(sys.argv) == 3:
         sendData(sys.argv[1], sys.argv[2])
     else:
-        sendData(sys.argv[1], "localhost:8000")
+        sendData(sys.argv[1], "error-report-web.yoctoproject.org")
-- 
1.9.0


