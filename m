Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88F11C02198
	for <webhook@archiver.kernel.org>; Sat,  8 Feb 2025 14:05:22 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.9210.1739023520985416079
 for <openembedded-core@lists.openembedded.org>;
 Sat, 08 Feb 2025 06:05:21 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=P0xVAcYd;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.171, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-21c2f1b610dso73818695ad.0
        for <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 06:05:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1739023520; x=1739628320; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Lz3lCphABrK8uEgEYlE4ALNbLEAjfLwc5iKkAv5oV7I=;
        b=P0xVAcYdAqQ1BsbWtuuY/2AU+EuAdJt9xPnin+zJsCklcPezr/ZnsHvq6NkRLgH7+a
         j9XzLqYztiSTcp228hhevV84oYVJW26qOrUGofnqCTSOpfCBz2oDcVDDYdrh02r3KrPP
         0cKcq+D5N0AnUTrDpmJhOhNDEKZkpr07CCn9uQ5BoitsQD78GYqEbDFz0McTjpDWowXC
         //nMQlSs1XmZDbKBzhX3IhC7l7Ule3BO1avOvUljuAIg/58EWHGqQ4v9UyjPdRuV5FlH
         VstpwqCWrIAMo1XqaRzKa+FOTwrWG9zC46Qe9FWRZlFqGf5/BbA5aurtCwjIeJ2ea4zP
         8+oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739023520; x=1739628320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lz3lCphABrK8uEgEYlE4ALNbLEAjfLwc5iKkAv5oV7I=;
        b=b7Gwqcqd8iZSN6SxOqjuYmSXZlMrqWbNHxkrBcrdsA2Ver8tvoAxcLRzeIXlcJn44v
         fCvJP9Q3jJa0AGwehOhQrWPpHzaURX5iMSEGRUYcE63+2snUG4AsJChDJklkfAkZkjlC
         4qOoJnKxPmap++b2c/jD8MH62V0X837Na54P5pdo9HfJCMFBjMOgTLZMRvXFzcaDBtEA
         C13w3Ja4bMzV59xjXJZBx9ZuzTLB6z58Sfroz4DKFYV/PaSRdA3JwSUkRTMRgAUJA8Ym
         siMIeaj982a9oy0WPSdqXQoOZ5FP4d/OG+31zi4XCErzfJ9c/VqsbTyU6iV4qPRQhvkk
         OrgQ==
X-Gm-Message-State: AOJu0YxEX3IA1h9fD7H6qzZN/ElsxxPWQbX03gcXjRl4z0B8amBCc9S5
	J1KFQ625iimJTzuhbh2iEzFuKWJGAkMuWnHNfOd9+RbRqISNzmFXVnNGBX4x+5YcmTTgP9aSv3H
	f
X-Gm-Gg: ASbGncsW7sDuxr2SRPN4JehUOfqk97aQKaEGhPIPandj1R0YDwyjhgGqPssbfsLftJb
	V3mX5ZX3XYTazC/CbCyzXK4reRsA9t54gXH387yJ+naJ1O0zrxliRf73TWInrUNxpgIbuqxCrEq
	qlRg59S+ZsMooE37qyJMiQt7a28UrEV5aPsfUJOJCrId9dH8MhpW9QgkKGcgpVaqTVEyn7BlQkb
	fBD8hHFDyDbjyLshEt4kBe+ExpxV4wLtZoZHoIxdyLcBvs4+Z1VEsbDZRe09JxPj8cIFjRKTzaw
	02MK
X-Google-Smtp-Source: AGHT+IEY6Q9uHovtgAAHNyzSuOIAH2S8Srm2XIfdz57SGXZN04qWwwkiDigP17/siSgDGVRYnLZlNA==
X-Received: by 2002:a17:902:e946:b0:21f:f3d:d533 with SMTP id d9443c01a7336-21f4e6ca8bemr118476045ad.2.1739023520219;
        Sat, 08 Feb 2025 06:05:20 -0800 (PST)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3687c820sm47278345ad.173.2025.02.08.06.05.19
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 08 Feb 2025 06:05:19 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 11/13] oeqa/sdk/context: fix for gtk3 test failure during do_testsdk
Date: Sat,  8 Feb 2025 06:04:58 -0800
Message-ID: <83c3e40e2361d771a724062e38a1349b87059c75.1739023409.git.steve@sakoman.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1739023409.git.steve@sakoman.com>
References: <cover.1739023409.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 08 Feb 2025 14:05:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211031

From: Harish Sadineni <Harish.Sadineni@windriver.com>

The do_testsdk for lib32-core-image-sato aborts with below error:
configure: error: Package requirements (gtk+-3.0) were not met:
No package 'gtk+-3.0' found
Consider adjusting the PKG_CONFIG_PATH environment variable if you installed software in a non-standard prefix.

This causes due to an absolute path name in 'sdk_env', which is now stripped to have only the environment name.

Backport from oe-core master: https://git.openembedded.org/openembedded-core/commit/?id=386e4132a9ced75599d92610cf5c0e8fe907c3b6

Signed-off-by: Harish Sadineni <Harish.Sadineni@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/lib/oeqa/sdk/context.py | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/lib/oeqa/sdk/context.py b/meta/lib/oeqa/sdk/context.py
index 01c38c24e6..77e6a98f39 100644
--- a/meta/lib/oeqa/sdk/context.py
+++ b/meta/lib/oeqa/sdk/context.py
@@ -41,11 +41,13 @@ class OESDKTestContext(OETestContext):
 
     def hasTargetPackage(self, pkg, multilib=False, regex=False):
         if multilib:
-            # match multilib according to sdk_env
-            mls = self.td.get('MULTILIB_VARIANTS', '').split()
-            for ml in mls:
-                if ('ml'+ml) in self.sdk_env:
-                    pkg = ml + '-' + pkg
+            stripped_sdk_env = os.path.basename(self.sdk_env)
+            if stripped_sdk_env.startswith('environment-setup-'):
+                # match multilib according to sdk_env
+                mls = self.td.get('MULTILIB_VARIANTS', '').split()
+                for ml in mls:
+                    if ('ml'+ml) in stripped_sdk_env:
+                        pkg = ml + '-' + pkg
         return self._hasPackage(self.target_pkg_manifest, pkg, regex=regex)
 
 class OESDKTestContextExecutor(OETestContextExecutor):
-- 
2.43.0


