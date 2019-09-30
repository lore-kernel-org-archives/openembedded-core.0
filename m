Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com
	[209.85.215.176])
	by mail.openembedded.org (Postfix) with ESMTP id 27E4C7F37C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Sep 2019 04:48:43 +0000 (UTC)
Received: by mail-pg1-f176.google.com with SMTP id e1so1147178pgj.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 Sep 2019 21:48:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=3uKAr1L1Xp1oeI2Oy17Tx8SLqaRoCYAuyxzRNzT+IPM=;
	b=Nuur8GW8REtCBfs+MRzH2hQc3U52lz36sWdw1LDrSGbCxh/X/tjDCY09aHPOht57FF
	Q+p+b0Xn4G0rZmHKyr4p8hYXcQeRYS/KBiT3Od8x+8breTBS2A6KXRKXyt13UaX2mSZs
	eVoz2jBGZyil2ljlLS8XLhTscf7ce4yzCNiTluWMpF2fZ9TdZ/0OhLq2K0u7yAIVMuW6
	oR42LmdcCTemyBPmKZi3twVGAIZUirbmc4GLvSbOTDmaoMhxMlpFMVqsL65vXQ+BcmYR
	JbuioxZ8vcz9Murd+filybpcwYKqq+ImLsbPkLaZSy4d+ytadJSqPrz4NxVHQPAvLYhf
	cCJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=3uKAr1L1Xp1oeI2Oy17Tx8SLqaRoCYAuyxzRNzT+IPM=;
	b=NpK3ILNpeZJ3afsQH3DS07Cbi/tO5M7pDjRkZQRAr8Ne4tT+qG3B6aBXhhFyGhGOxY
	mrNLyuqssSRQ/xHo05vFHAbv8jemXmZH1EHEEr7VO5xS3MxI1sYH/AnAvZYk9weEJQMY
	yeuTWUtrwEr8FxW2xW3KjgTWk9r3Q005L4gp+dQJ0/zLV1y+IjfFi2QiC8qo1BNDKLnh
	KtVchHcRVuITOF7NJyds2iWm/wY1DvdWslwctG3bw7SuD54q05gvbzfp+fRMNzgYwc0U
	D/M6JEcTMGk6JsvthbKml8NTAN3ogjAL87fCQU//TJRPDvuzrhAEP5CkAtw85qxPTFqj
	VCaQ==
X-Gm-Message-State: APjAAAV+inIyn1O2/sa1tvx3DUYWmrfXvSk81qZZQJReMFTJBr2SWAMB
	8AMEop4uvOwrTUAxSCJEmthHdq6OdlM=
X-Google-Smtp-Source: APXvYqx2vB+kYdnTj/6jcYWk7+3ZoIl22DpYziJslmKKpYI5ChPO2FsPcONxR5+gsBPvndtuaqZdAw==
X-Received: by 2002:a62:3585:: with SMTP id c127mr19009209pfa.18.1569818924384;
	Sun, 29 Sep 2019 21:48:44 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:a5c0:edf9:811d:ad92:85c2])
	by smtp.gmail.com with ESMTPSA id
	h15sm18888493pgn.76.2019.09.29.21.48.43
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 29 Sep 2019 21:48:43 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 Sep 2019 21:47:44 -0700
Message-Id: <51730928df4dbecac72b56e9f843885674b4d18a.1569818533.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1569818533.git.akuster808@gmail.com>
References: <cover.1569818533.git.akuster808@gmail.com>
Subject: [warrior-next 49/54] multilib.bbclass: Reduce ALTERNATIVE_PRIORITY for extended recipes
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
X-List-Received-Date: Mon, 30 Sep 2019 04:48:44 -0000

From: Robert Yang <liezhi.yang@windriver.com>

Fixed:
MACHINE = "qemux86-64"
require conf/multilib.conf
MULTILIBS = "multilib:lib32"
DEFAULTTUNE_virtclass-multilib-lib32 = "x86"

$ bitbake core-image-minimal
update-alternatives: libtool has multiple providers with the same priority,
please check
/path/to/rootfs/usr/lib/opkg/alternatives/libtool for details

Both libtool and lib32-libtool have the same priority (as they're the same
recipe), so update-alternatives won't deterministically pick a provider. This
means you could end up with an image using a 32-bit pkgconfig and 64-bit
libtool, for example.

Make extended recipes reduce priority by 1 (or 2, 3 ... when there are multiple
variants in MULTILIB_VARIANTS) to fix the problem.

[YOCTO #13418]

Signed-off-by: Robert Yang <liezhi.yang@windriver.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/multilib.bbclass | 47 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/meta/classes/multilib.bbclass b/meta/classes/multilib.bbclass
index 2b761f3..9b27b53 100644
--- a/meta/classes/multilib.bbclass
+++ b/meta/classes/multilib.bbclass
@@ -123,8 +123,55 @@ python __anonymous () {
     clsextend.map_variable("USERADD_PACKAGES")
     clsextend.map_variable("SYSTEMD_PACKAGES")
     clsextend.map_variable("UPDATERCPN")
+
+    reset_alternative_priority(d)
 }
 
+def reset_alternative_priority(d):
+    if not bb.data.inherits_class('update-alternatives', d):
+        return
+
+    # There might be multiple multilibs at the same time, e.g., lib32 and
+    # lib64, each of them should have a different priority.
+    multilib_variants = d.getVar('MULTILIB_VARIANTS')
+    bbextendvariant = d.getVar('BBEXTENDVARIANT')
+    reset_gap = multilib_variants.split().index(bbextendvariant) + 1
+
+    # ALTERNATIVE_PRIORITY = priority
+    alt_priority_recipe = d.getVar('ALTERNATIVE_PRIORITY')
+    # Reset ALTERNATIVE_PRIORITY when found
+    if alt_priority_recipe:
+        reset_priority = int(alt_priority_recipe) - reset_gap
+        bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY to %s' % (d.getVar('PN'), reset_priority))
+        d.setVar('ALTERNATIVE_PRIORITY', reset_priority)
+
+    handled_pkgs = []
+    for pkg in (d.getVar('PACKAGES') or "").split():
+        # ALTERNATIVE_PRIORITY_pkg = priority
+        alt_priority_pkg = d.getVar('ALTERNATIVE_PRIORITY_%s' % pkg)
+        # Reset ALTERNATIVE_PRIORITY_pkg when found
+        if alt_priority_pkg:
+            reset_priority = int(alt_priority_pkg) - reset_gap
+            if not pkg in handled_pkgs:
+                handled_pkgs.append(pkg)
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY_%s to %s' % (pkg, pkg, reset_priority))
+                d.setVar('ALTERNATIVE_PRIORITY_%s' % pkg, reset_priority)
+
+        for alt_name in (d.getVar('ALTERNATIVE_%s' % pkg) or "").split():
+            # ALTERNATIVE_PRIORITY_pkg[tool]  = priority
+            alt_priority_pkg_name = d.getVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg, alt_name)
+            # ALTERNATIVE_PRIORITY[tool] = priority
+            alt_priority_name = d.getVarFlag('ALTERNATIVE_PRIORITY', alt_name)
+
+            if alt_priority_pkg_name:
+                reset_priority = int(alt_priority_pkg_name) - reset_gap
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY_%s[%s] to %s' % (pkg, pkg, alt_name, reset_priority))
+                d.setVarFlag('ALTERNATIVE_PRIORITY_%s' % pkg, alt_name, reset_priority)
+            elif alt_priority_name:
+                reset_priority = int(alt_priority_name) - reset_gap
+                bb.debug(1, '%s: Setting ALTERNATIVE_PRIORITY[%s] to %s' % (pkg, alt_name, reset_priority))
+                d.setVarFlag('ALTERNATIVE_PRIORITY', alt_name, reset_priority)
+
 PACKAGEFUNCS_append = " do_package_qa_multilib"
 
 python do_package_qa_multilib() {
-- 
2.7.4


