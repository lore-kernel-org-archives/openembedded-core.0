Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id EA53474604
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Apr 2018 09:39:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2018 02:39:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,405,1517904000"; d="scan'208";a="30914162"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga008.jf.intel.com with ESMTP; 04 Apr 2018 02:39:58 -0700
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Apr 2018 12:33:30 +0300
Message-Id: <20180404093331.22593-1-alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.16.1
Subject: [morty][PATCH 1/2] selftest/signing: add --batch to gpg invocation when importing keys
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
X-List-Received-Date: Wed, 04 Apr 2018 09:39:59 -0000

Otherwise it may pop up windows asking for passphrases which breaks
automated testing.

Newer YP releases and master already have the fix.

[YOCTO #12521]

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/lib/oeqa/selftest/signing.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 3b5c2da0e0f..02e5f5ad29d 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -26,7 +26,7 @@ class Signing(oeSelfTest):
         cls.pub_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.pub")
         cls.secret_key_path = os.path.join(cls.testlayer_path, 'files', 'signing', "key.secret")
 
-        runCmd('gpg --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
+        runCmd('gpg --batch --homedir %s --import %s %s' % (cls.gpg_dir, cls.pub_key_path, cls.secret_key_path))
 
     @classmethod
     def tearDownClass(cls):
-- 
2.16.1


