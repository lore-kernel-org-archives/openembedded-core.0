Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7283.1795734459906365112
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Nov 2026 15:07:40 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=KScqWfop;
 spf=pass (domain: gmail.com, ip: 209.85.128.50, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4bb6ba3b244so76962675e9.3
        for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 15:07:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795734458; x=1796339258; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xonWD7Snn0hWh2vwO+f5ySqU3j4QSwz4J3oNMt7n+rU=;
        b=KScqWfopIReKPPWlPdoOjqt2vSx4kXC7V+/GZ7IySuRDM3qyJawtx7S8NqfCNGv+8E
         JClv77VYL7KlrrbK0C7XbHqqhO8e/E0vXn6DHNDX5C6vIKn6EJPF5pUCnUf3RCbgf2IR
         h99ASH562hCrVFwwjQOxRTKPSF0ZbRt7KliYYcLYTfG2V1vHRP8h9T2nZ2Lx/ks1rsmS
         krZip1MtOkX35vresyWzOnaRIgsw/0bjtTmu2KYaBEGFvSnWqWQ0Pc8gdvLFp4wt5EX9
         bKcQL3sDTfMXDOE2DtpiDkRg7V3FED1gAH9S4vrpAy0bAZ+IKTuiCau0VQreSx6edlp0
         J6WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795734458; x=1796339258;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xonWD7Snn0hWh2vwO+f5ySqU3j4QSwz4J3oNMt7n+rU=;
        b=KnLa9LgNao+b+QNEjCke4QYB6jnhJgip2RtyZhTI9tGTjQXPvGXFD8LRBjpjbM00Yv
         S5Pw60bTNdD9mETCeV1t0QKa0964R0bsHI/zbKGU5OvwbqOZ4hsfslYMbmKP7CIvL3Li
         jWhWuIATx6UM35g5vEHXq7GKOs+rgUFy6kf3nLKdvK7LjHJWNxeODysPJ+oUj/6B52hj
         HdcgKwJooyRhXtIky+P3Nf4MwQnMyT0rj1fYbpD6vdq4Fk7CmnraQt3dG31MXHApIFH8
         pKciWRgE2pmLYwwMh3LJ6MdJUs0Lv9jDWEnZKQnQcAeEtovgONFXtiSfIpYCFsdj6vMz
         C6bg==
X-Gm-Message-State: APuU4Z/b+IqtBi+9olRUMFqht+EwxvCwtqPVoZd80rLbpHybCMq9riEr
	paoFUDsY8U8XFaON5fZmx4Xt2WMz5uXkWIZXQRnqWDkKnpOSZRbZPIHP5y6J4W+V
X-Gm-Gg: AZFdTZfV43eIdFJY3Qg2orguo9QQ4lycpPTUds1Osv804lfjHL4LOlo8VIB3HjuPxBe
	15rgdguTSk+Wj4RBlKtv3+VE1/0WpdSM2m2mhQBOWrpMljSeNUXwUcex7WD5Gm3SH5oz/Eg6CtI
	Gbxb1qzyhioyvEXqr0NxK8gwPk9GJ/TF7zn9WmdcaGeMDyECr9lDtP0GKpNklTZD37QrATOF/sc
	mtGDe9KEmd9I854y2Oc178djdVwzf5k5RITPVVx6kS/L5kIcmjMm0qak6arRW+v7mJ+TpVraAoI
	oFYsEMfvddUjZHqJ7RA4lELL8c8CU0V3X4KpT+mj/SoelPqR0jAQyctJSjvow4u4V8t4RmzJOi3
	MwbZQwcSlInOrAa3olD9mx/6iYb3WhQMlPEHB7cX2B4neZBbBSWsvgSJY5NCF7jM1Y6HG2iBRkl
	jcaqw+5vpRtcFjtFMcfXQqw0bM0EClOIUDeZwacfJk2q8iGRzVf2NH81bPNLlo2EHggN2dxfFSP
	MG6q3WK/IdYfFWsugHlRjZ3dxaD5erKDlqWg50DGdh8mV82pk04D6Jbl72ekxdbhBGzKILYEQ+e
	Jfh1hVpkux4=
X-Received: by 2002:a05:600c:b8a:b0:4bb:7007:4a5a with SMTP id 5b1f17b1804b1-4bb88817772mr465342735e9.23.1795734458093;
        Thu, 26 Nov 2026 15:07:38 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm748625525e9.11.2026.11.26.15.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 15:07:37 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: JPEWhacker@gmail.com,
	alex.kanavin@gmail.com,
	stefan.herbrechtsmeier@weidmueller.com,
	paul@pbarker.dev,
	mathieu.dubois-briand@bootlin.com,
	peter.marko@siemens.com,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v5 2/3] spdx30: Add the PURLs of the source downloads to the output packages
Date: Fri, 27 Nov 2026 00:07:31 +0100
Message-ID: <20261126230732.2708012-3-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261126230732.2708012-1-stondo@gmail.com>
References: <20261126230732.2708012-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 26 Nov 2026 23:07:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251336
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

Statically linked code, for example a Rust crate, is part of the
binary. But the SPDX of the output package only names the recipe, so
a vulnerability scanner that checks the packages of an image does not
find the dependency.

Add the PURLs of the source downloads to the external identifiers of
each output package. The software_packageUrl of the package stays the
first PURL in SPDX_PACKAGE_URLS.

All downloads with a PURL go in, also the ones that are not in the
binary. For example, a Cargo.lock lists crates that only run at build
time and crates for other platforms. So a scanner can report a crate
that the package does not contain. To leave such downloads out, the
SPDX needs a lifecycle scope for each dependency. That is a separate
proposal.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oe/spdx30_tasks.py | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/meta/lib/oe/spdx30_tasks.py b/meta/lib/oe/spdx30_tasks.py
index eded315819..8f4e3dc4fc 100644
--- a/meta/lib/oe/spdx30_tasks.py
+++ b/meta/lib/oe/spdx30_tasks.py
@@ -597,11 +597,11 @@ def add_custom_annotations(d, objset, obj):
         )
 
 
-def set_purls(spdx_package, purls):
+def set_purls(spdx_package, purls, dependency_purls=()):
     if purls:
         spdx_package.software_packageUrl = purls[0]
 
-    for p in sorted(set(purls)):
+    for p in sorted(set(purls) | set(dependency_purls)):
         spdx_package.externalIdentifier.append(
             oe.spdx30.ExternalIdentifier(
                 externalIdentifierType=oe.spdx30.ExternalIdentifierType.packageUrl,
@@ -979,6 +979,14 @@ def create_spdx(d):
     source_files = add_download_files(d, build_objset)
     build_inputs |= source_files
 
+    # The output packages inherit the PURLs of the downloads they are built
+    # from, as the code of statically linked dependencies is in them.
+    dependency_purls = {
+        dl.software_packageUrl
+        for dl in source_files
+        if getattr(dl, "software_packageUrl", None)
+    }
+
     recipe_spdx_license = add_license_expression(
         d, build_objset, d.getVar("LICENSE"), license_data, [recipe_objset]
     )
@@ -1092,7 +1100,7 @@ def create_spdx(d):
                 or ""
             ).split()
 
-            set_purls(spdx_package, purls)
+            set_purls(spdx_package, purls, dependency_purls)
 
             pkg_objset.new_scoped_relationship(
                 [oe.sbom30.get_element_link_id(build)],
-- 
2.56.1

