Return-Path: <armccurdy@gmail.com>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2A3731E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:23 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id j3so1562736oig.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sdte8FW+21CU9J+RWXzfoxRln9f9lYv21e21sGxolq4=;
	b=K4rqM7Kz5znEneTv7uO/GwR0WefNz7wFmKIUQFDL8bp9mc4lUevoTK3ibalLLsw4zc
	NJF+Be6fSfKdsir0CZ5lFgzsyZCBJEWJL6E9ITnOc3AG4vf+zNXY+TEEHfWa6qexelRp
	2wdVGUA3qvpNq26//e5FBZRRw32ogYwu9CU6WQoS6hkmkgrTzzeyCFM5Rj4CIJIlXUoI
	9WgM4x5aoZX/LUuYsOnNeUwANVYu8Jl7Qv7OXZYpLkqGYxaRdkgajU/AhwdFo0NAlbEY
	hA8RAVMhYZ0j/exbka31CAr/Y3B/01Ey9huCG5MKKgBLyUhdNVcttV9D3q2cVmUAPsFd
	BPoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sdte8FW+21CU9J+RWXzfoxRln9f9lYv21e21sGxolq4=;
	b=GRPFs/JsIS2oI3LiW5yACTaYnEe3ctswKvea6NUzutafGtq8mrkktfw4BDOv4Atiba
	EwNYCCnmmf5s3FkzEezSTZ1y5TPz5SJiQWM9PHxHecV0J4scCSdPp4bMsSoOIyEtMgGx
	CbdyfKFqcyDvvisiT/dz089tGQZPg4OKI6ExtoYda0aD09d+/IL57gjSOTZ1EWwOiRPF
	1UJ0ChjjeamKWhex/j9Y8edVsMQaIyZcHfKMsXTrECRy/CtdUnlhkoD9BZWPbNoq1Iu7
	4tL5yNH+8pzGCY2O9v7/8ytZ83q3VBZZxd2rhcig5DEUPTAg+qjCdJYqCrOtfCo7WhHg
	2PaQ==
X-Gm-Message-State: AG10YORusRdWxUQTNQozTxbMV2MZwykJIZV6cX2SFYxUBPNf9shA/IHe9u/FgPyXEJTuSA==
X-Received: by 10.202.79.21 with SMTP id d21mr3492737oib.20.1453354644134;
	Wed, 20 Jan 2016 21:37:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:28 -0800
Message-Id: <1453354610-19218-11-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 10/32] gstreamer1.0-omx: minor formatting improvements + update HOMEPAGE
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:23 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc      | 7 +++++--
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb | 1 -
 meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb   | 7 +++----
 3 files changed, 8 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
index 6806455..0fff612 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx.inc
@@ -1,10 +1,11 @@
 SUMMARY = "OpenMAX IL plugins for GStreamer"
+HOMEPAGE = "http://gstreamer.freedesktop.org/"
 SECTION = "multimedia"
+
 LICENSE = "LGPLv2.1"
 LICENSE_FLAGS = "commercial"
-HOMEPAGE = "http://www.gstreamer.net/"
+
 DEPENDS = "gstreamer1.0 gstreamer1.0-plugins-base gstreamer1.0-plugins-bad"
-RDEPENDS_${PN} = "libomxil"
 
 inherit autotools pkgconfig gettext
 
@@ -32,9 +33,11 @@ python __anonymous () {
 set_omx_core_name() {
 	sed -i -e "s;^core-name=.*;core-name=${GSTREAMER_1_0_OMX_CORE_NAME};" "${D}${sysconfdir}/xdg/gstomx.conf"
 }
+
 do_install[postfuncs] += " set_omx_core_name "
 
 FILES_${PN} += "${libdir}/gstreamer-1.0/*.so"
 FILES_${PN}-dev += "${libdir}/gstreamer-1.0/*.la"
 FILES_${PN}-staticdev += "${libdir}/gstreamer-1.0/*.a"
 
+RDEPENDS_${PN} = "libomxil"
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
index fe7c91c..74358a7 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_1.2.0.bb
@@ -9,4 +9,3 @@ SRC_URI[md5sum] = "d24e8c0153c35dfefee3e26b1c2c35f8"
 SRC_URI[sha256sum] = "0b4874961e6488ad9e5808114bd486ea981c540907262caab1419355fd82d745"
 
 S = "${WORKDIR}/gst-omx-${PV}"
-
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
index 99c84668..9705543 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-omx_git.bb
@@ -9,18 +9,17 @@ SRC_URI = " \
     git://anongit.freedesktop.org/gstreamer/gst-omx;branch=master;name=gst-omx \
     git://anongit.freedesktop.org/gstreamer/common;destsuffix=git/common;branch=master;name=common \
     file://0001-omx-fixed-type-error-in-printf-call.patch \
-    "
-
-S = "${WORKDIR}/git"
+"
 
 SRCREV_gst-omx = "a2db76b048db278ef0aa798e106b7594264e06c0"
 SRCREV_common = "5edcd857b2107cd8b78c16232dd10877513ec157"
 
 SRCREV_FORMAT = "gst-omx"
 
+S = "${WORKDIR}/git"
+
 do_configure_prepend() {
 	cd ${S}
 	./autogen.sh --noconfigure
 	cd ${B}
 }
-
-- 
1.9.1


