Return-Path: <jpewhacker@gmail.com>
Received: from mail-it0-f47.google.com (mail-it0-f47.google.com
	[209.85.214.47])
	by mail.openembedded.org (Postfix) with ESMTP id 68400745A7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 17:55:04 +0000 (UTC)
Received: by mail-it0-f47.google.com with SMTP id u4-v6so4004180itg.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jun 2018 10:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=q4BrcboZxeB+O5s5YmlQmwzinhPmRd3OhWKwVGN5Mek=;
	b=CkQlg30V4U4uO+yOgeL8JtX2qVWFdPDCBrXv6t+tsQMfwfLh9hy1Xnn4cSCZaSKSQs
	YkttaDgae/O7iIb1aVbYgRCsszq9CYYNobNYRLD+zr7/u3JnN/nC1Ad6B/JrEHvQrvWI
	mT2aV5seI6XmE86/klrUdKgWfjWoMUoAIxGtUQygO5isoCyt6HwnTgVzrBKHAtDrUY8w
	/Ls7IwJhJfIUXlNvZRNOgUEpR1YhgOGzeJT9uoAq086aAJtolfduW3q8fqogDRM4MDcI
	7ol8O8vx0/wmy17wrOXDk24d6jodglkd2ArcBfPqu/25x2NZBq5boFLTOgH4TUGeCUJG
	0pgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=q4BrcboZxeB+O5s5YmlQmwzinhPmRd3OhWKwVGN5Mek=;
	b=jSlErIQIz/7f1A8emqXUtmBQDNi8nX+reDwkYDXefYJyCjzJAUjjeh78zowNcRtK18
	d2lj68o5PClIjeLNHMWHCFphMZ4OBlPwGZLk+cFZ8vg27R/6tGdQ+YCrr9WtTMpjaajj
	MoqnhPL92ycu+unTJUZMQv3tBwzOJa4wB+JzSPIwqA6dXfpAb5k/IYjKpqLopWEL5zxC
	l7bVNnVKVdh7wsvWOdHNhDhWnZF82FnDK91B1rXIitOlVDLmVmSvXtFETsJFis10K1XX
	Gpgvk9EaPRttJf+CETFU8mnhJpQS0tUVnqhVhOn03o3QZPYkGO02LtMYvpajOagV4AOL
	DXVw==
X-Gm-Message-State: APt69E2SK/ofkjZwrB0hy/Im5YACaSvqAUa6pAO9VJPZ1Dmp20v8Vgxh
	u3xxpqGV9kCBD1lBXRdAaxCPne5R
X-Google-Smtp-Source: AAOMgpeujfWaxg+bUNCvPQkvxKjSpKBgD0AI18z8Z9zg/sUZpLgDW8TamGnHubndzT7xSUCRPMTYMw==
X-Received: by 2002:a24:46d4:: with SMTP id
	j203-v6mr2703598itb.93.1530294905076; 
	Fri, 29 Jun 2018 10:55:05 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id
	g6-v6sm872371iti.0.2018.06.29.10.55.04
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 29 Jun 2018 10:55:04 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jun 2018 12:54:45 -0500
Message-Id: <20180629175445.21871-1-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180628175342.16560-1-JPEWhacker@gmail.com>
References: <20180628175342.16560-1-JPEWhacker@gmail.com>
Subject: [PATCH v2] oe-selftest: Add bitbake-layer create-layer test
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
X-List-Received-Date: Fri, 29 Jun 2018 17:55:04 -0000

Adds a test that creates a layer, adds it to bblayers.conf, then ensure
that it appears properly in bitbake-layers show-layers.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/lib/oeqa/selftest/cases/bblayers.py | 26 +++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oeqa/selftest/cases/bblayers.py b/meta/lib/oeqa/selftest/cases/bblayers.py
index 90a2249b081..f2fc8327647 100644
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
2.17.1


