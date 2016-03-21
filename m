Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7D15B6AC3C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 09:25:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u2L9PtOX016564
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Mar 2016 02:25:55 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 21 Mar 2016 02:25:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 21 Mar 2016 02:25:51 -0700
Message-ID: <e7580623a1ee236d26e948ce06e9d775b69e3e63.1458551516.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1458551516.git.liezhi.yang@windriver.com>
References: <cover.1458551516.git.liezhi.yang@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] selftest/signing.py: RPM_GPG_PASSPHRASE_FILE -> RPM_GPG_PASSPHRASE
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
X-List-Received-Date: Mon, 21 Mar 2016 09:25:56 -0000
Content-Type: text/plain

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
---
 meta-selftest/files/signing/secret.txt |    1 -
 meta/lib/oeqa/selftest/signing.py      |    2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)
 delete mode 100644 meta-selftest/files/signing/secret.txt

diff --git a/meta-selftest/files/signing/secret.txt b/meta-selftest/files/signing/secret.txt
deleted file mode 100644
index 5271a52..0000000
--- a/meta-selftest/files/signing/secret.txt
+++ /dev/null
@@ -1 +0,0 @@
-test123
diff --git a/meta/lib/oeqa/selftest/signing.py b/meta/lib/oeqa/selftest/signing.py
index 1e710e3..312e502 100644
--- a/meta/lib/oeqa/selftest/signing.py
+++ b/meta/lib/oeqa/selftest/signing.py
@@ -54,7 +54,7 @@ class Signing(oeSelfTest):
         test_recipe = 'ed'
 
         feature = 'INHERIT += "sign_rpm"\n'
-        feature += 'RPM_GPG_PASSPHRASE_FILE = "%ssecret.txt"\n' % self.gpg_dir
+        feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'RPM_GPG_PUBKEY = "%s%s"\n' % (self.gpg_dir, self.pub_key_name)
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
-- 
1.7.9.5


