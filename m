Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.6007.1792694179813590458
 for <openembedded-core@lists.openembedded.org>;
 Thu, 22 Oct 2026 11:36:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=bMwN2PbZ;
 spf=pass (domain: konsulko.com, ip: 209.85.128.46, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a1df146015so993345e9.0
        for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 11:36:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1792694178; x=1793298978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=dnnK2eTrFRLJpcI2cCmQrbIyCnuZXVvLD5iMxwq7XBw=;
        b=bMwN2PbZD5rhMbPsgv/J0hmKUZoWkT5Inq1m84wdQzeno6oKYEKl7aDZ+fpUvoJV3d
         3KDrwIHCOVYkeHvr3KU/WTRHLUQzKkfSe2vDBAtnAMvel5oZ1R3phEoWsXeA0yrbeTyf
         GRRidoJOyMs8+udTISSf23+52Kv6rCFcEAcf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792694178; x=1793298978;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dnnK2eTrFRLJpcI2cCmQrbIyCnuZXVvLD5iMxwq7XBw=;
        b=IMddhBTlQqegLPFllYY7yGx1rT5bbB0DMnAYTrDk52V4LMwcGjigOQcU2Fg3BoCEu2
         f13mk3WDyADKGpPIHqdyh72q+S/tTnmvaNq49jqBOyEg66wE3UcuZ9uVDunQ2uGNpyzJ
         0a0LqrvkBoFBsZjnsQDcruZwl4qFSPQ42acQ7IAvFqfcduPdWedom7UaGQSVgnwavJLL
         w0WvQr3zsXUqQpK8WaUJPY+TYCUv3x9/NwmRxpulVNIf8ryQ8YPv5i9ebq5+uK0NGN7v
         CRIetzAMsIwSwi6YlcN5c+QTLwRtXRTujxsxPHJJLp6YPGfCu5PrzzW3vHMGGV+cPSb8
         6juA==
X-Gm-Message-State: AFq9FYLeNUh8wfUAk+LuIEdOSmd/WvfGgE7+sfDwzXHt4Ahin2GEnWu+
	lN488O2Bz35xCjkYxRttDVtb4t1r1IAGppOXibkVMNYbDPZrTEAVn6OeUjoT+U+5gDaeihzX3Ro
	fxviQ
X-Gm-Gg: AYBFou0rhKgSNOUTYMfxWfqYIwQnKpGlva1FH2o2Vh7w8Usx0SrOElvspmdzJgHuSSR
	5lVNtv7KAkyU+qraTq/X/6KkTxmWuu+QeIxywhrednV79sTd9+35zyxBZrLhBa2xkPy7zcJsE63
	51e9MndP8ETAujEPrVcAZUTo4a+oqAfIZ6yqqCbCurTgwVK9VwsLLSUr5utq3Bwm9UmydH4kdt2
	YCPQ1tsSjTDNbQhRxOHFgKY4SkjCvs0iKTs0PMd6hGHYRzCwPy5HFQaJVS7NYEaKzQkZjf5tMqv
	iBGr8kOy6faX6T6H8pVT1UzKwpxmUp2HddfO1YFLrRXIZTV0nvONLpGxtuR2a1TYCp5HbN+50/m
	C9SnkuUszhLzi8EhZdW27KY3X4mVE5oKSKXUiohp6xjtpls6apaZ1XiOyYv8wfvNBQHnZEEaYfP
	WDguyjRxrkESjdvML7GZjvk3JEfw6nffkI7pwfu6Fr2LkqI2J0V6pG0BoAfcUIKvvFOUku5DpC/
	wPTPqXW7VJ9/nPMWAYyRWgl4wJ7cKk0zsw/dL3yQ6CbUbHSitKevvdm1k0irpJp2wIZwSSWSQ9U
	Wh5FOSFfkWi0h5KnrXCgcTrH+I+nXhZ0DPgl2TaNsg0PR4pEJyZ2U/y8pjz6zTXmzGa+WAl2Eeb
	B4uip
X-Received: by 2002:a05:600c:c094:b0:4a1:faa1:3813 with SMTP id 5b1f17b1804b1-4a1fdd26e79mr106804975e9.27.1792694177654;
        Thu, 22 Oct 2026 11:36:17 -0700 (PDT)
Return-Path: <leon.anavi@konsulko.com>
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a21047b524sm15303475e9.14.2026.10.22.11.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 11:36:15 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [PATCH 1/3] recipetool: Support multi-line license
Date: Thu, 22 Oct 2026 21:36:06 +0300
Message-ID: <20261022183608.3500655-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 22 Oct 2026 18:36:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248452
Content-Type: text/plain; charset="utf-8"

Some Python packages put the full license text into the license
field of PKG-INFO or pyproject.toml instead of a short identifier.
Add a comment_lines() helper to PythonRecipeHandler which prefixes
every continuation line with '#' to avoid the ParseError.

Fixes:

$ devtool add python3-tibs https://pypi.org/project/tibs
bb.parse.ParseError: ParseError at .../python3-tibs_2.0.2.bb:9:
unparsed line: 'Copyright (c) 2025 Scott Griffiths (...)'
ERROR: Parsing newly created recipe failed

AI-Generated: Uses Claude Code
Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 scripts/lib/recipetool/create_buildsys_python.py | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/create_buildsys_python.py b/scripts/lib/recipetool/create_buildsys_python.py
index 0c5f44b966..81ceaed47a 100644
--- a/scripts/lib/recipetool/create_buildsys_python.py
+++ b/scripts/lib/recipetool/create_buildsys_python.py
@@ -123,6 +123,17 @@ class PythonRecipeHandler(RecipeHandler):
         """
         return re.sub(r"[-_.]+", "-", s).lower()
 
+    @staticmethod
+    def comment_lines(s):
+        """
+        Some Python packages put the full license text into the license
+        field of PKG-INFO or pyproject.toml instead of a short identifier.
+        Prefix follow-up lines with '#' so that multi-line values (e.g.
+        a full license text) remain a valid comment in the recipe.
+        """
+        return "\n".join(("# " + line).rstrip() if i else line
+                         for i, line in enumerate(s.splitlines()))
+
     def process_url(self, args, classes, handled, extravalues):
         """
         Convert any pypi url https://pypi.org/project/<package>/<version> into https://files.pythonhosted.org/packages/source/...
@@ -675,7 +686,7 @@ class PythonSetupPyRecipeHandler(PythonRecipeHandler):
         if license_str:
             for i, line in enumerate(lines_before):
                 if line.startswith('##LICENSE_PLACEHOLDER##'):
-                    lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % license_str)
+                    lines_before.insert(i, '# NOTE: License in setup.py/PKGINFO is: %s' % self.comment_lines(license_str))
                     break
 
         if 'Classifier' in info:
@@ -914,7 +925,7 @@ class PythonPyprojectTomlRecipeHandler(PythonRecipeHandler):
                 for i, line in enumerate(lines_before):
                     if line.startswith("##LICENSE_PLACEHOLDER##"):
                         lines_before.insert(
-                            i, "# NOTE: License in pyproject.toml is: %s" % license_str
+                            i, "# NOTE: License in pyproject.toml is: %s" % self.comment_lines(license_str)
                         )
                         break
 
-- 
2.47.3

