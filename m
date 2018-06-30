Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5207E75460
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 16:18:40 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id y127-v6so4998132itd.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jun 2018 09:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jGlJSPAY8fJPuIfDGMaAvi2mSUDT6j2HyGz0PYK/Gqs=;
	b=ZlCC8q6rdjvNMm50OPZNuvp7t10EY34v9QYr1kYPQNH81rTJevRtW0kXtW0C1B9Sr8
	4f1F6hezdQwGHLdLTaErz464xh+ZiIoNxvjPyYPr/u5KYSTcCChQ5RaXxAo21Orqzu51
	Gjn7/cSWEo2GXP6bNFfbofyckkcThiasj1Drpco4J0x7bvEL2XJ7jzaSqhH6rQGnKgZf
	xRKmgi/3PqN5E3lF0WmXn5jARanaXqpiw1k2/L+Uhk8J7qyOKHJsc6QhWTvXVp5konV6
	uEnNFRYLc8TyB6WH4SSL676kPqfNKAhrKSLVrv5ECEIdFBMBVY52Nn2HxrOR+sNeUSNE
	RysA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jGlJSPAY8fJPuIfDGMaAvi2mSUDT6j2HyGz0PYK/Gqs=;
	b=SBMirPfpdovMtny7nhwDP+WvzCTGHV7t7bu3gPpUmbAEww3uCdccWeQkPDR321BHOE
	wJhC0YZAool6DtkdjCc2lsKS6g1h5oKZOSK95OKFhANgBmky/mfv4YN/h9+4Ck4H2JXW
	K4VLgkiJdgsTjFoHxVTA7gmAJ/4ZQynAWE3rLjhx492hjvzFTXyTQ+qBoS2lsQtZWKEP
	1gwUeSviViDAkEXGTk6olRXOSj2MZASRmI/Z5trfef8vZuaCNQeAplJiaSIu3VaAZT3r
	DsG1cy98VAHBULs885OM+bXGn1EKyDESSohYXX99FU4UNZxLNABvoj/hBKYo+JGwk0Ls
	k4jw==
X-Gm-Message-State: APt69E07qdDgTmrBxNyOeEhrU+sCE7Mbd6KEYFXihjgeKpKyQcwc+7vu
	/J59k3OyIezIU7a3jSlKtSY6vROe
X-Google-Smtp-Source: AAOMgpdmAbUu6cuENkYKKAol38+23Qnk91quJKvrbIhV307Fl5n7ftujDRtLLEBAdrxIhY6Mf+M6jA==
X-Received: by 2002:a24:214d:: with SMTP id
	e74-v6mr1315320ita.91.1530375521000; 
	Sat, 30 Jun 2018 09:18:41 -0700 (PDT)
Received: from localhost.localdomain ([136.32.200.236])
	by smtp.gmail.com with ESMTPSA id
	k10-v6sm4157130ioj.59.2018.06.30.09.18.39
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 30 Jun 2018 09:18:40 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 30 Jun 2018 11:16:37 -0500
Message-Id: <20180630161637.7153-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180629175445.21871-1-JPEWhacker@gmail.com>
References: <20180629175445.21871-1-JPEWhacker@gmail.com>
Subject: [PATCH v3] oe-selftest: Add bitbake-layer create-layer test
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
X-List-Received-Date: Sat, 30 Jun 2018 16:18:40 -0000

Adds a test that creates a layer, adds it to bblayers.conf, then ensure
that it appears properly in bitbake-layers show-layers.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 27 +++++++++++++++++++++++-
 1 file changed, 26 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 90a2249b081..3448ae1999b 100644
--- a/meta/lib/oeqa/selftest/cases/bblayers.py
+++ b/meta/lib/oeqa/selftest/cases/bblayers.py
@@ -2,7 +2,7 @@ import os
 import re
 
 import oeqa.utils.ftools as ftools
-from oeqa.utils.commands import runCmd, get_bb_var
+from oeqa.utils.commands import runCmd, get_bb_var, get_bb_vars
 
 from oeqa.selftest.case import OESelftestTestCase
 from oeqa.core.decorator.oeid import OETestID
@@ -85,6 +85,31 @@ class BitbakeLayers(OESelftestTestCase):
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
+        self.add_command_to_tearDown('bitbake-layers remove-layer %s' % layerpath)
+        result = runCmd('bitbake-layers show-layers')
+        find_in_contents = re.search(re.escape(layername) + r'\s+' + re.escape(layerpath) + r'\s+' + re.escape(str(priority)), result.output)
+        self.assertTrue(find_in_contents, "%s not found in layers\n%s" % (layername, result.output))
+
+        layervars = ['BBFILE_PRIORITY', 'BBFILE_PATTERN', 'LAYERDEPENDS', 'LAYERSERIES_COMPAT']
+        bb_vars = get_bb_vars(['BBFILE_COLLECTIONS'] + ['%s_%s' % (v, layername) for v in layervars])
+
+        for v in layervars:
+            varname = '%s_%s' % (v, layername)
+            self.assertIsNotNone(bb_vars[varname], "%s not found" % varname)
+
+        find_in_contents = re.search(r'(^|\s)' + re.escape(layername) + r'($|\s)', bb_vars['BBFILE_COLLECTIONS'])
+        self.assertTrue(find_in_contents, "%s not in BBFILE_COLLECTIONS" % layername)
+
+        self.assertEqual(bb_vars['BBFILE_PRIORITY_%s' % layername], str(priority), 'BBFILE_PRIORITY_%s != %d' % (layername, priority))
+
     def get_recipe_basename(self, recipe):
         recipe_file = ""
         result = runCmd("bitbake-layers show-recipes -f %s" % recipe)
-- 
2.17.0


