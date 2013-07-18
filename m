Return-Path: <net147@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 8671F6B118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:02:36 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id tj12so3228416pac.40
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=p/UQE8uLdM4DbIiDtgiV9MRggjh4dmNje/KVbfucQz8=;
	b=iq+xGluYkG+XSRYaC2rz/F5Evjfm4M6TeFKXGTtZlrudnOkPhlet5CqueyboF2Al1O
	ZhBkBdBi3cp/bCWGNQhg/kGEebsoN/+4SAGMFtXTpYBn9CeJQYVcHvHBzRWbajS0ZPbh
	8PHbE5G8xrW9ziaHR1FC/PlWdCZDJpOGOEtfVsgmh+3w0K6qGSqv2PWt6ycxjVX9VRf6
	Af1FfvfnIF2+BeJyhop7KQOkBOU4X/lBvKTqfRHScqL5LppY/pfrNHxC6/XLjGCpPMlS
	r78KV4c60x3iOhNeDoYz+L7K0yqhKhhhuqlH2IYBBm8i5EnjYJoPNDKnsdz0VNoFBlZN
	wPfg==
X-Received: by 10.68.17.169 with SMTP id p9mr12308078pbd.17.1374156157453;
	Thu, 18 Jul 2013 07:02:37 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id
	wf7sm16892301pac.20.2013.07.18.07.02.36 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 18 Jul 2013 07:02:37 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Jul 2013 00:18:17 +1000
Message-Id: <1374157097-20939-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.2
Subject: [PATCH] mesa: update git recipe to 9.1.5 release
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
X-List-Received-Date: Thu, 18 Jul 2013 14:02:37 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/mesa/mesa_git.bb | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa_git.bb b/meta/recipes-graphics/mesa/mesa_git.bb
index 52d3d81..d8db4e8 100644
--- a/meta/recipes-graphics/mesa/mesa_git.bb
+++ b/meta/recipes-graphics/mesa/mesa_git.bb
@@ -5,14 +5,15 @@ DEFAULT_PREFERENCE = "-1"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=f69a4626e9efc40fa0d3cc3b02c9eacf"
 
 PR = "${INC_PR}.0"
-SRCREV = "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
-PV = "9.1.3+git${SRCPV}"
+SRCREV = "42146f777b9aa89c3d2c01f2a5cde05749534508"
+PV = "9.1.5+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/git/mesa/mesa;protocol=git \
            file://0001-configure-Avoid-use-of-AC_CHECK_FILE-for-cross-compi.patch \
            file://0002-pipe_loader_sw-include-xlib_sw_winsys.h-only-when-HA.patch \
            file://0003-EGL-Mutate-NativeDisplayType-depending-on-config.patch \
            file://0004-glsl-fix-builtin_compiler-cross-compilation.patch \
+           file://0005-llvmpipe-remove-the-power-of-two-sizeof-struct-cmd_b.patch \
            "
 
 S = "${WORKDIR}/git"
-- 
1.8.3.2


