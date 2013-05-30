Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id 8F1AC6A4D9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 13:56:18 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id c10so4583664wiw.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 May 2013 06:56:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=DStF1SJNuL0PEX4CUkWxJEVeKbJQmGmo+oK6QaKGauk=;
	b=Li4tK0hsHJIxCEBaQvnmSRrCb0dXABen2r4TUUWDtLJ15OjabIcxHJfCSIMBuuUkwI
	vNMiplIxtZ0xIc3cG/gRSGrM+Ym8+/M1FgUtdhPZkFbat1EVFL2hKgv5T2idXUCqbr5i
	84ybtVoSbmF8/6bLruvPwZqs1+ybozkmwdTMqMncPmV7w4PdAFJOW+/lFYIW2ROHx8Ry
	+VFcrmL7pq663lewg29/at/+5YOCQQYybVbkLH/W/iqrV6kqQ96lMYKDBmrukih+82Zi
	2zsA+VZ26oXHjbHxVfVK/hzOHySFZFqMTNhQsTLrRS91isktqbPJt+lH2cAC2yF0Sw3K
	yNVQ==
X-Received: by 10.194.171.65 with SMTP id as1mr4835899wjc.40.1369922179250;
	Thu, 30 May 2013 06:56:19 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	fu14sm38247963wic.0.2013.05.30.06.56.17
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 30 May 2013 06:56:18 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 May 2013 14:52:40 +0100
Message-Id: <21860cf5670b2c628a3375f6690606b18a0a4d81.1369921759.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
In-Reply-To: <cover.1369921759.git.ross.burton@intel.com>
References: <cover.1369921759.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQku5LZV7zqa406mOmVb+2isWmdsfiO9KIjzf6Dn1d0XrEsVbUNX0Nqka4QE8IR9a0cBpRN6
Subject: [PATCH 06/14] at-spi2: add -core and -atk, for GTK+ 3.8
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
X-List-Received-Date: Thu, 30 May 2013 13:56:18 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb  |   19 +++++++++++++++++++
 meta/recipes-support/atk/at-spi2-core_2.8.0.bb |   17 +++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
 create mode 100644 meta/recipes-support/atk/at-spi2-core_2.8.0.bb

diff --git a/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb b/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
new file mode 100644
index 0000000..32cbe3b
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-atk_2.8.1.bb
@@ -0,0 +1,19 @@
+SUMMARY = "AT-SPI 2 Toolkit Bridge"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "854e36a2538bea50bc08d33aa9499bb2"
+SRC_URI[sha256sum] = "eb659b94fde6dc0a2f584c9121a5e6d39a4c8aa297d21d8f9032f7a8a775fd06"
+
+DEPENDS = "dbus glib-2.0 atk at-spi2-core"
+
+inherit autotools
+
+PACKAGES =+ "${PN}-gnome ${PN}-gtk2"
+
+FILES_${PN}-gnome = "${libdir}/gnome-settings-daemon-3.0/gtk-modules"
+FILES_${PN}-gtk2 = "${libdir}/gtk-2.0/modules/libatk-bridge.*"
+FILES_${PN}-dbg += "${libdir}/gtk-2.0/modules/.debug"
diff --git a/meta/recipes-support/atk/at-spi2-core_2.8.0.bb b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
new file mode 100644
index 0000000..29851bb
--- /dev/null
+++ b/meta/recipes-support/atk/at-spi2-core_2.8.0.bb
@@ -0,0 +1,17 @@
+SUMMARY = "Assistive Technology Service Provider Interface (dbus core)"
+LICENSE = "LGPLv2"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e9f288ba982d60518f375b5898283886"
+
+MAJ_VER = "${@oe.utils.trim_version("${PV}", 2)}"
+
+SRC_URI = "${GNOME_MIRROR}/${BPN}/${MAJ_VER}/${BPN}-${PV}.tar.xz"
+SRC_URI[md5sum] = "93b57d5d56d15d1222ddf2386e2f869f"
+SRC_URI[sha256sum] = "1861a30fc7f583d5a567a0ba547db67ce9bd294f0d1c9f7403c96a10a481c458"
+
+DEPENDS = "dbus glib-2.0 virtual/libx11 libxi"
+
+inherit autotools gtk-doc
+
+EXTRA_OECONF = "--disable-introspection --disable-xevie"
+
+FILES_${PN} += "${datadir}/dbus-1/services/*.service"
-- 
1.7.10.4


