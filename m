Return-Path: <martin@hundeboll.net>
Received: from mail.hundeboll.net (mail.hundeboll.net [88.198.92.70])
	by mail.openembedded.org (Postfix) with ESMTP id 01AA071479
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Oct 2014 10:43:28 +0000 (UTC)
Received: from hundeboll.localdomain (5634263f.rev.stofanet.dk [86.52.38.63])
	by mail.hundeboll.net (Postfix) with ESMTPSA id 24CAE1BF32E;
	Thu, 30 Oct 2014 11:43:27 +0100 (CET)
From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Oct 2014 11:43:24 +0100
Message-Id: <1414665805-21734-2-git-send-email-martin@hundeboll.net>
X-Mailer: git-send-email 2.1.2
In-Reply-To: <1414665805-21734-1-git-send-email-martin@hundeboll.net>
References: <1414665805-21734-1-git-send-email-martin@hundeboll.net>
MIME-Version: 1.0
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@hundeboll.net>
Subject: [RFCv2 1/2] scripts: use '/usr/bin/env' in shebangs with python
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
X-List-Received-Date: Thu, 30 Oct 2014 10:43:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

To support yocto on systems with python3 as default version, scripts
should use /usr/bin/env python in the shebang, as this allows the use of
a fake env to mimic python2 as default version.

This patch simply replaces occurrences of #!/usr/bin/python with
 #!/usr/bin/env python and was done with this oneliner:

     git grep -lE '^#!/usr/bin/python' | xargs \
         sed -i 's|/usr/bin/python|/usr/bin/env python|'

Signed-off-by: Martin Hundebøll <martin@hundeboll.net>
---
 bitbake/lib/progressbar.py                                | 2 +-
 scripts/lib/wic/conf.py                                   | 2 +-
 scripts/lib/wic/creator.py                                | 2 +-
 scripts/lib/wic/imager/baseimager.py                      | 2 +-
 scripts/lib/wic/kickstart/__init__.py                     | 2 +-
 scripts/lib/wic/kickstart/custom_commands/micboot.py      | 2 +-
 scripts/lib/wic/kickstart/custom_commands/micpartition.py | 2 +-
 scripts/lib/wic/msger.py                                  | 2 +-
 scripts/lib/wic/plugin.py                                 | 2 +-
 scripts/lib/wic/pluginbase.py                             | 2 +-
 scripts/lib/wic/utils/errors.py                           | 2 +-
 scripts/lib/wic/utils/fs_related.py                       | 2 +-
 scripts/lib/wic/utils/misc.py                             | 2 +-
 scripts/lib/wic/utils/partitionedfs.py                    | 2 +-
 scripts/lib/wic/utils/runner.py                           | 2 +-
 scripts/pybootchartgui/pybootchartgui.py                  | 2 +-
 16 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/bitbake/lib/progressbar.py b/bitbake/lib/progressbar.py
index b668647..114cdc1 100644
--- a/bitbake/lib/progressbar.py
+++ b/bitbake/lib/progressbar.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python
 # -*- coding: iso-8859-1 -*-
 #
 # progressbar  - Text progressbar library for python.
diff --git a/scripts/lib/wic/conf.py b/scripts/lib/wic/conf.py
index d5419f8..be34355 100644
--- a/scripts/lib/wic/conf.py
+++ b/scripts/lib/wic/conf.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/wic/creator.py b/scripts/lib/wic/creator.py
index a4b19ac..2219377 100644
--- a/scripts/lib/wic/creator.py
+++ b/scripts/lib/wic/creator.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/wic/imager/baseimager.py b/scripts/lib/wic/imager/baseimager.py
index 5bcd2f7..e830527 100644
--- a/scripts/lib/wic/imager/baseimager.py
+++ b/scripts/lib/wic/imager/baseimager.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2007 Red Hat  Inc.
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/wic/kickstart/__init__.py b/scripts/lib/wic/kickstart/__init__.py
index 4f5b778..6000982 100644
--- a/scripts/lib/wic/kickstart/__init__.py
+++ b/scripts/lib/wic/kickstart/__init__.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2007 Red Hat, Inc.
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/wic/kickstart/custom_commands/micboot.py b/scripts/lib/wic/kickstart/custom_commands/micboot.py
index 66d1678..d162142 100644
--- a/scripts/lib/wic/kickstart/custom_commands/micboot.py
+++ b/scripts/lib/wic/kickstart/custom_commands/micboot.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2008, 2009, 2010 Intel, Inc.
 #
diff --git a/scripts/lib/wic/kickstart/custom_commands/micpartition.py b/scripts/lib/wic/kickstart/custom_commands/micpartition.py
index 59a87fb..43d04f1 100644
--- a/scripts/lib/wic/kickstart/custom_commands/micpartition.py
+++ b/scripts/lib/wic/kickstart/custom_commands/micpartition.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Marko Saukko <marko.saukko@cybercom.com>
 #
diff --git a/scripts/lib/wic/msger.py b/scripts/lib/wic/msger.py
index 9afc85b..9f557e7 100644
--- a/scripts/lib/wic/msger.py
+++ b/scripts/lib/wic/msger.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 # vim: ai ts=4 sts=4 et sw=4
 #
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/wic/plugin.py b/scripts/lib/wic/plugin.py
index 61c5859..41a8017 100644
--- a/scripts/lib/wic/plugin.py
+++ b/scripts/lib/wic/plugin.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/wic/pluginbase.py b/scripts/lib/wic/pluginbase.py
index b8b3a46..e3de9ba 100644
--- a/scripts/lib/wic/pluginbase.py
+++ b/scripts/lib/wic/pluginbase.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/lib/wic/utils/errors.py b/scripts/lib/wic/utils/errors.py
index 86e230a..9410311 100644
--- a/scripts/lib/wic/utils/errors.py
+++ b/scripts/lib/wic/utils/errors.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2007 Red Hat, Inc.
 # Copyright (c) 2011 Intel, Inc.
diff --git a/scripts/lib/wic/utils/fs_related.py b/scripts/lib/wic/utils/fs_related.py
index 79cc1d5..ea9f85c 100644
--- a/scripts/lib/wic/utils/fs_related.py
+++ b/scripts/lib/wic/utils/fs_related.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2007, Red Hat, Inc.
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
diff --git a/scripts/lib/wic/utils/misc.py b/scripts/lib/wic/utils/misc.py
index 194b88f..6e56316 100644
--- a/scripts/lib/wic/utils/misc.py
+++ b/scripts/lib/wic/utils/misc.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2010, 2011 Intel Inc.
 #
diff --git a/scripts/lib/wic/utils/partitionedfs.py b/scripts/lib/wic/utils/partitionedfs.py
index 791f488..fb95cc7 100644
--- a/scripts/lib/wic/utils/partitionedfs.py
+++ b/scripts/lib/wic/utils/partitionedfs.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2009, 2010, 2011 Intel, Inc.
 # Copyright (c) 2007, 2008 Red Hat, Inc.
diff --git a/scripts/lib/wic/utils/runner.py b/scripts/lib/wic/utils/runner.py
index e740dad..2ae9f41 100644
--- a/scripts/lib/wic/utils/runner.py
+++ b/scripts/lib/wic/utils/runner.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python -tt
+#!/usr/bin/env python -tt
 #
 # Copyright (c) 2011 Intel, Inc.
 #
diff --git a/scripts/pybootchartgui/pybootchartgui.py b/scripts/pybootchartgui/pybootchartgui.py
index 947ce10..7ce1a5b 100755
--- a/scripts/pybootchartgui/pybootchartgui.py
+++ b/scripts/pybootchartgui/pybootchartgui.py
@@ -1,4 +1,4 @@
-#!/usr/bin/python
+#!/usr/bin/env python
 #
 #  This file is part of pybootchartgui.
 
-- 
2.1.2


