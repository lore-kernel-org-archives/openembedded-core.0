Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23675C5B55F
	for <webhook@archiver.kernel.org>; Mon, 20 Nov 2023 16:39:33 +0000 (UTC)
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web10.611.1700498369525046673
 for <openembedded-core@lists.openembedded.org>;
 Mon, 20 Nov 2023 08:39:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=TCWQldEc;
 spf=softfail (domain: sakoman.com, ip: 209.85.210.176, mailfrom: steve@sakoman.com)
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6cb66f23eddso1135226b3a.0
        for <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1700498368; x=1701103168; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DxKf9iy847YC1nrQNG1Tsf/SzmsneK0BLB0jvcivbuo=;
        b=TCWQldEc9Hsdy3tH3MooeKishqy5LnDLCbi30QcRalvv3LshpMBUfGmQlzFRmwqbCV
         mSKcivW/wooaO0JRmcXam/t+mX7+7Nq0bZxZJgMYPEyS6i2WULw53GmMCKMfz8UyfqBl
         at9WJhIerqLYI4m1W87IR6t8+OjvrEYJnEyC0R2EfRpGarYVehuuF5gu/qsZFal9sQdl
         paKsR/MsRQMwmGMDD5jCBvtwjpSHPkawtAXKxVaBptrltOlwLralhfWQGvO452zPZ/LU
         3Nc25FMN0tD/+lbA6tLwLj0ZIXCGaapVhRrFRJAawCeNgdoLToFPWLq7KSBDFME3khRi
         qoKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700498368; x=1701103168;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DxKf9iy847YC1nrQNG1Tsf/SzmsneK0BLB0jvcivbuo=;
        b=cIbLT5j/LMCUtgIXVJP5GeGdvf1JNj1gtxB0ZE8cEek46cwvXb1Woe+Vx2rrTZJ3BX
         voHnN1ahZdnLsobfD0aa9QGpfNEi5lJe3MPQXIcv1ZqBxVaxTkz2lpf0NGxxiL5SXavW
         IJte2Es+cSa2PSnDNqDR70GHVPJiSbm8kputRqrQd3dgB6kZNofHwLdFXWbTniePA01Z
         FoYb8tKrZMfMQ7HnZcXpnHNWo9ZBHk6QkOBhuEjcnb/DQ2cbVn06h/E4fBAEmZdWqaR7
         05rFi34a5EfRBDrMUgdcDJU6sewvToi5F6LkVUp8MrK8CxC1adCEFH9gadCbPj2kXh+y
         RVbQ==
X-Gm-Message-State: AOJu0YyNKmJKonZTDrJjUe/TcKbEyZaLJaty7QpwKMc0nttUiuH0x1ON
	VEUgRPI3b4BIplG/Wy1b+FUXMcbJJP1qMgFUOuU+og==
X-Google-Smtp-Source: AGHT+IFftazldvpY6UJNeLYExSgV+uiWhz802FfSAqQUsa2696mLGVJsflPS22RedL8FNu2rRDOurw==
X-Received: by 2002:a05:6a00:27aa:b0:6cb:a8dc:26ed with SMTP id bd42-20020a056a0027aa00b006cba8dc26edmr2678485pfb.16.1700498368287;
        Mon, 20 Nov 2023 08:39:28 -0800 (PST)
Received: from hexa.lan (dhcp-72-234-108-41.hawaiiantel.net. [72.234.108.41])
        by smtp.gmail.com with ESMTPSA id o23-20020a634e57000000b005c215baacc1sm4899279pgl.70.2023.11.20.08.39.27
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 08:39:27 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][nanbield 17/33] patchtest: remove unused imports
Date: Mon, 20 Nov 2023 06:38:31 -1000
Message-Id: <48b07348a8601129c591dd42cf6af6dc7844d33d.1700496737.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1700496737.git.steve@sakoman.com>
References: <cover.1700496737.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 20 Nov 2023 16:39:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/190906

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit be8429d986335aae65c2426862b97836ba46e42a)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/patchtest/data.py                             | 1 -
 meta/lib/patchtest/repo.py                             | 1 -
 meta/lib/patchtest/tests/test_mbox_cve.py              | 1 -
 meta/lib/patchtest/tests/test_mbox_mailinglist.py      | 1 -
 meta/lib/patchtest/tests/test_metadata_src_uri.py      | 1 -
 meta/lib/patchtest/tests/test_patch_cve.py             | 1 -
 meta/lib/patchtest/tests/test_patch_upstream_status.py | 1 -
 meta/lib/patchtest/utils.py                            | 1 -
 scripts/patchtest                                      | 1 -
 scripts/patchtest-get-branch                           | 1 -
 10 files changed, 10 deletions(-)

diff --git a/meta/lib/patchtest/data.py b/meta/lib/patchtest/data.py
index 25a9a57dfb..356259921d 100644
--- a/meta/lib/patchtest/data.py
+++ b/meta/lib/patchtest/data.py
@@ -16,7 +16,6 @@
 import os
 import argparse
 import collections
-import tempfile
 import logging
 
 logger=logging.getLogger('patchtest')
diff --git a/meta/lib/patchtest/repo.py b/meta/lib/patchtest/repo.py
index 8a11af5fd6..d3788f466d 100644
--- a/meta/lib/patchtest/repo.py
+++ b/meta/lib/patchtest/repo.py
@@ -11,7 +11,6 @@
 import os
 import utils
 import logging
-import json
 from patch import PatchTestPatch
 
 logger = logging.getLogger('patchtest')
diff --git a/meta/lib/patchtest/tests/test_mbox_cve.py b/meta/lib/patchtest/tests/test_mbox_cve.py
index 31faeb5ef5..29ab12cbb5 100644
--- a/meta/lib/patchtest/tests/test_mbox_cve.py
+++ b/meta/lib/patchtest/tests/test_mbox_cve.py
@@ -6,7 +6,6 @@
 #
 
 import base
-import os
 import parse_cve_tags
 import pyparsing
 
diff --git a/meta/lib/patchtest/tests/test_mbox_mailinglist.py b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
index 0ffb6056c0..feff436089 100644
--- a/meta/lib/patchtest/tests/test_mbox_mailinglist.py
+++ b/meta/lib/patchtest/tests/test_mbox_mailinglist.py
@@ -4,7 +4,6 @@
 #
 # SPDX-License-Identifier: GPL-2.0-only
 
-import subprocess
 import collections
 import base
 import pyparsing
diff --git a/meta/lib/patchtest/tests/test_metadata_src_uri.py b/meta/lib/patchtest/tests/test_metadata_src_uri.py
index 01d8a45103..87a24ea937 100644
--- a/meta/lib/patchtest/tests/test_metadata_src_uri.py
+++ b/meta/lib/patchtest/tests/test_metadata_src_uri.py
@@ -4,7 +4,6 @@
 #
 # SPDX-License-Identifier: GPL-2.0-only
 
-import subprocess
 import base
 import os
 import pyparsing
diff --git a/meta/lib/patchtest/tests/test_patch_cve.py b/meta/lib/patchtest/tests/test_patch_cve.py
index c0c7e742ee..c77848de45 100644
--- a/meta/lib/patchtest/tests/test_patch_cve.py
+++ b/meta/lib/patchtest/tests/test_patch_cve.py
@@ -6,7 +6,6 @@
 #
 
 import base
-import os
 import pyparsing
 
 class CVE(base.Base):
diff --git a/meta/lib/patchtest/tests/test_patch_upstream_status.py b/meta/lib/patchtest/tests/test_patch_upstream_status.py
index 957817ba8d..a5b278304e 100644
--- a/meta/lib/patchtest/tests/test_patch_upstream_status.py
+++ b/meta/lib/patchtest/tests/test_patch_upstream_status.py
@@ -7,7 +7,6 @@
 import base
 import parse_upstream_status
 import pyparsing
-import os
 
 class PatchUpstreamStatus(base.Base):
 
diff --git a/meta/lib/patchtest/utils.py b/meta/lib/patchtest/utils.py
index 8dcac30941..a4a523b4e2 100644
--- a/meta/lib/patchtest/utils.py
+++ b/meta/lib/patchtest/utils.py
@@ -11,7 +11,6 @@
 import os
 import subprocess
 import logging
-import sys
 import re
 import mailbox
 
diff --git a/scripts/patchtest b/scripts/patchtest
index 7b47d45dce..a1c824f7b7 100755
--- a/scripts/patchtest
+++ b/scripts/patchtest
@@ -12,7 +12,6 @@
 import sys
 import os
 import unittest
-import fileinput
 import logging
 import traceback
 import json
diff --git a/scripts/patchtest-get-branch b/scripts/patchtest-get-branch
index 962f572b20..b5fb2b0f04 100755
--- a/scripts/patchtest-get-branch
+++ b/scripts/patchtest-get-branch
@@ -15,7 +15,6 @@ import mailbox
 import argparse
 import re
 import git
-import sys
 
 re_prefix = re.compile("(\[.*\])", re.DOTALL)
 
-- 
2.34.1


