Return-Path: <wbourque@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id D51227C617
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 19:12:55 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id v22so34588569qkj.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jul 2019 12:12:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y7/6hFkF1rgiDNmBDH90dsrMkBLOOKjHqpi8u8ODGt4=;
	b=nbxCQvJZBu9fzRs+43+a6EFiorqBw0fH9cbextAl+EuTJRWb6+uqozPOry6/HRYUVM
	wLz2JqAcc/kvEhnp+yTQpLTZDlS3WT/umg7URdXQL8ZyGCpnRyEQzP7VL5kSvBbAOa3H
	LKL9THNPieC8UadEInOAaMh22viCQSL6zNi/otyevXyTQKZOpHUrrqcqRHZJyojAvqhb
	Uk7Gp+C/ESdAOQdOo4BdL8iGgRQyorUGLOXC7nRUdPNYU1/F8p2EjoGtqvPAqQ2IrUk+
	XDAUzDXLcEs+ie5WIvbJRPUBqGFml9kha/H1QG4fqfzJpOfCe3QJV0+Vk97ti2/R074w
	YxOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y7/6hFkF1rgiDNmBDH90dsrMkBLOOKjHqpi8u8ODGt4=;
	b=asjIP2QcBz4nbItO8436NxM60N6t6sWTjtxNbRnRniHa9KYyP0w9w6CiCXiuDDbQ6+
	owgSLqTWFxFCr1q00eemeI3NO2U96zH+cCaootStf7eQRZEKEE4h/LvSdwt2MxiqDZEn
	RmZWwu0pjNuKQXPKFHi9OYhBJLmX6OfxUGTFtC68nlPknCrLkj7BHVpZQ5rBz21ySXvI
	vs4K7gvlyOu4up18n6FwngWCGpUrzV52EgXr0Wc3fgihEkHQXPD+0YlaREMslmfTXUHt
	1wsKunkJH0ORqeHfQ8WmxUfDcMcuX+Rqy9bFMmjok1hUzsMGDvBpH8JzTSkZh5/WHyUN
	muDA==
X-Gm-Message-State: APjAAAUz3EeS/7Gvgq4vpy9XTCbTmCT4a2RCpPX649ofT8i/O7a05pXC
	r3T1diFtuOFLaWjJDJViSa8JchYn
X-Google-Smtp-Source: APXvYqx+ljtEuvzrJND5zyPpq90801QqvlslULMZZs8hoz58Sjl8V9bLsTM93VJx+NcJbbcfsWGMWg==
X-Received: by 2002:a37:dc42:: with SMTP id v63mr39734707qki.488.1563995576621;
	Wed, 24 Jul 2019 12:12:56 -0700 (PDT)
Received: from dingo.touchtunes.com (vcmtl.touchtunes.com. [207.96.182.162])
	by smtp.gmail.com with ESMTPSA id
	t8sm20233517qkt.75.2019.07.24.12.12.55
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Wed, 24 Jul 2019 12:12:55 -0700 (PDT)
From: William Bourque <wbourque@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jul 2019 15:12:44 -0400
Message-Id: <20190724191244.23258-1-wbourque@gmail.com>
X-Mailer: git-send-email 2.17.1
Subject: [PATCH] meta/lib/oeqa: Remove ext4 for bootimg-biosplusefi
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 24 Jul 2019 19:12:56 -0000

Remove "ext4" IMAGE_FSTYPES when generating core-image-minimal
for the bootimg-biosplusefi unittests; "wic" type is enough.

Signed-off-by: William Bourque <wbourque@gmail.com>
---
 meta/lib/oeqa/selftest/cases/wic.py | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/meta/lib/oeqa/selftest/cases/wic.py b/meta/lib/oeqa/selftest/cases/wic.py
index 928c476ebc..fcdd55059d 100644
--- a/meta/lib/oeqa/selftest/cases/wic.py
+++ b/meta/lib/oeqa/selftest/cases/wic.py
@@ -684,11 +684,10 @@ class Wic2(WicTestCase):
     @only_for_arch(['i586', 'i686', 'x86_64'])
     def test_biosplusefi_plugin_qemu(self):
         """Test biosplusefi plugin in qemu"""
-        for fstype in ("ext4", "wic"):
-            config = 'IMAGE_FSTYPES = "%s"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n' % fstype
-            self.append_config(config)
-            self.assertEqual(0, bitbake('core-image-minimal').status)
-            self.remove_config(config)
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
 
         with runqemu('core-image-minimal', ssh=False, image_fstype='wic') as qemu:
             # Check that we have ONLY two /dev/sda* partitions (/boot and /)
@@ -722,11 +721,10 @@ class Wic2(WicTestCase):
         # If an image hasn't been built yet, directory ${STAGING_DATADIR}/syslinux won't exists and _get_bootimg_dir()
         #   will raise with "Couldn't find correct bootimg_dir"
         # The easiest way to work-around this issue is to make sure we already built an image here, hence the bitbake call
-        for fstype in ("ext4", "wic"):
-            config = 'IMAGE_FSTYPES = "%s"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n' % fstype
-            self.append_config(config)
-            self.assertEqual(0, bitbake('core-image-minimal').status)
-            self.remove_config(config)
+        config = 'IMAGE_FSTYPES = "wic"\nWKS_FILE = "test_biosplusefi_plugin.wks"\nMACHINE_FEATURES_append = " efi"\n'
+        self.append_config(config)
+        self.assertEqual(0, bitbake('core-image-minimal').status)
+        self.remove_config(config)
 
         img = 'core-image-minimal'
         with NamedTemporaryFile("w", suffix=".wks") as wks:
-- 
2.17.1


