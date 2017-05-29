Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f45.google.com (mail-it0-f45.google.com
	[209.85.214.45])
	by mail.openembedded.org (Postfix) with ESMTP id 99E1C7809E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 15:33:01 +0000 (UTC)
Received: by mail-it0-f45.google.com with SMTP id c15so28582115ith.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 08:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ntT0Uxriv+NDfZa/IbuHU01PujxHvLd/ysugeVSpmag=;
	b=tGQqaJx4DcXdZbOuLBCt+jt5/5JYpJ+ec9I4Bo5Ta6NdI3NxSFiAs1WtTlECtM1/oh
	Qh7fqcSSQ4JCpC8HE+l8b09rnVEuu+LJL3hpEeCEBaNR2mQoI+vyiSVDCar0ZxN5ty3h
	X6m0311urZ7uYY/JlGulZ1SRbxfRUM7Y5Nhh3q9J7UQYr9KdugfYi1ePLIAPrv6W851K
	hMEM2muOO7DNXn4kJ28eXwG1uScRAavEfbgSSw8ExehjU5HK+SiHCS3uPmImbNKdcFmk
	aDuqNOyvIV754AREeU7PPbZsVJwW+aqAgQvxGYYicQcx1+oIN/eVz7i99zVpTuP8bEi9
	SaEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ntT0Uxriv+NDfZa/IbuHU01PujxHvLd/ysugeVSpmag=;
	b=oEj8gNc7hjseIisepPzOO6accbHf7CUcaUf/tSnVYv49PZXzs91hSLhigi+QLs9KdZ
	YV6izzKP5EHoT0Ch9LhbZ8SDsMzK4LeLPdcY+n4jXWmgAQX2EQyZAgGWq/Fb/nfrqJRa
	qMvAqsEfi5DCv6UxTaP/Xg01EXMeGQBLi+5C1PlMrDE3tGGIRzqeANkbcLTY9rg+Mbdc
	VAKZ6uwIbQDH3lYF9vRY+AMG7X0GFBHuIZg6CX/YHl+uyDUaHFgvRRpaQ5gXH9iWk8Fr
	p0e1+wNS2v6WJiqnd/g0zmKJmxicj4eZvf3niGYNI6MSb3A72Hz4Lz4llMHUhxZu+NZ5
	TuEQ==
X-Gm-Message-State: AODbwcAI2pb33mcz08Glh6fEB1dUdQpLk5DrrHzYWE0DuubFPA1iK+tZ
	mXZcDVt8ruGtYYpBY7w=
X-Received: by 10.36.29.150 with SMTP id 144mr8261409itj.71.1496071982364;
	Mon, 29 May 2017 08:33:02 -0700 (PDT)
Received: from pohly-desktop.fritz.box (p5DE8FCB8.dip0.t-ipconnect.de.
	[93.232.252.184]) by smtp.gmail.com with ESMTPSA id
	r82sm4232600iod.45.2017.05.29.08.33.00
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 29 May 2017 08:33:01 -0700 (PDT)
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 May 2017 17:32:39 +0200
Message-Id: <c352a354d5263ef5fb82e3ce7cda0ed265437a2c.1496071841.git-series.patrick.ohly@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
References: <cover.393a6efac99077bd222866024d8e18f371414195.1496071841.git-series.patrick.ohly@intel.com>
Subject: [PATCH 5/6] yocto-compat-layer.py: allow README with suffix
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
X-List-Received-Date: Mon, 29 May 2017 15:33:01 -0000

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
index b9cd656..284d1cc 100644
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

