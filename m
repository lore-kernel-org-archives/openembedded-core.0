Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4792.1795121357828128177
 for <openembedded-core@lists.openembedded.org>;
 Thu, 19 Nov 2026 12:49:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=JeqJG+60;
 spf=pass (domain: gmail.com, ip: 209.85.221.45, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-490c3ae81d3so82726f8f.2
        for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 12:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795121356; x=1795726156; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PvCH4R90rfne2Q7UD9n5NqK14z1DQrcr6x0XCs0igVY=;
        b=JeqJG+60F9k2l+zL8q/N0hxAHJLbgQMZKEalvBXQFowYElcc19pqGAArc4/jwivk//
         8kJnH4yBXC4hek9dbT/aqkB9mz3tBuuChqC5owAF7LfPyXFaK2E4U/B+ViYZVQjOdW7M
         v4/ylduM0XqpaDwyTSwwSvIUdy01Fph/lZ1p2ZEmjtzSk9Xo+XY4KH3p5sVQJULgBuXx
         o9ooi8Qrf5TVnlQdbxjZBh+rcNtYwO3uITVqvs8Z6Y/CAJw6tLHVqR9i1S3/7/kqzYmf
         C52eJHfow+WFQgO0LfoFExlUUGBdFv3qQmvoWCldnyiLon7LIcM/zo7ijV8A/085rlfg
         e/Kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795121356; x=1795726156;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=PvCH4R90rfne2Q7UD9n5NqK14z1DQrcr6x0XCs0igVY=;
        b=Pvabnnqt7RUhRoROG5MHuo9hgx9TXIWLF8FcqYrjifIWfcEHXYSRpFlxixM6Rp7yHT
         yevoTDSiWxyLtrPLFTAv7tPONa+H3yy3XKEoFicsTr+PRRO2DD5TDINItFsJ60IjIOXC
         AfhrweNQEfsw3U7d4WmMn9NpKwIDOPVlicDBDoRBV30Yqmsyv8ei7cyV59mV5J9OJ6sN
         RH+/eGDMeujgcFjqeEugYlJ3ghBuLiFXFfHiekuficK0TZ0jo3qJOhZanpHrfDVZru69
         Vj/GVFXnaBgajGjLR5x8ZJMGmOP/4oRihpMlji2jTifP7dkwslF0aTOQ0q2LX04LRx+D
         MxDA==
X-Gm-Message-State: APuU4Z9tKXkyvQoxRzAKzueIO6mnMNZZWySbtZTIJwhlg/Lxh3Cj74OW
	aYbLimOea/C74zA819exBMP3jID717FYTc+4yfDvfl0UUwTTbdHHfLXapkT0E32z
X-Gm-Gg: AZFdTZcHmL/BJQLK506rCUFmXqxqio1ByUFH5ReLQRzA/2bZt+BSy8esfD93VMel6aI
	qNdwsdp9av+70VbFUEG0TsTtPXBP04JUSaf+f4CYnc//0NAAztRvnafpTpSAL80CbOwjVWSEgYr
	H53UNkiNFuxRi5+1ZZSR1c9Z71KigNExUiPPEeA77+aglbTbcjZQoW4ZZq3nK2VWGRBsnfF6BmW
	zYmBJpPLEQmOAtTU9f/eAZfvQimCKuRlRfv68hguDxKvDi2UKWxUh59PtHQJ+nnzKMX+Ea4ESNI
	LubTm7vxv3dSCCFlESBSwZvYn+yNDreBrqVj8s/qMOwyJqaJ6IZJ9a4OEF5O70iZHFiJKLlqeS4
	cTg9AsstblGLPdQd1iWJzu/0XwVWOl2DtbEVlJVvBbAeNbGXzS8QOkVjEyoW+5A99TXp7w8E01+
	x4ikyXhdRobdakRRqrGtwyyR89mgDc0JfgrUjg5I/e8xn/yykOfeZSCphDn6zdMq2NAmmfOirdY
	SEruhGh3DGeIHH1Gv58AKY4nrh97y+gxz4qCuE0RD4ik6vjUSRxPzdERyVQhlviQfuKiUFnREBO
	mRZZBihSdlc=
X-Received: by 2002:a05:6000:47d4:b0:493:8c32:94 with SMTP id ffacd0b85a97d-4abb400ae31mr774991f8f.38.1795121355964;
        Thu, 19 Nov 2026 12:49:15 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c43563esm1606171f8f.57.2026.11.19.12.49.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 12:49:14 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>,
	Alexander Kanavin <alex.kanavin@gmail.com>,
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>,
	Paul Barker <paul@pbarker.dev>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Peter Marko <peter.marko@siemens.com>,
	stefano.tondo.ext@siemens.com
Subject: [PATCH v3 3/4] spdx30: Add the PURLs of the source downloads to the output packages
Date: Thu, 19 Nov 2026 21:49:08 +0100
Message-ID: <20261119204909.2931233-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261119204909.2931233-1-stondo@gmail.com>
References: <20261119204909.2931233-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 19 Nov 2026 20:49:19 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250720
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
index 01e4eefa2d..6887f408ea 100644
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

