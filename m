Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 2EE236A555
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 15:09:08 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id p58so1309972wes.21
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 May 2013 08:09:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=DStF1SJNuL0PEX4CUkWxJEVeKbJQmGmo+oK6QaKGauk=;
	b=bMGsF3fmQZczE9ub8BoeFurzQPJ8PAVHiZFrrfPjMsn3JFKgGnYu+C3BecrbnntZcX
	bo0fVqMy8Jm/vxGk7NR8pNZGWJu4hUkacfrWuRxSbIpugReqgKj8Aoc+OP8zACwKN97U
	Q3mFLVFyynTamYSSUu3xr+I48ySb8aW9sVIy+QQiCPufwX1PMjs17/KA1JWQ8NB42/SM
	sDxx7FOeFimOoYxVrWxKs4xgPBd/dCpE0rF267WzNWhG2k7z7wiTMnbChSpLZdPtqg/W
	oZdVSjpoP8gu+gnUWeMlMkSdakB4wJVHl22zfzEl7649f3awrT8rfLSnkOGlhWzqLYjo
	mw6Q==
X-Received: by 10.180.208.49 with SMTP id mb17mr3718274wic.46.1370012947755;
	Fri, 31 May 2013 08:09:07 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu14sm4546170wic.8.2013.05.31.08.09.06
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 31 May 2013 08:09:06 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 31 May 2013 16:05:38 +0100
Message-Id: <5bed792688d848b38d1565e2705b1f9dca7a17d5.1370012689.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
In-Reply-To: <cover.1370012689.git.ross.burton@intel.com>
References: <cover.1370012689.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQmL2TCyjSoX2KnYQzNKnGc41I9D2smQm206TAxhg/KGbiSb8B1CBX/sz5W+J6xFZDcI1r7x
Subject: [PATCH 02/11] at-spi2: add -core and -atk, for GTK+ 3.8
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
X-List-Received-Date: Fri, 31 May 2013 15:09:08 -0000

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


