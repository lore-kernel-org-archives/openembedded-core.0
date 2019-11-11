Return-Path: <paul@betafive.co.uk>
Received: from wout5-smtp.messagingengine.com (wout5-smtp.messagingengine.com
	[64.147.123.21])
	by mail.openembedded.org (Postfix) with ESMTP id 077027FA11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2019 14:16:26 +0000 (UTC)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
	by mailout.west.internal (Postfix) with ESMTP id CEEA4430;
	Mon, 11 Nov 2019 09:16:26 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute1.internal (MEProxy); Mon, 11 Nov 2019 09:16:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=betafive.co.uk;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding; s=fm3; bh=8BcXLWmNE0HGG
	yNiN9jwme8c9FDDuJ3IXe5i/wYHlNY=; b=gHZs/2aZwKLHqOUENQ59bkR9f8oeZ
	EtU+vS1PoCb8qeyd7XJtI2wUwzmUqfAl4ZqqkXDbl1e8JTMZBTYXLlpC6MXbdGZ2
	qU4qvIQWaxVgncgMXmQfz6mhihNF7J9qcklfp1CYXdAsRvkAVwHQIGZWGFrla9Ge
	FjD0F9m7TPgb2Tw4RyllZ5CHGMPakz3WuH5FQAvkcUMP0pIeJC1R2XSD+xJEIWN6
	Tf3krm4b36ZPS6aDqWDTR9TPdaw9t8yybS73oOiwQEEDQ4ayaRGrT08QF458A4m3
	oU553YTuwO/m6CRy/BPnVGNo55utfbVol4ezVMGVPjK9aLW2oaRV/BAcw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:date:from
	:in-reply-to:message-id:mime-version:references:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=8BcXLWmNE0HGGyNiN9jwme8c9FDDuJ3IXe5i/wYHlNY=; b=ZxncdbF/
	nDRnBuyciTiX29+YK5ly45hSJz1Rac/AZ8qEu9EwbxEyku2yQaS1s5VYx/3qR3jt
	voVcnMS8w29v7RdlUFKjquWocqQMv0w4BOLVV44UqGoqChw7bXPjP82KYs0XzBQm
	DUeDczcM2PxM+JovvVLP7hKyHHikTPUbg/gOIcdKFOGJWPYZAiupXhJTIJGNSWWx
	mjigwpJQsOQUhrQDME5fqDUBiofQME6vxxyLcM42TVSxAwKKO7yzG24tYQDVpCBP
	sb0AdgUStnxcd0U7Wd26uwxY8UUpMe0xxTZY6+DvGGXxrcgc2RtWlU+gePDEkJDu
	qK6eaap3Ywx81Q==
X-ME-Sender: <xms:Om3JXX5JA18VK44Gu-YamFqolD6YMJHftW7LmLhS4B1hyNhYTLp62g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedufedruddvjedgieefucetufdoteggodetrfdotf
	fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
	uceurghilhhouhhtmecufedttdenucenucfjughrpefhvffufffkofgjfhgggfestdekre
	dtredttdenucfhrhhomheprfgruhhluceurghrkhgvrhcuoehprghulhessggvthgrfhhi
	vhgvrdgtohdruhhkqeenucfkphepkedvrdegrddvtdejrdeivdenucfrrghrrghmpehmrg
	hilhhfrhhomhepphgruhhlsegsvghtrghfihhvvgdrtghordhukhenucevlhhushhtvghr
	ufhiiigvpedt
X-ME-Proxy: <xmx:Om3JXfdPAwzN-5yOJ09aLqzAFEDls_1BVCnxaSGWpp67Au-BjGkMfQ>
	<xmx:Om3JXfb02vCKNFABKwqLZ6fp5AvyV5UtiSHHHJUYRnsgDjhV2PAQsA>
	<xmx:Om3JXdJu-fSWvsgx-lWNaksUXm9a1LMHVxjUaP3JiVXGqInFqY_8ew>
	<xmx:Om3JXYLVI6T_qr9_MDjTsVyAt-HJieGox188jliFno3Gap5vVmg2Ig>
Received: from arch-laptop.roaming.b5net.uk
	(cpc86219-nott20-2-0-cust829.12-2.cable.virginm.net [82.4.207.62])
	by mail.messagingengine.com (Postfix) with ESMTPA id E7908306005C;
	Mon, 11 Nov 2019 09:16:25 -0500 (EST)
From: Paul Barker <paul@betafive.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Nov 2019 14:16:21 +0000
Message-Id: <20191111141621.319368-2-paul@betafive.co.uk>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191111141621.319368-1-paul@betafive.co.uk>
References: <20191111141621.319368-1-paul@betafive.co.uk>
MIME-Version: 1.0
Subject: [PATCH 1/1] oeqa: archiver: Add basic tests for all archiver modes
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
X-List-Received-Date: Mon, 11 Nov 2019 14:16:27 -0000
Content-Transfer-Encoding: 8bit

6 new test cases are added to cover the various archiver modes
documented at the top of archiver.bbclass. Each test sets the
appropriate configuration options, runs the `do_deploy_archives` task
for the selftest-ed recipe and checks for the presence of the expected
archive file.

Signed-off-by: Paul Barker <paul@betafive.co.uk>
---
 meta/lib/oeqa/selftest/cases/archiver.py | 66 ++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/archiver.py b/meta/lib/oeqa/selftest/cases/archiver.py
index f8672f8abb..6bd0e06ec4 100644
--- a/meta/lib/oeqa/selftest/cases/archiver.py
+++ b/meta/lib/oeqa/selftest/cases/archiver.py
@@ -129,3 +129,69 @@ class Archiver(OESelftestTestCase):
         self.write_config(features)
 
         bitbake('-n core-image-sato')
+
+    def _test_archiver_mode(self, mode, target_file_name, extra_config=None):
+        target = "selftest-ed"
+
+        features = 'INHERIT += "archiver"\n'
+        features +=  'ARCHIVER_MODE[src] = "%s"\n' % (mode)
+        if extra_config:
+            features += extra_config
+        self.write_config(features)
+
+        bitbake('-c clean %s' % (target))
+        bitbake('-c deploy_archives %s' % (target))
+
+        bb_vars = get_bb_vars(['DEPLOY_DIR_SRC', 'TARGET_SYS'])
+        glob_str = os.path.join(bb_vars['DEPLOY_DIR_SRC'], bb_vars['TARGET_SYS'], '%s-*' % (target))
+        glob_result = glob.glob(glob_str)
+        self.assertTrue(glob_result, 'Missing archiver directory for %s' % (target))
+
+        archive_path = os.path.join(glob_result[0], target_file_name)
+        self.assertTrue(os.path.exists(archive_path), 'Missing archive file %s' % (target_file_name))
+
+    def test_archiver_mode_original(self):
+        """
+        Test that the archiver works in with `ARCHIVER_MODE[src] = "original"`.
+        """
+
+        self._test_archiver_mode('original', 'ed-1.14.1.tar.lz')
+
+    def test_archiver_mode_patched(self):
+        """
+        Test that the archiver works in with `ARCHIVER_MODE[src] = "patched"`.
+        """
+
+        self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-patched.tar.gz')
+
+    def test_archiver_mode_configured(self):
+        """
+        Test that the archiver works in with `ARCHIVER_MODE[src] = "configured"`.
+        """
+
+        self._test_archiver_mode('configured', 'selftest-ed-1.14.1-r0-configured.tar.gz')
+
+    def test_archiver_mode_recipe(self):
+        """
+        Test that the archiver works in with `ARCHIVER_MODE[recipe] = "1"`.
+        """
+
+        self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-recipe.tar.gz',
+                                 'ARCHIVER_MODE[recipe] = "1"\n')
+
+    def test_archiver_mode_diff(self):
+        """
+        Test that the archiver works in with `ARCHIVER_MODE[diff] = "1"`.
+        Exclusions controlled by `ARCHIVER_MODE[diff-exclude]` are not yet tested.
+        """
+
+        self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-diff.gz',
+                                 'ARCHIVER_MODE[diff] = "1"\n')
+
+    def test_archiver_mode_dumpdata(self):
+        """
+        Test that the archiver works in with `ARCHIVER_MODE[dumpdata] = "1"`.
+        """
+
+        self._test_archiver_mode('patched', 'selftest-ed-1.14.1-r0-showdata.dump',
+                                 'ARCHIVER_MODE[dumpdata] = "1"\n')
-- 
2.24.0


