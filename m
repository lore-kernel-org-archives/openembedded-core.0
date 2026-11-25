Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.48619.1795631781800988460
 for <openembedded-core@lists.openembedded.org>;
 Wed, 25 Nov 2026 10:36:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=BfHqjR9H;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so49476665e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 10:36:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631780; x=1796236580; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/FleaBFvWPlvaB4AMIla7Lw9JilLoGWrC6AZTqDKtaQ=;
        b=BfHqjR9H/qRRGJV99CX7GCg/252wR0HMontkZM0+E5p7+cJNSmuAe5T+wEkDmB+7PT
         g+IMjC1/WtgmB/W9PjyD985ydtVy9VmhYwBTBXoxkMg0wV+dXjvYVuS1sYDlwI4c3r3b
         AuToBkt2G+vZn7I545JmdyKNyH+HWbOPMDbojV7ytf19k/eCcR9x3gnYgTNudiOtEopC
         jtQE20nQLjkNt15M3lEGX4HqTvlWzLp+jgUwmsPf8BWoUUiDaBquWexv26R+btOv0uzo
         AZSR3mBuP+Ik8lE4P+uksViJZLsv5C3NMve+ToNQUl1jMDFsRcrWInhxSSNrpBfwM4LI
         OCXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631780; x=1796236580;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=/FleaBFvWPlvaB4AMIla7Lw9JilLoGWrC6AZTqDKtaQ=;
        b=2KUu6ShlOWU/RWJnF4q3vtOaoIAIDzU5GlrWYDzFPGlr0VGfgYmFkWm3iS+SCng9j7
         ksbKyRY6SUrh6UsjT5WBB1V5VMZ5qZcQqiLJckHE5tBRQ3x32Vc63IddkigPErK8MkLO
         mkAMGy8egFq8nex3Tlf7kkA9IeFku071k0vlF82V2nzDuzEqYaJ3QaCMrjS5v4es9CyC
         lw8xmwRw6g+ndhreQOi+eOMtbYWKdlwYW+qDntHTC3xDsPFiLV7KmVQVe2tGQ+noMDGF
         nwzcxw6W/9XIeArRjky+ocJrWNZ0Q4Cm1Tsk756/1BqEwWdnfJW1/KkF/1rJK8ZeRMOI
         ZMFw==
X-Gm-Message-State: APuU4Z8lH1MCdemKBVeH+wTKB1Y7ZeFg6ZBj1wSAy7y5TMyo63zbaXig
	pXWQ8GvhbKG0bR/auXuNSc0RYNKe0m4CxxJVj9V1e8i2az3OtY+snmNtCa0op5S3
X-Gm-Gg: AZFdTZc0GjAH2pEaQVFgmta6ontxqAZAVBUtAC12/tom7xC9VOxDRGgkZm72EoHGXgI
	pE6jKlLiFYQuFg53qkxIWVbgNOTl6ZjEY/nSAi84OKQ8MzhEOx60eME210Ui3xuxQ301L66094+
	VB2D2S423FXfzbT4sQFJ/egUlJFfmsXaFbsXdPgC+HlLUl+7Pwi3os6XL6SsEfdtu8vfuuywO2f
	icJV+/f02Lh0I+4u2nhu8jPA5iOnHc1hpoUteWdoWO6SgmnjtmWaxHpePQRlfaUKV7GOC02+tE4
	Qis9r3QVYTp9KikuHNjJOcSiMg+kEtUUi5xynE+gBpxDJ6373zG693/WsRKzpMGh+UqrDug/lwX
	Gl753O00BLZhBOaVEhT/R+cHPHM4FH/fxqcNKdQeszpeDwhsibBuqC1c9FwwhbMBHmvBatvpLFL
	6LmPX8FCPJBA/k92JRJOE4A9MQtX9AQhGPVzWZryuz1ce06O0vMYUnlJTpd/1H6xrND3slepOh5
	UoPkn55k6yJg0/jh0OdaNTFZes/2KFp6IMoGbTV4su8EoT0wNtm3jPLAJBTXXLK64XeMiISz8m4
	zGC9n0Jo3Tk=
X-Received: by 2002:a05:600c:154f:b0:4bb:6842:66ef with SMTP id 5b1f17b1804b1-4bb8893a963mr364279565e9.30.1795631779770;
        Wed, 25 Nov 2026 10:36:19 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2c8csm36941016f8f.2.2026.11.25.10.36.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:36:19 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v4 3/4] spdx30: Add the PURLs of the source downloads to the output packages
Date: Wed, 25 Nov 2026 19:36:12 +0100
Message-ID: <20261125183613.1335718-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125183613.1335718-1-stondo@gmail.com>
References: <20261125183613.1335718-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 18:36:24 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251239
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Statically linked code, for example a Rust crate, is part of the
binary, but the SPDX of the output package only names the recipe.
A vulnerability scanner that checks the packages of an image does
not find the dependency.

Add the PURLs of the source downloads to the external identifiers of
each output package. Leave out the downloads that a function in
SPDX_DEPENDENCY_SCOPE_FUNCS shows are not built into the target, for
example crates that only run at build time. The software_packageUrl
of the package stays the first PURL in SPDX_PACKAGE_URLS.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index 588be68e58..d613b4dad1 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -482,6 +482,9 @@ def add_dependency_scopes(d, objset, build, source_files):
     The build gets a scoped dependsOn relationship to each download with a
     scope. A download that is fetched but not used on the target gets an
     annotation instead.
+
+    Returns the downloads that are not built into the target: downloads
+    that are not used on it, and downloads with a scope other than runtime.
     """
     downloads = {}
     for dl in source_files:
@@ -500,10 +503,13 @@ def add_dependency_scopes(d, objset, build, source_files):
         )
 
     by_scope = {}
+    not_in_target = set()
     for purl, scope in scopes.items():
         if scope is not None and scope not in oe.spdx30.LifecycleScopeType.NAMED_INDIVIDUALS:
             bb.fatal("SPDX_DEPENDENCY_SCOPE_FUNCS: %s is not a lifecycle scope" % scope)
         for dl in downloads.get(purl, []):
+            if scope != "runtime":
+                not_in_target.add(dl)
             if scope is None:
                 objset.new_annotation(
                     dl,
@@ -522,6 +528,8 @@ def add_dependency_scopes(d, objset, build, source_files):
             sorted(oe.sbom30.get_element_link_id(dl) for dl in dls),
         )
 
+    return not_in_target
+
 
 def add_download_files(d, objset):
     inputs = set()
@@ -1025,7 +1033,18 @@ def create_spdx(d):
 
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
-    add_dependency_scopes(d, build_objset, build, source_files)
+
+    # The output packages inherit the PURLs of the downloads they are built
+    # from, as the code of statically linked dependencies is in them. Only
+    # the downloads known not to be built into the target are left out.
+    not_in_target = add_dependency_scopes(d, build_objset, build, source_files)
+    dependency_purls = sorted(
+        {
+            dl.software_packageUrl
+            for dl in source_files
+            if getattr(dl, "software_packageUrl", None) and dl not in not_in_target
+        }
+    )
 
     recipe_spdx_license = add_license_expression(
         d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
@@ -1138,7 +1157,7 @@ def create_spdx(d):
                 d.getVar("SPDX_PACKAGE_URLS:%s" % package)
                 or d.getVar("SPDX_PACKAGE_URLS")
                 or ""
-            ).split()
+            ).split() + dependency_purls
 
             set_purls(spdx_package, purls)
 
-- 
2.56.1

