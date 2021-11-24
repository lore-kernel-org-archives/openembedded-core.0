Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9072AC433FE
	for <webhook@archiver.kernel.org>; Wed, 24 Nov 2021 08:08:50 +0000 (UTC)
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by mx.groups.io with SMTP id smtpd.web12.3502.1637741329290274134
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=jcUkBDMZ;
 spf=pass (domain: gmail.com, ip: 209.85.221.44,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f44.google.com with SMTP id d24so2698476wra.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Nov 2021 00:08:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=4xJP9oSgW3YeqV4NFDewMso7fpxWt4VLqvPBW3qP2+4=;
        b=jcUkBDMZ0tUuOzgaL43CZapbfXiCSbjZ7TK7smpwcuFhmNtS4pnOqpOoXsphuRaLT7
         Ad1MWJ7rioxl6eXB/TKFITrzHxb5ZGHbot5HFaxALZcTSAkNMD2VGLOfsxlXzQjzpW1S
         VviDWhnpzBLdNRpU6s3yOHXcBef7HrLpbjS44rvdEUrrOGBNtwbA93qsjg2h7kCJErTd
         MukQCHUtdW+DJBWdt1wYHGXqJsz2KPe67cyKGvgV7PVCHgderj+khwhSVOZ/ceb0ussF
         OW5AfqqAM738f5x3Bt9xIGi8xBOAwEkxE3m5Uw4WvWt00I2wcqzC8UUCX+JKbEXjnBPK
         SqiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=4xJP9oSgW3YeqV4NFDewMso7fpxWt4VLqvPBW3qP2+4=;
        b=qCHH6bofwSup0Ax874EuWBQHfT8NbUdpT4fSjQSJFbNl4z+JmXzxz5p1kLtrYPwQrn
         p72cdZ02YYQpXvP5907YMeSX62VjAAFsxjOdFXYJsdHufcQH3+F+SXlLNfqLAUpDpwgP
         0jTAL5rHkZ3Kj4H2ZezKqQbnSWBCJVlR1Lq0gAwqquwTcPHf8+PuipN4g6lHhnV3hJQl
         A5tOgDTPnr9f2Yewdydf6maKiDGmOdqPTyAjK0SrhJWAdwfjaPEWStKuUoBnNTMYekC0
         b5N0zcVEjpWWeDJQ92r5vK9aPzahk3E/PMHwCeO7V48SkO8lQllu34H0L3U3mvYuS08n
         96cA==
X-Gm-Message-State: AOAM531riZOebpr3FXVKFrfDikDH9UFjC3YiI0vp4/YfxuUNQmc9RzzC
	gPGzysGkAT+acrZ3Yx/bNDpUe5OxPxrnPA==
X-Google-Smtp-Source: 
 ABdhPJzIrWTEBLFFbePmNw/jXKod+71HbUBTqSsfJrw9voJTq3wKAqNCRxIu03myIBhXQB287B7ahg==
X-Received: by 2002:a5d:52c3:: with SMTP id r3mr11605141wrv.115.1637741327459;
        Wed, 24 Nov 2021 00:08:47 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 k37sm4220205wms.21.2021.11.24.00.08.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Nov 2021 00:08:46 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/21] python3-packaging: update 21.2 -> 21.3
Date: Wed, 24 Nov 2021 09:08:27 +0100
Message-Id: <20211124080828.530981-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211124080828.530981-1-alex@linutronix.de>
References: <20211124080828.530981-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 24 Nov 2021 08:08:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158676

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 ...dbf19e2b76ab025efc11208bd50e09e8223e.patch | 37 -------------------
 ...ging_21.2.bb => python3-packaging_21.3.bb} |  4 +-
 2 files changed, 1 insertion(+), 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-packaging/8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch
 rename meta/recipes-devtools/python/{python3-packaging_21.2.bb => python3-packaging_21.3.bb} (69%)

diff --git a/meta/recipes-devtools/python/python3-packaging/8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch b/meta/recipes-devtools/python/python3-packaging/8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch
deleted file mode 100644
index 42b1dc133f..0000000000
--- a/meta/recipes-devtools/python/python3-packaging/8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 8cb9dbf19e2b76ab025efc11208bd50e09e8223e Mon Sep 17 00:00:00 2001
-From: Moyiz <8603313+moyiz@users.noreply.github.com>
-Date: Tue, 2 Nov 2021 21:42:53 +0200
-Subject: [PATCH] Revert pyparsing constraint (#482)
-
-Upstream-Status: Backport
-Signed-off-by: Alexander Kanavin <alex@linutronix.de>
----
- setup.py                   | 2 +-
- tests/test_requirements.py | 4 +++-
- 4 files changed, 6 insertions(+), 4 deletions(-)
-
-diff --git a/setup.py b/setup.py
-index c6a1caec..419aa284 100644
---- a/setup.py
-+++ b/setup.py
-@@ -48,7 +48,7 @@
-     author=about["__author__"],
-     author_email=about["__email__"],
-     python_requires=">=3.6",
--    install_requires=["pyparsing>=2.0.2,<3"],  # Needed to avoid issue #91
-+    install_requires=["pyparsing>=2.0.2"],  # Needed to avoid issue #91
-     classifiers=[
-         "Development Status :: 5 - Production/Stable",
-         "Intended Audience :: Developers",
-diff --git a/tests/test_requirements.py b/tests/test_requirements.py
-index 8cc45687..f2c209c4 100644
---- a/tests/test_requirements.py
-+++ b/tests/test_requirements.py
-@@ -192,4 +192,6 @@ def test_sys_platform_linux_in(self):
-     def test_parseexception_error_msg(self):
-         with pytest.raises(InvalidRequirement) as e:
-             Requirement("toto 42")
--        assert "Expected stringEnd" in str(e.value)
-+        assert "Expected stringEnd" in str(e.value) or (
-+            "Expected string_end" in str(e.value)  # pyparsing>=3.0.0
-+        )
diff --git a/meta/recipes-devtools/python/python3-packaging_21.2.bb b/meta/recipes-devtools/python/python3-packaging_21.3.bb
similarity index 69%
rename from meta/recipes-devtools/python/python3-packaging_21.2.bb
rename to meta/recipes-devtools/python/python3-packaging_21.3.bb
index 5e9541082f..446edf04e1 100644
--- a/meta/recipes-devtools/python/python3-packaging_21.2.bb
+++ b/meta/recipes-devtools/python/python3-packaging_21.3.bb
@@ -3,9 +3,7 @@ HOMEPAGE = "https://github.com/pypa/packaging"
 LICENSE = "Apache-2.0 | BSD-2-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=faadaedca9251a90b205c9167578ce91"
 
-SRC_URI[sha256sum] = "096d689d78ca690e4cd8a89568ba06d07ca097e3306a4381635073ca91479966"
-
-SRC_URI += "file://8cb9dbf19e2b76ab025efc11208bd50e09e8223e.patch"
+SRC_URI[sha256sum] = "dd47c42927d89ab911e606518907cc2d3a1f38bbd026385970643f9c5b8ecfeb"
 
 inherit pypi setuptools3
 
-- 
2.20.1


