Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f196.google.com (mail-ob0-f196.google.com
	[209.85.214.196])
	by mail.openembedded.org (Postfix) with ESMTP id D31FF60670
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 02:43:53 +0000 (UTC)
Received: by mail-ob0-f196.google.com with SMTP id is5so1823454obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 18:43:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=sdte8FW+21CU9J+RWXzfoxRln9f9lYv21e21sGxolq4=;
	b=DwcYUrmGyCOcUkM+p6SOMw3sJnBlcPiLsWb6G2QkxdBerQoiPsm9rIoWq/R/QQHcPK
	9qqYqcVj3ss+AclIdU3htT0pjPCHOzRpQWg4yg27YhSQ0vXy7Ep+YM1lk0TkjXqTG8Yx
	GblEfAzsysfYbkQ3phQlltmqw3NhwwW73lLbvJvArrt+3mDcAy3HF/+R92vQXS3WncFJ
	iJfzyEpUNkOVhxaURZIh92evVyoSZ4+iJ1oPu+IEQRzvn+C6ZTwrZJ1ytCchkCDUyFIo
	xFdCpDd7/F3IPveTZ/Tvy3lTVAZzdW53wgQAgSVI0VXFLEQUjgUk1gKR6GT4LNIerVYe
	HenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=sdte8FW+21CU9J+RWXzfoxRln9f9lYv21e21sGxolq4=;
	b=IygWa6msIyNrMBEZcCrkoj/R1x4rR3ncSAD+47b3a0TgWRsAoz0VfUN27h7oSJxMAM
	2b4xL29tnTYvbrjTKF2YwGSkmPnrzEM7QycRBAfs+cRZu60+SIPzE4/Q8y8ae7WfGWAl
	W8uPtEM6NTFG7FTYe3Z/boPELx+Yx0cD8hrMm4W3OtbR2lP5kr4GNStijh/0pHFNv/jw
	ohiyQyzVc/ZimwPznIPB3Z01Mh0rPtpwCOGSsC8XDSIy9JkwSOwaJskYLE3EnBC/l5aI
	b8V/UsKLGUtpU6gABPKHk8VB00K5jgOBs44GPjK1QBJRT8ycdP2qdgDF9l9rXT5NK8Iz
	ECAA==
X-Gm-Message-State: ALoCoQkqHe1kfs7cyBcMYjxt04EBvyTD0zWlONeq0sX9Rh9vFT/GyheYdNqImf1Ph9JiPryGZTmkKkQLC4982DEob4oct4pTyg==
X-Received: by 10.60.135.98 with SMTP id pr2mr31671896oeb.65.1453344232163;
	Wed, 20 Jan 2016 18:43:52 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id l3sm19310608oeq.0.2016.01.20.18.43.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 18:43:51 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 18:43:08 -0800
Message-Id: <1453344203-7118-11-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
References: <1453344203-7118-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 10/25] gstreamer1.0-omx: minor formatting improvements + update HOMEPAGE
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
X-List-Received-Date: Thu, 21 Jan 2016 02:43:54 -0000

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


