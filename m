Return-Path: <stefanx.stanacar@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 56F9465D59
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Apr 2014 10:34:35 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 17 Apr 2014 03:34:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,878,1389772800"; d="scan'208";a="522568099"
Received: from linux.jf.intel.com (HELO linux.intel.com) ([10.23.219.25])
	by orsmga002.jf.intel.com with ESMTP; 17 Apr 2014 03:34:36 -0700
Received: from firebird.rb.intel.com (firebird.rb.intel.com [10.237.105.38])
	by linux.intel.com (Postfix) with ESMTP id 786416A4083;
	Thu, 17 Apr 2014 03:34:18 -0700 (PDT)
From: Stefan Stanacar <stefanx.stanacar@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 17 Apr 2014 13:35:04 +0300
Message-Id: <1397730904-28866-1-git-send-email-stefanx.stanacar@intel.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH v3] scripts/send-error-report: use a real server as the default
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
X-List-Received-Date: Thu, 17 Apr 2014 10:34:36 -0000

Now that there is a public instance [1] of the error report web interface [2],
we should set it as the default.

[1] http://errors.yoctoproject.org/
[2] http://git.yoctoproject.org/cgit/cgit.cgi/error-report-web/

Signed-off-by: Stefan Stanacar <stefanx.stanacar@intel.com>
---
 scripts/send-error-report | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/send-error-report b/scripts/send-error-report
index 5e3b2a2..3d1f7a4 100755
--- a/scripts/send-error-report
+++ b/scripts/send-error-report
@@ -106,4 +106,4 @@ if __name__ == '__main__':
     elif len(sys.argv) == 3:
         sendData(sys.argv[1], sys.argv[2])
     else:
-        sendData(sys.argv[1], "localhost:8000")
+        sendData(sys.argv[1], "errors.yoctoproject.org")
-- 
1.9.0


