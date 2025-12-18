Return-Path: <lukakrstic031@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE92ED6ACD4
	for <webhook@archiver.kernel.org>; Thu, 18 Dec 2025 09:12:03 +0000 (UTC)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.37793.1766049116631133305
 for <openembedded-core@lists.openembedded.org>;
 Thu, 18 Dec 2025 01:11:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Ql5FVWZ9;
 spf=pass (domain: gmail.com, ip: 209.85.221.53, mailfrom: lukakrstic031@gmail.com)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-42fb2314f52so195984f8f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 01:11:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766049115; x=1766653915; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1RK3kHhVA/jQPhbC+3hfSsvY7m+DUI+/V+6dY+A6WK8=;
        b=Ql5FVWZ9C2YS1Ofn+tlYKJXqL/2MPcISluEWAgtLWU8warAyczhapI/6uuFnU+jkbf
         fQiyh4MOLqUlq9kTTp1y4N825QDHzVhiCrxJKRqowSpjRHJmDSrU0bEX9copXLMtWu+t
         7Yxu1sjdDOelJ/nqdTZM8J7lxxqT+gE6Pm6qOb/uN7H7A1i4F9xeG9LrSOc+QhOPP8zC
         NacRAxAmj4DdwrHs8McoSHSKGQEitlZ2fzOyEItg1YoKK8EpqFnNKS86BG/Nix9jFJ9D
         anS0KmvF/hbzwITBZwUIrtXh49GLFtA8CJUEPlhtczF4CuNxhxidyLiFmaKpsDolM7tT
         Hcgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766049115; x=1766653915;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1RK3kHhVA/jQPhbC+3hfSsvY7m+DUI+/V+6dY+A6WK8=;
        b=eP5JSTm0/FLf+XN0ptwlqCV5fqMGvNT2bzk9TgdnaqaMLxJ/CrgAUuHh2lKjxd7nVg
         qKS0CdMBiV0sCOiLtwUeRRIZeQWcRIQ/2CuXf3yUYTGYtdcXaUgJc244oa/mBWjU9UQi
         naEM1hYBLVR+i0ImnC2u4rdAX06+AvPUZBfGJGUAzMhoU/HAHZ2AGE1GUUWvfAELpLvG
         H8J6J0xyH25udUarn7x37CzguZA6n83YBokKbGTbyxaRIrkY9N9pW3DFOIkau/hwY58O
         Gyfw1GYUTqnOcasGFijdTV4Z5DU8k65u/auGgozeMkWSIQ5WylvoSjaVVcKJvgFHrjVU
         lx/A==
X-Gm-Message-State: AOJu0YwRLyRDDr3rmUaeS3CRt1h8tQnphzNgKJCqybwW+NjSQlUbUO8/
	zNC6SuwfqtYM7Qip7D57RykBBvc4uzDRgJTAOz7xibvAYtgRSeV3BOGAfLa9Dg==
X-Gm-Gg: AY/fxX4GZGusFNQFreAOG4G8J0U3m5L5cuIJ9tLqmrrqVjrsRpn4nsCAX6xLbyPV7ph
	g1ml87lhHoOrJNwlvVU98Lgef9HxO0v+UfB64DFdJBwTGgPX+0c4+cb0mLJzZ6as2TiPcA9rm8J
	M1AOGS7aHe68K/E3LuxSvp1nMWW+GOLPeImOy05pEZblnAyUHvocBlCLkLYCYVFclrvWLRi2rYL
	HP4P0dbJXLVhwUV9cDHsacOjLogLagJgF6EVv4OtvvV+lDoDww9hxjX2jHFAkSPh6h50IMfj0Hp
	8wyJIvaLYoyFfJisn6hKYXV0EoK94SIx0wHTfqER+tGLPgX8LdOCFeZ1p3Dav2C9oSGVWqIaV2/
	Q8Wpoe4S9K81Urwpp+ngFLk/aiCMJSDIfRg8F/UB/L9xv0gL9DruQBgQrcGYOePgM9Uo0TIRGGZ
	YY9ngr6CNHHxQzzEkAov+QVvS9Z+SeYnInpXeJyE6iSKufHtxmTvJr4qwYZcm/eXDSxAmERKFpY
	aMb1g==
X-Google-Smtp-Source: AGHT+IEsE4ikp6v8tFvp+O4ljLtBE3zhbHQzDTqBy3jaaVFIZEWI7F6pLO21kr6O/JDv6zU9yu2ZgQ==
X-Received: by 2002:a05:6000:22c8:b0:431:16d:63d1 with SMTP id ffacd0b85a97d-431016d6854mr12550109f8f.44.1766049114539;
        Thu, 18 Dec 2025 01:11:54 -0800 (PST)
Received: from lukak-ThinkBook-15-G2-ITL.. (178-223-29-172.dynamic.isp.telekom.rs. [178.223.29.172])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4324493f004sm3892453f8f.11.2025.12.18.01.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 01:11:54 -0800 (PST)
From: Luka Krstic <lukakrstic031@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Luka Krstic <lukakrstic031@gmail.com>
Subject: [PATCH] patchtest: reject Upstream-Status after scissors
Date: Thu, 18 Dec 2025 10:11:38 +0100
Message-ID: <20251218091138.775105-1-lukakrstic031@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 18 Dec 2025 09:12:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/228105

Upstream-Status must be placed in the patch header before the
scissors line. patchtest currently accepts tags that appear
only after the scissors, which means the tag is lost when the
patch is refreshed by git or devtool.

Update test_upstream_status_presence_format() to distinguish
between tags in the header and tags after the scissors, and
reject the latter.

Fixes: [YOCTO #15940]
Signed-off-by: Luka Krstic <lukakrstic031@gmail.com>
---
 meta/lib/patchtest/tests/test_patch.py | 153 ++++++++++++++++---------
 1 file changed, 99 insertions(+), 54 deletions(-)

diff --git a/meta/lib/patchtest/tests/test_patch.py b/meta/lib/patchtest/tests/test_patch.py
index d08b8a5019..3b33b5a199 100644
--- a/meta/lib/patchtest/tests/test_patch.py
+++ b/meta/lib/patchtest/tests/test_patch.py
@@ -45,62 +45,107 @@ class TestPatch(base.Base):
 
         for newpatch in TestPatch.newpatches:
             payload = newpatch.__str__()
-            if not patchtest_patterns.upstream_status_regex.search_string(payload):
-                self.fail(
-                    "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
-                    data=[
-                        ("Standard format", self.standard_format),
-                        ("Valid status", self.valid_status),
-                    ],
-                )
-            for line in payload.splitlines():
+            lines = payload.splitlines()
+
+            scissors_index = None
+            for idx, line in enumerate(lines):
+                if line.lstrip("+") == "---":
+                    scissors_index = idx
+                    break
+
+            header_has_upstream = False
+            body_has_upstream = False
+
+            for idx, line in enumerate(lines):
+                if not patchtest_patterns.upstream_status_regex.search_string(line):
+                    continue
+
+                if scissors_index is not None and idx > scissors_index:
+                    body_has_upstream = True
+                else:
+                    header_has_upstream = True
+
+            if not header_has_upstream:
+                if body_has_upstream:
+                    self.fail(
+                        'Upstream-Status is present only after the patch scissors. '
+                        "It must be placed in the patch header before the scissors line.",
+                        data=[
+                            ("Standard format", self.standard_format),
+                            ("Valid status", self.valid_status),
+                        ],
+                    )
+                else:
+                    self.fail(
+                        "Added patch file is missing Upstream-Status: <Valid status> in the commit message",
+                        data=[
+                            ("Standard format", self.standard_format),
+                            ("Valid status", self.valid_status),
+                        ],
+                    )
+
+            for idx, line in enumerate(lines):
                 if patchtest_patterns.patchmetadata_regex.match(line):
                     continue
-                if patchtest_patterns.upstream_status_regex.search_string(line):
-                    if patchtest_patterns.inappropriate.searchString(line):
-                        try:
-                            patchtest_patterns.upstream_status_inappropriate_info.parseString(
-                                line.lstrip("+")
-                            )
-                        except pyparsing.ParseException as pe:
-                            self.fail(
-                                "Upstream-Status is Inappropriate, but no reason was provided",
-                                data=[
-                                    ("Current", pe.pstr),
-                                    (
-                                        "Standard format",
-                                        "Upstream-Status: Inappropriate [reason]",
-                                    ),
-                                ],
-                            )
-                    elif patchtest_patterns.submitted.searchString(line):
-                        try:
-                            patchtest_patterns.upstream_status_submitted_info.parseString(
-                                line.lstrip("+")
-                            )
-                        except pyparsing.ParseException as pe:
-                            self.fail(
-                                "Upstream-Status is Submitted, but it is not mentioned where",
-                                data=[
-                                    ("Current", pe.pstr),
-                                    (
-                                        "Standard format",
-                                        "Upstream-Status: Submitted [where]",
-                                    ),
-                                ],
-                            )
-                    else:
-                        try:
-                            patchtest_patterns.upstream_status.parseString(line.lstrip("+"))
-                        except pyparsing.ParseException as pe:
-                            self.fail(
-                                "Upstream-Status is in incorrect format",
-                                data=[
-                                    ("Current", pe.pstr),
-                                    ("Standard format", self.standard_format),
-                                    ("Valid status", self.valid_status),
-                                ],
-                            )
+
+                if not patchtest_patterns.upstream_status_regex.search_string(line):
+                    continue
+
+                if scissors_index is not None and idx > scissors_index:
+                    self.fail(
+                        'Upstream-Status must be placed in the patch header before the scissors line, '
+                        "but was found afterwards.",
+                        data=[
+                            ("Current", line.lstrip("+")),
+                            ("Standard format", self.standard_format),
+                            ("Valid status", self.valid_status),
+                        ],
+                    )
+
+                if patchtest_patterns.inappropriate.searchString(line):
+                    try:
+                        patchtest_patterns.upstream_status_inappropriate_info.parseString(
+                            line.lstrip("+")
+                        )
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            "Upstream-Status is Inappropriate, but no reason was provided",
+                            data=[
+                                ("Current", pe.pstr),
+                                (
+                                    "Standard format",
+                                    "Upstream-Status: Inappropriate [reason]",
+                                ),
+                            ],
+                        )
+                elif patchtest_patterns.submitted.searchString(line):
+                    try:
+                        patchtest_patterns.upstream_status_submitted_info.parseString(
+                            line.lstrip("+")
+                        )
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            "Upstream-Status is Submitted, but it is not mentioned where",
+                            data=[
+                                ("Current", pe.pstr),
+                                (
+                                    "Standard format",
+                                    "Upstream-Status: Submitted [where]",
+                                ),
+                            ],
+                        )
+                else:
+                    try:
+                        patchtest_patterns.upstream_status.parseString(line.lstrip("+"))
+                    except pyparsing.ParseException as pe:
+                        self.fail(
+                            "Upstream-Status is in incorrect format",
+                            data=[
+                                ("Current", pe.pstr),
+                                ("Standard format", self.standard_format),
+                                ("Valid status", self.valid_status),
+                            ],
+                        )
 
     def test_signed_off_by_presence(self):
         if not TestPatch.newpatches:
-- 
2.43.0


