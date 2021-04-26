Received: from mga14.intel.com (mga14.intel.com [])
 by mx.groups.io with SMTP id smtpd.web11.972.1619398464930781840
 for <openembedded-core@lists.openembedded.org>;
 Sun, 25 Apr 2021 17:54:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=fail (domain: intel.com, ip: <nil>, mailfrom: anuj.mittal@intel.com)
IronPort-SDR: mwAN90E39VatvFuRpbsQQsuw7zMAf/4nUhkQniaFFGi1RTcFy+7pubCUUGocmVgx+U+npLNE40
 MlSsv1hX9OYw==
X-IronPort-AV: E=McAfee;i="6200,9189,9965"; a="195818181"
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="195818181"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:34 -0700
IronPort-SDR: 0llJjJPah/9RGGuAaucUbG+07KIZR2A3+Wr9VbhZuJqVHnqD8CR6HSSzebKZQlCH/3D413dj7i
 XLIIk1gDkWDg==
X-IronPort-AV: E=Sophos;i="5.82,251,1613462400"; 
   d="scan'208";a="454067395"
Received: from wsan-mobl1.ccr.corp.intel.com (HELO anmitta2-mobl1.gar.corp.intel.com) ([10.213.45.138])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Apr 2021 17:54:33 -0700
From: "Anuj Mittal" <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Subject: [hardknott][PATCH 29/64] oeqa/runtime: space needed
Date: Mon, 26 Apr 2021 08:53:00 +0800
Message-Id: <f85c993bc4535dc42b89e87050d43c018c100f58.1619397968.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1619397968.git.anuj.mittal@intel.com>
References: <cover.1619397968.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Jon Mason <jdmason@kudzu.us>

Messages are currently being printed as:
	Test requires dropbear, oropenssh-sshd to be installed
but should be
	Test requires dropbear, or openssh-sshd to be installed
Adding the space after the 'or' corrects this.

Signed-off-by: Jon Mason <jdmason@kudzu.us>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 51596e0f8cebe1607ab64ffb018d51e815c0ee4b)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 meta/lib/oeqa/runtime/decorator/package.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oeqa/runtime/decorator/package.py b/meta/lib/oeqa/runtime/decorator/package.py
index 57178655cc..2d7e174dbf 100644
--- a/meta/lib/oeqa/runtime/decorator/package.py
+++ b/meta/lib/oeqa/runtime/decorator/package.py
@@ -45,14 +45,14 @@ class OEHasPackage(OETestDecorator):
             msg = 'Checking if %s is not installed' % ', '.join(unneed_pkgs)
             self.logger.debug(msg)
             if not self.case.tc.image_packages.isdisjoint(unneed_pkgs):
-                msg = "Test can't run with %s installed" % ', or'.join(unneed_pkgs)
+                msg = "Test can't run with %s installed" % ', or '.join(unneed_pkgs)
                 self._decorator_fail(msg)
 
         if need_pkgs:
             msg = 'Checking if at least one of %s is installed' % ', '.join(need_pkgs)
             self.logger.debug(msg)
             if self.case.tc.image_packages.isdisjoint(need_pkgs):
-                msg = "Test requires %s to be installed" % ', or'.join(need_pkgs)
+                msg = "Test requires %s to be installed" % ', or '.join(need_pkgs)
                 self._decorator_fail(msg)
 
     def _decorator_fail(self, msg):
-- 
2.30.2

