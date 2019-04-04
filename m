Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id 7FB0B7C629
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Apr 2019 11:06:26 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id k11so3240133wro.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Apr 2019 04:06:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wpWvJ8sVpDokXzZOk4UBO12hAKllMpo4sVfYG+9q6Ok=;
	b=bYW/KqwuwufjnpH7P7XmwJd3/G6MB8wOSBN9hsmBn2PloZxME2KRf4FVZUmWL5/zYM
	izfetO7aezoOd2quuEW+xIlVT80hNiJeMq1EQIMlkCyZedXC+cs0LGAXxAEMUCqHZIC9
	Ic3Bw6q3AE1qJDe29+RcMcB4xigYZq0LdjzBc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=wpWvJ8sVpDokXzZOk4UBO12hAKllMpo4sVfYG+9q6Ok=;
	b=SYUR5UpAab8nvTjs8jBx2l+j1TJZMvelueoWlunJKToYzmyL/Mw9GePIAuOxuzf6Yq
	H/lM9/0tj9QH3BuTAn95RX6HmlHL+5C6B9gWrsO3HWPnW5LqZkeaIDlR2WTmXu7PS5Su
	O1fZqFnbu/sdVnPTlbgOlaIVjli07qloB3nkWpRIEA3baa0dErhRdN2kfBRz2/ERT1qI
	f3UAFGlyTYed55qUmZW8/y/6Gu6Wmx59xqG7KhIU+X8Ker0+FL6rGnjvkjG8LGFlZyue
	Q6a2XvsYvN616gL6ZcRxdheRgWFMMkovM/zSKImhcOxT2d63slQ8x7bL1KN9QFeYRL9s
	8sJQ==
X-Gm-Message-State: APjAAAUgZiHdg1KiuG37sXWdfX/6wn3Nrvt1mOfbNRLZIyLELOL0Jbta
	6vN88chSJ9QoBUPWh01WtWzfg/FvQlmP0g==
X-Google-Smtp-Source: APXvYqwjAdOyEfCPBtBZTyjHbL2gzaTaZ4IfQodcNLBi3pbCmo4f1QrSVFwmz2qBRv+ACKHxUkqrkg==
X-Received: by 2002:adf:f051:: with SMTP id t17mr3522170wro.73.1554375986843; 
	Thu, 04 Apr 2019 04:06:26 -0700 (PDT)
Received: from hex.int.rpsys.net (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	d17sm25153134wrw.88.2019.04.04.04.06.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 04 Apr 2019 04:06:26 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Apr 2019 12:06:25 +0100
Message-Id: <20190404110625.6057-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH] base/pixbufcache: Remove obsolete sstatecompletions code
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
X-List-Received-Date: Thu, 04 Apr 2019 11:06:26 -0000
Content-Transfer-Encoding: 8bit

This has been unused in OE-Core since the introduction of recipe specific
sysroots. Its not so useful since it only runs once upon sstate installation,
not per installation per sysroot.

Remove the weird looking comment left behind in pixbufcache too.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 meta/classes/base.bbclass        | 14 +-------------
 meta/classes/pixbufcache.bbclass |  1 -
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/meta/classes/base.bbclass b/meta/classes/base.bbclass
index d0b82d747dc..1636c6ef938 100644
--- a/meta/classes/base.bbclass
+++ b/meta/classes/base.bbclass
@@ -220,7 +220,7 @@ def buildcfg_neededvars(d):
         bb.fatal('The following variable(s) were not set: %s\nPlease set them directly, or choose a MACHINE or DISTRO that sets them.' % ', '.join(pesteruser))
 
 addhandler base_eventhandler
-base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.runqueue.sceneQueueComplete bb.event.RecipeParsed"
+base_eventhandler[eventmask] = "bb.event.ConfigParsed bb.event.MultiConfigParsed bb.event.BuildStarted bb.event.RecipePreFinalise bb.event.RecipeParsed"
 python base_eventhandler() {
     import bb.runqueue
 
@@ -274,18 +274,6 @@ python base_eventhandler() {
             d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}g++")
             d.delVar("PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}compilerlibs")
 
-    if isinstance(e, bb.runqueue.sceneQueueComplete):
-        completions = d.expand("${STAGING_DIR}/sstatecompletions")
-        if os.path.exists(completions):
-            cmds = set()
-            with open(completions, "r") as f:
-                cmds = set(f)
-            d.setVar("completion_function", "\n".join(cmds))
-            d.setVarFlag("completion_function", "func", "1")
-            bb.debug(1, "Executing SceneQueue Completion commands: %s" % "\n".join(cmds))
-            bb.build.exec_func("completion_function", d)
-            os.remove(completions)
-
     if isinstance(e, bb.event.RecipeParsed):
         #
         # If we have multiple providers of virtual/X and a PREFERRED_PROVIDER_virtual/X is set
diff --git a/meta/classes/pixbufcache.bbclass b/meta/classes/pixbufcache.bbclass
index fb50cd49659..b07f51ed56a 100644
--- a/meta/classes/pixbufcache.bbclass
+++ b/meta/classes/pixbufcache.bbclass
@@ -54,7 +54,6 @@ GDK_PIXBUF_FATAL_LOADER=1 ${STAGING_LIBDIR_NATIVE}/gdk-pixbuf-2.0/gdk-pixbuf-que
 DEPENDS_append_class-native = " gdk-pixbuf-native"
 SYSROOT_PREPROCESS_FUNCS_append_class-native = " pixbufcache_sstate_postinst"
 
-# See base.bbclass for the other half of this
 pixbufcache_sstate_postinst() {
 	mkdir -p ${SYSROOT_DESTDIR}${bindir}
 	dest=${SYSROOT_DESTDIR}${bindir}/postinst-${PN}
-- 
2.20.1


