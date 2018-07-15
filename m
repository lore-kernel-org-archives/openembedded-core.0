Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f182.google.com (mail-pf0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 71D756B6EA
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 19:44:18 +0000 (UTC)
Received: by mail-pf0-f182.google.com with SMTP id k21-v6so342239pff.11
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 Jul 2018 12:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=C7pyI2ibZHTQdhcWg++py4A4d7a3SXp+8zh3TEYyMK4=;
	b=YRwsEArYXBd/7pblpZZFPu68Dii0muBlul0W8ZkRZBhLyjmTJ2HldEqeouAMUCKXxK
	CdwKBxNvnq0sLScTSVnoW11bDSchmIHIMHxwqmNPDXe0Ni8SOH59omY9qOZZG+WDJ04G
	3KaWyF6mscCYHE4KmCJ9GWzvUhWDsq/Qq6h/LhKqF6jjh/i9bmnoNVk2C9BPkHMJ+/oD
	0hXe72mqzMf1E6ulIOB3I0/fNgD+Bn9mLSsOBEpj0zGmg2sOrkkNz+YfYFlJvfrmlI5R
	P+HZjmSpEq0XETnIcmq5DVYslMsKIOOin7Sblcunt4MumMuU/zvJlZ8PyhPx+Pgvtznv
	dO+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=C7pyI2ibZHTQdhcWg++py4A4d7a3SXp+8zh3TEYyMK4=;
	b=BnleOuIbfyN1h/Z83zBDhl33uo1EJxgSZ4C1J2WxuYSGlSVr34u6DpAnZwNRmwwA+g
	4pridNE9zXFTRJljHVXtedBobNm5Dn651gal/7mGIE7PUKWWbQEw2bDToOUbeN3Oc/ne
	rbk/LE6B6pbzIB4XZAanX+1Yl96HstQvHw22dcFX1tW/vBogHe9hfTfL4ueM8PHq3zfG
	ZItm0+cM+wMe7wNg/SuKgHpCXJo1lUsaKmfFkGYcEf1lyPIOumBv1Ce47hUUbfnLstZa
	ZJPvgmvD/v6B7I9GKktpL/6f5QI8u2hylVzGthTBey09Wy1eb5L1sVjhWVOFA3pBZOzo
	fecQ==
X-Gm-Message-State: AOUpUlFcuC3rxo8XZWPk2hSUEj54RGP5zCdsvtqb1/D2CHvWIPnaUk+l
	obKFMIwO/NPb6BsTKJsi/H7wsw==
X-Google-Smtp-Source: AAOMgpdtikqhEmeYUfKBZy1HZvymDf29psWoqBg9YwwOJ0vaQUz3wdce1cckxlOOs/ZlK+Doi2diPw==
X-Received: by 2002:a63:29c6:: with SMTP id
	p189-v6mr13422830pgp.305.1531683859142; 
	Sun, 15 Jul 2018 12:44:19 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::1736])
	by smtp.gmail.com with ESMTPSA id
	x25-v6sm14309360pgv.63.2018.07.15.12.44.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 15 Jul 2018 12:44:18 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 15 Jul 2018 12:44:04 -0700
Message-Id: <20180715194404.29736-3-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180715194404.29736-1-raj.khem@gmail.com>
References: <20180715194404.29736-1-raj.khem@gmail.com>
Subject: [PATCH 3/3] meson: Add risc-v to known architectures
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
X-List-Received-Date: Sun, 15 Jul 2018 19:44:18 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/meson/meson.inc         |  1 +
 ...nbuild-Recognise-risc-v-architecture.patch | 27 +++++++++++++++++++
 2 files changed, 28 insertions(+)
 create mode 100644 meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch

diff --git a/meta/recipes-devtools/meson/meson.inc b/meta/recipes-devtools/meson/meson.inc
index b278d33b72..a650469e93 100644
--- a/meta/recipes-devtools/meson/meson.inc
+++ b/meta/recipes-devtools/meson/meson.inc
@@ -12,6 +12,7 @@ SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}/meson-${P
            file://0004-Prettifying-some-output-with-pathlib.patch \
            file://0005-Set-the-meson-command-to-use-when-we-know-what-it-is.patch \
            file://validate-cpu.patch \
+           file://0001-mesonbuild-Recognise-risc-v-architecture.patch \
            "
 
 SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
diff --git a/meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch b/meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch
new file mode 100644
index 0000000000..5abf3642f3
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch
@@ -0,0 +1,27 @@
+From 85bb96909d2024769d8e758538a7e8e2004dbb4d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jul 2018 13:03:39 -0700
+Subject: [PATCH] mesonbuild: Recognise risc-v architecture
+
+Upstream-Status: Submitted [https://github.com/mesonbuild/meson/pull/3889]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ mesonbuild/environment.py | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/mesonbuild/environment.py b/mesonbuild/environment.py
+index a0580a21..b2041424 100644
+--- a/mesonbuild/environment.py
++++ b/mesonbuild/environment.py
+@@ -83,6 +83,8 @@ known_cpu_families = (
+     'ppc',
+     'ppc64',
+     'ppc64le',
++    'riscv32',
++    'riscv64',
+     'sparc64',
+     'x86',
+     'x86_64'
+-- 
+2.18.0
+
-- 
2.18.0


