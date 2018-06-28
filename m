Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f53.google.com (mail-it0-f53.google.com
	[209.85.214.53])
	by mail.openembedded.org (Postfix) with ESMTP id 1527D74813
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 17:53:53 +0000 (UTC)
Received: by mail-it0-f53.google.com with SMTP id p17-v6so8853962itc.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2018 10:53:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Vt0P9GBVzpVw9fNXAs6xZwpp7Le8H8fsIORo1cVmO1o=;
	b=I5VANm0xuOhh+2ZRXRuCuVzSL6eCdowqsRepkZgLpDtEnA80DPP/2UIqdJqnQVBXcX
	2//hIPCnb1iBr+fNrkhCbYtUMaB3q+0N96n5StIvNIfL2FVgld+jyw/exwqHtxBcfDck
	S9HYekxG9m6yM/Q1PMP+MX9NNXEIVW0MIm677X9P28VlD5Xueu4nZcAEICi2xghGlxX+
	Sy6TfVdjQbUh2qHB4mX/q1TWDLP2C3sajQ1Ze27BlIu48j9nq+AzRO843CtRo/Js0Rmp
	evo2rhh7t7OKvity1zxN/mu+49IMpRwZdwPhQM9FG71VckeN2HfaivjW4zCRbBP2K8MG
	Vv1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Vt0P9GBVzpVw9fNXAs6xZwpp7Le8H8fsIORo1cVmO1o=;
	b=oBLmF4jzg9zSgoM6A9vR6zqIgMT+ekAzHAnDlpp7tXLfrYJ0c83jvjh1cp4PuHUi4r
	dbtxm5HSXf16GWc1uIfdmWWTdP4SyCXdHbgEMo8+k/k/MKDl6kSwo8myvnuFhpVS2Kec
	0sMREG16bvCe9UHWm03x6fQfkeRZnpChYcpbJwn4TkFcl9ecTZy8SKUng/8hwoOtGJtD
	c5VG+TTOAEZFvYJv3E6XX/rAhvnVxMt18Y+1hBA6u1RzbvOYyr+SPlV042vMqguCh8Za
	s8vNN5oHVK4NdrmKZi4HUFEMnYPi0dO3tGRl6+xg1+ECQyXPbVNp3boD5bp38y7MpIEt
	J8hA==
X-Gm-Message-State: APt69E2dUPWSgThnGeie9qdquF03tJF2YE9nJu/RvrIGIGPM6GThYh+C
	GwJIAHTqxc6vPhtfns/IorWMTsos
X-Google-Smtp-Source: ADUXVKI9b5mUFOvJwN0fvmyqWxf86rsfFx02HDN8dFJpWn398Th55e/eYy78PS5cUi514alKuIt+Zw==
X-Received: by 2002:a24:7215:: with SMTP id
	x21-v6mr8946629itc.131.1530208434882; 
	Thu, 28 Jun 2018 10:53:54 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	d202-v6sm4350945itc.30.2018.06.28.10.53.54
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 28 Jun 2018 10:53:54 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 28 Jun 2018 12:53:42 -0500
Message-Id: <20180628175342.16560-2-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180628175342.16560-1-JPEWhacker@gmail.com>
References: <20180628175342.16560-1-JPEWhacker@gmail.com>
Subject: [PATCH 2/2] oe-selftest: Add bitbake-layer create-layer test
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
X-List-Received-Date: Thu, 28 Jun 2018 17:53:54 -0000

Adds a test that creates a layer, adds it to bblayers.conf, then ensure
that it appears properly in bitbake-layers show-layers.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 90a2249b081..fba7fbb9b0f 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -2,7 +2,7 @@ import os
 import re
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, get_bb_var
+from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
@@ -85,6 +85,30 @@ class BitbakeLayers(OESelftestTestCase):
         self.assertNotEqual(result.status, 0, 'bitbake-layers show-recipes -i nonexistentclass should have failed')
         self.assertIn('ERROR:', result.output)
 
+    def test_bitbakelayers_createlayer(self):
+        priority = 10
+        layername = 'test-bitbakelayer-layercreate'
+        layerpath = os.path.join(get_bb_var('COREBASE'), layername)
+        self.assertFalse(os.path.exists(layerpath), '%s should not exist at this point in time' % layerpath)
+        result = runCmd('bitbake-layers create-layer --priority=%d %s' % (priority, layerpath))
+        self.track_for_cleanup(layerpath)
+        result = runCmd('bitbake-layers add-layer %s' % layerpath)
+        result = runCmd('bitbake-layers show-layers')
+        find_in_contents = re.search(re.escape(layername) + r'\s+' + re.escape(layerpath) + r'\s+' + re.escape(str(priority)), result.output)
+        self.assertTrue(find_in_contents, "%s not found in layers" % layername)
+
+        layervars = ['BBFILE_PRIORITY', 'BBFILE_PATTERN', 'LAYERDEPENDS', 'LAYERSERIES_COMPAT']
+        bb_vars = get_bb_vars(['BBFILE_COLLECTIONS'] + ['%s_%s' % (v, layername) for v in layervars])
+
+        for v in layervars:
+            varname = '%s_%s' % (v, layername)
+            self.assertTrue(bb_vars[varname], "%s not found" % varname)
+
+        find_in_contents = re.search(r'(^|\s)' + re.escape(layername) + r'($|\s)', bb_vars['BBFILE_COLLECTIONS'])
+        self.assertTrue(find_in_contents, "%s not in BBFILE_COLLECTIONS" % layername)
+
+        self.assertEqual(str(priority), bb_vars['BBFILE_PRIORITY_%s' % layername])
+
     def get_recipe_basename(self, recipe):
         recipe_file = ""
         result = runCmd("bitbake-layers show-recipes -f %s" % recipe)
-- 
2.17.1


