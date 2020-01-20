Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 70AAE7F2BC
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 22:02:04 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z3so1127105wru.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jan 2020 14:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lcnEWyZ4rjENBrOjSGiRfaeieHoPuM/14M9YZ/OFyO0=;
	b=V7Z9L0sCjpy2e7O2MoawFkoT4DpZtuZsL26R8i+Uttk+H6NfJfxbo4ETn3yeBUzlSr
	WAePCoAa9ZSU981UEojXlEI//yirW63QRRB/3oN70I5KXXX56RU7A2naEGygygTqunVA
	lg9Fi66fKJ6q+XLQstqbTUxHa9dLZdsYE6fg57pO7zqtyFqBZul830a+ioZLU5YvzMey
	WixHdYKJ57tAuyikg3hC6TDTSrgCz0V/53UCZaKMI6QiDIuF9v4amv/uL2GpoXhVvZ6u
	P3uxNCwodV2Cb4objmCFwa+gQSnrJCVEhg7k5Q9eIrV2kVj6wbG4n3Z+avZRH4IN9iDo
	QmCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=lcnEWyZ4rjENBrOjSGiRfaeieHoPuM/14M9YZ/OFyO0=;
	b=RXdfKzZZ2RxwxEBhDnn02ueIFh3gr6zVHFMnO6pE+KVo7/SkbDljTJhBE8E3XeQ/Gt
	KA2ZxvgqdPLSBVtSJzJzS8EDY1/wHuQcWOSD01RdCGxWtYNvJezMvlPlQ4bW7FmQLjxv
	nDPsDMK+O34Vsnoh54iIQ4Wmnxt7715Btu4Lcefh8BIVq4uFwonGru8ghqO3wbhTumK7
	WGbK9IDiRFy+iHG+TB5KK1AtSDDLNr+36oXD0aOHNCimVFdg4wwSohCV22jcJoQe+mhr
	GhHX1TE3slF0IBi+qQooGZnOXiAVJK1kjvSpTHqc45Qyo7xfME7SWq3mpBnNQF3xzTxf
	aBTA==
X-Gm-Message-State: APjAAAVLAUZnRDtqz1u6ENSmLfMP70to/VMbi78OxkYhWxQH5RIJUQhv
	4Dd/nmsaeffvof9k6G44kHYr116C
X-Google-Smtp-Source: APXvYqwQwB+2zoZfFiCgK3buhKi5xwojAsi6PpP5Z5ZOqOSQI8isUcEwY6nViFHjZLz97pWjqaGiIg==
X-Received: by 2002:a5d:50ce:: with SMTP id f14mr1602292wrt.254.1579557724933; 
	Mon, 20 Jan 2020 14:02:04 -0800 (PST)
Received: from localhost ([109.238.218.228]) by smtp.gmail.com with ESMTPSA id
	v83sm1052625wmg.16.2020.01.20.14.02.04
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 20 Jan 2020 14:02:04 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jan 2020 23:01:59 +0100
Message-Id: <20200120220200.31859-1-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCH 1/2] gstreamer1.0-omx: allow to more easily select different libomxil provider
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
X-List-Received-Date: Mon, 20 Jan 2020 22:02:04 -0000
Content-Transfer-Encoding: 8bit

* for rpi it's provided by userland recipe and this will make the bbappend
  in meta-raspberrypi a bit smaller

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb | 5 +++--
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb           | 2 ++
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
index 89e13937ea..dfe4b691d1 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.16.1.bb
@@ -14,7 +14,7 @@ SRC_URI[sha256sum] = "cbf54121a2cba575d460833e8132265781252ce32cf5b8f9fa8753e42a
 
 S = "${WORKDIR}/gst-omx-${PV}"
 
-DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
+DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad virtual/libomxil"
 
 inherit meson pkgconfig upstream-version-is-even
 
@@ -43,4 +43,5 @@ do_install[postfuncs] += " set_omx_core_name "
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 
-RDEPENDS_${PN} = "libomxil"
+VIRTUAL-RUNTIME_libomxil ?= "libomxil"
+RDEPENDS_${PN} = "${VIRTUAL-RUNTIME_libomxil}"
diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index d83eb45701..271c2a30a3 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -24,6 +24,8 @@ inherit autotools
 
 EXTRA_OECONF += "--disable-doc --disable-Werror"
 
+PROVIDES += "virtual/libomxil"
+
 #
 # The .so files under ${libdir}/bellagio are not intended to be versioned and symlinked.
 # Make sure they get packaged in the main package.
-- 
2.20.1


