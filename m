Return-Path: <peter.kjellerstedt@axis.com>
Received: from bes.se.axis.com (bes.se.axis.com [195.60.68.10])
	by mail.openembedded.org (Postfix) with ESMTP id BC4F96E668
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 17:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bes.se.axis.com (Postfix) with ESMTP id 34C2B2E1AA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:09 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bes.se.axis.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from bes.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bes.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 6zhiz+38CHfl
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bes.se.axis.com (Postfix) with ESMTP id 26E192E12B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 104781647
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 056441645
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from saur-2.se.axis.com (saur-2.se.axis.com [10.92.3.2])
	by thoth.se.axis.com (Postfix) with ESMTP id 0405E1039
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:08 +0200 (CEST)
Received: from saur-2.se.axis.com (localhost [127.0.0.1])
	by saur-2.se.axis.com (8.14.5/8.14.5) with ESMTP id u3FHU7Ba014319
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Apr 2016 19:30:07 +0200
Received: (from pkj@localhost)
	by saur-2.se.axis.com (8.14.5/8.14.5/Submit) id u3FHU75k014313
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Apr 2016 19:30:07 +0200
From: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 15 Apr 2016 19:30:06 +0200
Message-Id: <5f23a9102ac2d6fda2f17aed4a564cb9d6944876.1460741369.git.pkj@axis.com>
X-Mailer: git-send-email 2.1.0
In-Reply-To: <cover.1460741369.git.pkj@axis.com>
References: <cover.1460741369.git.pkj@axis.com>
In-Reply-To: <cover.1460741369.git.pkj@axis.com>
References: <cover.1460741369.git.pkj@axis.com>
Subject: [PATCH 1/2] oe-selftest: Correct the usage examples
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
X-List-Received-Date: Fri, 15 Apr 2016 17:30:10 -0000

---
 scripts/oe-selftest | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/scripts/oe-selftest b/scripts/oe-selftest
index 3d2dffb..5e23ef0 100755
--- a/scripts/oe-selftest
+++ b/scripts/oe-selftest
@@ -16,13 +16,13 @@
 # 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 # DESCRIPTION
-# This script runs tests defined in meta/lib/selftest/
+# This script runs tests defined in meta/lib/oeqa/selftest/
 # It's purpose is to automate the testing of different bitbake tools.
 # To use it you just need to source your build environment setup script and
 # add the meta-selftest layer to your BBLAYERS.
-# Call the script as: "oe-selftest" to run all the tests in in meta/lib/selftest/
-# Call the script as: "oe-selftest <module>.<Class>.<method>" to run just a single test
-# E.g: "oe-selftest bboutput.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/selftest/bboutput.py
+# Call the script as: "oe-selftest -a" to run all the tests in meta/lib/oeqa/selftest/
+# Call the script as: "oe-selftest -r <module>.<Class>.<method>" to run just a single test
+# E.g: "oe-selftest -r bblayers.BitbakeLayers" will run just the BitbakeLayers class from meta/lib/oeqa/selftest/bblayers.py
 
 
 import os
-- 
2.1.0


