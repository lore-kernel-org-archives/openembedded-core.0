Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id D7BD87C538
	for <openembedded-core@lists.openembedded.org>;
	Sun,  3 Mar 2019 00:38:40 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id g37so770440plb.5
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Mar 2019 16:38:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=NeUMJvEpnavzqLzRupXSgXAfk14xWhYL3SRRINjLIC4=;
	b=IdT+nkYbpdFnPNhLO+yEAGazooQ0qScppf0hzUqzwd40KD0GAah4UGjseZgM1cSQCe
	Kpd5712HcZrKRlg2Va0Xr89lm9Kyfmjzd8BBbQt+QrlcPEUft6h1UzIYDa62GjCruA3k
	cnPgprjYZV1gEz2750grdVHYw6Lt54sgLvjCZ/+tm+mDwa7H6ZSDVIYUkmg0NDOMOz0a
	TvTd6js9C73sPh3bj0nOAXZEo7Rw56rQGq5siU4ZGrFGU277JwoIVFHnmSg6vopYLN6A
	MacY3lPYuybt+BOmokV0MTHpV5ZfmtF+jsHzuWtGFrGvCRx47iNWFNIn9FA0sn7bAZmF
	fm7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=NeUMJvEpnavzqLzRupXSgXAfk14xWhYL3SRRINjLIC4=;
	b=D6TxGgdpv+wLk45cSoC0fUkQ5J6CxZTdgvtyVirrsk15NdWehcFQN8k9VN02NdEg6f
	r0zeydM/H7DEMYaSplvpwna2vPXRNs5wtAX2JNMFrXaW1TuytXS6uzRA/hk1zmv2newI
	fUkpL32+idKTpLJfV3h/shsSFn/WwDl2qS5aEHM7U2KsDx5c0pkhAU/5cyLyCgYAJyRp
	GhH2S+tHyO/lbu7N8CrniRjvkaCw8RF8eCyNiUAGewRNHTEjMsztDG9lL9d1EWxHJH3E
	f/qZwrMC1PmUj+4BrQs19P9uGtEDNofttelHebIlFUuspn/EXr7BoUNIrXUJOsclxa1g
	L00w==
X-Gm-Message-State: APjAAAWssPCIzZsJ01JzvTtGvEFbKz7L1B01Pr1x5Au7fSTLSNOuq2RC
	y0AYJfBzOLsvW5FFIwdbbjF12UZ3
X-Google-Smtp-Source: APXvYqxqUAvu6Z0YPICsAI1nLKkQ8TmImQgWVXky/o7n5c6wvP4r/1xBoeaQZnEu5eHOh4IIfaM0zQ==
X-Received: by 2002:a17:902:1101:: with SMTP id
	d1mr12653665pla.19.1551573521558; 
	Sat, 02 Mar 2019 16:38:41 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:6bc6::5fa3])
	by smtp.gmail.com with ESMTPSA id
	f65sm2889328pff.21.2019.03.02.16.38.40
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Mar 2019 16:38:41 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  2 Mar 2019 16:38:34 -0800
Message-Id: <20190303003834.44637-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190303003834.44637-1-raj.khem@gmail.com>
References: <20190303003834.44637-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] xserver-xorg: Fix build errors with clang
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
X-List-Received-Date: Sun, 03 Mar 2019 00:38:40 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...t-xtest-Initialize-array-with-braces.patch | 36 +++++++++++++++++++
 .../xorg-xserver/xserver-xorg_1.20.4.bb       |  1 +
 2 files changed, 37 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
new file mode 100644
index 0000000000..c0c242814b
--- /dev/null
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-test-xtest-Initialize-array-with-braces.patch
@@ -0,0 +1,36 @@
+From 8a382c015cd3c69fcfc146ef03dcbf30c77ff207 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 1 Mar 2019 09:47:57 -0800
+Subject: [PATCH] test/xtest: Initialize array with braces
+
+Fixes an error when extra warnings are enabled, this is caught with clang
+
+test/xtest.c:64:23: error: suggest braces around initialization of subobject [-Werror,-Wmissing-braces]
+    WindowRec root = {0};
+                      ^
+                      {}
+1 error generated.
+
+Upstream-Status: Pending
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ test/xtest.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/test/xtest.c b/test/xtest.c
+index fc5e433..d7e6620 100644
+--- a/test/xtest.c
++++ b/test/xtest.c
+@@ -61,7 +61,7 @@ xtest_init_devices(void)
+ {
+     ScreenRec screen = {0};
+     ClientRec server_client = {0};
+-    WindowRec root = {0};
++    WindowRec root = {{0}};
+     WindowOptRec optional = {0};
+ 
+     /* random stuff that needs initialization */
+-- 
+2.21.0
+
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
index 3f55987bba..ad99d6bece 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg_1.20.4.bb
@@ -3,6 +3,7 @@ require xserver-xorg.inc
 SRC_URI += "file://musl-arm-inb-outb.patch \
             file://0001-xf86pciBus.c-use-Intel-ddx-only-for-pre-gen4-hardwar.patch \
             file://pkgconfig.patch \
+            file://0001-test-xtest-Initialize-array-with-braces.patch \
             "
 SRC_URI[md5sum] = "c4841cc24b79420205d082fe82e0a650"
 SRC_URI[sha256sum] = "fe0fd493ebe93bfc56bede382fa204458ff5f636ea54d413a5d1bd58e19166ee"
-- 
2.21.0


