Return-Path: <martin.jansa@gmail.com>
Received: from mail-ea0-f169.google.com (mail-ea0-f169.google.com
	[209.85.215.169])
	by mail.openembedded.org (Postfix) with ESMTP id 82B496A9CD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 23:19:44 +0000 (UTC)
Received: by mail-ea0-f169.google.com with SMTP id h15so7475038eak.28
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2013 16:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=/4tkvqi5vZaYEc1X6l+G9/eaop3Wwhj8jyiVmsClGt4=;
	b=PB1LOcX6wpo93UGVZxrCvu753KFe7za5Unrhy5LZ3ULi74Qv8G7+u3cr4NFCLApu3a
	iQ+ltjm8GPAJbmHzsgbJaE5VYw8qMs9HfPOnhfQRo+x1Ni3wG0DsdpnWKn4Lm3W1rm1g
	tmt3QmkFxWrcXbloG16Swa9v13apaxZ6/Ep3JjVe5DS7tcgf854oY+GD3UCYmrvZLbdn
	mpkFCTA7PKqds58gH2glp7GWf1wwCJuo7pHiIAzgZcriPkYBDmwFTJ3b2PlDy5cXbfdh
	gxGeO/CDczQ1FH2fPuY7d+W2dau3g4WviN0tboRHI478/5xLoDJJ6BAq9cipmyVNqk78
	aM3g==
X-Received: by 10.14.111.129 with SMTP id w1mr23878012eeg.13.1371079185284;
	Wed, 12 Jun 2013 16:19:45 -0700 (PDT)
Received: from localhost (ip-62-24-80-145.net.upcbroadband.cz. [62.24.80.145])
	by mx.google.com with ESMTPSA id
	b7sm31175522eef.16.2013.06.12.16.19.44 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 12 Jun 2013 16:19:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Jun 2013 01:19:57 +0200
Message-Id: <c8bce9ea4e2e14776f73290909ceeddea517d93e.1371079127.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.2.1
In-Reply-To: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
References: <4f22f9950f2354b903b37d1739113d5a83841c1f.1371079127.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1371079127.git.Martin.Jansa@gmail.com>
References: <cover.1371079127.git.Martin.Jansa@gmail.com>
Subject: [PATCH 04/10] mesa: merge mesa-git.inc to mesa_git.bb
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
X-List-Received-Date: Wed, 12 Jun 2013 23:19:44 -0000

---
 meta/recipes-graphics/mesa/mesa-git.inc | 10 ----------
 meta/recipes-graphics/mesa/mesa_git.bb  | 13 +++++++++++--
 2 files changed, 11 insertions(+), 12 deletions(-)
 delete mode 100644 meta/recipes-graphics/mesa/mesa-git.inc

diff --git a/meta/recipes-graphics/mesa/mesa-git.inc b/meta/recipes-graphics/mesa/mesa-git.inc
deleted file mode 100644
index cf07155..0000000
--- a/meta/recipes-graphics/mesa/mesa-git.inc
+++ /dev/null
@@ -1,10 +0,0 @@
-# 9.1.3 commit
-SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
-PV = "9.1.3+git${SRCPV}"
-
-SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
-           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
-           file://fix-glsl-cross.patch \
-           "
-
-S = "${WORKDIR}/git"
diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 241261c..ef0bec4 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -1,6 +1,15 @@
-require mesa-git.inc
-require mesa.inc
+require ${BPN}.inc
 
 DEFAULT_PREFERENCE = "-1"
 
 PR = "${INC_PR}.0"
+# 9.1.3 commit
+SRCREV = "f32ec82a8cfcabc5b7596796f36afe7986651f02"
+PV = "9.1.3+git${SRCPV}"
+
+SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
+           file://EGL-Mutate-NativeDisplayType-depending-on-config.patch \
+           file://fix-glsl-cross.patch \
+           "
+
+S = "${WORKDIR}/git"
-- 
1.8.2.1


