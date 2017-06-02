Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id E9FF76FF84
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Jun 2017 19:34:26 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id w69so13529387pfk.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Jun 2017 12:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=UflVlLYQZQgv5nO6a00C7hpmztdVdIawBCyr+jiI3BU=;
	b=l4/Ask7auEpYjGBy0ZjvTyvEzQMJ4JRqaUs77vpXFneoDO12F1ZcdbMQE97aCeLcS1
	dGOdPL0szVp5PoBSZYUo6KHhf6/OkzQqwm5qGrF6ss7c4AyRCBJLg9UyJFD1CAJVOfR2
	g2fZYwWjHt+6EANMSjjUCGbaSX9e4UjUTyXd9VHfglunBDp+XJ9ZVdtPiiH+ZSAgPpLu
	nahBcSlvA8XEIDe4bJHN6ieJyk+7KX4p24mG/m/fCbAABa457i/hNm5HGgo/1cgE8wvV
	YN1F+x2mIQ2YIVj42DFhP0y3pUdAbpgUjW7PdZltOiOa5Aob5Ytu6hJS7qfCRfLTcYYu
	Nj+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=UflVlLYQZQgv5nO6a00C7hpmztdVdIawBCyr+jiI3BU=;
	b=BipZwInsqjafIdcmiQ0RUWpRg3hgbE+HVNQiJQC/GXeqMla7/it2DKbeAqHZnDE8yn
	kqNOD9NB4A68n2VAY7VWiFOdNcALwOfwkCmBFaVbmT0hlGhzxEqvbRR/OTMilIziDmV0
	Q9kz6DgpTYeGUYO8zDl7wviO645lASD/AzkZt14mTCeH+mlRHXvEaOctPRcZ7S5TypC3
	Z+SAU7pGfVP4JvgYhN/TxyZ7V8m+mDa9SmEfYh4AlNxL8IRPcAXnLul2I1wgiGFxTDRP
	u1CNgGvyS2wRvI2szalNlZSQhlIRo7Cbpl9NAHA2L148vpPnuMg+TPBCj302bVH3pEiD
	jyHQ==
X-Gm-Message-State: AODbwcA7mJx++8Nuu+LHmG2HTO45jGzMfvEOvjEpDwWh900Y4obypt1Z
	ayuLe/THdXOkZTVv
X-Received: by 10.99.177.77 with SMTP id g13mr8569299pgp.131.1496432067575;
	Fri, 02 Jun 2017 12:34:27 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::cf4])
	by smtp.gmail.com with ESMTPSA id
	h84sm45349912pfh.45.2017.06.02.12.34.26
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 02 Jun 2017 12:34:26 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  2 Jun 2017 12:34:11 -0700
Message-Id: <20170602193411.3591-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.13.0
Subject: [PATCH] go: Upgrade to 1.8.3
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
X-List-Received-Date: Fri, 02 Jun 2017 19:34:27 -0000

Add a comment to fix build musl<->glibc switch while
using same TMPDIR

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-1.8.inc   | 8 ++++----
 meta/recipes-devtools/go/go-cross.inc | 3 ++-
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-devtools/go/go-1.8.inc b/meta/recipes-devtools/go/go-1.8.inc
index 5c376a2eb6..3690f310bd 100644
--- a/meta/recipes-devtools/go/go-1.8.inc
+++ b/meta/recipes-devtools/go/go-1.8.inc
@@ -1,8 +1,8 @@
 require go-common.inc
 
-GOMINOR = ""
+GOMINOR = "3"
 GO_BASEVERSION = "1.8"
-PV .= "${GOMINOR}"
+PV .= ".${GOMINOR}"
 FILESEXTRAPATHS_prepend := "${FILE_DIRNAME}/go-${GO_BASEVERSION}:"
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=5d4950ecb7b26d2c5e4e7b4e0dd74707"
@@ -15,5 +15,5 @@ SRC_URI += "\
        file://split-host-and-target-build.patch \
        file://gotooldir.patch \
 "
-SRC_URI[md5sum] = "7743960c968760437b6e39093cfe6f67"
-SRC_URI[sha256sum] = "406865f587b44be7092f206d73fc1de252600b79b3cacc587b74b5ef5c623596"
+SRC_URI[md5sum] = "64e9380e07bba907e26a00cf5fcbe77e"
+SRC_URI[sha256sum] = "5f5dea2447e7dcfdc50fa6b94c512e58bfba5673c039259fd843f68829d99fa6"
diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index 93206a5d05..71e461123c 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -6,7 +6,8 @@ PN = "go-cross-${TARGET_ARCH}"
 
 # Ignore how TARGET_ARCH is computed.
 TARGET_ARCH[vardepvalue] = "${TARGET_ARCH}"
-
+# Ignore target os libc for cross compiler
+#TARGET_OS[vardepexclude] = "LIBCEXTENSION"
 FILESEXTRAPATHS =. "${FILE_DIRNAME}/go-cross:"
 
 GOROOT_FINAL = "${libdir}/go"
-- 
2.13.0


