Return-Path: <david.partain@est.tech>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9613DCD8CA4
	for <webhook@archiver.kernel.org>; Tue,  9 Jun 2026 13:55:36 +0000 (UTC)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com [209.85.222.54])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75205.1780995322397479699
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Jun 2026 01:55:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=VaccjVAN;
 spf=pass (domain: gmail.com, ip: 209.85.222.54, mailfrom: adityags2004@gmail.com)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-9639fa0636bso3266525241.0
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 01:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780995321; x=1781600121; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mVGma1AFGK/0kQqtCxj1o02rIa9W1TgwzoUeLBK4WRQ=;
        b=VaccjVANSKO5Z7kA4vJwOa7HSeGH2ca0yDLGw1LxqcwtUYCfr9hNQEPwapFN7pSqKh
         EFvTOOmWNusbboDL2mGYZZ6+tSRAejUM43ypxBLZlUlsGfCLT95YAiay8/TgnuzZB0dI
         508g/2gsew04uBmTxU6haUxUTALshXHyJ2PKEaPOB9NxzCs0DgKXLG9bUWycML23t7Vg
         ckuUZhdksy8OTzw0t3m6AoCJrdtt7ebY6dIR+V1Hx7yqX0L8ayOjrcJBotnS9+IA+Tqg
         zK1l4EkiA46Z6e3xGP9Xm8QA6sgaMVIqilQUXN122xZUj96lZX1zW1uspHBp/mOjMQIm
         J/4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780995321; x=1781600121;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mVGma1AFGK/0kQqtCxj1o02rIa9W1TgwzoUeLBK4WRQ=;
        b=aNT9OWxmrQohzUGjSz3Ftz1SRNwWQrFINANoUgvpaSStKWQIUIFT11nvAFCus3JdDN
         qkbIiYFowvQqmi5kiwlxID7BoEqQRiIqsiVr23zGb8EmP7rvVWdLaktyOZZhuDMSnrB5
         0oNfeUQ1yKurA+3zwbpw13/38YJNv6brJV6/cYjA16IeQvdNBL5V9kAf5+mYYY94rWqz
         iWm+YvCRjEZFFrvlWESHOIcUptxYsupRMd9vZvStOPB3JnF5tUIS+U3oarZCzJSpY2nP
         PZhAll+YtJMk3FMXopgygMXoVGfvlU0D0Yn2PvFwqpRgAHE6hXyEcEcOGgSgJUXMHa2w
         vOCA==
X-Gm-Message-State: AOJu0YyBwBRVvbnrgt6AjAwIl0rPKoTdb1cDc9cqXUvMQsXnWy5lCagy
	O6ZRMvAopO0UpbWl9lyQTgju6x7IQfohDzKJaHj5MtVItETPsAIStGfxrEVeNZBU
X-Gm-Gg: Acq92OHHR0Q8omlGKH+jEK9CeXG/WLLF3y7V/ds72gem4voZmhRCu3+LDQm5+fJfoIl
	4tg1fOAv7qOwgOGdECng4jgssbaPFmbp8FKoFGH/NtTeRufSNLHvesIpWAxkwzhBzG313w4bheH
	VmIFyUSM7xmwnSobql8DzWaKkU7TUiO6LzNK0m2fECPZMWJ67DLKvDSslfTGp4w5mnbCS2gb2Oo
	+SbCITdQH1RljyFBSRikVZiClyGz0KrZE6bmxXOvHE29FHssM59ppAGXGzXV1BiEUUSBSePWYBK
	Q8yzHYVHh30G62ccW7PN6LePW5NVj+YnFBW/+7MIAKALAVzUxksoR/sUQ8HV1kemMDHoKoLf5oC
	xj31wtOyJQOvsxFmu2E4bYNiiJy4+WLmJP5bXuTtNuzycfjmiaQmITryT15DnCJqoy3WyuQtlR0
	mJQr0OMFSNVXTnO/kw40FukiAlSWT+Mj1/Knn10KT1GNkqVLjKvSPsF2FTyyS2xgWJc2qxyk0Jv
	I+4tNo9xcwZpIhGoBg=
X-Received: by 2002:a17:90a:d003:b0:368:65d1:893 with SMTP id 98e67ed59e1d1-371306869a2mr15798974a91.5.1780994923088;
        Tue, 09 Jun 2026 01:48:43 -0700 (PDT)
Received: from BLR1RLPT00005.localdomain ([157.50.194.152])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-36f6c6751dfsm18814422a91.8.2026.06.09.01.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 01:48:42 -0700 (PDT)
From: Aditya GS <adityags2004@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: tgamblin@baylibre.com,
	Aditya GS <adityags2004@gmail.com>
Subject: [PATCH] patchtest: warn if Upstream-Status is after patch scissors
Date: Tue,  9 Jun 2026 14:17:04 +0530
Message-Id: <20260609084704.2765-1-adityags2004@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Jun 2026 13:55:36 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238296

Detect cases where Upstream-Status is placed after the patch
scissors ("---") and emit a warning instead of failing.

Such placement may be intentional in some workflows to avoid
including the tag in upstream commits.

Signed-off-by: Aditya GS <adityags2004@gmail.com>
---
 meta/lib/patchtest/tests/test_patch.py | 187 ++++++++++++-------------
 1 file changed, 89 insertions(+), 98 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index f427b7a8b0..79aa8f100c 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -40,116 +40,107 @@ class TestPatch(base.Base):
             self.skip('No new CVE patches introduced')
 
     def test_upstream_status_presence_format(self):
-        if not TestPatch.newpatches:
-            self.skip("There are no new software patches, no reason to test Upstream-Status presence/format")
+    if not TestPatch.newpatches:
+        self.skip("There are no new software patches, no reason to test Upstream-Status presence/format")
 
-        for newpatch in TestPatch.newpatches:
-            payload = newpatch.__str__()
-            lines = payload.splitlines()
+    for newpatch in TestPatch.newpatches:
+        payload = newpatch.__str__()
+        lines = payload.splitlines()
 
-            scissors_index = None
-            for idx, line in enumerate(lines):
-                if line.lstrip("+") == "---":
-                    scissors_index = idx
-                    break
+        scissors_index = None
+        for idx, line in enumerate(lines):
+            if line.lstrip("+") == "---":
+                scissors_index = idx
+                break
 
-            header_has_upstream = False
-            body_has_upstream = False
+        header_has_upstream = False
+        body_has_upstream = False
 
-            for idx, line in enumerate(lines):
-                if not patchtest_patterns.upstream_status_regex.search_string(line):
-                    continue
+        for idx, line in enumerate(lines):
+            if not patchtest_patterns.upstream_status_regex.search_string(line):
+                continue
 
-                if scissors_index is not None and idx > scissors_index:
-                    body_has_upstream = True
-                else:
-                    header_has_upstream = True
-
-            if not header_has_upstream:
-    if body_has_upstream:
-        self.skip(
-            'Upstream-Status is present only after the patch scissors. '
-            'It may be ignored by git and lost during patch refresh. '
-            'Consider placing it before the scissors line.',
-            data=[
-                ("Standard format", self.standard_format),
-                ("Valid status", self.valid_status),
-            ],
-        )
-                else:
+            if scissors_index is not None and idx > scissors_index:
+                body_has_upstream = True
+            else:
+                header_has_upstream = True
+
+        if not header_has_upstream:
+            if body_has_upstream:
+                print(
+                    'WARNING: Upstream-Status is present only after the patch scissors. '
+                    'It may be ignored by git and lost during patch refresh. '
+                    'Consider placing it before the scissors line.'
+                )
+            else:
+                self.fail(
+                    "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
+                    data=[
+                        ("Standard format", self.standard_format),
+                        ("Valid status", self.valid_status),
+                    ],
+                )
+
+        for idx, line in enumerate(lines):
+            if patchtest_patterns.patchmetadata_regex.match(line):
+                continue
+
+            if not patchtest_patterns.upstream_status_regex.search_string(line):
+                continue
+
+            if scissors_index is not None and idx > scissors_index:
+                print(
+                    'WARNING: Upstream-Status found after patch scissors. '
+                    'It may be ignored by git and lost during patch refresh. '
+                    'Consider placing it before the scissors line.'
+                )
+                continue
+
+            if patchtest_patterns.inappropriate.searchString(line):
+                try:
+                    patchtest_patterns.upstream_status_inappropriate_info.parseString(
+                        line.lstrip("+")
+                    )
+                except pyparsing.ParseException as pe:
+                    self.fail(
+                        "Upstream-Status is Inappropriate, but no reason was provided",
+                        data=[
+                            ("Current", pe.pstr),
+                            (
+                                "Standard format",
+                                "Upstream-Status: Inappropriate [reason]",
+                            ),
+                        ],
+                    )
+            elif patchtest_patterns.submitted.searchString(line):
+                try:
+                    patchtest_patterns.upstream_status_submitted_info.parseString(
+                        line.lstrip("+")
+                    )
+                except pyparsing.ParseException as pe:
+                    self.fail(
+                        "Upstream-Status is Submitted, but it is not mentioned where",
+                        data=[
+                            ("Current", pe.pstr),
+                            (
+                                "Standard format",
+                                "Upstream-Status: Submitted [where]",
+                            ),
+                        ],
+                    )
+            else:
+                try:
+                    patchtest_patterns.upstream_status.parseString(line.lstrip("+"))
+                except pyparsing.ParseException as pe:
                     self.fail(
-                        "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
+                        "Upstream-Status is in incorrect format",
                         data=[
+                            ("Current", pe.pstr),
                             ("Standard format", self.standard_format),
                             ("Valid status", self.valid_status),
                         ],
                     )
 
-            for idx, line in enumerate(lines):
-                if patchtest_patterns.patchmetadata_regex.match(line):
-                    continue
-
-                if not patchtest_patterns.upstream_status_regex.search_string(line):
-                    continue
-
-                if scissors_index is not None and idx > scissors_index:
-    self.skip(
-        'Upstream-Status found after patch scissors. '
-        'It may be ignored by git and lost during patch refresh. '
-        'Consider placing it before the scissors line.',
-        data=[
-            ("Current", line.lstrip("+")),
-            ("Standard format", self.standard_format),
-            ("Valid status", self.valid_status),
-        ],
-    )
-
-
-                if patchtest_patterns.inappropriate.searchString(line):
-                    try:
-                        patchtest_patterns.upstream_status_inappropriate_info.parseString(
-                            line.lstrip("+")
-                        )
-                    except pyparsing.ParseException as pe:
-                        self.fail(
-                            "Upstream-Status is Inappropriate, but no reason was provided",
-                            data=[
-                                ("Current", pe.pstr),
-                                (
-                                    "Standard format",
-                                    "Upstream-Status: Inappropriate [reason]",
-                                ),
-                            ],
-                        )
-                elif patchtest_patterns.submitted.searchString(line):
-                    try:
-                        patchtest_patterns.upstream_status_submitted_info.parseString(
-                            line.lstrip("+")
-                        )
-                    except pyparsing.ParseException as pe:
-                        self.fail(
-                            "Upstream-Status is Submitted, but it is not mentioned where",
-                            data=[
-                                ("Current", pe.pstr),
-                                (
-                                    "Standard format",
-                                    "Upstream-Status: Submitted [where]",
-                                ),
-                            ],
-                        )
-                else:
-                    try:
-                        patchtest_patterns.upstream_status.parseString(line.lstrip("+"))
-                    except pyparsing.ParseException as pe:
-                        self.fail(
-                            "Upstream-Status is in incorrect format",
-                            data=[
-                                ("Current", pe.pstr),
-                                ("Standard format", self.standard_format),
-                                ("Valid status", self.valid_status),
-                            ],
-                        )
-
     def test_signed_off_by_presence(self):
         if not TestPatch.newpatches:
             self.skip("There are no new software patches, no reason to test %s presence" % PatchSignedOffBy.mark)
-- 
2.34.1


