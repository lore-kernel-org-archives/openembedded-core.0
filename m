Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
	[209.85.210.174])
	by mail.openembedded.org (Postfix) with ESMTP id F1994790D6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 18:59:57 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id j26-v6so7214940pfi.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Aug 2018 11:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ZC6275qcLiXjWLSyIpEoBHmm9WQh4bp7m+BjMy4B7K8=;
	b=T9dJGlJPDADF9x5JJs3LKI3irFFEZZZDu2TY4czUqE1hslAfR9jNiOVUiMc94t39Yw
	KpckZGwsjMECXy38VAaI7QheF+9EtZdH/YIT8v9NgOilBccfnHUCDdJ4q+yen+uduya0
	laqhoSzekZfsXYSIuz4C/KW1CEBHxE1EgjoOuPrBHFew2v0yR1lpB0iR379s0d8a3AA7
	A7dVOhTuELEdCh8mOURiNLFMyEArj2FyESiQsbf6IoiTmnTeeoJO06dRVzMjUuBIz3gi
	Z0zoihlHCqDOJ8ouQxoqK0fc27/1ZPUSHi0aHfvoxavA53FRA1t26Oh/9r2aXZ8sJ6Z8
	ibGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ZC6275qcLiXjWLSyIpEoBHmm9WQh4bp7m+BjMy4B7K8=;
	b=J1b0to3fIkciJ/PVugt9ZBguvXQGlbVn4AsvBrONvzpknFbpohcGoxetM584SLvKIl
	mcS9qUIGVxjcJ/VoufmuSbm5FY7v26lMl3Z+SPGHPIuR4sdq3Ub8aCxTF/4U96Dpyn9H
	Q6j3PDyE7JSC5hZRhxdIip7186ZZfGSRWMHgtMYScagXU6OixmH8J6aHX/B4dT7lZFOg
	M9qEMQPVdzKN6Z4uU/+BPp7t3YQOSz+WeEG9NjcIP7dfEMzdNZ9lWcQCmCIKPHTmhxH4
	JZQMFmSlvTJHp2RzBVw/R+KvThETY57K50OVI+LSrKguo56Md/pWiwgjiCPXpdQr3wi0
	sL3g==
X-Gm-Message-State: AOUpUlHk81zq3sr0p9Y4baNIbSDiPAwH/ZrpeaJ/ta9nBJR8M86Ivx33
	ioFvp7I7L1p2Lc9tz+kDz/n48Lpe
X-Google-Smtp-Source: AA+uWPzKiSSJGWJbEYMx0jEweSOJUH48OMhnezWhwc/72A7Y4NOEgUrwYxqeCufhR4nZ1PfiJFVKYQ==
X-Received: by 2002:a62:c60e:: with SMTP id
	m14-v6mr49786499pfg.40.1534791598786; 
	Mon, 20 Aug 2018 11:59:58 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::4add])
	by smtp.gmail.com with ESMTPSA id
	j27-v6sm18773223pfj.91.2018.08.20.11.59.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Aug 2018 11:59:58 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Aug 2018 11:59:47 -0700
Message-Id: <011962bd47ca60969fa50a3e890adadd6bddc487.1534791421.git.raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <cover.1534791421.git.raj.khem@gmail.com>
References: <cover.1534791421.git.raj.khem@gmail.com>
Subject: [PATCH 1/5] mesa: Enable gallium-llvm on x86 and x86_64
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
X-List-Received-Date: Mon, 20 Aug 2018 18:59:58 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-graphics/cairo/cairo.inc | 3 ++-
 meta/recipes-graphics/mesa/mesa.inc   | 3 +++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/cairo/cairo.inc b/meta/recipes-graphics/cairo/cairo.inc
index 20e0d2c92a..7347f223ff 100644
--- a/meta/recipes-graphics/cairo/cairo.inc
+++ b/meta/recipes-graphics/cairo/cairo.inc
@@ -22,7 +22,8 @@ X11DEPENDS = "virtual/libx11 libsm libxrender libxext"
 DEPENDS = "libpng fontconfig pixman glib-2.0 zlib"
 
 PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'x11 xcb', '', d)} \
-           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)}"
+           ${@bb.utils.filter('DISTRO_FEATURES', 'directfb', d)} \
+           ${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'opengl', '', d)}"
 
 PACKAGECONFIG[x11] = "--with-x=yes -enable-xlib,--with-x=no --disable-xlib,${X11DEPENDS}"
 PACKAGECONFIG[xcb] = "--enable-xcb,--disable-xcb,libxcb"
diff --git a/meta/recipes-graphics/mesa/mesa.inc b/meta/recipes-graphics/mesa/mesa.inc
index 5afd0db4b7..dd626d9f00 100644
--- a/meta/recipes-graphics/mesa/mesa.inc
+++ b/meta/recipes-graphics/mesa/mesa.inc
@@ -48,6 +48,9 @@ PACKAGECONFIG ??= "${@bb.utils.filter('DISTRO_FEATURES', 'wayland vulkan', d)} \
                    ${@bb.utils.contains('DISTRO_FEATURES', 'x11 vulkan', 'dri3', '', d)} \
 		   "
 
+PACKAGECONFIG_append_x86 = " gallium-llvm gallium r600"
+PACKAGECONFIG_append_x86-64 = " gallium-llvm gallium r600"
+
 # "gbm" requires "dri", "opengl"
 PACKAGECONFIG[gbm] = "--enable-gbm,--disable-gbm"
 
-- 
2.18.0


