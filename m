Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7057.1793791385216139509
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 03:23:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=YRw8znom;
 spf=pass (domain: gmail.com, ip: 209.85.128.46, mailfrom: stondo@gmail.com)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35db1f202so4014085e9.3
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 03:23:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793791383; x=1794396183; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=clrinB6kn2KFJrBAh44Avrv6dR4n+TvXFI9I/VdAcDY=;
        b=YRw8znomi4rdzgSbKQFDYqdYllvkaS3BZPsJoSNumsWF1GqZ4WPT9jxSjzQ+J08fOc
         8sUp+x7FlfMpgtDg81x8ov3VZGX+uQVysi3QvOvHbQU8C6p1vHJbf8hkFgcThmSDPWSS
         bFanGjyfh8GeuG7UfeA06vXWuCRHoIkwrHx8vcOc5/vLQqg26S7JRrt4NDOzcJb5adPn
         2fzAVZ/4KWUdfZOxr+UP+vNPJgtCf6ZiVTqsspl13lSUMC+1QTWvqgW4HT/xxVoF83cH
         8UxlEARaTR2MSXGo+q+i1W8FTKzrk2X8c2eCIfKNJHq+7nE7H4tteXrGBA3coUv5nTsM
         kYpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793791383; x=1794396183;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=clrinB6kn2KFJrBAh44Avrv6dR4n+TvXFI9I/VdAcDY=;
        b=HBwaVH+z0OnitJTbUv6HMwca73gGH8ZxDasJPjG3SlW6XxWNvD/qDtYh1F/elmGSXX
         dHC8o7qfhhb8A7NOREC5feM94iXLppsS3ontmoAFT77EFOGZBjVA9ENdQvHcBUDArKZ3
         nN+eHIE+r/CCKC7DN7DqEUI62ZyfMvg+Y/K5jtj4TINi4lkG7IVTVNv9nztvhdn9qU0s
         Ki4FlVgI8ZMvCkLUdX+T7otM/2rjSsYE9xTj/45Zi3/Y+rnAWcc5cwIFkbpaoXT+xQk3
         coVoS5oSfuSn+dTUJXeauE3AwX9bf88kD4pf/HBG1jn9ZqxbIasrCBETPXU//+XPwfGD
         UwPg==
X-Gm-Message-State: APuU4Z/3ZJaD/Gw78S8pejSSE2pNv7+ELVQuA5QpnappnMZYk1V+HoQL
	Zj9XyhT6I37m7RBm1amK2szQRYdOh+XBn++MzIPOJVY/8buoAkFux97DKbRhvA==
X-Gm-Gg: AYBFou0TmnTDn23brr8pZMJafTLaX+Qj1lJIBc96pXVJPsANvRZg2LJE//VaNgmhXus
	HgFwLnbmlaza9WCM9Y3cPyxtbxaUJLn8gQldmi9K7ONh3L1BgxAxydvpY3Zt5hUMuEBoStFCwan
	DvyHLZDeMs+JENxO4AunXQzgSoQ1dyOw15Mv7cDMDfJdI/FHkFavw+05SeSxti1Wm8maIqfhsR5
	LlQhXdUdbFl6tv0uLSVVyW+PUnBHQR5BJzOCeLjkNWf6+6CCdM96YsScgnb6Zv8Z58lBoV6p7sb
	G5yYcNgw/4bTf84O1uTml2ljTfeUQPpffmbCDSarZRCswsN1Sk9EsvP7egclIQya2p4qkE6Sb3C
	W7fvRVMDJBLr0wqXHVeBhKZ9WNod+jPZ/UjnPnzgBQVhWFdOFvOFXowU5k90Rupa38xtnAzEvNJ
	HYCWYCfRmCfYAPKKDqGHC2TuIgHmy8qZL8H/jYJTzE/aWxktTpHIXIQ82m+yFLSFS4eiw4URiz0
	6YT6QyQ4lG5Txve2OIjYwDuLKtcvF8X5k4cdFYP68YEyuzRkllQUjfieFLHoQGt9QmunDMgh5Xs
	c+cO97FEQOw=
X-Received: by 2002:a05:600c:1d07:b0:4a2:18d4:f9e0 with SMTP id 5b1f17b1804b1-4ac18c735b3mr362427095e9.25.1793791383412;
        Wed, 04 Nov 2026 03:23:03 -0800 (PST)
Return-Path: <stondo@gmail.com>
Received: from fedora ([165.225.94.251])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b412e48fd8sm45024275e9.1.2026.11.04.03.23.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 03:23:02 -0800 (PST)
From: Stefano Tondo <stondo@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: jpewhacker@gmail.com,
	peter.marko@siemens.com,
	adrian.freihofer@siemens.com,
	Stefano Tondo <stondo@gmail.com>,
	Stefano Tondo <stefano.tondo.ext@siemens.com>
Subject: [PATCH 3/3] oeqa/selftest: Add tests for source download enrichment
Date: Wed,  4 Nov 2026 12:22:57 +0100
Message-ID: <20261104112257.866914-4-stondo@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104112257.866914-1-stondo@gmail.com>
References: <20261104112257.866914-1-stondo@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 11:23:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249366
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
---
 meta/lib/oeqa/selftest/cases/spdx.py | 47 ++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/lib/oeqa/selftest/cases/spdx.py b/meta/lib/oeqa/selftest/cases/spdx.py
index c900558b44..e5d6715aa9 100644
--- a/meta/lib/oeqa/selftest/cases/spdx.py
+++ b/meta/lib/oeqa/selftest/cases/spdx.py
@@ -445,6 +445,53 @@ class SPDX30Check(SPDX3CheckBase, OESelftestTestCase):
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
     def test_release_date_source_date_epoch(self):
         """releaseTime should be derived from SDE_FILE via epochfile_read().
 
-- 
2.56.0

