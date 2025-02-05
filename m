Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43660C02197
	for <webhook@archiver.kernel.org>; Wed,  5 Feb 2025 04:36:55 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web11.5028.1738730206099746210
 for <openembedded-core@lists.openembedded.org>;
 Tue, 04 Feb 2025 20:36:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ks+qfX+n;
 spf=pass (domain: gmail.com, ip: 209.85.128.41, mailfrom: zboszor@gmail.com)
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43625c4a50dso43314725e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 04 Feb 2025 20:36:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738730204; x=1739335004; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PVRrpAmvN6eeaoCvvNv+TbYnu1e45bCSri1erdHFmY4=;
        b=ks+qfX+njH/XWR1M86wehYs1lwThHPyUGoVxUiD96M8ct9YjbDwRuZTMLisiCVDche
         W1R+Y52vUo9HXcFeXidJ/DCDG84OOMgf3yKLf8JsEQPTqe1gyYNNKfsteKJ0CbkmoSRh
         XwgWwBOITb5VYvTx/wmZndLI02cFLKuzs4WpchnhKezMw9y5krJ3Gzjd7xlhmDg1l8O/
         xSIK9g4v49JLU0ySqioTvsipeJXV+LCn3yPGIhCtZ22qNpDhBHydV6JuG+Zq2UZgWhUK
         BxCwyVgB55yRU67GfDNi2atO+TNoQwtv7FYaoTkRxTOIPqOKxdNz/LbXWSlyz5ggi4Fv
         aDxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738730204; x=1739335004;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PVRrpAmvN6eeaoCvvNv+TbYnu1e45bCSri1erdHFmY4=;
        b=bhJ4TIR+3ypCqSnLGZ709vvnc1UwFXEJV2y+m8Tm28U+0zpnI19GCKpTIpsQuy+PoT
         OgZNHxaI0nLX609zWTpyb2cS2Swe2CZRNguDAaCqzMG0St605lzV9htKB7RFSAqlKTBb
         Vr17f7CuN9yBSoteKlPDSl8ATKZ5RtWoAp0b3b2GuA0CTmKpLs+H4w6ak9JPNFSycuvp
         BcbKHLEqJZIhEEYsYybcNZkEZOn1mFw5hoqooCAJ3YVcPtX5TJ+r0jpHd8RuaL4dnYCC
         mT9gOEeoBOUYYk+FiwWWoih8y4Kd98XBHtXFs1HpcF3CCQriLAIPHUQKJbNKah4hemDJ
         dIPA==
X-Gm-Message-State: AOJu0YzuatJQTFCnVxQWLvojwH0Ov7JwQYEtJAG0Uwl2YZIYtMEZPjIZ
	kSHcewKlNSJg2mZWPRN5Uc3Lg3wVjWo24pR+IY/CX/IFcMMQ6zxhqVLKwQ==
X-Gm-Gg: ASbGncvC/8SOJEM+Q4QHEg0JlBwy3cO9Cis20cffbF9O5bZtWTUTNyKx9FxgsXsVJjE
	TwDpCTJNT3sOx+diYzQWtn0k9otRx22Dcg2jM3xRhkGlKZZ+x9mDTRmIddPC+9wS6B6cA7wjFJI
	Brm/asRxWHvkHTfZo+9mmjPdvEZDwKthRM3rTMuqlXjld46jGx8rWEBYBY2dUoOcEGj+cQ9TrLK
	jX3QUMNLx8MweaaLuzDP54w8/9gvrKlp2NLOMcneqAWI+VJpxFyv4VhBv4n3v1MaA6ttmjYWjHB
	+DHL9a4jP5yciV4/VRSpDqwvtNBkuEY/brtwK1YT3Kqkgg==
X-Google-Smtp-Source: AGHT+IEmIIedEOkkfy6Kvy0VBKPKsEXZxR4/G9YqpZPC5IaGKKzUGRUNm0EP8DWLQgzalhJGUAtMLw==
X-Received: by 2002:a05:600c:1c91:b0:434:fbda:1f44 with SMTP id 5b1f17b1804b1-4390d56141dmr5279845e9.19.1738730204207;
        Tue, 04 Feb 2025 20:36:44 -0800 (PST)
Received: from localhost.lan (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db1150csm8117865e9.39.2025.02.04.20.36.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 20:36:42 -0800 (PST)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>,
	Randy MacLeod <randy.macleod@windriver.com>,
	Khem Raj <raj.khem@gmail.com>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [OE-core][PATCH v6 3/3] oeqa/selftest/cases/signing.py: Re-enable self-test
Date: Wed,  5 Feb 2025 05:36:37 +0100
Message-ID: <20250205043637.2649428-3-zboszor@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250205043637.2649428-1-zboszor@gmail.com>
References: <20250205043637.2649428-1-zboszor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Feb 2025 04:36:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/210828

Enable building rpm with rpm-seqouia for the test.

sign_rpm.bbclass already takes care of signing rpm packages.

Add a crypto policy file (identical to the one shipped by
rpm-sequoia) and use its path in SEQUOIA_CRYPTO_POLICY envvar
for runCmd('rpmkeys') commands.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../files/signing/rpm-sequoia.config          | 51 +++++++++++++++++++
 meta/lib/oeqa/selftest/cases/signing.py       | 11 +++-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta-selftest/files/signing/rpm-sequoia.config

diff --git a/meta-selftest/files/signing/rpm-sequoia.config b/meta-selftest/files/signing/rpm-sequoia.config
new file mode 100644
index 0000000000..cec1d1550b
--- /dev/null
+++ b/meta-selftest/files/signing/rpm-sequoia.config
@@ -0,0 +1,51 @@
+[hash_algorithms]
+md5.collision_resistance = "never"
+md5.second_preimage_resistance = "never"
+sha1.collision_resistance = "always"
+sha1.second_preimage_resistance = "always"
+ripemd160.collision_resistance = "never"
+ripemd160.second_preimage_resistance = "never"
+sha224.collision_resistance = "always"
+sha224.second_preimage_resistance = "always"
+sha256.collision_resistance = "always"
+sha256.second_preimage_resistance = "always"
+sha384.collision_resistance = "always"
+sha384.second_preimage_resistance = "always"
+sha512.collision_resistance = "always"
+sha512.second_preimage_resistance = "always"
+default_disposition = "never"
+
+[symmetric_algorithms]
+idea = "never"
+tripledes = "never"
+cast5 = "never"
+blowfish = "never"
+aes128 = "always"
+aes192 = "never"
+aes256 = "always"
+twofish = "never"
+camellia128 = "always"
+camellia192 = "never"
+camellia256 = "always"
+default_disposition = "never"
+
+[asymmetric_algorithms]
+rsa1024 = "never"
+rsa2048 = "always"
+rsa3072 = "always"
+rsa4096 = "always"
+dsa1024 = "always"
+dsa2048 = "always"
+dsa3072 = "always"
+dsa4096 = "always"
+nistp256 = "always"
+nistp384 = "always"
+nistp521 = "always"
+cv25519 = "always"
+elgamal1024 = "never"
+elgamal2048 = "never"
+elgamal3072 = "never"
+elgamal4096 = "never"
+brainpoolp256 = "never"
+brainpoolp512 = "never"
+default_disposition = "never"
diff --git a/meta/lib/oeqa/selftest/cases/signing.py b/meta/lib/oeqa/selftest/cases/signing.py
index 51d1c3fa64..f01a464d1d 100644
--- a/meta/lib/oeqa/selftest/cases/signing.py
+++ b/meta/lib/oeqa/selftest/cases/signing.py
@@ -21,6 +21,7 @@ class Signing(OESelftestTestCase):
     gpg_dir = ""
     pub_key_path = ""
     secret_key_path = ""
+    sequoia_config_path = ""
 
     def setup_gpg(self):
         bitbake('gnupg-native -c addto_recipe_sysroot')
@@ -30,6 +31,7 @@ class Signing(OESelftestTestCase):
 
         self.pub_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.pub")
         self.secret_key_path = os.path.join(self.testlayer_path, 'files', 'signing', "key.secret")
+        self.sequoia_config_path = os.path.join(self.testlayer_path, 'files', 'signing', "rpm-sequoia.config")
 
         nsysroot = get_bb_var("RECIPE_SYSROOT_NATIVE", "gnupg-native")
 
@@ -71,7 +73,6 @@ class Signing(OESelftestTestCase):
         """
         import oe.packagedata
 
-        self.skipTest('This test requires rpm-sequoia support in rpm')
         self.setup_gpg()
 
         package_classes = get_bb_var('PACKAGE_CLASSES')
@@ -84,6 +85,8 @@ class Signing(OESelftestTestCase):
         feature += 'RPM_GPG_PASSPHRASE = "test123"\n'
         feature += 'RPM_GPG_NAME = "testuser"\n'
         feature += 'GPG_PATH = "%s"\n' % self.gpg_dir
+        feature += 'PACKAGECONFIG:append:pn-rpm-native = " sequoia"\n'
+        feature += 'PACKAGECONFIG:append:pn-rpm = " sequoia"\n'
 
         self.write_config(feature)
 
@@ -106,6 +109,9 @@ class Signing(OESelftestTestCase):
 
         pkg_deploy = os.path.join(deploy_dir_rpm, package_arch, '.'.join((pf, package_arch, 'rpm')))
 
+        # Use our crypto policy file for runCmd('rpmkeys')
+        os.environ['SEQUOIA_CRYPTO_POLICY'] = self.sequoia_config_path
+
         # Use a temporary rpmdb
         rpmdb = tempfile.mkdtemp(prefix='oeqa-rpmdb')
 
@@ -118,6 +124,9 @@ class Signing(OESelftestTestCase):
         self.assertIn('digests signatures OK', ret.output, 'Package signed incorrectly.')
         shutil.rmtree(rpmdb)
 
+        # Make sure SEQUOIA_CRYPTO_POLICY envvar is unset
+        del os.environ['SEQUOIA_CRYPTO_POLICY']
+
         #Check that an image can be built from signed packages
         self.add_command_to_tearDown('bitbake -c clean core-image-minimal')
         bitbake('-c clean core-image-minimal')
-- 
2.48.1


