Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 251B5C00140
	for <webhook@archiver.kernel.org>; Wed, 10 Aug 2022 19:45:26 +0000 (UTC)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.web09.2828.1660160716304288796
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:45:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=VKonVLb3;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.45,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f45.google.com with SMTP id z12so18895360wrs.9
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Aug 2022 12:45:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc;
        bh=gVcHOTMPq82IVnJ2xUPnTLjsfQVNlAGaB9LysPUKyBY=;
        b=VKonVLb35feylw4Ck8HzWO+6K04BTK8MDAzwukPmFaOmopOV6Kp6ti1aqJ97IzgqOv
         8FLS2pMEBN+yquF8jkhQDhqh8TaqWqy1cqPU2lM19hTprHJxJ5wr+NW+6C5yKWaoU8y1
         RCM0mAKr6wdVPmZyuJ8uMj2g3LWeqaqqFQyzU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc;
        bh=gVcHOTMPq82IVnJ2xUPnTLjsfQVNlAGaB9LysPUKyBY=;
        b=hNNZxZlyjfdEyFzEgD/Opz1bNUNOGWlkSrstbyYUscWj/OB84ht8Uphuj+F88KoaVy
         EozqKjyUHM0dPsJTWGnZzUmV/76QOeEBv47hzRWAsgGt9ZrJ+gEv77Dqd8ea92rh8H3N
         rEeVGC7SxaevnzTnEk64PzJldRTzPnL/8UFSGJ1m7ZflFDYp+P5iaUISikxb83vmVyYb
         sR6KJrW9FD7eEFTfxuGmJ7LU80YE2GyWF77+dlA4IiPhjLKg/FT256qwDDgnksU+29M4
         TTrsorwUZKPulhZqz+MtPL36txZy7xbhq4D0yIWBdrD7orFT/3LFfwnrbyFk2Kzw+4SS
         wp+g==
X-Gm-Message-State: ACgBeo0XFsQEaRgJpo1J0a32bphEOx0vNKmzT1FWXTxj6X0QoUA7A/fj
	wgX+PMr7wvsRaWzKoxLJNcaV4cXBHmyiPw==
X-Google-Smtp-Source: 
 AA6agR7ZlSCurUwj1aSuxziBFetjGw5WpKcF7wYOXMxmgrUq+LK+TxXNVGdTOFIQdBF5iZpuk199pg==
X-Received: by 2002:a5d:48c8:0:b0:21e:5134:c78c with SMTP id
 p8-20020a5d48c8000000b0021e5134c78cmr17832532wrs.233.1660160714385;
        Wed, 10 Aug 2022 12:45:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:bdb5:cbd6:cc51:991])
        by smtp.gmail.com with ESMTPSA id
 l21-20020a1ced15000000b0039747cf8354sm3240823wmh.39.2022.08.10.12.45.13
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Aug 2022 12:45:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 3/5] scripts: Add copyright statements to files without one
Date: Wed, 10 Aug 2022 20:45:08 +0100
Message-Id: <20220810194510.484900-3-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
References: <20220810194510.484900-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Aug 2022 19:45:26 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169203

Where there isn't a copyright statement, add one to make it explicit.
Also drop editor config lines where they were present and add license
identifiers as MIT if there isn't one.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 scripts/autobuilder-worker-prereq-tests   | 2 ++
 scripts/bitbake-prserv-tool               | 2 ++
 scripts/bitbake-whatchanged               | 4 +---
 scripts/combo-layer-hook-default.sh       | 2 ++
 scripts/contrib/ddimage                   | 2 ++
 scripts/contrib/dialog-power-control      | 2 ++
 scripts/contrib/documentation-audit.sh    | 2 ++
 scripts/contrib/patchreview.py            | 2 ++
 scripts/contrib/test_build_time_worker.sh | 2 ++
 scripts/contrib/verify-homepage.py        | 2 ++
 scripts/cp-noerror                        | 2 ++
 scripts/gen-lockedsig-cache               | 3 +++
 scripts/git                               | 4 ++++
 scripts/oe-debuginfod                     | 2 ++
 scripts/oe-gnome-terminal-phonehome       | 2 ++
 scripts/oe-pkgdata-browser                | 5 +++++
 scripts/oe-pylint                         | 2 ++
 scripts/oe-setup-layers                   | 6 +++++-
 scripts/oe-time-dd-test.sh                | 4 ++++
 scripts/oe-trim-schemas                   | 2 ++
 scripts/oepydevshell-internal.py          | 2 ++
 scripts/pythondeps                        | 2 ++
 scripts/sstate-diff-machines.sh           | 2 ++
 scripts/sstate-sysroot-cruft.sh           | 2 ++
 scripts/sysroot-relativelinks.py          | 2 ++
 scripts/task-time                         | 2 ++
 scripts/verify-bashisms                   | 2 ++
 27 files changed, 64 insertions(+), 4 deletions(-)

diff --git a/scripts/autobuilder-worker-prereq-tests b/scripts/autobuilder-worker-prereq-tests
index 572227dccd1..54fd3c10041 100755
--- a/scripts/autobuilder-worker-prereq-tests
+++ b/scripts/autobuilder-worker-prereq-tests
@@ -1,5 +1,7 @@
 #!/bin/bash
 #
+# Copyright OpenEmbedded Contributors
+#
 # Script which can be run on new autobuilder workers to check all needed configuration is present.
 # Designed to be run in a repo where bitbake/oe-core are already present.
 #
diff --git a/scripts/bitbake-prserv-tool b/scripts/bitbake-prserv-tool
index e55d98c72e1..bed97bd8ac3 100755
--- a/scripts/bitbake-prserv-tool
+++ b/scripts/bitbake-prserv-tool
@@ -1,5 +1,7 @@
 #!/usr/bin/env bash
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/scripts/bitbake-whatchanged b/scripts/bitbake-whatchanged
index 6f4b268119b..cdb730dbdb9 100755
--- a/scripts/bitbake-whatchanged
+++ b/scripts/bitbake-whatchanged
@@ -1,7 +1,5 @@
 #!/usr/bin/env python3
-# ex:ts=4:sw=4:sts=4:et
-# -*- tab-width: 4; c-basic-offset: 4; indent-tabs-mode: nil -*-
-
+#
 # Copyright (c) 2013 Wind River Systems, Inc.
 #
 # SPDX-License-Identifier: GPL-2.0-only
diff --git a/scripts/combo-layer-hook-default.sh b/scripts/combo-layer-hook-default.sh
index 11547a98269..fb9651b31fd 100755
--- a/scripts/combo-layer-hook-default.sh
+++ b/scripts/combo-layer-hook-default.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Hook to add source component/revision info to commit message
diff --git a/scripts/contrib/ddimage b/scripts/contrib/ddimage
index 7f2ad112a62..70eee8ebea2 100755
--- a/scripts/contrib/ddimage
+++ b/scripts/contrib/ddimage
@@ -1,5 +1,7 @@
 #!/bin/sh
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/scripts/contrib/dialog-power-control b/scripts/contrib/dialog-power-control
index ad6070c3693..82c84baa1d4 100755
--- a/scripts/contrib/dialog-power-control
+++ b/scripts/contrib/dialog-power-control
@@ -1,5 +1,7 @@
 #!/bin/sh
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Simple script to show a manual power prompt for when you want to use
diff --git a/scripts/contrib/documentation-audit.sh b/scripts/contrib/documentation-audit.sh
index 36f7f3287c8..7197a2fcea7 100755
--- a/scripts/contrib/documentation-audit.sh
+++ b/scripts/contrib/documentation-audit.sh
@@ -1,5 +1,7 @@
 #!/bin/bash
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Perform an audit of which packages provide documentation and which
diff --git a/scripts/contrib/patchreview.py b/scripts/contrib/patchreview.py
index 85d2169ad13..b22cc07f0a5 100755
--- a/scripts/contrib/patchreview.py
+++ b/scripts/contrib/patchreview.py
@@ -1,5 +1,7 @@
 #! /usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/scripts/contrib/test_build_time_worker.sh b/scripts/contrib/test_build_time_worker.sh
index 478e8b0d03b..a2879d23367 100755
--- a/scripts/contrib/test_build_time_worker.sh
+++ b/scripts/contrib/test_build_time_worker.sh
@@ -1,5 +1,7 @@
 #!/bin/bash
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # This is an example script to be used in conjunction with test_build_time.sh
diff --git a/scripts/contrib/verify-homepage.py b/scripts/contrib/verify-homepage.py
index 7bffa78e238..a90b5010bc5 100755
--- a/scripts/contrib/verify-homepage.py
+++ b/scripts/contrib/verify-homepage.py
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # This script can be used to verify HOMEPAGE values for all recipes in
diff --git a/scripts/cp-noerror b/scripts/cp-noerror
index ab617c5d35a..13a098eee0b 100755
--- a/scripts/cp-noerror
+++ b/scripts/cp-noerror
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Allow copying of $1 to $2 but if files in $1 disappear during the copy operation,
diff --git a/scripts/gen-lockedsig-cache b/scripts/gen-lockedsig-cache
index cc674f9c1b0..023015ec41c 100755
--- a/scripts/gen-lockedsig-cache
+++ b/scripts/gen-lockedsig-cache
@@ -1,5 +1,8 @@
 #!/usr/bin/env python3
 #
+#
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/scripts/git b/scripts/git
index 644055e5401..689adbf9dda 100755
--- a/scripts/git
+++ b/scripts/git
@@ -1,5 +1,9 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 # Wrapper around 'git' that doesn't think we are root
 
 import os
diff --git a/scripts/oe-debuginfod b/scripts/oe-debuginfod
index 9e5482d8698..b5253102253 100755
--- a/scripts/oe-debuginfod
+++ b/scripts/oe-debuginfod
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: MIT
 #
 
diff --git a/scripts/oe-gnome-terminal-phonehome b/scripts/oe-gnome-terminal-phonehome
index b6b9a3867b2..1352a9872bf 100755
--- a/scripts/oe-gnome-terminal-phonehome
+++ b/scripts/oe-gnome-terminal-phonehome
@@ -1,5 +1,7 @@
 #!/bin/sh
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Gnome terminal won't tell us which PID a given command is run as 
diff --git a/scripts/oe-pkgdata-browser b/scripts/oe-pkgdata-browser
index a3a381923b7..c152c82b25a 100755
--- a/scripts/oe-pkgdata-browser
+++ b/scripts/oe-pkgdata-browser
@@ -1,4 +1,9 @@
 #! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 
 import os, sys, enum, ast
 
diff --git a/scripts/oe-pylint b/scripts/oe-pylint
index 7cc1ccb010e..5ad72838e97 100755
--- a/scripts/oe-pylint
+++ b/scripts/oe-pylint
@@ -1,5 +1,7 @@
 #!/bin/bash
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Run the pylint3 against our common python module spaces and print a report of potential issues
diff --git a/scripts/oe-setup-layers b/scripts/oe-setup-layers
index 39cc16a30da..08ec97048fb 100755
--- a/scripts/oe-setup-layers
+++ b/scripts/oe-setup-layers
@@ -1,11 +1,15 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+
 # This file was copied from poky(or oe-core)/scripts/oe-setup-layers by running
 #
 # bitbake-layers create-layers-setup destdir
 #
 # It is recommended that you do not modify this file directly, but rather re-run the above command to get the freshest upstream copy.
-#
 
 import argparse
 import json
diff --git a/scripts/oe-time-dd-test.sh b/scripts/oe-time-dd-test.sh
index 386de83dcef..81748b8c9e4 100755
--- a/scripts/oe-time-dd-test.sh
+++ b/scripts/oe-time-dd-test.sh
@@ -1,5 +1,9 @@
 #!/bin/bash
 #
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
 # oe-time-dd-test records how much time it takes to 
 # write <count> number of kilobytes to the filesystem.
 # It also records the number of processes that are in
diff --git a/scripts/oe-trim-schemas b/scripts/oe-trim-schemas
index bf77c8cf643..e3b26e273e2 100755
--- a/scripts/oe-trim-schemas
+++ b/scripts/oe-trim-schemas
@@ -1,5 +1,7 @@
 #! /usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/scripts/oepydevshell-internal.py b/scripts/oepydevshell-internal.py
index e3c35bbe2cd..3bf7df1114f 100755
--- a/scripts/oepydevshell-internal.py
+++ b/scripts/oepydevshell-internal.py
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/scripts/pythondeps b/scripts/pythondeps
index be21dd84ebc..48277ec28ad 100755
--- a/scripts/pythondeps
+++ b/scripts/pythondeps
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Determine dependencies of python scripts or available python modules in a search path.
diff --git a/scripts/sstate-diff-machines.sh b/scripts/sstate-diff-machines.sh
index 8b64e11be1c..5ed413b2ee7 100755
--- a/scripts/sstate-diff-machines.sh
+++ b/scripts/sstate-diff-machines.sh
@@ -1,5 +1,7 @@
 #!/bin/bash
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Used to compare sstate checksums between MACHINES.
diff --git a/scripts/sstate-sysroot-cruft.sh b/scripts/sstate-sysroot-cruft.sh
index 9c948e932de..b2002badfbe 100755
--- a/scripts/sstate-sysroot-cruft.sh
+++ b/scripts/sstate-sysroot-cruft.sh
@@ -1,5 +1,7 @@
 #!/bin/sh
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 # Used to find files installed in sysroot which are not tracked by sstate manifest
diff --git a/scripts/sysroot-relativelinks.py b/scripts/sysroot-relativelinks.py
index 56e36f3ad54..ccb3c867f01 100755
--- a/scripts/sysroot-relativelinks.py
+++ b/scripts/sysroot-relativelinks.py
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/scripts/task-time b/scripts/task-time
index bcd1e258175..8f71b29b774 100755
--- a/scripts/task-time
+++ b/scripts/task-time
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
diff --git a/scripts/verify-bashisms b/scripts/verify-bashisms
index ec2374f183e..fc3677c6ed0 100755
--- a/scripts/verify-bashisms
+++ b/scripts/verify-bashisms
@@ -1,5 +1,7 @@
 #!/usr/bin/env python3
 #
+# Copyright OpenEmbedded Contributors
+#
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-- 
2.34.1


