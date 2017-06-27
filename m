Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f52.google.com (mail-it0-f52.google.com
	[209.85.214.52])
	by mail.openembedded.org (Postfix) with ESMTP id CB66977FF5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:34:05 +0000 (UTC)
Received: by mail-it0-f52.google.com with SMTP id x12so2970889itb.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Jun 2017 08:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=B2fdNI/zSir6QslU4jeF3NDV6AfuPpjhdNgMSRVr1eQ=;
	b=fT10ox1MKveI/Ifj+3yQPCownQud/5EAKIOCnXO6G2DHz21NPeRu3MvvPHCcdABfIF
	Ul7rfo5gU/knzRUfnwJ5z3caV4Kj2z2oUINz1LW1jbQkggPMtrzeVcMz8EM1V1GBXFxW
	7QabMFwLfBMR7J+RECAbSZU4AqjjrhIXbUEVWCKTmKN3ZxCbPQmb4sSBRefiKZB4n4ve
	Fs/SrD6ZNQVed/7bw/InY8yEwoMAAkpH9skfqQReVEaRgUnA6vjFluD8dsi/6koB8TG4
	7NWa3t1XYtg5PRyVyNYY9FOMD3lXJAKZc2haSMxIHDXjECTp9PCVzgDhyO9qqm4fNJBU
	+pow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=B2fdNI/zSir6QslU4jeF3NDV6AfuPpjhdNgMSRVr1eQ=;
	b=Uzn8WhV6ooht/M2FaP+MgxSmVVlAv7R4WqIwrDUw8eFVDql0xgsVFM9+UtmuWH7cQl
	dfSJ7P4C/gs797MiLk/NcCf5rRS8mUCq7yv76hFEYu8QjFdJ8JL1if7y5rx23iNzM+ze
	0YM05XqmrewxND/HrfEwtVko98NSzsvcurXwcLyaaCJmIrdJN9rU6jVrScc3hMjPgVC8
	eQh1btbKRdJgNlbI78Bx/70QWlfUUU16ub4pw0ei637WZwcfs6d8++c9LPD3Y0pshGF5
	tx4yyTwwgPs3XGuylvLvZ+t2BtGRegNvNTbAFxN0izcEKO8KlQVTNRpyFUu3XlSHFhTf
	q3lw==
X-Gm-Message-State: AKS2vOz09B0rDr44eqn3BS2KM2MsoSXfuW6/YCMFIvbIMD/cN10ChNF1
	e19pqRfgmIPbDC530oY=
X-Received: by 10.36.55.143 with SMTP id r137mr3003022itr.27.1498577647041;
	Tue, 27 Jun 2017 08:34:07 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FB9F.dip0.t-ipconnect.de.
	[93.232.251.159]) by smtp.gmail.com with ESMTPSA id
	f40sm1702550ioj.19.2017.06.27.08.34.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Jun 2017 08:34:06 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Jun 2017 17:33:42 +0200
Message-Id: <02c8a1b9bf15e95941b05a7a5154e266156f595a.1498577501.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
References: <cover.f2f002a814bb8f4571ff6f9fd7cb880b94cc611f.1498577501.git-series.patrick.ohly@intel.com>
Subject: [PATCH v2 5/6] yocto-compat-layer.py: allow README with suffix
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
X-List-Received-Date: Tue, 27 Jun 2017 15:34:06 -0000

It may be useful to append a suffix denoting the file format. For
example, README.rst is rendered differently when viewed on Github, and
also helps editors to switch to a mode more suitable for the format.

The tests uses a file pattern to find the README file(s) and treats
the one with the shortest name as the main one which must not be
empty.

Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
---
 scripts/lib/compatlayer/cases/common.py | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/scripts/lib/compatlayer/cases/common.py b/scripts/lib/compatlayer/cases/common.py
index ede002d..4c8a543 100644
--- a/scripts/lib/compatlayer/cases/common.py
+++ b/scripts/lib/compatlayer/cases/common.py
@@ -1,6 +1,7 @@
 # Copyright (C) 2017 Intel Corporation
 # Released under the MIT license (see COPYING.MIT)
 
+import glob
 import os
 import unittest
 from compatlayer import get_signatures, LayerType, check_command, get_depgraph
@@ -8,15 +9,20 @@ from compatlayer.case import OECompatLayerTestCase
 
 class CommonCompatLayer(OECompatLayerTestCase):
     def test_readme(self):
-        readme_file = os.path.join(self.tc.layer['path'], 'README')
-        self.assertTrue(os.path.isfile(readme_file),
-                msg="Layer doesn't contains README file.")
+        # The top-level README file may have a suffix (like README.rst or README.txt).
+        readme_files = glob.glob(os.path.join(self.tc.layer['path'], 'README*'))
+        self.assertTrue(len(readme_files) > 0,
+                        msg="Layer doesn't contains README file.")
 
+        # There might be more than one file matching the file pattern above
+        # (for example, README.rst and README-COPYING.rst). The one with the shortest
+        # name is considered the "main" one.
+        readme_file = sorted(readme_files)[0]
         data = ''
         with open(readme_file, 'r') as f:
             data = f.read()
         self.assertTrue(data,
-                msg="Layer contains README file but is empty.")
+                msg="Layer contains a README file but it is empty.")
 
     def test_parse(self):
         check_command('Layer %s failed to parse.' % self.tc.layer['name'],
-- 
git-series 0.9.1

