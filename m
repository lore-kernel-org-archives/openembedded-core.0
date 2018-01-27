Return-Path: <max.oss.09@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 770E378853
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 13:56:57 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id t74so6209248wme.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Jan 2018 05:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=s50AS6xfF3ZnoHaH3eMQAiXXr5VsHHtMO+tSVhMXrm4=;
	b=OsqDKIncD+B9IwqaSRHqVg77xZiMuQ3gygQv81kkrNflLVs8/li8XkmTek3mWlTT6W
	x4vfvr/sMaO17E4SWmInEDQp0Fe14R+y29HxP28LHrA87i1AACzrWNrGyxGui9YsLw3/
	3WYFO9Jm1DyTkoOGPeBSSRhN56NCNXrDTzt1YOOsCpurkAOrSb5eD+s7qF5fZOP6p0iT
	5xb1dH0+MEWKxvqBsPOZm6iC9hfwi911Wj5rSRdeJWXvz1Y+XNDbtNiZxW9DRYBbBoQ2
	xQA7Xj4UtF+Xs/WrWdkxuVc2fM4F0O2pfTrGsdQYkHkerEfWu0QZPTt6sukgMf8s7uTH
	gSKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=s50AS6xfF3ZnoHaH3eMQAiXXr5VsHHtMO+tSVhMXrm4=;
	b=hvK7Un0XoPERTfP3nMzPsKuAuNNpdOK5eRr2m98kPezk7QVqSJqZKWFCF9IXHNam8r
	oI0ziXFsp2dDfKctX8R5SN19u/hzrYJyGs1/1tyStJ44VhEHq995+EW62OVvgvz+UEx2
	8SMoGZKHPvWwN1Xl+ahPy6eHBGw8TYORCi3Xj4oT+jo+r87S/mgbdb6XML37mEEddpsv
	4pzJtKwPHF+ZQQtH+VudFIoishkL7Dz9jX//5OU0gX1krU9AVjK1fhyHVSw6Cp+K5Lv9
	OnqYVRD3sWD7HFtbXF/Nt9uwIeLx/0fKd9DhvFsy0zSyrC/BX+SJLl9HiXBcYebOy4+z
	fw+A==
X-Gm-Message-State: AKwxyteDACUUUTLrqPFfco9pFDOtiqtUUyunN5ePvOIm2owMpoP4I5Gf
	NwQ6rKlaJ6jMQ35Bgkh5v35rhA==
X-Google-Smtp-Source: AH8x225ci13cwgi8I/cY7igUj91ORy5Sttfbe9yuN8jfpa5iMD1tVV1m9f8DdDJerHaxpfojngkWAA==
X-Received: by 10.80.241.20 with SMTP id w20mr2477273edl.280.1517061418021;
	Sat, 27 Jan 2018 05:56:58 -0800 (PST)
Received: from Saturn.local.all ([195.48.14.138])
	by smtp.gmail.com with ESMTPSA id
	o26sm3662793edi.18.2018.01.27.05.56.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 27 Jan 2018 05:56:57 -0800 (PST)
From: Max Krummenacher <max.oss.09@gmail.com>
X-Google-Original-From: Max Krummenacher <max.krummenacher@toradex.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 27 Jan 2018 14:56:32 +0100
Message-Id: <20180127135632.9425-1-max.krummenacher@toradex.com>
X-Mailer: git-send-email 2.13.6
Cc: Max Krummenacher <max.krummenacher@toradex.com>
Subject: [PATCH] libfm: split the gtk+ bindings into their own package
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
X-List-Received-Date: Sat, 27 Jan 2018 13:56:57 -0000

Recipes depending on libfm with the gtk+ bindings will automatically rdepend
additionally on the new package libfm-gtk.

Signed-off-by: Max Krummenacher <max.krummenacher@toradex.com>
---
 meta/recipes-support/libfm/libfm_1.2.5.bb | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/meta/recipes-support/libfm/libfm_1.2.5.bb b/meta/recipes-support/libfm/libfm_1.2.5.bb
index 1ddddfdc99..6844243c1e 100644
--- a/meta/recipes-support/libfm/libfm_1.2.5.bb
+++ b/meta/recipes-support/libfm/libfm_1.2.5.bb
@@ -24,7 +24,19 @@ EXTRA_OECONF = "--with-gtk=3"
 
 do_configure[dirs] =+ "${S}/m4"
 
+PACKAGES =+ "libfm-gtk"
 PACKAGES += "${PN}-mime"
+FILES_libfm-gtk = " \
+    ${libdir}/libfm-gtk*so.* \
+    ${libdir}/libfm/modules/gtk* \
+    ${bindir}/libfm-pref-apps \
+    ${bindir}/lxshortcut \
+    ${datadir}/applications/libfm-pref-apps.desktop \
+    ${datadir}/applications/lxshortcut.desktop \
+    ${datadir}/libfm/images/folder.png \
+    ${datadir}/libfm/images/unknown.png \
+    ${datadir}/libfm/ui/*.ui \
+"
 FILES_${PN}-mime = "${datadir}/mime/"
 
 do_install_append () {
-- 
2.13.6


