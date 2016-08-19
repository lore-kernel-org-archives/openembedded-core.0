Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id EFB1D76FFA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2016 13:01:35 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga104.fm.intel.com with ESMTP; 19 Aug 2016 06:01:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,544,1464678000"; d="scan'208";a="158381010"
Received: from marquiz.fi.intel.com ([10.237.72.155])
	by fmsmga004.fm.intel.com with ESMTP; 19 Aug 2016 06:01:36 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Aug 2016 16:01:33 +0300
Message-Id: <1471611694-31473-2-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
In-Reply-To: <1471611694-31473-1-git-send-email-markus.lehtonen@linux.intel.com>
References: <1471611694-31473-1-git-send-email-markus.lehtonen@linux.intel.com>
Subject: [PATCH 1/2] oe-build-perf-test: align log message format with testrunner output
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
X-List-Received-Date: Fri, 19 Aug 2016 13:01:36 -0000

The previous attempt on this was a bit erroneous, dropping time stamps
completely although only the timestamp format should've been changed.

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/oe-build-perf-test | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/oe-build-perf-test b/scripts/oe-build-perf-test
index 9f3ba44..88af40a 100755
--- a/scripts/oe-build-perf-test
+++ b/scripts/oe-build-perf-test
@@ -34,7 +34,9 @@ from oeqa.utils.commands import runCmd
 
 
 # Set-up logging
-logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')
+LOG_FORMAT = '[%(asctime)s] %(levelname)s: %(message)s'
+logging.basicConfig(level=logging.INFO, format=LOG_FORMAT,
+                    datefmt='%Y-%m-%d %H:%M:%S')
 log = logging.getLogger()
 
 
@@ -75,7 +77,7 @@ def setup_file_logging(log_file):
     log_dir = os.path.dirname(log_file)
     if not os.path.exists(log_dir):
         os.makedirs(log_dir)
-    formatter = logging.Formatter('[%(asctime)s] %(levelname)s: %(message)s')
+    formatter = logging.Formatter(LOG_FORMAT)
     handler = logging.FileHandler(log_file)
     handler.setFormatter(formatter)
     log.addHandler(handler)
-- 
2.6.6


