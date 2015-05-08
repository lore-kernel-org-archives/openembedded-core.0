Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lb0-f171.google.com (mail-lb0-f171.google.com
	[209.85.217.171])
	by mail.openembedded.org (Postfix) with ESMTP id 344B960034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 15:04:16 +0000 (UTC)
Received: by lbbuc2 with SMTP id uc2so55080166lbb.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 08:04:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=fENKihup/kERmY9DRSiffA4DwoUebwLmpkGEdm3I4SY=;
	b=IMWtygOIIJNec9WVAvP6YI4uLu3gP2orNmKRyCAClutQeGzj0ZTiERp1QlmYpBySkg
	TOu99NnniyHPm32MGGaxM5+bkXwuDIYhHt/BOHLqQVmN9fQdysLdbxkQ9luYgBaBh5Ba
	f8zV7+9nvfMkKDQxJuZP0qEpDaE+MHU746+F1ZKy6+sFqyL3cWV7x29gwrHegXkEl5c0
	gXrWFd2cDoiusZA5RJJZCRT1bi20n1R4qqV4lTfsuQdiEkF+Wcfgj8HD0QSAu00Ixmop
	er4XZhy6tUEWi6J3FXP1Ry+QxCuLqaHiLcJa7VBpgWcbFUn9KRaVspUZTcFDtfc7wmef
	g+IA==
X-Received: by 10.112.83.135 with SMTP id q7mr3265494lby.13.1431097457353;
	Fri, 08 May 2015 08:04:17 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id n10sm1224002laa.40.2015.05.08.08.04.15
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 08:04:16 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Robert Yang <liezhi.yang@windriver.com>,
	Cristian Iorga <cristian.iorga@intel.com>,
	Carlos Rafael Giani <dv@pseudoterminal.org>,
	Ross Burton <ross.burton@intel.com>
Date: Fri,  8 May 2015 17:04:14 +0200
Message-Id: <1431097454-28641-2-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
References: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
Subject: [PATCH 2/2] gstreamer1.0: Make check selectable via PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 May 2015 15:04:22 -0000

This way, this configuration can be easily changed via .bbappend file
without having to re-define the whole EXTRA_OECONF.

With --disable-check  libgstcheck is not build.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index 17a0d7f839c4..be8aa8f9cbb7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -10,9 +10,10 @@ DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 inherit autotools pkgconfig gettext
 
 PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
+PACKAGECONFIG[check] = "--enable-check,--disable-check"
 
 EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
-                --disable-dependency-tracking --disable-check \
+                --disable-dependency-tracking \
                 --disable-examples --disable-tests \
                 --disable-valgrind \
                 "
-- 
2.1.4


