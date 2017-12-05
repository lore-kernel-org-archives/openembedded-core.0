Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id BC211786EE
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Dec 2017 01:37:36 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2017 17:37:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.45,362,1508828400"; d="scan'208";a="184038104"
Received: from gsteoh-mobl3.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.76.232])
	by fmsmga006.fm.intel.com with ESMTP; 04 Dec 2017 17:37:34 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Dec 2017 14:36:57 +1300
Message-Id: <8c94a9aaacf214108a395e0619fad3cdf894da07.1512437788.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <cover.1512437788.git.paul.eggleton@linux.intel.com>
References: <cover.1512437788.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] classes/patch: remove unused variable
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
X-List-Received-Date: Tue, 05 Dec 2017 01:37:36 -0000

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/classes/patch.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/classes/patch.bbclass b/meta/classes/patch.bbclass
index 8f35cb4..930ee33 100644
--- a/meta/classes/patch.bbclass
+++ b/meta/classes/patch.bbclass
@@ -26,7 +26,6 @@ python () {
 
 python patch_task_patch_prefunc() {
     # Prefunc for do_patch
-    func = d.getVar('BB_RUNTASK')
     srcsubdir = d.getVar('S')
 
     patchdir = os.path.join(srcsubdir, 'patches')
-- 
2.9.5


