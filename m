Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4153.1795045477079480627
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 15:44:37 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uuKZpdeB;
 spf=pass (domain: gmail.com, ip: 209.85.128.52, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4ac95761c85so12810025e9.2
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 15:44:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795045475; x=1795650275; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4h39kvK8SGfHkypJnM+Og15Dbn7IP3iwkJ7gsJCdJqE=;
        b=uuKZpdeBfXf2DcevDMaf2KN28k3/ydrY9UZoPhhOmAdqnKk1YKVNNTMXwj3OVUcOHr
         yOspr2jsJb7BOeJNKb9aHdq13qldaFkCwpABJ6udhaX7ndUD70tRVgsrt5TM+S2cas60
         zRIw6Dym4j/aRf03jc2k1mqCnBZRwKgIjWxF6yocJFF5HrARnyPXMoM8g7Pqv2gD64Ti
         Ef7tf6ToIehJ8suiHnUmc26C4wfDeyS1PxP/kLzljf3KuXbrVfdXfutT0ICnMIJzsKbl
         7KyARcPqdEi94D7dEf+ZBXxAaFZ0WQX1R42LHe+IS5PEwaU8Q0eYwPouq1i2j6sX6dmR
         CDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795045475; x=1795650275;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4h39kvK8SGfHkypJnM+Og15Dbn7IP3iwkJ7gsJCdJqE=;
        b=1lW+s1T99YQP3yTHrwjvAeuyWXEPtiblL2Iplu8sbGH6StJij2B36C+LWvkDjIyV3B
         QwCMVJOMAB/SLiQEegpXmhRYXbn3/81INpg36mue5y7XleSH84OzMK+vzIBIhPYpSs4p
         OBJTte5P8eAOfn9bFf2klSJL9SbjQSgE1BmT3Z5vsKk9XwoAqfCtI7xd4i5kzAjW4IkR
         MagoXN+GMx1Spn44RwpJtqN7Dyofe6Ox0uGaG9/MISFJXsKllHbUFb8ybzgodHhd5AZD
         Q87Vg/7Kml651K8I3KHf9MLoelP9BeVM4FPAMKLjJRTczN0Eos0tPmNNT3Y57HjUO+mN
         UTJQ==
X-Gm-Message-State: APuU4Z9o+3o6wjz6y59E/tOV1FR2vrQyz9N0JfiCoWT0ZlkoduBk49mX
	cxbQSdV0K7XDaDX/m8/W7uHcxXB5cJLgV6dKentg5PO3dR/VLtuSeZvZjPnElQ==
X-Gm-Gg: AYBFou0qcRVN82uNTmqqDnH10igW+OUrOUIGOLAfB/TjiL5IZYV1RIrSRuhT4UcTqBf
	gjPrtKaogq7CLJR9xP6UyXBoAdd0nn7ue6AkWJiD7mS6akUWdMSznCdhwGlP5SxlEOfWMKCae7X
	oLYXvOR6HvAmP8Ow3qjF3kAr/JQayObvBdX3csAZY0Xv6p+NBI1DmqLDGA+8q+ZV55irQxvOHoA
	AaVGtaxJdrJfpmgZmUqG62eRGTKuZLjsfZ0JrYL/jqGr/qzmMz4DkE8Yg6IE/7XKMSJr5NBkq8F
	PK0kHFw+Dg7Hw8SbHWfmFriNPHgiirTXxJLtvxxQo98fMSIUc/LvXWONFndg2+9zJyO1oixYQ1G
	9ZKWzRsdt8wYAwlSF6YwgSN2FFgM+A9Wg0dm4vn2APnDXFGvdxmLUzyt2W8QVErsqRvKyMKnVmf
	WlVM9ok3c6I+OGjq8j380OX1gEnbieMsaHUsxau0tzeNzDhqrifNW+ouAg5fZZpljhAHjZaClx8
	WNDTCXb3fWZXiLiCze2I0KS0H0OZ4AeSuWIIpX8EMX12GispBeaJ67nJcaH2jqIdr9/WSaa6dcM
	0gmn5M5WTv8=
X-Received: by 2002:a05:600c:c174:b0:4a8:f2ad:a9e5 with SMTP id 5b1f17b1804b1-4bb7d5d4108mr77253235e9.3.1795045475276;
        Wed, 18 Nov 2026 15:44:35 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a654a8c3c6sm6730718f8f.19.2026.11.18.15.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 15:44:33 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v2 3/4] spdx30: Add the PURLs of the source downloads to the output packages
Date: Thu, 19 Nov 2026 00:44:24 +0100
Message-ID: <20261118234425.3681880-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261118234425.3681880-1-stondo@gmail.com>
References: <20261118234425.3681880-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 23:44:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250603
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
index 7aae73ed0d..49494a5007 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -535,16 +535,24 @@ def get_cargo_scopes(d):
 
 
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
@@ -563,6 +571,8 @@ def add_dependency_scopes(d, objset, build, source_files):
             sorted(oe.sbom30.get_element_link_id(dl) for dl in dls),
         )
 
+    return not_in_target
+
 
 def add_download_files(d, objset):
     inputs = set()
@@ -1066,8 +1076,20 @@ def create_spdx(d):
 
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
@@ -1180,7 +1202,7 @@ def create_spdx(d):
                 d.getVar("SPDX_PACKAGE_URLS:%s" % package)
                 or d.getVar("SPDX_PACKAGE_URLS")
                 or ""
-            ).split()
+            ).split() + dependency_purls
 
             set_purls(spdx_package, purls)
 
-- 
2.56.1

