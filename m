Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.7103.1795734462170518560
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 15:07:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=yTRWnwLo;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4bb64c99d2fso69491695e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:07:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795734460; x=1796339260; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uIQYNFg414Ab9Crcc812Ai6xnzWiVIAukwG64D/Zt6M=;
        b=yTRWnwLohAvT0nJ1A/Pv7MHaP+PK9uRtHfrumxz8C8NLUTl+oHJhaIs8MXzkdftqm4
         yVKF2wveO9D6xXuwe1cyGFwh15amEZfpRrMPNqyFyjvyaXuV0rNP7NSiaPS6QuqSArQp
         fRTQ9xF3n1Xpd8OjoglQbst1htOwll06PNTrwk90Lvzkh+QGahM3F+BOJdXbDFaXsKxz
         EPY3Sq/AVhC8OvN7ReiBb2MxLrkX0VFDaCbPoV5zDVUKayjnXrv+ZKJmC8sRBAUOLO38
         AMiSp5CrpoaEELASUfgAxdLEInwHMtd4jte/ArglPYs052aQttJOlusViSRxPjEqJhc3
         y2yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734460; x=1796339260;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=uIQYNFg414Ab9Crcc812Ai6xnzWiVIAukwG64D/Zt6M=;
        b=TN8RvLnu/dZGWj9H6K/9kirLcMOMReKg90JXRhjgwkvDfyZfZs0ylSl24jrMji34IQ
         1YsxoCHGbA82n6TF+HErNHlJMA8qJjRTdcESfxZOeKTuhQa1vF2CehWHAHb8mBpv7Hc+
         ucb6zwGYAYR4s0U83tq+/h4o0EJBh2bZo1+1XKxkbIIQpmt2YpT85nnNZfxLJAbpjn5k
         N/lXEw4uDBz8eGYPLfq4V1klVj4csWKqtBE2QnMsma4KCjbw3OG2AJjzKpr83XdP83CC
         GYJqQaSFTEfzx9pK2sDE1XW15kjPBRWcUiASE2KdB/HzeZ1SbEUuNdIWPvZ46/trztP1
         Xo/A==
X-Gm-Message-State: APuU4Z/BCOq5HmF+Jfsqs6pPuOnitvhKzV0kzfZcSgUeMfvUkBknjT9b
	O2TIZcqVvf50c/MI/lJSukND3CnMp/9MIN5Ac1T7iz534/im9B2m6ANnnaqHPO38
X-Gm-Gg: AZFdTZfVRptHjvSd7FuTTEobERX/6u5f3PbjvHFParp6//VV+pPOTR5lWcolP6/lneo
	ehY8FX9y8Q3NFWNdrIVAAIXX0ymVOn49FQbtmACWXsHP9bvyDxxtr3CcBPqM/4h571yt5MdCWfS
	7ithI91iq/9ucbcEo15vBTyw2H2TbIwMFbsnwZ27sagPc+LDlfGRRU9Y1tFGmdBLmQ5M19Zqa+c
	Vv+E7zORtbgVxxENUxha9N1gGMS14ndU7htaG/850KFIgzQNM0jKterCSivkn91NRqCiIngsGSp
	lyb7cRBa0WqffzQyBlcQKxB+kFszgGEYxcNuxTI+lnanJscAt8mRYIp1dV2JqNpzB/DU2Zi2vjR
	sZfx54CphEvQfXeWfdTrMeFGpORi9doP7+pgnpinM0WQjrWbQyPffGOZfQ7HfU8Jlp9kY1aNQQo
	fFjFZvndmgqKRDIBrNAY1MW181iEinhH4qq2FusXc7/srPTbTDAXFECBshLSQ0eMFRJl0Hve0At
	rJJ633LMBb9U1E6g8TbKkYNGvTsQV1sK000b3x7U68mILZxoMEEJwoJvwVN9+Dhcdj7D0SvYV6h
	539ejev/F0c=
X-Received: by 2002:a05:600c:64c9:b0:4bb:8701:bb14 with SMTP id 5b1f17b1804b1-4bb88804d1cmr482843625e9.5.1795734460295;
        Thu, 26 Nov 2026 15:07:40 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm748625525e9.11.2026.11.26.15.07.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:07:38 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	alex.kanavin@gmail.com,
	stefan.herbrechtsmeier@weidmueller.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	peter.marko@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v5 3/3] oeqa/selftest: spdx: Test crate identity and output PURLs
Date: Fri, 27 Nov 2026 00:07:32 +0100
Message-ID: <20261126230732.2708012-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126230732.2708012-1-stondo@gmail.com>
References: <20261126230732.2708012-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 23:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251337
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

hello-rs from meta-selftest has a fixed SRCREV. It fetches its source
and one git dependency from github.com, and one crate, figlet-rs
0.1.5. The new tests check that:

- The crate download has its name, version and PURL.
- The output package gets the PURLs of the three downloads and keeps
  its own PURLs.
- A download PURL does not become the PURL of the package when
  SPDX_PACKAGE_URLS is empty.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 55 ++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index ce9a8af4f6..17484df591 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -543,3 +543,58 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
 
         # Document should be fully linked
         self.check_objset_missing_ids(objset)
+
+    # hello-rs is a test recipe with a fixed SRCREV. It fetches its source
+    # and one git dependency from github.com, and one crate.
+    HELLO_RS_DOWNLOAD_PURLS = {
+        "pkg:github/akiernan/hello-bin@d3d096eda182644868f8e7458dcfa538ff637db3",
+        "pkg:github/akiernan/hello-lib@59c84574e844617043cf337bc8fa537cf87ad8ae",
+        "pkg:cargo/figlet-rs@0.1.5",
+    }
+
+    def test_crate_package_identity(self):
+        """Test that a crate download has its name, version and PURL."""
+        objset = self.check_recipe_spdx(
+            "hello-rs",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-hello-rs.spdx.json",
+        )
+
+        crates = [
+            (pkg.name, pkg.software_packageVersion, pkg.software_packageUrl)
+            for pkg in objset.foreach_type(oe.spdx30.software_Package)
+            if (pkg.software_downloadLocation or "").startswith("https://static.crates.io/")
+        ]
+        self.assertEqual(crates, [("figlet-rs", "0.1.5", "pkg:cargo/figlet-rs@0.1.5")])
+
+    def get_package_purls(self, extraconf=""):
+        objset = self.check_recipe_spdx(
+            "hello-rs",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/packages/package-hello-rs.spdx.json",
+            extraconf=extraconf,
+        )
+        package = next(
+            pkg
+            for pkg in objset.foreach_type(oe.spdx30.software_Package)
+            if pkg.name == "hello-rs"
+        )
+        purls = {
+            e.identifier
+            for e in package.externalIdentifier
+            if e.externalIdentifierType == oe.spdx30.ExternalIdentifierType.packageUrl
+        }
+        return package.software_packageUrl, purls
+
+    def test_download_purls_in_output_package(self):
+        """Test that the output package gets the PURLs of its downloads."""
+        package_purl, purls = self.get_package_purls()
+
+        own_purls = get_bb_var("SPDX_PACKAGE_URLS", "hello-rs").split()
+        self.assertEqual(package_purl, own_purls[0])
+        self.assertEqual(purls, set(own_purls) | self.HELLO_RS_DOWNLOAD_PURLS)
+
+    def test_download_purls_without_package_urls(self):
+        """Test that a download PURL does not become the package PURL."""
+        package_purl, purls = self.get_package_purls('SPDX_PACKAGE_URLS:pn-hello-rs = ""\n')
+
+        self.assertIsNone(package_purl)
+        self.assertEqual(purls, self.HELLO_RS_DOWNLOAD_PURLS)
-- 
2.56.1

