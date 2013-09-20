Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [143.182.124.21])
	by mail.openembedded.org (Postfix) with ESMTP id C89D46C9A1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Sep 2013 09:27:56 +0000 (UTC)
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 20 Sep 2013 02:27:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.90,943,1371106800"; d="scan'208";a="363220955"
Received: from unknown (HELO helios.ger.corp.intel.com) ([10.252.123.234])
	by azsmga001.ch.intel.com with ESMTP; 20 Sep 2013 02:27:58 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Sep 2013 10:27:49 +0100
Message-Id: <ddeff2959cd3aef0284ed974a53f4766a72a4e56.1379669217.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1379669217.git.paul.eggleton@linux.intel.com>
References: <cover.1379669217.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 1/5] classes/testimage: remove odd characters in comments
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
X-List-Received-Date: Fri, 20 Sep 2013 09:27:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/testimage.bbclass | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/classes/testimage.bbclass b/meta/classes/testimage.bbclass
index c83906d..9ecef68 100644
--- a/meta/classes/testimage.bbclass
+++ b/meta/classes/testimage.bbclass
@@ -7,9 +7,9 @@
 # Most of the tests are commands run on target image over ssh.
 # To use it add testimage to global inherit and call your target image with -c testimage
 # You can try it out like this:
-# - first build a qemu core-image-sato
-# - add INHERIT += "testimage" in local.conf
-# - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.
+# - first build a qemu core-image-sato
+# - add INHERIT += "testimage" in local.conf
+# - then bitbake core-image-sato -c testimage. That will run a standard suite of tests.
 
 # You can set (or append to) TEST_SUITES in local.conf to select the tests
 # which you want to run for your target.
-- 
1.8.1.2


