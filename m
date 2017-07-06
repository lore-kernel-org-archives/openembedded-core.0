Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f177.google.com (mail-pf0-f177.google.com
	[209.85.192.177])
	by mail.openembedded.org (Postfix) with ESMTP id 5898B775DA
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Jul 2017 14:34:06 +0000 (UTC)
Received: by mail-pf0-f177.google.com with SMTP id q86so1888171pfl.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Jul 2017 07:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=47mrCpKZNVhuoyNWNKzAEDN5gPUKyG3fCkrK3ZR5P2k=;
	b=M/dG5Si/yJiyB2ujymc2NGwHVE6NhqfpXaSGvj9tZoTCAOHYzV+11Ys6oPh/0I1Adz
	SneLFSezgdtPJNCqnZVYKshAxNXQscKlYiUMfjzk85qDnkFcFNQBHaI/rgxp4G8Rwgal
	DuJ8XEe7LTX9CwZf2JoELymuhWi+bHX1TahfHoFoAtK5nVB9fcNkFz642K/WBkYDZDW+
	eYqjiyyRA3tv84BHNRQmf7dZkEKtULvZO0cdS/FxMd93KPLSKdri0KrRIpsLR1IdUJa/
	+lS0mStUiVl+N52vf+Dxtb2MYy3so5aOQPC6c5bLuTKQitpzs5nwGm3rmv6aZKwQQKMN
	sDmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=47mrCpKZNVhuoyNWNKzAEDN5gPUKyG3fCkrK3ZR5P2k=;
	b=hV2I7E/cJIK8iO54uUVORqWoUev9hMlGb8WN7SdFHQY6Zgd8oJcSeifTIYAjy16ldN
	ZZVpPJqHPXWgR3ty90LODtCpGM4qV4zCBc+F4Wi8Ey6ePOZUYRWjsBn53XcCbujdedSP
	CXB7z4HcCQDgXg57oBftpmmUN9HA2SPUti35ZCIUIXUDrP87Fktsj7icrWh798fd887e
	WbjOX3ATd2WHxqILzzWB3Z6MF9hWmK1VbKa4ZoDAlGExZ3VAYh1nmAVZSyE7CsczugK1
	IKgjvyn56XgOew81iVxBsAt7/ldiUzAPsudrLjrv9Hi/saa/IIzvsVNo7ZXtePYl8Tt2
	imOg==
X-Gm-Message-State: AIVw112pEzCPFhpJzbmQFs4mo+uGZJYMm6MWAbPZ66erUrV4CCFCCOto
	rVt+29vd6C6zjZHr
X-Received: by 10.99.132.198 with SMTP id k189mr27014007pgd.233.1499351647304; 
	Thu, 06 Jul 2017 07:34:07 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::3df3])
	by smtp.gmail.com with ESMTPSA id
	w66sm1132739pfi.63.2017.07.06.07.34.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 06 Jul 2017 07:34:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Jul 2017 07:33:22 -0700
Message-Id: <0f6e5426a194960cdd80aa01f5b0e259875caf90.1499351361.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.2
In-Reply-To: <cover.1499351361.git.raj.khem@gmail.com>
References: <cover.1499351361.git.raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 21/22] oeqa/sdk: Replace buildiptables for buildlzip tests
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
X-List-Received-Date: Thu, 06 Jul 2017 14:34:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>

Buildiptables test cases are conflicting with images built with “musl”
as standard C library, in order to avoid those issues lzip package was
selected to be used on the tests as this does not have any "musl"
dependency.

[YOCTO #11713]

Signed-off-by: Jose Perez Carranza <jose.perez.carranza@linux.intel.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/lib/oeqa/sdk/cases/{buildiptables.py => buildlzip.py} | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)
 rename meta/lib/oeqa/sdk/cases/{buildiptables.py => buildlzip.py} (84%)

diff --git a/meta/lib/oeqa/sdk/cases/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildlzip.py
similarity index 84%
rename from meta/lib/oeqa/sdk/cases/buildiptables.py
rename to meta/lib/oeqa/sdk/cases/buildlzip.py
index 419c7ebd09..3a89ce8627 100644
--- a/meta/lib/oeqa/sdk/cases/buildiptables.py
+++ b/meta/lib/oeqa/sdk/cases/buildlzip.py
@@ -3,15 +3,15 @@ from oeqa.sdk.case import OESDKTestCase
 from oeqa.sdk.utils.sdkbuildproject import SDKBuildProject
 
 
-class BuildIptablesTest(OESDKTestCase):
+class BuildLzipTest(OESDKTestCase):
     td_vars = ['DATETIME']
 
     @classmethod
     def setUpClass(self):
         dl_dir = self.td.get('DL_DIR', None)
 
-        self.project = SDKBuildProject(self.tc.sdk_dir + "/iptables/", self.tc.sdk_env, 
-                        "http://downloads.yoctoproject.org/mirror/sources/iptables-1.4.13.tar.bz2",
+        self.project = SDKBuildProject(self.tc.sdk_dir + "/lzip/", self.tc.sdk_env,
+                        "http://downloads.yoctoproject.org/mirror/sources/lzip-1.19.tar.gz",
                         self.tc.sdk_dir, self.td['DATETIME'], dl_dir=dl_dir)
         self.project.download_archive()
 
@@ -21,7 +21,7 @@ class BuildIptablesTest(OESDKTestCase):
                 self.tc.hasTargetPackage("gcc")):
             raise unittest.SkipTest("SDK doesn't contain a cross-canadian toolchain")
 
-    def test_iptables(self):
+    def test_lzip(self):
         self.assertEqual(self.project.run_configure(), 0,
                         msg="Running configure failed")
 
-- 
2.13.2


