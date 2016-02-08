Return-Path: <armccurdy@gmail.com>
Received: from mail-pf0-f196.google.com (mail-pf0-f196.google.com
	[209.85.192.196])
	by mail.openembedded.org (Postfix) with ESMTP id 207FD73179
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Feb 2016 20:35:19 +0000 (UTC)
Received: by mail-pf0-f196.google.com with SMTP id 71so3989224pfv.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 12:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=ecgYoUvPPj9H3jtU6dczGPTOO/sw7XJjk8PuYvu7SeM=;
	b=X/SRqUDL+qlDUZn2dIVIN7Sj3mJahodAZDarXZXDnxio22KWuhRGJdqX/9TdaRen2q
	nKz3jrReIV/GSwo2UBIl3kPf6jnP+UhowRPbnVjaihJVaO917EwQ57uR3OCHWm1idkpl
	J8YtzBe1YbSc314SLFAj0m6TRTCKOI9T+tf93lVpAxMFTlGPHzBFxv6obNBq1jFo9FbU
	NT0Cv3o3+FgRdMd8/dA7UKLnO3WA2O2wWyiDcxWb6uZleTTw2t7DX+iNDY9Z3uSYrQnH
	r0hgH+s9ZvO0ti8VdKAvh+A3Z2RiJXxa4LFT6uxGg2EOcJOVlpIo947HbD/oQ4WMbojV
	Azeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=ecgYoUvPPj9H3jtU6dczGPTOO/sw7XJjk8PuYvu7SeM=;
	b=nFmlE2xKP2YNbyPHyoxg9ufrzMklpmqgv2LQfYQyJnz2sREVP74yOiHu2vdIyLsw70
	65e6h5c8PK98icgjgzS69jDKPX6oCtpV9eTpaZrQKGz8RyXHwUDjJ/4jhHWMLrSEJjoQ
	fkKS7g6zNp9M4fbDK/GUE5MQQ8F9YFwmUo1yuVtoIbbA1S4hSoy+OFWY3VCjYdcxWhDf
	D6dnpO5y4n+WKYiPQHHxMW4cbv4cISKKzkqoZ3XTKiBTjmamSvlcY/kD2v8+8BmyWdur
	ultyXWuR9fUNHAkGEFyVeRcZGFcFSY7e1OgL1/s08q4GN0T5x0D/3BJWSx9Bvgj7wv/M
	2Dxg==
X-Gm-Message-State: AG10YOQQ10NaLZP2ICB7ftdDbHfqBVMn6+1XA9/rwTTnIR6c7GV0ibnTFR5ngl3OIW9lNw==
X-Received: by 10.98.72.70 with SMTP id v67mr45021076pfa.100.1454963720182;
	Mon, 08 Feb 2016 12:35:20 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	u90sm45313301pfa.60.2016.02.08.12.35.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 08 Feb 2016 12:35:19 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Feb 2016 12:34:40 -0800
Message-Id: <1454963681-18756-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
References: <1454963681-18756-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] libproxy: replace PACKAGECONFIG equivalent with the real thing
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
X-List-Received-Date: Mon, 08 Feb 2016 20:35:21 -0000

No change in functionality, just use PACKAGECONFIG instead of python.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-support/libproxy/libproxy_0.4.11.bb | 29 ++++++++++++++++--------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/meta/recipes-support/libproxy/libproxy_0.4.11.bb b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
index 9db5231..a523857 100644
--- a/meta/recipes-support/libproxy/libproxy_0.4.11.bb
+++ b/meta/recipes-support/libproxy/libproxy_0.4.11.bb
@@ -6,29 +6,38 @@ LICENSE = "LGPLv2.1+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=4fbd65380cdd255951079008b364516c \
                     file://utils/proxy.c;beginline=1;endline=18;md5=55152a1006d7dafbef32baf9c30a99c0"
 
-DEPENDS = "gconf glib-2.0"
+DEPENDS = "glib-2.0"
 
 SRC_URI = "${DEBIAN_MIRROR}/main/libp/${BPN}/${BPN}_${PV}.orig.tar.gz \
            file://0001-test-Include-sys-select.h-for-select.patch \
           "
+
 SRC_URI[md5sum] = "3cd1ae2a4abecf44b3f24d6639d2cd84"
 SRC_URI[sha256sum] = "dc3f33de54163718f82b3e7c496a7de97f8862578414b8ecaad3cbfe4821864b"
 
 inherit cmake pkgconfig
 
-EXTRA_OECMAKE = "-DWITH_WEBKIT=no -DWITH_GNOME=yes -DWITH_KDE4=no \
-	      -DWITH_PYTHON=no -DWITH_PERL=no -DWITH_MOZJS=no -DWITH_NM=no -DLIB_INSTALL_DIR=${libdir} -DLIBEXEC_INSTALL_DIR=${libexecdir}"
+PACKAGECONFIG ?= " \
+    ${@ '' if incompatible_license_contains('GPLv3', 'x', '', d) == 'x' or bb.utils.contains('DISTRO_FEATURES', 'x11', 'x', '', d) == '' else 'gnome' } \
+"
 
-FILES_${PN} += "${libdir}/${BPN}/${PV}/modules"
-FILES_${PN}-dev += "${datadir}/cmake"
+PACKAGECONFIG[gnome] = "-DWITH_GNOME=yes,-DWITH_GNOME=no,gconf"
+
+EXTRA_OECMAKE += " \
+    -DWITH_KDE4=no \
+    -DWITH_MOZJS=no \
+    -DWITH_NM=no \
+    -DWITH_PERL=no \
+    -DWITH_PYTHON=no \
+    -DWITH_WEBKIT=no \
+    -DLIB_INSTALL_DIR=${libdir} \
+    -DLIBEXEC_INSTALL_DIR=${libexecdir} \
+"
 
 do_configure_prepend() {
 	export HOST_SYS=${HOST_SYS}
 	export BUILD_SYS=${BUILD_SYS}
 }
 
-python() {
-    if incompatible_license_contains("GPLv3", "x", "", d) == "x" or bb.utils.contains("DISTRO_FEATURES", "x11", "x", "", d) == "":
-        d.setVar("EXTRA_OECMAKE", d.getVar("EXTRA_OECMAKE", False).replace("-DWITH_GNOME=yes", "-DWITH_GNOME=no"))
-        d.setVar("DEPENDS", " ".join(i for i in d.getVar("DEPENDS", False).split() if i != "gconf"))
-}
+FILES_${PN} += "${libdir}/${BPN}/${PV}/modules"
+FILES_${PN}-dev += "${datadir}/cmake"
-- 
1.9.1


