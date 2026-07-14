Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F40C4450D
	for <webhook@archiver.kernel.org>; Tue, 14 Jul 2026 19:04:19 +0000 (UTC)
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.1657.1784055855576136514
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Jul 2026 12:04:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=XQ+aoUf1;
 spf=pass (domain: gmail.com, ip: 209.85.160.54, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-4472500e25fso2256978fac.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 12:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784055855; x=1784660655; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Pi4/ryKBVPflVsFdajeMnwoWzrRBrJEW4iBcNy6E3IQ=;
        b=XQ+aoUf1sQbQu30DeWbZyIBLe0ffixZS/Vwa84hURxX//vPdMuesQwt88s0wZb7Nt4
         cHtYi+YwvbTt7MO+skyOkf+qi8UBLlnTadNE277S9J3GHdl4Z2tfhcM3k8yLiQl71uLG
         k7xtMIF14aS/BF467BsJO1mIjf6zUoXFFuo4vDjL/q8M1ZlGr7wQKvsjQa88BrxupNgz
         KX9/5BlxFedzgyesZ20ExlxnBvVm0Rib8xbmG51ID2Er2Y9VljVi6Q5uj7sd2fbvp9FS
         lL8LNYT+wfarWhFpd8LTC5Sk5kHdY6G517bbxXfDK0TnVZ7NVXE4XzJhaPNf9T9cGv26
         dc9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784055855; x=1784660655;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Pi4/ryKBVPflVsFdajeMnwoWzrRBrJEW4iBcNy6E3IQ=;
        b=i/S7xnUeqHQZiE750DSlKGmwzi7LTUN9xugU3Xpb8aCR4/mXBdMBSK/elK1WryfrJp
         wOsB9H7ZsVsDO7wnBfcs8/MycymZUX0OwAVudW6wWqY3+WVji8otN0u9JsgejA65aUvi
         K1f6EfPrvg2yKdYpPibTGTFbX0I3iDXPIdOQLRFFw081Q6O4KijKp4UQXBCxF4sx9jBG
         rxq5j8wXL6oc46et5JDkv9hjzw/pdFYm0OyqqUMjjydGt5Hn5CTowsRR6/zXHNHkfLqt
         Pm77QYm5qygzuOmcEXQH0jOhOLxdoYIJPX5uCCG5e2+rW8aSenDM+9rURm4Fkp5M8dtH
         7Hxg==
X-Gm-Message-State: AOJu0Yy2x14aRl+HNctHR/XGVnq79q3kClIUExw+Gwyee4t4YXSEFmpY
	SWnSaGw7MODbsxfx7RHGFtkKUy+Yu9mWB94/RE4g2xgwOhBStSglyVPBfLbqaQ==
X-Gm-Gg: AfdE7cmc2jzTZIyZd1WBzyipdhaZ0SZlhMfhJMhlTNlb0/b4RJFQAOhvayCh7CQHYkL
	Zn1kPy1kqKdOEDzFfe1wqa8D10cLBJdaecu5wbjgmUzRzZF6B2VUj2XbrMQ+DtqXcwhGg/WtosP
	TsZoi84iijYwZpIWSvdNj21n/hfAtv2qJfwsPk0hG5dH8tdRjTDhx5aU29UtSpzpriP4O7N1+5j
	nirOjjotgZNyoMp1wKnRaiuZDWgscI/KJTxq+5CbTPLTi8M6SHKYofw4JP04JKPS7q1ZzbO6cQ6
	Yq9rC8G4WM1bBi91GFi/ecXLYD7/ntXX1r/RRnO01STEDaH3lkxGByJJPqOeYgptoI2LoyD0K6E
	TOMkGhI4HAV2NuMSzNkTDAIF09SU19t0a3KdX5SevlInhZJiZoc7AGNyfo8ypbOMp+E/cD2wTLv
	mTYb+cjLV04w==
X-Received: by 2002:a05:6870:4788:b0:448:7da5:4468 with SMTP id 586e51a60fabf-4562b222ddemr36788fac.7.1784055854648;
        Tue, 14 Jul 2026 12:04:14 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::7b52])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451916f31d4sm17695629fac.16.2026.07.14.12.04.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 12:04:14 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH 07/22] convert-spdx-licenses: Convert to valid SPDX expressions
Date: Tue, 14 Jul 2026 12:31:17 -0600
Message-ID: <20260714190405.3328796-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260714190405.3328796-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Jul 2026 19:04:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/240914

Reworks the script to re-write LICENSE lines as valid SPDX license
expressions in addition to remapping the license names

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/contrib/convert-spdx-licenses.py | 254 +++++++++++++++--------
 1 file changed, 162 insertions(+), 92 deletions(-)

diff --git a/scripts/contrib/convert-spdx-licenses.py b/scripts/contrib/convert-spdx-licenses.py
index 13cf12a33f..39cbbb28e5 100755
--- a/scripts/contrib/convert-spdx-licenses.py
+++ b/scripts/contrib/convert-spdx-licenses.py
@@ -7,113 +7,175 @@
 # SPDX-License-Identifier: GPL-2.0-only
 #
 
-import re
+
+from abc import abstractmethod, ABC
+from enum import Enum
+from pathlib import Path
+import json
+import mimetypes
 import os
+import re
+import shutil
 import sys
 import tempfile
-import shutil
-import mimetypes
+
+THIS_DIR = Path(__file__).parent
+
+sys.path.insert(0, str(THIS_DIR.parent.parent / "meta" / "lib"))
+import oe.spdx_license
 
 if len(sys.argv) < 2:
     print("Please specify a directory to run the conversion script against.")
     sys.exit(1)
 
-license_map = {
-"AGPL-3" : "AGPL-3.0-only",
-"AGPL-3+" : "AGPL-3.0-or-later",
-"AGPLv3" : "AGPL-3.0-only",
-"AGPLv3+" : "AGPL-3.0-or-later",
-"AGPLv3.0" : "AGPL-3.0-only",
-"AGPLv3.0+" : "AGPL-3.0-or-later",
-"AGPL-3.0" : "AGPL-3.0-only",
-"AGPL-3.0+" : "AGPL-3.0-or-later",
-"BSD-0-Clause" : "0BSD",
-"GPL-1" : "GPL-1.0-only",
-"GPL-1+" : "GPL-1.0-or-later",
-"GPLv1" : "GPL-1.0-only",
-"GPLv1+" : "GPL-1.0-or-later",
-"GPLv1.0" : "GPL-1.0-only",
-"GPLv1.0+" : "GPL-1.0-or-later",
-"GPL-1.0" : "GPL-1.0-only",
-"GPL-1.0+" : "GPL-1.0-or-later",
-"GPL-2" : "GPL-2.0-only",
-"GPL-2+" : "GPL-2.0-or-later",
-"GPLv2" : "GPL-2.0-only",
-"GPLv2+" : "GPL-2.0-or-later",
-"GPLv2.0" : "GPL-2.0-only",
-"GPLv2.0+" : "GPL-2.0-or-later",
-"GPL-2.0" : "GPL-2.0-only",
-"GPL-2.0+" : "GPL-2.0-or-later",
-"GPL-3" : "GPL-3.0-only",
-"GPL-3+" : "GPL-3.0-or-later",
-"GPLv3" : "GPL-3.0-only",
-"GPLv3+" : "GPL-3.0-or-later",
-"GPLv3.0" : "GPL-3.0-only",
-"GPLv3.0+" : "GPL-3.0-or-later",
-"GPL-3.0" : "GPL-3.0-only",
-"GPL-3.0+" : "GPL-3.0-or-later",
-"LGPLv2" : "LGPL-2.0-only",
-"LGPLv2+" : "LGPL-2.0-or-later",
-"LGPLv2.0" : "LGPL-2.0-only",
-"LGPLv2.0+" : "LGPL-2.0-or-later",
-"LGPL-2.0" : "LGPL-2.0-only",
-"LGPL-2.0+" : "LGPL-2.0-or-later",
-"LGPL2.1" : "LGPL-2.1-only",
-"LGPL2.1+" : "LGPL-2.1-or-later",
-"LGPLv2.1" : "LGPL-2.1-only",
-"LGPLv2.1+" : "LGPL-2.1-or-later",
-"LGPL-2.1" : "LGPL-2.1-only",
-"LGPL-2.1+" : "LGPL-2.1-or-later",
-"LGPLv3" : "LGPL-3.0-only",
-"LGPLv3+" : "LGPL-3.0-or-later",
-"LGPL-3.0" : "LGPL-3.0-only",
-"LGPL-3.0+" : "LGPL-3.0-or-later",
-"MPL-1" : "MPL-1.0",
-"MPLv1" : "MPL-1.0",
-"MPLv1.1" : "MPL-1.1",
-"MPLv2" : "MPL-2.0",
-"MIT-X" : "MIT",
-"MIT-style" : "MIT",
-"openssl" : "OpenSSL",
-"PSF" : "PSF-2.0",
-"PSFv2" : "PSF-2.0",
-"Python-2" : "Python-2.0",
-"Apachev2" : "Apache-2.0",
-"Apache-2" : "Apache-2.0",
-"Artisticv1" : "Artistic-1.0",
-"Artistic-1" : "Artistic-1.0",
-"AFL-2" : "AFL-2.0",
-"AFL-1" : "AFL-1.2",
-"AFLv2" : "AFL-2.0",
-"AFLv1" : "AFL-1.2",
-"CDDLv1" : "CDDL-1.0",
-"CDDL-1" : "CDDL-1.0",
-"EPLv1.0" : "EPL-1.0",
-"FreeType" : "FTL",
-"Nauman" : "Naumen",
-"tcl" : "TCL",
-"vim" : "Vim",
-"SGIv1" : "SGI-OpenGL",
+LICENSE_MAP = {
+    "AGPL-3": "AGPL-3.0-only",
+    "AGPL-3+": "AGPL-3.0-or-later",
+    "AGPLv3": "AGPL-3.0-only",
+    "AGPLv3+": "AGPL-3.0-or-later",
+    "AGPLv3.0": "AGPL-3.0-only",
+    "AGPLv3.0+": "AGPL-3.0-or-later",
+    "AGPL-3.0": "AGPL-3.0-only",
+    "AGPL-3.0+": "AGPL-3.0-or-later",
+    "BSD-0-Clause": "0BSD",
+    "GPL-1": "GPL-1.0-only",
+    "GPL-1+": "GPL-1.0-or-later",
+    "GPLv1": "GPL-1.0-only",
+    "GPLv1+": "GPL-1.0-or-later",
+    "GPLv1.0": "GPL-1.0-only",
+    "GPLv1.0+": "GPL-1.0-or-later",
+    "GPL-1.0": "GPL-1.0-only",
+    "GPL-1.0+": "GPL-1.0-or-later",
+    "GPL-2": "GPL-2.0-only",
+    "GPL-2+": "GPL-2.0-or-later",
+    "GPLv2": "GPL-2.0-only",
+    "GPLv2+": "GPL-2.0-or-later",
+    "GPLv2.0": "GPL-2.0-only",
+    "GPLv2.0+": "GPL-2.0-or-later",
+    "GPL-2.0": "GPL-2.0-only",
+    "GPL-2.0+": "GPL-2.0-or-later",
+    "GPL-3": "GPL-3.0-only",
+    "GPL-3+": "GPL-3.0-or-later",
+    "GPLv3": "GPL-3.0-only",
+    "GPLv3+": "GPL-3.0-or-later",
+    "GPLv3.0": "GPL-3.0-only",
+    "GPLv3.0+": "GPL-3.0-or-later",
+    "GPL-3.0": "GPL-3.0-only",
+    "GPL-3.0+": "GPL-3.0-or-later",
+    "LGPLv2": "LGPL-2.0-only",
+    "LGPLv2+": "LGPL-2.0-or-later",
+    "LGPLv2.0": "LGPL-2.0-only",
+    "LGPLv2.0+": "LGPL-2.0-or-later",
+    "LGPL-2.0": "LGPL-2.0-only",
+    "LGPL-2.0+": "LGPL-2.0-or-later",
+    "LGPL2.1": "LGPL-2.1-only",
+    "LGPL2.1+": "LGPL-2.1-or-later",
+    "LGPLv2.1": "LGPL-2.1-only",
+    "LGPLv2.1+": "LGPL-2.1-or-later",
+    "LGPL-2.1": "LGPL-2.1-only",
+    "LGPL-2.1+": "LGPL-2.1-or-later",
+    "LGPLv3": "LGPL-3.0-only",
+    "LGPLv3+": "LGPL-3.0-or-later",
+    "LGPL-3.0": "LGPL-3.0-only",
+    "LGPL-3.0+": "LGPL-3.0-or-later",
+    "MPL-1": "MPL-1.0",
+    "MPLv1": "MPL-1.0",
+    "MPLv1.1": "MPL-1.1",
+    "MPLv2": "MPL-2.0",
+    "MIT-X": "MIT",
+    "MIT-style": "MIT",
+    "openssl": "OpenSSL",
+    "PSF": "PSF-2.0",
+    "PSFv2": "PSF-2.0",
+    "Python-2": "Python-2.0",
+    "Apachev2": "Apache-2.0",
+    "Apache-2": "Apache-2.0",
+    "Artisticv1": "Artistic-1.0",
+    "Artistic-1": "Artistic-1.0",
+    "AFL-2": "AFL-2.0",
+    "AFL-1": "AFL-1.2",
+    "AFLv2": "AFL-2.0",
+    "AFLv1": "AFL-1.2",
+    "CDDLv1": "CDDL-1.0",
+    "CDDL-1": "CDDL-1.0",
+    "EPLv1.0": "EPL-1.0",
+    "FreeType": "FTL",
+    "Nauman": "Naumen",
+    "tcl": "TCL",
+    "vim": "Vim",
+    "SGIv1": "SGI-OpenGL",
+    "Apache-2.0-with-LLVM-exception": "Apache-2.0 WITH LLVM-exception",
+    "GPL-3-with-bison-exception": "GPL-3.0-or-later WITH Bison-exception-2.2",
+    "GPL-2.0-with-Linux-syscall-note": "GPL-2.0-only WITH Linux-syscall-note",
 }
 
+
+LINE_RE = re.compile(r'^(?P<var>LICENSE[\s:].*=.*)"(?P<expression>.*)"')
+
+
+def convert_unknown(node):
+    node.children = [convert_unknown(c) for c in node.children]
+
+    if not isinstance(node, oe.spdx_license.UnknownId):
+        return node
+
+    if node.ident.startswith("$"):
+        return node
+
+    if node.ident in LICENSE_MAP:
+        return oe.spdx_license.parse(LICENSE_MAP[node.ident])
+
+    ident = re.sub(r"[^a-zA-Z0-9\.\-]", "-", node.ident)
+
+    return oe.spdx_license.LicenseRef("LicenseRef-" + ident, ident, token=node.token)
+
+
 def processfile(fn):
-    print("processing file '%s'" % fn)
+    # print("processing file '%s'" % fn)
     try:
         fh, abs_path = tempfile.mkstemp()
+        if os.path.basename(fn) == "bitbake.conf":
+            return
+
         modified = False
-        with os.fdopen(fh, 'w') as new_file:
+        with os.fdopen(fh, "w") as new_file:
             with open(fn, "r") as old_file:
-                for line in old_file:
-                    if not line.startswith("LICENSE"):
+                for lineno, line in enumerate(old_file):
+                    m = LINE_RE.match(line)
+                    if m is None:
+                        new_file.write(line)
+                        continue
+
+                    if "[doc]" in m.group("var"):
+                        new_file.write(line)
+                        continue
+
+                    expression = (
+                        m.group("expression").replace("|", " OR ").replace("&", " AND ")
+                    ).strip()
+                    if not expression or expression == "CLOSED":
                         new_file.write(line)
                         continue
-                    orig = line
-                    for license in sorted(license_map, key=len, reverse=True):
-                        for ending in ['"', "'", " ", ")"]:
-                            line = line.replace(license + ending, license_map[license] + ending)
-                    if orig != line:
-                        modified = True
-                    new_file.write(line)
+
+                    try:
+                        t = oe.spdx_license.parse(expression, allow_unknown=True)
+                        if t is None:
+                            new_file.write(line)
+                            continue
+                        t = convert_unknown(t)
+                    except oe.spdx_license.ParseError as e:
+                        print(f"Cannot convert {fn}:{lineno + 1}")
+                        print(e.format())
+                        new_file.write(line)
+                        continue
+
+                    if t.to_string() == expression:
+                        new_file.write(line)
+                        continue
+
+                    new_line = m.group("var") + '"' + t.sort().to_string() + '"\n'
+                    new_file.write(new_line)
+                    modified = True
         new_file.close()
         if modified:
             shutil.copymode(fn, abs_path)
@@ -122,8 +184,9 @@ def processfile(fn):
     except UnicodeDecodeError:
         pass
 
+
 ourname = os.path.basename(sys.argv[0])
-ourversion = "0.01"
+ourversion = "0.02"
 
 if os.path.isfile(sys.argv[1]):
     processfile(sys.argv[1])
@@ -138,7 +201,14 @@ for targetdir in sys.argv[1:]:
             fn = os.path.join(root, name)
             if os.path.islink(fn):
                 continue
-            if "/.git/" in fn or fn.endswith(".html") or fn.endswith(".patch") or fn.endswith(".m4") or fn.endswith(".diff") or fn.endswith(".orig"):
+            if (
+                "/.git/" in fn
+                or fn.endswith(".html")
+                or fn.endswith(".patch")
+                or fn.endswith(".m4")
+                or fn.endswith(".diff")
+                or fn.endswith(".orig")
+            ):
                 continue
             processfile(fn)
 
-- 
2.54.0


