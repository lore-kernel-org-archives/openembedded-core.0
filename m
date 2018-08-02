Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
	[209.85.210.172])
	by mail.openembedded.org (Postfix) with ESMTP id 6665475258
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Aug 2018 18:39:27 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id j26-v6so1791270pfi.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2018 11:39:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=8Zson2hteqAE1PAl+jN9x85NlPWek79uPm0VuoNkPmc=;
	b=PkR9iG7U5GoZ1Fbo0p8SFkdki1h9m1mSeFun2oJqfFDjTU7gVvzNE3cnvzWWpnscp6
	/abh4flcu1mUmhzRHMSsA6az9g60hq6BFJdRmaPFKhajGOaOvXakflVDdaDy4N+109xx
	hMhyJIl5lwERE+LqpVvQHPwpb/rmiIAWyjZUeyBmk9EC8T6WrrjZ2DJnovvNDsV7hvvY
	Y1SyYZ17K/YZKbPlq+KGNWr/XauG3Lu2ckwuPq9775nMvPAVACr5xYlPSqbNrbPNaMof
	59JQcJoNphGwY8GV0tjSdW9kSGPhpSFzllmxSxE1VgwpVz8+oh9ZRw9u52GAv44jRHLt
	kDSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=8Zson2hteqAE1PAl+jN9x85NlPWek79uPm0VuoNkPmc=;
	b=FJSh7CYnNTdy0dntk6TCefAUDZfqUzczQwxCNkK6FQIf/tkFB1zyk+bGfs0vfqMyrq
	CMD1QHasveiQuFzhfkuEFiEdtILc6u7g28ceXx1pev5elHnZiIMLmYm+zirHm6YVTxqh
	4tdXUZ1Xql9ruNXV2chh2gieloYSr8TrB2EmMNz9Yq+35k+PbfS9Q/Vfv5e3Zjf0KNx8
	zX448pM7MREnJ2z4Tzl2Lu7xLdCzoC/f8uGT4pKngnzx8zT/rKTq8RRLTgnev2bYTdvE
	/Q2HxjPgzxdByWf7VZyshoUn8j/mGhbss66E76ORp8k6HqpZdy/ZH0ojYpSvl1hBNlUt
	uOdw==
X-Gm-Message-State: AOUpUlFI0Cj70XvA6WOaawEfo8KYPfdFbQ9yvECi1TVGfKTNGJWarsQf
	jRwmHV3M/5BJ4CXOSLkpLS0JPkp4
X-Google-Smtp-Source: AAOMgpfcuRsVEVuJS6UvFZSLK9JJOIKj3y3EZXOSUVHYOEaGLzEFoqG0RyC4YkZL2MC9/hPKHeM0pg==
X-Received: by 2002:a63:2b89:: with SMTP id
	r131-v6mr564257pgr.39.1533235167937; 
	Thu, 02 Aug 2018 11:39:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::5b3b])
	by smtp.gmail.com with ESMTPSA id
	a15-v6sm4285385pfe.32.2018.08.02.11.39.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 02 Aug 2018 11:39:27 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2018 11:39:20 -0700
Message-Id: <20180802183920.18949-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
Subject: [PATCH V2] meson: Add risc-v to known architectures
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
X-List-Received-Date: Thu, 02 Aug 2018 18:39:27 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
V2:
- Update patch status to Backport as its accepted upsream now

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
index 0000000000..a983bd7a9b
--- /dev/null
+++ b/meta/recipes-devtools/meson/meson/0001-mesonbuild-Recognise-risc-v-architecture.patch
@@ -0,0 +1,27 @@
+From 85bb96909d2024769d8e758538a7e8e2004dbb4d Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sat, 14 Jul 2018 13:03:39 -0700
+Subject: [PATCH] mesonbuild: Recognise risc-v architecture
+
+Upstream-Status: Backport [https://github.com/mesonbuild/meson/commit/6fafbad6d5ba591075a72e4726af647cece7020d]
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


