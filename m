Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2384.1794418550059218292
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=uTEQn43U;
 spf=pass (domain: gmail.com, ip: 209.85.128.45, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a1fbd52ab6so23598655e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418548; x=1795023348; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnt5ZzV7vikxmQUthDHOJrKIXPLKU60aKKQHbI2yaQw=;
        b=uTEQn43UmaSLqpl4xZ09VLVmxBDc+8vK6hE/PuLc8bRSDBrL7KMZRGJ3dX8QQMssj+
         0XCLdPAJ5gmdIe/9/qOXii94PztRFVIUrcRWpNpPRfR6WYxVWaYG536j2S7/ZH+AHbS/
         QnzceXcvpdH9gAbfJR7LsMzvyDm+4F5uqolyf/IxwXaau0RYO6teOWIWtVAT97LzlloG
         3KKamx6AbFvzZLblHKxB05VPV5ySpNtutN73pCMf8ex+THAXXspmEAg79ZUs0zWw+yr6
         sJiPFGc+ZJTecKAXiacnMM4SD0HMbrBGLOvy1Kk0KvxKKsvyvSNmcjn2ES+ATIHg8hH3
         4I7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418548; x=1795023348;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnt5ZzV7vikxmQUthDHOJrKIXPLKU60aKKQHbI2yaQw=;
        b=cEzSb5fVsjPXpgWLw3QB/jG+ZBZ0P2YJKVciAC/ZpFUUVfrq+ocPLz9P6wSbVpDyUJ
         4j4ddPVu3MZqgxdegBlThaceK6Gyywjv2sw/CZSYJVJze+qxvIFQWYLX3zUyyAr0NgbF
         5a5ryU0ZU+dqG2JhRUDWOIKr2J4pebq6NBdyHtlBqICCdNQp94esbF5qFkwRBIDf/z8U
         kUk3pPugPRJeL0hRRiqQI9wnrLywbjtKG8dW8V9TYqIWu1uY7n6R5kZvuGjg03PUKnLg
         tC1JE4uOOGAaHH2ZWDaf9KZENieofWlgsTxN1QAP8ypXrHFVJ9gUKGfuIuAEIlZbx5La
         uYxA==
X-Gm-Message-State: APuU4Z/5fqiVjpsDOgkvdC2nOZ6py7MV6TWEcWu6I/vUTxgL6l+1hl4N
	GKPn0Ua0eoZFrjU+b8FkUm2YRgbYjyYSxoNdq2ETQU7sN7vFllSgq+JsWFnlnJU5
X-Gm-Gg: AYBFou0cvuyNYWTIgxyWfXkv1w02XLG84BO7m+rV8J5yV84UOhS+11gSm9UZZNUNTIA
	Vfhm8JPtHTckHuFbxIa7yMN5BYxiqvSaATaOehDHzbf0zBYOGh+1+TARzbIphuhwO+lHM/VISoh
	BS2EbxHJ4hZH6oFnmfYDltYozbtlqnUslIauCfCYOgsvgY+n78ExbvzluB3iaJaH25Q7cDfmCcz
	3L24v/7mkPVnGkID3VN6Dkl1E2LXfbhlsJrnG8O3mUpiKfN1SIwlnQ1HgnwX/ydhHgaV49v/PFg
	UYu6i6CRwsTps2KMno8pSBzEq4V3B911LehaZhM93U1nEcdWLaevGdJWHUKvGj0lWRoUTJcaGSO
	NA+8uM7vbNu8RbgtjNKHbMgIr8Lr1r19oairuh3jcCbxUll8xB9FM715WrhxnaWZQictGZq6v+j
	qUp7e7BuX1Z5Ckc+JDqzSCdSkXfR1QykJfYYF+ACGqkDT7ADavBEp0AQFEjf7G4eMDNUX7XJXJe
	+9oCl/ZdS0JnIzOl4xHc8KUJqXJzQsUXsncxW3sF74gumQJdYwPWYijOh70/2dir/t8BQWbMgX9
	jt0UgIwep37H7GBl33o2uzW/wBpJqnBXoNMMvkhlRsahyQ==
X-Received: by 2002:a05:600c:a012:b0:4a1:fba8:b13d with SMTP id 5b1f17b1804b1-4ba0939d46cmr53629145e9.9.1794418548198;
        Wed, 11 Nov 2026 09:35:48 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4ba0950394fsm54823785e9.2.2026.11.11.09.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:46 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: yoann.congal@smile.fr,
	jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	patrick.wicki@siemens.com,
	stefano.tondo.ext@siemens.com,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	Richard Purdie <richard.purdie@linuxfoundation.org>
Subject: [wrynose][PATCH 4/4] oeqa/selftest: Add tests for source download enrichment
Date: Wed, 11 Nov 2026 18:35:37 +0100
Message-ID: <20261111173537.3653558-5-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111173537.3653558-1-stondo@gmail.com>
References: <20261111173537.3653558-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250049
Content-Type: text/plain; charset="utf-8"

From: Stefano Tondo <stefano.tondo.ext@siemens.com>

test_gitsm_source_version builds git-submodule-test, which uses gitsm,
and checks that its source download carries the SRCREV as version.

test_git_purl_mappings_rerun_create_spdx builds fastfloat twice, first
with the default mapping and then with github.com mapped to another
PURL type, and checks that the second SPDX carries the new PURL. Before
the enrichment became part of the task signature, the second build
restored the first SPDX from sstate.

Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 3ca309cbd38e7115705a9871c389b4641ec88c63)
Signed-off-by: Stefano Tondo <stefano.tondo.ext@siemens.com>
---
 meta/lib/oeqa/selftest/cases/spdx.py | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index 8285189382..e65ab46f30 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -443,3 +443,50 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
                 r'\d',
                 f"Version '{version}' for package '{name}' should contain digits"
             )
+    def test_gitsm_source_version(self):
+        """Test that gitsm source downloads are enriched like git ones.
+
+        git-submodule-test is fetched with gitsm://, so its source download
+        must carry the SRCREV as version.
+        """
+        objset = self.check_recipe_spdx(
+            "git-submodule-test",
+            "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-git-submodule-test.spdx.json",
+        )
+
+        srcrev = get_bb_var("SRCREV", "git-submodule-test")
+        for pkg in objset.foreach_type(oe.spdx30.software_Package):
+            location = pkg.software_downloadLocation or ""
+            if location.startswith("git+https://git.yoctoproject.org/git-submodule-test"):
+                self.assertEqual(pkg.software_packageVersion, srcrev)
+                break
+        else:
+            self.fail("git-submodule-test gitsm source download not found")
+
+    def test_git_purl_mappings_rerun_create_spdx(self):
+        """Test that SPDX_GIT_PURL_MAPPINGS is part of the do_create_spdx signature.
+
+        fastfloat is fetched from github.com. Build it with the default
+        mapping, then map github.com to another PURL type: do_create_spdx
+        must run again instead of restoring the first result from sstate.
+        """
+        spdx_path = "{DEPLOY_DIR_SPDX}/{SSTATE_PKGARCH}/builds/build-fastfloat.spdx.json"
+        location_prefix = "git+https://github.com/fastfloat/fast_float"
+        srcrev = get_bb_var("SRCREV", "fastfloat")
+
+        def source_purl(objset):
+            for pkg in objset.foreach_type(oe.spdx30.software_Package):
+                if (pkg.software_downloadLocation or "").startswith(location_prefix):
+                    return pkg.software_packageUrl
+            self.fail("fastfloat git source download not found")
+
+        objset = self.check_recipe_spdx("fastfloat", spdx_path)
+        self.assertEqual(source_purl(objset), f"pkg:github/fastfloat/fast_float@{srcrev}")
+
+        objset = self.check_recipe_spdx(
+            "fastfloat",
+            spdx_path,
+            extraconf='SPDX_GIT_PURL_MAPPINGS = "github.com:pkg:selftest"\n',
+        )
+        self.assertEqual(source_purl(objset), f"pkg:selftest/fastfloat/fast_float@{srcrev}")
+
-- 
2.56.0

