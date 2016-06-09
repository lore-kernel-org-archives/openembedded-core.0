Return-Path: <humberto.ibarra.lopez@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 4BB1D6FFA4
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jun 2016 16:00:05 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga102.fm.intel.com with ESMTP; 09 Jun 2016 09:00:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,445,1459839600"; d="scan'208";a="716515819"
Received: from unknown (HELO jhibarra-MOBL1.zpn.intel.com) ([10.219.17.152])
	by FMSMGA003.fm.intel.com with ESMTP; 09 Jun 2016 09:00:00 -0700
From: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  9 Jun 2016 11:01:40 -0500
Message-Id: <1465488100-5659-1-git-send-email-humberto.ibarra.lopez@intel.com>
X-Mailer: git-send-email 2.4.11
Subject: [PATCH] scripts/yocto-bsp: Fixed typo in parameter that was causing exception
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
X-List-Received-Date: Thu, 09 Jun 2016 16:00:06 -0000

There is a typo in the logging parameters, "filname" is being used instead
of "filename". This didn't cause issues before since python 2 didn't
validate unused parameters but with python >= 3.4.3 an exception is
thrown. This patch fixes this parameter name.

[Yocto #9736]

Signed-off-by: Humberto Ibarra <humberto.ibarra.lopez@intel.com>
---
 scripts/yocto-bsp | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/yocto-bsp b/scripts/yocto-bsp
index 6a422c3..0d36370 100755
--- a/scripts/yocto-bsp
+++ b/scripts/yocto-bsp
@@ -118,7 +118,7 @@ subcommands = {
 
 
 def start_logging(loglevel):
-    logging.basicConfig(filname = 'yocto-bsp.log', filemode = 'w', level=loglevel)
+    logging.basicConfig(filename = 'yocto-bsp.log', filemode = 'w', level=loglevel)
 
 
 def main():
-- 
2.4.11


