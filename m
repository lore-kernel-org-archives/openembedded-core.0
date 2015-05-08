Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-la0-f49.google.com (mail-la0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 16E0C60034
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 15:04:15 +0000 (UTC)
Received: by laat2 with SMTP id t2so54650525laa.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 May 2015 08:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=p+53UcVTp4iuwq/EzDZvX0CFtTiE8eKVujjokT/7Xos=;
	b=txcjvf8qoYSK3k2EsQLjxtw8w2n3GBeMJSQiN5oF+rUfH4tB8EVWHUpUvAU9rRcd8G
	7D8HiIjYEPVWoQqMEuTnpVtQ3JLsM4QO0pyHhjVjcxS/BQ599AkA0Zr6fEQZerY9wGZN
	HcxQAp6ZWXFEd9xsM1jqh1r7Y+y4oL5tYXjA1IZNjx4vEjkN1ONl5Z+Zb5zFV1Q+sCGc
	gcrxXhC6e6w32dHqeDfrh7Z8gTvqFW5DcZbjsa8mh8ttOXt2OHU117juHC7pjbtofOsI
	45zBZhDJrt39sLB0ZsL3r4FB1KPbm4z4ube8ZoQFLGjfNL2Empz+hw0/aII5fwBnW/gj
	AjcA==
X-Received: by 10.112.42.233 with SMTP id r9mr1603664lbl.58.1431097455887;
	Fri, 08 May 2015 08:04:15 -0700 (PDT)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by mx.google.com with ESMTPSA id n10sm1224002laa.40.2015.05.08.08.04.14
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 08 May 2015 08:04:15 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-core@lists.openembedded.org,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Robert Yang <liezhi.yang@windriver.com>,
	Cristian Iorga <cristian.iorga@intel.com>,
	Carlos Rafael Giani <dv@pseudoterminal.org>,
	Ross Burton <ross.burton@intel.com>
Date: Fri,  8 May 2015 17:04:13 +0200
Message-Id: <1431097454-28641-1-git-send-email-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 1/2] gstreamer1.0: convert GSTREAMER_1_DEBUG to PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 May 2015 15:04:20 -0000

It is more elegant

Suggested-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0.inc | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
index a01c33ce5ff9..17a0d7f839c4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0.inc
@@ -9,11 +9,12 @@ DEPENDS = "glib-2.0 libxml2 bison-native flex-native"
 
 inherit autotools pkgconfig gettext
 
-GSTREAMER_1_DEBUG ?= "--disable-debug"
+PACKAGECONFIG[debug] = "--enable-debug,--disable-debug"
+
 EXTRA_OECONF = "--disable-docbook --disable-gtk-doc \
                 --disable-dependency-tracking --disable-check \
                 --disable-examples --disable-tests \
-                --disable-valgrind ${GSTREAMER_1_DEBUG} \
+                --disable-valgrind \
                 "
 
 RRECOMMENDS_${PN}_qemux86    += "kernel-module-snd-ens1370 kernel-module-snd-rawmidi"
-- 
2.1.4


