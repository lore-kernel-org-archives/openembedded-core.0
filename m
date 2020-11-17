Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by mx.groups.io with SMTP id smtpd.web11.9634.1605627379456851254
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:36:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: intel.com, ip: 134.134.136.126, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: WLJfvaR6y85EYbcUCzjR+L8wlgRRE7jq0DADZuDD6/w3WpFBUX2Mw5OXkgxZ5GHDT9kD0LF9s+
 jq4087IZCD9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9808"; a="158719952"
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="158719952"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:19 -0800
IronPort-SDR: VMGLkPeU5ewBQ8p+EgcKUyBIHqoxhFHYzDeJ0HQg0MTxIRw+czjp8FKGq+rVpM8vkP9Rl0YF1o
 culI+1OJm1pg==
X-IronPort-AV: E=Sophos;i="5.77,485,1596524400"; 
   d="scan'208";a="400802935"
Received: from sbinisma-mobl2.gar.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.40.254])
  by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2020 07:36:18 -0800
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [gatesgarth][PATCH 02/19] ptest-runner: Fix license as it contains 'or later' clause
Date: Tue, 17 Nov 2020 23:35:51 +0800
Message-Id: <daa16f56f1596fa2987499d6b48b98f5b7aedca2.1605626675.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <cover.1605626675.git.anuj.mittal@intel.com>
References: <cover.1605626675.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Richard Purdie <richard.purdie@linuxfoundation.org>

The license headers are clear that the code is "or later", fix LICENSE
to match.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 5f0b5cdfcb104ac50222a47652e090ad8770e49f)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
index 10b4c5b6a4..8b9938f572 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.0.bb
@@ -4,7 +4,7 @@ program which loops through all installed ptest test suites and \
 runs them in sequence."
 HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 
-LICENSE = "GPLv2"
+LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
 SRCREV = "834670317bd3f6e427e1ac461c07ada6b8936dfd"
-- 
2.28.0

