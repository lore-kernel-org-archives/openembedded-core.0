Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.9018.1794994174894705442
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 01:29:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vQhzAFha;
 spf=pass (domain: gmail.com, ip: 209.85.221.47, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4a33359c1b3so435617f8f.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 01:29:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794994173; x=1795598973; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1kl6VU6VdpKismv/dpDsJcyLqr9MXcp0WnD4sSJdUj4=;
        b=vQhzAFhau4VTm3nSqStrN6F4oSH1AdxQvAFcp8NLOV8jlKTY8fEmskD+f5IPRudHbG
         ElYTCzVp8gjZEPzKYT36zvFZaqeXb3W+1qg+MzvxXjdAzdTd5xiC7shmDsuJPaRaMh17
         YEnu446P47mzpR2SxiuRAI38i2sNQGWD9acODqnWSSXbBH63CZTnkzIIaH8xZmzLrCK4
         SkiE1a1frNgYztOx65kCnOyB8RXUzQXo+BE5DV+ulTaiTL5p/yIFdbQ7VtYiAONNSfls
         eYVbB4kN/ot5b+8FETJ65heEChjxyx44mduBfOErC+pAe7iF5bmsRHuCU70Dma9X2OYs
         Vnyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994173; x=1795598973;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1kl6VU6VdpKismv/dpDsJcyLqr9MXcp0WnD4sSJdUj4=;
        b=HqfQ+KWcjtYBih2QPahSNsNKcL/PhY6YMsfN5uDayOj+tG7E3spDX65V5JX6mo8PvS
         Ji3tihdOQ3S5IJZ25q4D/cFs5LHQbq2vxeKHJ6QTqMvyjWn/hA8GEM2JXUWCMmi0mO98
         j2/ERKVBJUPhscKMJdc13cVmAn+A8Wyno9I68ewIHQ0nZq8Zqnu+lrUb1WbfXKUXjvLc
         /6Rq3wqUlbWkyELOqgWLmYCyL1ulu6R2lj/xEbmLWYuED1SABvXPlqvzdPReOjm+T4NX
         BIqcxwt7XUtEnMMp4sUcCs7m1wGHZUn807nUFxlHW7MUfPutm79HHXzjiB6bMeC8o84F
         vTvw==
X-Gm-Message-State: APuU4Z93X8LADZIVuOf4egFXPUSxEAHgpG6rdROfHhWz96TuTMrnLm05
	k0FZKRZKdFUmJQDXh07RF/4GhCU8kEeXltw3TjEUQXXRwySpy6uQg+iNT0muLQ==
X-Gm-Gg: AYBFou2ZSAPN+wwKtw3p1sLPvBX/a3dZXvhThTVre0VQsNoZFLqMGfjV2hI0+4WkVld
	lcJSoPjoF4nLdq6GgfiUAGRHxwKYW2EuO4R7ATKeqk5zYy5CNWGtZm1K2tm3cMIAdS3Yv4VCbAj
	zwh9Y0AegVKd4lqb+23hKSmZJwf+Tt1azAK2FTmFOLo7uWr/gm7fdC+5MUkLWotVsHzHRMREvHY
	PNbfL0df/e72mC6xiK6a0MG7FZYtfrOe6f3naVsf+eAI34vuaIslUwhFXDsmBXjcOKYPYWmbW1L
	w+pLmC5Z2VLeKSOZAXWQTvrD3xRRLCq2UD3rzixVEh2RopdWW/wxUDeRPR+I1ysaANm2NF1wK6T
	J1lUN42Rd0SYTINdBbXarAF1K+T6vL/uRm5n5LFuvQNZ8dtQ1nbdg4r6+1BuFcgLOvn/WacFPAh
	YGB5gCVi1CWv7JwI3C0EUAI9YwAW/jt27jzEcpdb54rk2aOpkqS/LKDY40e42KZBvKyM4h5RB/W
	JwfUK/UbEmI+HGwEFrFq8OUNxDRIpEyiqaq9lZ6Fd5V5OWuyXN1xr8M4CR6F9SvPN6p521pMnIK
	URriHOI2ZGsqlD+UUjszGDjUPdNrBkp3
X-Received: by 2002:a05:600c:a112:b0:4bb:7e4e:de69 with SMTP id 5b1f17b1804b1-4bb7e4edf78mr17121755e9.20.1794994173089;
        Wed, 18 Nov 2026 01:29:33 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d28ec3asm55486755e9.0.2026.11.18.01.29.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:29:32 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Stefano Tondo <stondo@gmail.com>,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH 3/4] spdx30: Add the PURLs of the source downloads to the output packages
Date: Wed, 18 Nov 2026 10:29:26 +0100
Message-ID: <20261118092927.204959-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118092927.204959-1-stondo@gmail.com>
References: <20261118092927.204959-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 09:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250529
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Statically linked code, for example a Rust crate, is part of the
binary, but the SPDX of the output package only names the recipe.
A vulnerability scanner that checks the packages of an image does
not find the dependency.

Add the PURLs of the source downloads to the external identifiers of
each output package. Leave out the crates that the cargo dependency
graph proves are not built into the target. The software_packageUrl
of the package stays the first PURL in SPDX_PACKAGE_URLS.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 30 ++++++++++++++++++++++++++----
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index e40716a6df..441df709a4 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -526,16 +526,24 @@ def get_cargo_scopes(d):
 
 
 def add_dependency_scopes(d, objset, build, source_files):
-    """Give crate downloads a lifecycle scope, see get_cargo_scopes()."""
+    """Give crate downloads a lifecycle scope, see get_cargo_scopes().
+
+    Returns the crate downloads that are not built into the target: crates
+    that are not used on it, build scripts, proc-macros and the crates
+    they use, and test-only crates.
+    """
     scopes = get_cargo_scopes(d)
     if scopes is None:
-        return
+        return set()
 
     by_scope = {}
+    not_in_target = set()
     for dl in source_files:
         if not (getattr(dl, "software_packageUrl", None) or "").startswith("pkg:cargo/"):
             continue
         scope = scopes.get((dl.name, dl.software_packageVersion))
+        if scope != "runtime":
+            not_in_target.add(dl)
         if scope:
             by_scope.setdefault(scope, []).append(dl)
         else:
@@ -554,6 +562,8 @@ def add_dependency_scopes(d, objset, build, source_files):
             sorted(oe.sbom30.get_element_link_id(dl) for dl in dls),
         )
 
+    return not_in_target
+
 
 def add_download_files(d, objset):
     inputs = set()
@@ -1057,8 +1067,20 @@ def create_spdx(d):
 
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
+
+    # The output packages inherit the PURLs of the downloads they are built
+    # from, as the code of statically linked dependencies is in them. Only
+    # the downloads known not to be built into the target are left out.
+    not_in_target = set()
     if bb.data.inherits_class("cargo", d):
-        add_dependency_scopes(d, build_objset, build, source_files)
+        not_in_target = add_dependency_scopes(d, build_objset, build, source_files)
+    dependency_purls = sorted(
+        {
+            dl.software_packageUrl
+            for dl in source_files
+            if getattr(dl, "software_packageUrl", None) and dl not in not_in_target
+        }
+    )
 
     recipe_spdx_license = add_license_expression(
         d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
@@ -1171,7 +1193,7 @@ def create_spdx(d):
                 d.getVar("SPDX_PACKAGE_URLS:%s" % package)
                 or d.getVar("SPDX_PACKAGE_URLS")
                 or ""
-            ).split()
+            ).split() + dependency_purls
 
             set_purls(spdx_package, purls)
 
-- 
2.56.1

