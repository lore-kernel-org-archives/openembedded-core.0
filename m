Return-Path: <tim.orling@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FF16C52D7C
	for <webhook@archiver.kernel.org>; Tue, 13 Aug 2024 16:33:34 +0000 (UTC)
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
 by mx.groups.io with SMTP id smtpd.web11.76718.1723566807715849777
 for <openembedded-core@lists.openembedded.org>;
 Tue, 13 Aug 2024 09:33:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=JpzyKh30;
 spf=pass (domain: konsulko.com, ip: 209.85.210.171, mailfrom: tim.orling@konsulko.com)
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70eb0ae23e4so4265492b3a.0
        for <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 09:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1723566807; x=1724171607; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lAF/10uJnGQo3W6r+6exGQ7XuTJt9720QXqdjk2r0Ok=;
        b=JpzyKh305Tgl0BhOmYYrb4jCDrr76YPDeCCP0nvkdVp+2ogx9o3V8OhYcL/hODGIeA
         y/0ETx6va5GlGDZQzByhq6NFCbwXnuMpdtujcuutGFifIORc8sKadEBjUyjAm9qMYFYT
         5iYPkonAGsi/ZwxWT0siQua3yCEW24uNYg7K0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723566807; x=1724171607;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lAF/10uJnGQo3W6r+6exGQ7XuTJt9720QXqdjk2r0Ok=;
        b=en46kM5BcF8kAm/A82rad1L/VzxtEz0few4Y3vOHezTskJFgq9jbxIcm/PXEkEVp3o
         cozqHQBzx5wE8qS6CJmRV4USU2e2lnEhtG6+Q0D8R8ePyQjZQtrCyXiCBDXz1ySMn7YR
         VDjsi3f8KBxFcxPyCuGnu8LNz45cJ9jGQJbXDLhtHf0CLnGRHv3Na6O7BPWbc9DGiium
         qDln1CjAhG8ybhIxu6b4a6ItJLPP1SKXevJIU5a701oKjU3//AYrIPkM/egASoH7GNBb
         saZ4KLyjNg3GJt4fQNWuu/KpPF6oVY2Ts/NpaskqoV3E4lHUfkVHPSSW08LxvwshSCmt
         syJQ==
X-Gm-Message-State: AOJu0YxuYa3bbfeMZYuaKgQjoyfw0Hrvd9Tv7ZCPHI5fFHtc4u3lViw3
	/AD/SDOObmUEeYIKtRF9a3QH09OH/EGMPEPD452846VM85gObZZCP4f/2YBfeHjmnPsfbC2+0in
	Xn3Q=
X-Google-Smtp-Source: AGHT+IGu4A2K8VCq2NtcaQuQ5a/CyWLw43RM0YM2PN2Ko+z9QXd9jkD50Zi+RaQSUr4Io8VuzkHPcA==
X-Received: by 2002:a05:6a00:3a08:b0:710:6f54:bcac with SMTP id d2e1a72fcca58-712670ed1b4mr231444b3a.1.1723566806616;
        Tue, 13 Aug 2024 09:33:26 -0700 (PDT)
Received: from localhost (c-98-232-159-17.hsd1.or.comcast.net. [98.232.159.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5a562bbsm5944377b3a.111.2024.08.13.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 09:33:26 -0700 (PDT)
From: tim.orling@konsulko.com
To: openembedded-core@lists.openembedded.org
Cc: Tim Orling <tim.orling@konsulko.com>
Subject: [PATCH] python3-setuptools-rust: upgrade 1.9.0 -> 1.10.1
Date: Tue, 13 Aug 2024 09:33:02 -0700
Message-ID: <20240813163301.1390651-2-tim.orling@konsulko.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 13 Aug 2024 16:33:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203288

From: Tim Orling <tim.orling@konsulko.com>

* Set PYPI_PACKAGE = "setuptools_rust"
* Cleanup SRC_URI as we do not need old tarball link anymore
  and PYPI_SRCURI should be the default.

https://github.com/PyO3/setuptools-rust/compare/v1.9.0...v1.10.1

1.10.1 (2024-08-04)
  * Fixed
    - Fix regression in 1.10.0 where editable builds would be built in
	  release mode

1.10.0 (2024-08-03)
  * Packaging
    - Extend macOS build flags to iOS, tvOS and watchOS. #436
    - Support Python 3.13. #446
  * Changed
    - Add SETUPTOOLS_RUST_PEP517_USE_BASE_PYTHON environment variable to use
	  the base interpreter path when running inside a virtual environment to
	  avoid recompilation when switching between virtual environments. #429
    - Delay import of dependencies until use to avoid import errors during a
	  partially complete install when multiple packages are installing at
	  once. #437
    - Deprecate --build-temp argument to build_rust command (it does
	  nothing). #457

Signed-off-by: Tim Orling <tim.orling@konsulko.com>
---
 ...rust_1.9.0.bb => python3-setuptools-rust_1.10.1.bb} | 10 +++-------
 1 file changed, 3 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/python/{python3-setuptools-rust_1.9.0.bb => python3-setuptools-rust_1.10.1.bb} (65%)

diff --git a/meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb b/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb
similarity index 65%
rename from meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb
rename to meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb
index 62ac4764038..d2881e91013 100644
--- a/meta/recipes-devtools/python/python3-setuptools-rust_1.9.0.bb
+++ b/meta/recipes-devtools/python/python3-setuptools-rust_1.10.1.bb
@@ -9,17 +9,13 @@ BUGTRACKER = "https://github.com/PyO3/setuptools-rust/issues"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=011cd92e702dd9e6b1a26157b6fd53f5"
 
-SRC_URI = "${PYPI_SRC_URI} \
-           https://files.pythonhosted.org/packages/67/08/e1aa2c582c62ac76e4d60f8e454bd3bba933781a06a88b4e38797445822a/setuptools-rust-${PV}.tar.gz \
-           "
-SRC_URI[sha256sum] = "704df0948f2e4cc60c2596ad6e840ea679f4f43e58ed4ad0c1857807240eab96"
+SRC_URI[sha256sum] = "d79035fc54cdf9342e9edf4b009491ecab06c3a652b37c3c137c7ba85547d3e6"
+
+PYPI_PACKAGE = "setuptools_rust"
 
 inherit cargo pypi python_setuptools_build_meta
 
 DEPENDS += "python3-setuptools-scm-native python3-wheel-native"
-# remove when https://github.com/PyO3/setuptools-rust/commit/7ced8d2a8f36e1b4fc41b5544636defb7bd44bdf
-# is included
-DEPENDS += "python3-semantic-version-native"
 
 RDEPENDS:${PN} += " \
     python3-json \
-- 
2.46.0


