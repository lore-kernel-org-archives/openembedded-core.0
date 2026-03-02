Return-Path: <stondo@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3E233EA4E34
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 16:01:56 +0000 (UTC)
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.163900.1772467312142704044
 for <openembedded-core@lists.openembedded.org>;
 Mon, 02 Mar 2026 08:01:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=FLB0tZFN;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4833115090dso48084045e9.3
        for <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 08:01:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772467310; x=1773072110; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSwz6Q0bosfSFNMXUEKBdXHqAunYPQFf0+puT9za7no=;
        b=FLB0tZFNE4CVrd9MW8LCK1YOSiG0nz7t8zR617+3d+zYnQtTftTWJrkUIvaGcnBqlE
         iCvyOm60N3jkKOH2qJCnNvgw5Jej8nWuPv476fAmGYXYv4ygRszSYVQ4O2ts1xGEvrIG
         MAzNA8QpZNRA6+q8wwoFOgDEGCe/24CIPQcNfe+2uUL2ZpV0fziWUN0MXFK2uivtK6bO
         148+4IY4sTKZHvrhyZo4VaVdp7fNPMLwMku2734BBvaGgfZjs4lgiuI2/9I9Q5zbNp6H
         Ai4Vh+BPZsPiyhvp+GqrU1TJLzJKvyLTAOp5chtgcSMhV3CMdJ+K/obwFI9lQ4H+3Ooc
         mCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772467310; x=1773072110;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSwz6Q0bosfSFNMXUEKBdXHqAunYPQFf0+puT9za7no=;
        b=nAmRVj+FpkQGsPoBP6HUzyLONv9plxtTWwgJOxNS1DKWeq6kbmaMnprJuhO42h8jTj
         a0uw8tlXICVzMAirL4NoDnJAzi5qW6WU/PtK1SD6JAWIkYHlsG/nyorxqIE/xEHuXDLU
         omoUIXIpCkXgzMYA5dwbwUrPZKVjeW8FSapjq4D/sYjW2RfxofMDJ2cdlIvKFZSz5g53
         QEg2DW99B1BxK6wxSwXvLcyV0nLsIDYpapsiomG3CYJnFUUYn9CaRdr/J+VOcoLs7+OF
         6ZiDhG43hH2RqFd7fw0sv3UDBNn6I3n7HZyLb7QMT+QsXQmNGZmPyQtjMtGVyOVYPuTp
         UGow==
X-Gm-Message-State: AOJu0YznrbuPlANELl1a0LFo+VRvbPtzey94ucJqaY/YeTorjBZWDMWL
	MzTsj60d3NNTzmSPDmqORxVeGPsrNj17UQLMBEoAZ5kJc1s530+n+aVbz8TVsA==
X-Gm-Gg: ATEYQzyPGDO24lUSDS1ROQxfLmtZjGDESjVEQUOx/z5grbhgeMX2+25By9cHF4c4gyU
	2xOf364tnvFWShm41zbVuXDggMbPwnxvYWpnF0Q0xPAQEuVTXLLAoy1lBWLOc6ahWLn02cRMEAX
	ftXkPlamBW3Tp2QWT10efQEnztKgxAdrF+MMJFvzH46vIc4EQ5LUz6SyAaUCFw/4rcT81gKEBPn
	cW2SIEh7MuLUUKqXPl/3NzWt0+4YyxMUvxO6oFCmXPqnrjp+TBYF9h/adnRBmOzr/1dpWOzluam
	lBCNam8BEiwXXwQGsRaehgdi6NeHwvqI/z5shYnvFst4P44KHZjbP6usJUgSUNfXltV0HHrrWFK
	3SzRABTmv2ySnfHpIZncIra9tZrxkBc2eYzbi6irBLToF4+9wLe8d3e10+F+Y2IX3Yl6ycS+0pE
	zQfQICxJavaPMx+sdzB7lZ+nrJF/pMzYTINPSQRieTZaodu85/yC725rGa4oSZqXyRsGrcdJ7dI
	s/LxtvAI/6Y0uwtTM/K
X-Received: by 2002:a05:6000:200c:b0:439:ae82:6abf with SMTP id ffacd0b85a97d-439ae826b99mr13195348f8f.31.1772467309983;
        Mon, 02 Mar 2026 08:01:49 -0800 (PST)
Received: from fedora (mob-194-230-144-8.cgn.sunrise.net. [194.230.144.8])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4399c60e40fsm28390097f8f.7.2026.03.02.08.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 08:01:48 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
X-Google-Original-From: Stefano Tondo <stefano.tondo.ext@siemens.com>
To: openembedded-core@lists.openembedded.org
Cc: Ross.Burton@arm.com,
	jpewhacker@gmail.com,
	stefano.tondo.ext@siemens.com,
	Peter.Marko@siemens.com,
	adrian.freihofer@siemens.com
Subject: [PATCH v5 09/10] cve_check: Escape special characters in CPE 2.3 formatted strings
Date: Mon,  2 Mar 2026 17:01:13 +0100
Message-ID: <20260302160114.46884-10-stefano.tondo.ext@siemens.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
References: <20260302160114.46884-1-stefano.tondo.ext@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 02 Mar 2026 16:01:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/232218

CPE 2.3 formatted string binding (cpe:2.3:...) requires backslash escaping
for special meta-characters according to NISTIR 7695. Characters like '++'
and ':' in product names must be properly escaped to pass SBOM validation.

The CPE 2.3 specification defines two bindings:
- URI binding (cpe:/...) uses percent-encoding
- Formatted string binding (cpe:2.3:...) uses backslash escaping

This patch implements the formatted string binding properly by escaping
only the required meta-characters with backslash:
- Backslash (\) -> \\
- Question mark (?) -> \?
- Asterisk (*) -> \*
- Colon (:) -> \:
- Plus (+) -> \+ (required by some SBOM validators)

All other characters including -, etc. are kept as-is without encoding.

Example CPE identifiers:
- cpe:2.3:*:*:crow:1.0+x:*:*:*:*:*:*:*
- cpe:2.3:*:*:sdbus-c++:2.2.1:*:*:*:*:*:*:*

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/cve_check.py | 37 ++++++++++++++++++++++++++++++++++++-
 1 file changed, 36 insertions(+), 1 deletion(-)

diff --git a/meta/lib/oe/cve_check.py b/meta/lib/oe/cve_check.py
index ae194f27cf..fa210e2037 100644
--- a/meta/lib/oe/cve_check.py
+++ b/meta/lib/oe/cve_check.py
@@ -205,6 +205,34 @@ def get_patched_cves(d):
     return patched_cves
 
 
+def cpe_escape(value):
+    r"""
+    Escape special characters for CPE 2.3 formatted string binding.
+
+    CPE 2.3 formatted string binding (cpe:2.3:...) uses backslash escaping
+    for special meta-characters, NOT percent-encoding. Percent-encoding is
+    only used in the URI binding (cpe:/...).
+
+    According to NISTIR 7695, these characters need escaping:
+    - Backslash (\) -> \\
+    - Question mark (?) -> \?
+    - Asterisk (*) -> \*
+    - Colon (:) -> \:
+    - Plus (+) -> \+ (required by some SBOM validators)
+    """
+    if not value:
+        return value
+
+    # Escape special meta-characters for CPE 2.3 formatted string binding
+    # Order matters: escape backslash first to avoid double-escaping
+    result = value.replace('\\', '\\\\')
+    result = result.replace('?', '\\?')
+    result = result.replace('*', '\\*')
+    result = result.replace(':', '\\:')
+    result = result.replace('+', '\\+')
+
+    return result
+
 def get_cpe_ids(cve_product, version):
     """
     Get list of CPE identifiers for the given product and version
@@ -221,7 +249,14 @@ def get_cpe_ids(cve_product, version):
         else:
             vendor = "*"
 
-        cpe_id = 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(vendor, product, version)
+        # Encode special characters per CPE 2.3 specification
+        encoded_vendor = cpe_escape(vendor) if vendor != "*" else vendor
+        encoded_product = cpe_escape(product)
+        encoded_version = cpe_escape(version)
+
+        cpe_id = 'cpe:2.3:*:{}:{}:{}:*:*:*:*:*:*:*'.format(
+            encoded_vendor, encoded_product, encoded_version
+        )
         cpe_ids.append(cpe_id)
 
     return cpe_ids
-- 
2.53.0


