Return-Path: <tgamblin@baylibre.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE7B7CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 13:25:58 +0000 (UTC)
Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
 by mx.groups.io with SMTP id smtpd.web10.215273.1697549148716938533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Oct 2023 06:25:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre-com.20230601.gappssmtp.com header.s=20230601 header.b=NZqBHg9x;
 spf=pass (domain: baylibre.com, ip: 209.85.222.180, mailfrom: tgamblin@baylibre.com)
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7788ebea620so11379485a.3
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 06:25:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1697549147; x=1698153947; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=BTFgsbyzRnJi5o+WmVAoEvU4bGZY4+B1Ub4KMwyUYS4=;
        b=NZqBHg9xAk32S/gT1la4W2+lWP5MaBZsWsF2NZ+aQrkwjvNKlV7b+F/2JlbPUKEtKP
         RZ6bNyE90HZjNYF9asB5nSqOKdY1dRnTdIyjhY1F+n7oVpgYVCbrrqQ3BI1HxkqD0Tt2
         M0Ul71qB3vcFk7Cs4CmFWu5Unjdw5d/cLcAfEh8b+hi8Yyp20BHhR+g/jEQHkNE0Pm0u
         p1zmCjF2motGtoAJDNdMNCfmmYOg7kCivogC1yiSFWk5qMA8bD6JW9wPSqDkjvKgslnm
         vFMGanolUgneKCkbcYcJ51ERaahAo4pY3uBgXTMzehwxM+uTmWlW1vGK+8HXYelWJi/u
         b8dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697549147; x=1698153947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BTFgsbyzRnJi5o+WmVAoEvU4bGZY4+B1Ub4KMwyUYS4=;
        b=pwIdDZsGqHzaLdGaa3300AI5XX919Z1QU15BwvzHizJ6aK37QG7HqFQLcIsA/HTS0v
         HtCerTZIe36bHvvKs7j2xDtKwgotUvFmVb0GSx5K1M9rGwuAq91ReuRVXxhIoYFTM9zK
         prtTM4mOgD0/P7HaGR5kJWa0dnLCm4b0d/xVAUxFhT1AeagFE3DBOTeiANacQMY5FnNi
         9/mK/PMr4/5vU9nLmRMWbYWRYiWMqeiQDg2kk+Ug1mEZ0l2w7ryaudsnCvPLikW2DeVU
         jByDuw/nfZmU4V+Z8PEYXPoWgrn6MTjqkvcwaSKMHCDfL7wIbJw7WyvPGOusGncs4Ql7
         xo9Q==
X-Gm-Message-State: AOJu0YwNKtmyG+39kCuJLRiCex7EqdCOjbqCfsBPdNXWGiRFLdG9PAjI
	AOtPn9GjdkuF5C8jaDUztnZwqVetVAGagEy9gCL9CA==
X-Google-Smtp-Source: AGHT+IF/Gt7kiXd0wcGkmDBtRbITKn6hYVWpUQ6K/78qIPIz9Di7ZvAwdN0XjOF1GyFEjUJ4kd1f8Q==
X-Received: by 2002:a05:620a:3c8f:b0:76d:2f15:56a9 with SMTP id tp15-20020a05620a3c8f00b0076d2f1556a9mr1794795qkn.31.1697549147279;
        Tue, 17 Oct 2023 06:25:47 -0700 (PDT)
Received: from megalith.cgocable.net ([2001:1970:5b1f:ab00:fc4e:ec42:7e5d:48dd])
        by smtp.gmail.com with ESMTPSA id oo20-20020a05620a531400b0076e1e2d6496sm630666qkn.104.2023.10.17.06.25.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Oct 2023 06:25:46 -0700 (PDT)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][PATCH] patchtest: update SPDX identifiers
Date: Tue, 17 Oct 2023 09:25:45 -0400
Message-ID: <20231017132545.2248267-1-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 17 Oct 2023 13:25:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189325

Replace full license headers with SPDX identifiers and adjust all
patchtest-related code to use GPL-2.0-only.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 meta/lib/patchtest/data.py                      | 15 +--------------
 meta/lib/patchtest/patch.py                     | 13 +------------
 meta/lib/patchtest/repo.py                      | 12 +-----------
 meta/lib/patchtest/selftest/selftest            |  2 +-
 meta/lib/patchtest/tests/base.py                |  2 +-
 meta/lib/patchtest/tests/pyparsing/common.py    |  2 +-
 .../patchtest/tests/pyparsing/parse_cve_tags.py |  2 +-
 .../patchtest/tests/pyparsing/parse_shortlog.py |  2 +-
 .../tests/pyparsing/parse_signed_off_by.py      |  2 +-
 .../tests/pyparsing/parse_upstream_status.py    |  2 +-
 meta/lib/patchtest/tests/test_mbox_author.py    |  2 +-
 meta/lib/patchtest/tests/test_mbox_bugzilla.py  |  2 +-
 meta/lib/patchtest/tests/test_mbox_cve.py       | 14 +-------------
 .../patchtest/tests/test_mbox_description.py    |  2 +-
 meta/lib/patchtest/tests/test_mbox_format.py    |  2 +-
 .../patchtest/tests/test_mbox_mailinglist.py    |  2 +-
 meta/lib/patchtest/tests/test_mbox_merge.py     |  2 +-
 meta/lib/patchtest/tests/test_mbox_shortlog.py  |  2 +-
 .../patchtest/tests/test_mbox_signed_off_by.py  |  2 +-
 .../tests/test_metadata_lic_files_chksum.py     |  2 +-
 .../patchtest/tests/test_metadata_license.py    |  2 +-
 .../patchtest/tests/test_metadata_max_length.py |  2 +-
 .../patchtest/tests/test_metadata_src_uri.py    |  2 +-
 .../patchtest/tests/test_metadata_summary.py    |  2 +-
 meta/lib/patchtest/tests/test_patch_cve.py      | 14 +-------------
 .../patchtest/tests/test_patch_signed_off_by.py |  2 +-
 .../tests/test_patch_upstream_status.py         |  2 +-
 meta/lib/patchtest/tests/test_python_pylint.py  |  2 +-
 meta/lib/patchtest/utils.py                     | 12 +-----------
 scripts/patchtest                               | 15 +--------------
 scripts/patchtest-get-branch                    | 12 +-----------
 scripts/patchtest-get-series                    | 12 +-----------
 scripts/patchtest-send-results                  | 17 ++---------------
 scripts/patchtest-setup-sharedir                | 14 +-------------
 34 files changed, 35 insertions(+), 161 deletions(-)

diff --git a/meta/lib/patchtest/data.py b/meta/lib/patchtest/data.py
index 12f36aa14d9..25a9a57dfb1 100644
--- a/meta/lib/patchtest/data.py
+++ b/meta/lib/patchtest/data.py
@@ -6,20 +6,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Author: Leo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+# SPDX-License-Identifier: GPL-2.0-only
 #
 # NOTE: Strictly speaking, unit test should be isolated from outside,
 #       but patchtest test suites uses command line input data and
diff --git a/meta/lib/patchtest/patch.py b/meta/lib/patchtest/patch.py
index c0e7d579eba..baf62838730 100644
--- a/meta/lib/patchtest/patch.py
+++ b/meta/lib/patchtest/patch.py
@@ -5,18 +5,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import logging
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 5c85c65ffb8..8a11af5fd66 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -5,18 +5,8 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
 import utils
diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index f8985314f5e..79b12542488 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -4,7 +4,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import os
 import subprocess
diff --git a/meta/lib/patchtest/tests/base.py b/meta/lib/patchtest/tests/base.py
index 27db380353c..aecbbc4aae5 100644
--- a/meta/lib/patchtest/tests/base.py
+++ b/meta/lib/patchtest/tests/base.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import unittest
 import logging
diff --git a/meta/lib/patchtest/tests/pyparsing/common.py b/meta/lib/patchtest/tests/pyparsing/common.py
index 9d37b0403d1..cbce4c38bc8 100644
--- a/meta/lib/patchtest/tests/pyparsing/common.py
+++ b/meta/lib/patchtest/tests/pyparsing/common.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import pyparsing
 
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py b/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
index dd7131a650c..f7fb82ec2bd 100644
--- a/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
+++ b/meta/lib/patchtest/tests/pyparsing/parse_cve_tags.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 
 import pyparsing
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py b/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
index 26e9612c4a5..30d3ab35b32 100644
--- a/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
+++ b/meta/lib/patchtest/tests/pyparsing/parse_shortlog.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 # NOTE:This is an oversimplified syntax of the mbox's summary
 
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py b/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
index c8a43515515..692ebec3ffc 100644
--- a/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
+++ b/meta/lib/patchtest/tests/pyparsing/parse_signed_off_by.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 
 import pyparsing
diff --git a/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py b/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
index d63567efbe1..bc6c427c4ce 100644
--- a/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
+++ b/meta/lib/patchtest/tests/pyparsing/parse_upstream_status.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 
 import common
diff --git a/meta/lib/patchtest/tests/test_mbox_author.py b/meta/lib/patchtest/tests/test_mbox_author.py
index e68e7a5ac4d..74bc441250a 100644
--- a/meta/lib/patchtest/tests/test_mbox_author.py
+++ b/meta/lib/patchtest/tests/test_mbox_author.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 import pyparsing
diff --git a/meta/lib/patchtest/tests/test_mbox_bugzilla.py b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
index adf46b5d59b..99b529b7559 100644
--- a/meta/lib/patchtest/tests/test_mbox_bugzilla.py
+++ b/meta/lib/patchtest/tests/test_mbox_bugzilla.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import pyparsing
 import base
diff --git a/meta/lib/patchtest/tests/test_mbox_cve.py b/meta/lib/patchtest/tests/test_mbox_cve.py
index af3712c1928..31faeb5ef5a 100644
--- a/meta/lib/patchtest/tests/test_mbox_cve.py
+++ b/meta/lib/patchtest/tests/test_mbox_cve.py
@@ -2,20 +2,8 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-
-# SPDX-License-Identifier: GPL-2.0-or-later
 
 import base
 import os
diff --git a/meta/lib/patchtest/tests/test_mbox_description.py b/meta/lib/patchtest/tests/test_mbox_description.py
index 46bedd46ce5..7874f9d0382 100644
--- a/meta/lib/patchtest/tests/test_mbox_description.py
+++ b/meta/lib/patchtest/tests/test_mbox_description.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 
diff --git a/meta/lib/patchtest/tests/test_mbox_format.py b/meta/lib/patchtest/tests/test_mbox_format.py
index c9e04658356..fea3793e2e4 100644
--- a/meta/lib/patchtest/tests/test_mbox_format.py
+++ b/meta/lib/patchtest/tests/test_mbox_format.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 
diff --git a/meta/lib/patchtest/tests/test_mbox_mailinglist.py b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
index c02c71ac6a7..0ffb6056c08 100644
--- a/meta/lib/patchtest/tests/test_mbox_mailinglist.py
+++ b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2017 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import subprocess
 import collections
diff --git a/meta/lib/patchtest/tests/test_mbox_merge.py b/meta/lib/patchtest/tests/test_mbox_merge.py
index a7e0821e726..bc55c588b40 100644
--- a/meta/lib/patchtest/tests/test_mbox_merge.py
+++ b/meta/lib/patchtest/tests/test_mbox_merge.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import subprocess
 import base
diff --git a/meta/lib/patchtest/tests/test_mbox_shortlog.py b/meta/lib/patchtest/tests/test_mbox_shortlog.py
index 7cc71562f6b..f5dbbc7807b 100644
--- a/meta/lib/patchtest/tests/test_mbox_shortlog.py
+++ b/meta/lib/patchtest/tests/test_mbox_shortlog.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 import parse_shortlog
diff --git a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
index 59a89bd1bc4..f3c57709619 100644
--- a/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
+++ b/meta/lib/patchtest/tests/test_mbox_signed_off_by.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 import parse_signed_off_by
diff --git a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
index 784d432f018..b2c32507ffe 100644
--- a/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
+++ b/meta/lib/patchtest/tests/test_metadata_lic_files_chksum.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 import pyparsing
diff --git a/meta/lib/patchtest/tests/test_metadata_license.py b/meta/lib/patchtest/tests/test_metadata_license.py
index e49331603ce..a5bc03b83fe 100644
--- a/meta/lib/patchtest/tests/test_metadata_license.py
+++ b/meta/lib/patchtest/tests/test_metadata_license.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 import os
diff --git a/meta/lib/patchtest/tests/test_metadata_max_length.py b/meta/lib/patchtest/tests/test_metadata_max_length.py
index 477a9bff57f..98c48ef7874 100644
--- a/meta/lib/patchtest/tests/test_metadata_max_length.py
+++ b/meta/lib/patchtest/tests/test_metadata_max_length.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 import pyparsing
diff --git a/meta/lib/patchtest/tests/test_metadata_src_uri.py b/meta/lib/patchtest/tests/test_metadata_src_uri.py
index c19582ec2df..01d8a451037 100644
--- a/meta/lib/patchtest/tests/test_metadata_src_uri.py
+++ b/meta/lib/patchtest/tests/test_metadata_src_uri.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import subprocess
 import base
diff --git a/meta/lib/patchtest/tests/test_metadata_summary.py b/meta/lib/patchtest/tests/test_metadata_summary.py
index 8bcea453c25..1502863df02 100644
--- a/meta/lib/patchtest/tests/test_metadata_summary.py
+++ b/meta/lib/patchtest/tests/test_metadata_summary.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 from data import PatchTestInput
diff --git a/meta/lib/patchtest/tests/test_patch_cve.py b/meta/lib/patchtest/tests/test_patch_cve.py
index 0ae85adcf9c..c0c7e742ee1 100644
--- a/meta/lib/patchtest/tests/test_patch_cve.py
+++ b/meta/lib/patchtest/tests/test_patch_cve.py
@@ -2,20 +2,8 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-
-# SPDX-License-Identifier: GPL-2.0-or-later
 
 import base
 import os
diff --git a/meta/lib/patchtest/tests/test_patch_signed_off_by.py b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
index 2df6419d264..b091ff6f105 100644
--- a/meta/lib/patchtest/tests/test_patch_signed_off_by.py
+++ b/meta/lib/patchtest/tests/test_patch_signed_off_by.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 import parse_signed_off_by
diff --git a/meta/lib/patchtest/tests/test_patch_upstream_status.py b/meta/lib/patchtest/tests/test_patch_upstream_status.py
index c21aeaf28fd..957817ba8d9 100644
--- a/meta/lib/patchtest/tests/test_patch_upstream_status.py
+++ b/meta/lib/patchtest/tests/test_patch_upstream_status.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 import parse_upstream_status
diff --git a/meta/lib/patchtest/tests/test_python_pylint.py b/meta/lib/patchtest/tests/test_python_pylint.py
index 907bd9eef4a..9cfc491a134 100644
--- a/meta/lib/patchtest/tests/test_python_pylint.py
+++ b/meta/lib/patchtest/tests/test_python_pylint.py
@@ -2,7 +2,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# SPDX-License-Identifier: GPL-2.0
+# SPDX-License-Identifier: GPL-2.0-only
 
 import base
 from data import PatchTestInput
diff --git a/meta/lib/patchtest/utils.py b/meta/lib/patchtest/utils.py
index 23428ae1c5e..8dcac30941e 100644
--- a/meta/lib/patchtest/utils.py
+++ b/meta/lib/patchtest/utils.py
@@ -5,18 +5,8 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import os
 import subprocess
diff --git a/scripts/patchtest b/scripts/patchtest
index b25ef183216..642486b8c7f 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -6,20 +6,7 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Author: Leo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
+# SPDX-License-Identifier: GPL-2.0-only
 #
 
 import sys
diff --git a/scripts/patchtest-get-branch b/scripts/patchtest-get-branch
index 9415de98efb..962f572b20c 100755
--- a/scripts/patchtest-get-branch
+++ b/scripts/patchtest-get-branch
@@ -8,18 +8,8 @@
 #
 # Copyright (C) 2016 Intel Corporation
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 import mailbox
 import argparse
diff --git a/scripts/patchtest-get-series b/scripts/patchtest-get-series
index 773701f80b5..908442089ff 100755
--- a/scripts/patchtest-get-series
+++ b/scripts/patchtest-get-series
@@ -4,18 +4,8 @@
 #
 # Copyright (C) 2023 BayLibre Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 
 # the interval into the past which we want to check for new series, in minutes
 INTERVAL_MINUTES=30
diff --git a/scripts/patchtest-send-results b/scripts/patchtest-send-results
index 2a2c57a10e0..15ee5b077fc 100755
--- a/scripts/patchtest-send-results
+++ b/scripts/patchtest-send-results
@@ -9,21 +9,8 @@
 #
 # Copyright (C) 2023 BayLibre Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
-#
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Author: Trevor Gamblin <tgamblin@baylibre.com>
-#
+# SPDX-License-Identifier: GPL-2.0-only
+# 
 
 import argparse
 import boto3
diff --git a/scripts/patchtest-setup-sharedir b/scripts/patchtest-setup-sharedir
index a1497987cb1..277677e5279 100755
--- a/scripts/patchtest-setup-sharedir
+++ b/scripts/patchtest-setup-sharedir
@@ -6,20 +6,8 @@
 #
 # Copyright (C) 2023 BayLibre Inc.
 #
-# This program is free software; you can redistribute it and/or modify
-# it under the terms of the GNU General Public License version 2 as
-# published by the Free Software Foundation.
+# SPDX-License-Identifier: GPL-2.0-only
 #
-# This program is distributed in the hope that it will be useful,
-# but WITHOUT ANY WARRANTY; without even the implied warranty of
-# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-# GNU General Public License for more details.
-#
-# You should have received a copy of the GNU General Public License along
-# with this program; if not, write to the Free Software Foundation, Inc.,
-# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
-#
-# Author: Trevor Gamblin <tgamblin@baylibre.com>
 
 # poky repository
 POKY_REPO="https://git.yoctoproject.org/poky"
-- 
2.41.0


