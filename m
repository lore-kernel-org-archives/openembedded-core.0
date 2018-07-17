Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id E6EAD789D7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 12:34:28 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Jul 2018 05:34:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.51,365,1526367600"; d="scan'208";a="55642269"
Received: from spalapa-mobl1.ger.corp.intel.com (HELO localhost.localdomain)
	([10.249.34.182])
	by fmsmga008.fm.intel.com with ESMTP; 17 Jul 2018 05:34:29 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 17 Jul 2018 14:34:18 +0200
Message-Id: <400e2b9a7876d34c7d15e49ca161ceb20fda3c57.1531830833.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1531830833.git.paul.eggleton@linux.intel.com>
References: <cover.1531830833.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] oe-find-native-sysroot: drop message if pseudo is not found
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
X-List-Received-Date: Tue, 17 Jul 2018 12:34:29 -0000

pseudo won't always be in the native sysroot for a recipe, so we
shouldn't be complaining if it isn't there.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/oe-find-native-sysroot | 2 --
 1 file changed, 2 deletions(-)

diff --git a/scripts/oe-find-native-sysroot b/scripts/oe-find-native-sysroot
index 350ea21373a..cc146b3fdbc 100755
--- a/scripts/oe-find-native-sysroot
+++ b/scripts/oe-find-native-sysroot
@@ -110,6 +110,4 @@ pseudo="$OECORE_NATIVE_SYSROOT/usr/bin/pseudo"
 if [ -e "$pseudo" ]; then
     echo "PSEUDO=$pseudo"
     PSEUDO="$pseudo"
-else
-    echo "PSEUDO $pseudo is not found."
 fi
-- 
2.17.1


