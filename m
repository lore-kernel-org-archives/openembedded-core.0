Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJbr-00043l-SM
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:37:59 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=tqoN57AdcNGVeWmVMeuyC5vZlUyvZVc6zIzQXFf3OK4=;
	b=LuKqXNxPWcdmDXHEEx26toV4jbbcVPMsQWHL5OZUXQgI9RKawUz99AepCjXUO+T3XB
	o4qu5bDVGFpezF8B2bP1PHRCBdyEtD9U2yWvN+z3XXaN1bouZhaF369+lahZPXMh1N3W
	tWOD54yzE8ucrc1guw+iuTRSzt+A84klrdVqg=
Received: by 10.204.152.195 with SMTP id h3mr2440126bkw.1.1318505538260;
	Thu, 13 Oct 2011 04:32:18 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id s12sm3281711bkt.4.2011.10.13.04.32.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:32:17 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:30 +0200
Message-Id: <a78cb5825b8682d4ba4c6c8d6a1a152cf472bdf4.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 12/20] mesa-xlib: move shared options to .inc
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Oct 2011 11:42:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/mesa/mesa-xlib.inc     |    1 +
 meta/recipes-graphics/mesa/mesa-xlib_7.11.bb |    3 +--
 2 files changed, 2 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa-xlib.inc

diff --git a/meta/recipes-graphics/mesa/mesa-xlib.inc b/meta/recipes-graphics/mesa/mesa-xlib.inc
new file mode 100644
index 0000000..b720e14
--- /dev/null
+++ b/meta/recipes-graphics/mesa/mesa-xlib.inc
@@ -0,0 +1 @@
+EXTRA_OECONF += " --with-driver=xlib --without-gallium-drivers"
diff --git a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
index 08277ac..95ff5e8 100644
--- a/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
+++ b/meta/recipes-graphics/mesa/mesa-xlib_7.11.bb
@@ -1,6 +1,5 @@
 include mesa-common.inc
 include mesa-${PV}.inc
-
+include mesa-xlib.inc
 PR = "${INC_PR}.0"
 
-EXTRA_OECONF += "--with-driver=xlib --without-gallium-drivers"
-- 
1.7.7



