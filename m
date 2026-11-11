Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.2376.1794418539514953302
 for <openembedded-core@lists.openembedded.org>;
 Wed, 11 Nov 2026 09:35:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=eNWeE8XJ;
 spf=pass (domain: gmail.com, ip: 209.85.221.42, mailfrom: stondo@gmail.com)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48b001cd92bso1844891f8f.2
        for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 09:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794418538; x=1795023338; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cnt5ZzV7vikxmQUthDHOJrKIXPLKU60aKKQHbI2yaQw=;
        b=eNWeE8XJz4rruGKnHX9V7xNtAe/T8caFvV1rXftsgb9lBgSrqUpKj9mWhCQQWwOJPy
         BbDO1In4IIpsh7iAJEdIcivqJaRGSn1GRPVojTd4US3mSFbgOMR68rTFakRl0JwOJjxf
         kRx2vQcD71u7WPMNBnInxbBJV8BYBNxkVcFaJivzuXIyuWeM458Iyr7qEMfEqshREzPr
         d8e/RZLFx7nGeaHJiyIS8LN/z2QAta/2Vx2drJnWT3CrR+En10ibj5DvONg6ZGsexB8/
         Mqxb+5nwX49dOVe17InjLYnatyR7Ox8WyBc5iHMNMtsjc2vUOaqEPLJN7DyCadgDw6xa
         MVzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794418538; x=1795023338;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cnt5ZzV7vikxmQUthDHOJrKIXPLKU60aKKQHbI2yaQw=;
        b=LNiU6w+eAMa9he3CiTikDaqMVgxvTDtbRYrAEZcHeSc6Cc0FKLw1vHtDDkVepoPhPi
         QwTR6vJ/kg0ZuCdQhuIvdx3pL0bRuP00DFaLs0sihmHjzhGm9oFxmSUGSpn/wXU+EcFR
         HrK8G1c7BeiuBPPLO3fezTRPQBNVJ/N4y5WIfRKi/43HTyJtjpvVB+mYGDvzPpjwWfyM
         bZ++170EV2YF1emqNd/d+tuTY0cO4OQX/b27vg3GIi5EXzWLqlgXcMYUkDHhxqXZc4VS
         xiKSp2oNHpMoszZLuiyQD4sByAsjNjda1lVG2B+nkl3U16pCGGxysFTIYGkF2WQKGi7u
         DsqQ==
X-Gm-Message-State: APuU4Z+zuy9GYprlUJWxG5u17ueJSmj7FR3iL99Wk+QDgMabtpNGz0xv
	9jVoo4xKRASz35BIwizaQTWNqldcFwPG83G7Ap54x7k6KNNb5yUiZCoH2qpKMIJF
X-Gm-Gg: AYBFou2UtKwKzIxNvvwuz0WAKP0rF0uROa1dOPevGU14VTDOS2LiDgnQReXpiLAhzbt
	BCS6ECVwrvBdb3woBDpzbwxgrab4QvVZc4kw5gmyXj3ZqfY+Dr5mQpjnf9x/ZQDNNh0hUwZhrSn
	f0ddxnLRIXFQ+wNh8TbEyxBSLt/VuUJHt14Zd9BbK+yX+ZSDebRPz2+mngHtwO4/ZycGsYOLvky
	g0/VZPJ3eUEUIpiSfr3w+8g10VduFHIRJGf/Gm9LzS8PR9+JMMWfanRRdEr9jmGfU4SEI8J3e3K
	P+AD8MSJ7fEss1jFWTeF241W4mYLoEmzPx9qrCjEx8aWGoqNhrSK7llFtU2dJBA2g6QbKBYwcZc
	7kwd2KaMeIZD1qWM0lf4uMG5thCHkZwHh5FHPksJsQI6rswmWl69I7IpI+Sku7PRUxN/3jdwr9q
	cU1j7eN44gIr5DGbPbqXOCNSFYUWVxEoIn+Le/Kliug0oNfWoS59LsSJ+IpvXQRVgHSOe/kdkfL
	hRAnDbEED5tyLgKW1Lsk2uWNQhSn0NS1GJmjT3AvM+CWXchEHSe9EzkwDTgX00QOdX5EsDLspGx
	j2KES06/Dd/7D4IiXsnmpNfhw78/y5NyEWAHLz7xORxDglE=
X-Received: by 2002:a5d:6f11:0:b0:492:46e:d4ce with SMTP id ffacd0b85a97d-499c89825ddmr5191813f8f.13.1794418537608;
        Wed, 11 Nov 2026 09:35:37 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498363df7a5sm12214329f8f.37.2026.11.11.09.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 09:35:36 -0800 (PST)
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
Subject: [blacksail][PATCH 3/3] oeqa/selftest: Add tests for source download enrichment
Date: Wed, 11 Nov 2026 18:35:26 +0100
Message-ID: <20261111173526.3653122-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111173526.3653122-1-stondo@gmail.com>
References: <20261111173526.3653122-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 11 Nov 2026 17:35:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250044
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

