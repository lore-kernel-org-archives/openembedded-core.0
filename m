Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 023E2C44508
	for <webhook@archiver.kernel.org>; Wed, 15 Jul 2026 16:48:11 +0000 (UTC)
Received: from mail-oa1-f50.google.com (mail-oa1-f50.google.com [209.85.160.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12408.1784134081157961577
 for <openembedded-core@lists.openembedded.org>;
 Wed, 15 Jul 2026 09:48:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=UjHdfPrf;
 spf=pass (domain: gmail.com, ip: 209.85.160.50, mailfrom: jpewhacker@gmail.com)
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-45171f2f608so1370236fac.1
        for <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 09:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784134080; x=1784738880; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P8s0xqHFbl128jcDCpGAzOD5ZPOArSaoyLbYDCfSfY0=;
        b=UjHdfPrfexgZdFRKP2wqCylgymGFzEI4QjSa2kQ92HeqJEkfgQXhhY/8YEVrQICfGh
         e3LWqKnb+9ckqLGMLuU6NzRVMfhuWe2CmFW18axRJtDO6gxrBHr3IXaI+PcncsLWjsTc
         EoPtjb3SNQoaRaCkXG6AfxF9MuHJ/R+XdlEmSr6mlmVWghH59rmyKIbcCB3v1HuzeV5L
         Y5OpM90bZ6BZBHTyIRg3uL+/3LHPua0+3h527i8y7pwnGoWmj0DHL8Rd//onRaQ1bKgZ
         OgvTQiS2LlsKmVaLogHQdsD3suCUK6sarzB/VO1ERlSnwl5fz/6gWsLIYmNQhXpIrsZG
         w1Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784134080; x=1784738880;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P8s0xqHFbl128jcDCpGAzOD5ZPOArSaoyLbYDCfSfY0=;
        b=dFzoJd0fUueSLJDhUd42heMGcO8xzoHthOyt5ieDnC2ELLiVe23usQ7PcJtaWE9yim
         Hn1Y9mHWajKcDj7R4HHy2yJd8cNzQOeMAhEVeNtoZIhUoO5GwnWi65DGRjKbxidRz9IK
         f38APt7M0ig7Rh9mTJGT8XQ8QPlI9Uxdngps/waIYdWSfdGLm/dFR9fso2SLgBGGJHqr
         tamzZ4o/hnB5QosjJrQE1yWSSg5+zy/cutkHNnat3T3hiCn9OZz0a/ijLSZPBNSobf0s
         TiakUM+JXOQrN1EdzWiGNur3ApUyHuwTGEVXqKEFIP/B7UdMBl62UleGAe5xDfsCiQVV
         6sUA==
X-Gm-Message-State: AOJu0Yy0MRPqrOs2KSQVoL42y3AFWcXe8tqG7vcWJtCBsBu80HneuVzH
	cORWBJPCGp9hVkDnxcmqX+Dn/3vrzFVvvhfZpANkqTBNwBcHubN9gBWzR+ADqA==
X-Gm-Gg: AfdE7cloeJtt7MaWq/Kzs8tdPFsYUsRRRL51iu3zgfo/vkHEmloGqTMXNTkPzPKYLsB
	3ZSaAvC14xhVDjIoa5Mmp4qBL+Z7LDmQpWITH73qVdccf/p/YFLlvcpZbnHVjn20sPtqLFR12bJ
	pGaDE42F2OSyCXKZFhnHYEZnT+MYdlOef5g/bIVhAFwhiE74hyqoIsh21pyjsKJ46jBBWbMzz0N
	IJoAIU/UWcj5h/tP4JwhKqOFDhnlG3R6f9mXVUa789siOewDXyBxWVvHQoA0LlWtFV3X012Te95
	AFygQy+VxlwjSNwiAeb1z02JxLQ4yYF/Pb7H/E8jufqkG5nCGDPZKjlP05ElVOmJxn4dxdVKCAw
	xN3eQAJ1M/iO+WxIc1K1uCwiwfLrlo7NwfLgfn9rIBhKvPaRzhrINzALJeImKmAia61SsPwVW5p
	N+EJPLBldG
X-Received: by 2002:a05:6871:4d4:b0:448:558e:84ee with SMTP id 586e51a60fabf-451f14dad85mr10360071fac.40.1784134080291;
        Wed, 15 Jul 2026 09:48:00 -0700 (PDT)
Received: from localhost.localdomain ([2601:283:4b02:22d0::eb5])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-451b64192adsm17354179fac.18.2026.07.15.09.47.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 09:48:00 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v2 25/25] scripts/contrib: Add reuse-get-license.py
Date: Wed, 15 Jul 2026 10:45:21 -0600
Message-ID: <20260715164739.364323-26-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260715164739.364323-1-JPEWhacker@gmail.com>
References: <20260714190405.3328796-1-JPEWhacker@gmail.com>
 <20260715164739.364323-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 15 Jul 2026 16:48:11 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/241016

Adds a script that extracts the LICENSE and LIC_FILES_CHKSUM for project
that uses reuse[1].

[1]: https://reuse.software/

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 scripts/contrib/reuse-get-license.py | 106 +++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)
 create mode 100755 scripts/contrib/reuse-get-license.py

diff --git a/scripts/contrib/reuse-get-license.py b/scripts/contrib/reuse-get-license.py
new file mode 100755
index 0000000000..f35f13fec9
--- /dev/null
+++ b/scripts/contrib/reuse-get-license.py
@@ -0,0 +1,106 @@
+#! /usr/bin/env python3
+#
+# Copyright OpenEmbedded Contributors
+#
+# SPDX-License-Identifier: MIT
+#
+# /// script
+# dependencies = [
+#   "reuse",
+#   "py-spdx-license",
+# ]
+# ///
+#
+# Extracts the LICENSE for software that uses reuse. Run with any PEP 723
+# complaint tool, e.g.
+#
+#   uv run reuse-get-license.py <project-root>
+
+import argparse
+import hashlib
+import sys
+import textwrap
+from pathlib import Path
+
+import py_spdx_license
+import reuse.project
+
+def main():
+    parser = argparse.ArgumentParser(
+        description="Generate LICENSE expression from reuse"
+    )
+    parser.add_argument("dir", help="Project root directory", type=Path)
+    parser.add_argument(
+        "--include-submodules",
+        "-s",
+        help="Include submodules",
+        action="store_true",
+    )
+    parser.add_argument(
+        "--include-meson-subprojects",
+        "-m",
+        help="Include meson subprojects",
+        action="store_true",
+    )
+    parser.add_argument(
+        "--width",
+        "-w",
+        type=int,
+        help="Maximum line width for the output. Default is %(default)s",
+        default=100,
+    )
+
+    args = parser.parse_args()
+
+    prj = reuse.project.Project.from_directory(
+        args.dir,
+        include_submodules=args.include_submodules,
+        include_meson_subprojects=args.include_meson_subprojects,
+    )
+
+    licenses = []
+    for k in prj.licenses.keys():
+        licenses.append(py_spdx_license.parse(k))
+
+    lic = py_spdx_license.AndOp.join(licenses).sort()
+
+    prefix = 'LICENSE = "'
+
+    if args.width:
+        lic_text = textwrap.wrap(
+            f'{prefix}{lic.to_string()}"',
+            width=args.width,
+            subsequent_indent=" " * len(prefix),
+        )
+    else:
+        lic_text = [prefix + lic.to_string() + '"']
+
+    print(" \\\n".join(lic_text))
+
+    tomls = reuse.project.Project.find_global_licensing(
+        args.dir,
+        include_submodules=args.include_submodules,
+        include_meson_subprojects=args.include_meson_subprojects,
+    )
+
+    checksums = []
+
+    for t in tomls:
+        h = hashlib.md5()
+        with open(t.path, "rb") as f:
+            while b := f.read(4096):
+                h.update(b)
+
+        rel_path = Path(t.path).relative_to(args.dir)
+        checksums.append(f"file://{rel_path};md5={h.hexdigest()}")
+
+    if checksums:
+        checksums.sort()
+        prefix = 'LIC_FILES_CHKSUM = "'
+        print(prefix + (" \\\n" + " " * len(prefix)).join(checksums) + '"')
+
+    return 0
+
+
+if __name__ == "__main__":
+    sys.exit(main())
-- 
2.54.0


