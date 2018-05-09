Return-Path: <armccurdy@gmail.com>
Received: from mail-pl0-f68.google.com (mail-pl0-f68.google.com
	[209.85.160.68])
	by mail.openembedded.org (Postfix) with ESMTP id DCCA8750D4
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 May 2018 21:46:58 +0000 (UTC)
Received: by mail-pl0-f68.google.com with SMTP id t12-v6so17639plo.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2018 14:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=1QqPt1X50oTQfgduhGCWiGOUdfpw2nrO/UKqMKDYSYY=;
	b=rWg4LMW2/xlPg3ECzw/b928VaR2EXSUrT+Ilnss9QyomPFlk5MrbTQt1atBW6IUuYY
	k19vFbSLMcY1cizmwWfKeDtqkg7vcpFW4Ss8gOdhQFo7t9UtcYUZ02XBpZzMrWgJdOZ3
	gnHjmTZvFqKCIA10I0Z2XK3m8SqkvNCy0NliL9orMTXUrOW9N/w8+F7K/vCfsgz9N4uF
	kApDmpGZbDYKhvTAc6Sr1MIX/iz5cCV62DTsIWWhIk5N55TGr6+iriB7rbVGC0VCliGB
	UVCdVF71CcsUkT/3Ga+1OiVVybE7TfsrZYi+J0bUqlD/4OzKAajAC13LflI7kFNhG33o
	mokg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=1QqPt1X50oTQfgduhGCWiGOUdfpw2nrO/UKqMKDYSYY=;
	b=MnKKBgowwmCW6N7EuhJWc1z4Jppifdmlu3x4OCjxqtGLuYEA6wQhjaPAZ2nClpgAUb
	wGgEFkH/B9E3XVL/V59jX1Zj/htnxTPITQapPEr44X2oBY4uXMfLddkPKPaMQVLW5a/7
	aRAqaDOUfqp3IKn1mbYIkTxi5WdqMLLHFuudjmiJnJsJbhRfPIyWmq5Mipou/9AVig3Q
	UOt/V/uP+z8eh8uh+Asas/Ssy6sxTFd7o7RrFo98gDisAcolWBhHUQbrskFFYKWN76WC
	GTr8005P/Ia8a0Lxu6K3Aq6X9+WW748xzESqygb5GRc7f1k9qFW96AdkGJzzbOnau34U
	kB9Q==
X-Gm-Message-State: ALQs6tCoEeUuLInP3xvqq4bD7AdSxGfBUp7izL/bj4A6OypwLKmFu78F
	58fbVRSi6l4EWjehpyNJaZpxmg==
X-Google-Smtp-Source: AB8JxZo8V03nrxpFlshuVysE0Ijb/nG+CV9ceh6c9hRsX817ZeebpAHGq88/pOk7aDoi6OLaaC79dg==
X-Received: by 2002:a17:902:8ec4:: with SMTP id
	x4-v6mr46285161plo.370.1525902419962; 
	Wed, 09 May 2018 14:46:59 -0700 (PDT)
Received: from e6520.guest-wifi.scl.liberty.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	76-v6sm3699193pge.75.2018.05.09.14.46.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 09 May 2018 14:46:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 May 2018 14:46:44 -0700
Message-Id: <1525902408-6796-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
References: <1525902408-6796-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 4/8] distcc: move ASNEEDED over-ride into the distcc recipe
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
X-List-Received-Date: Wed, 09 May 2018 21:46:59 -0000

Move the recipe specific over-ride for ASNEEDED into the recipe to
make it more apparent that the over-ride is being applied (and that
it should be re-checked on version updates, etc).

Also misc minor recipe cleanup (re-order variables to follow the OE
style guide, etc).

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/distro/include/as-needed.inc     |  1 -
 meta/recipes-devtools/distcc/distcc_3.2.bb | 29 ++++++++++++++++++++---------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/meta/conf/distro/include/as-needed.inc b/meta/conf/distro/include/as-needed.inc
index 91c0762..94f5b90 100644
--- a/meta/conf/distro/include/as-needed.inc
+++ b/meta/conf/distro/include/as-needed.inc
@@ -1,7 +1,6 @@
 
 ASNEEDED = "-Wl,--as-needed"
 
-ASNEEDED_pn-distcc = ""
 ASNEEDED_pn-openobex = ""
 ASNEEDED_pn-icu = ""
 ASNEEDED_pn-pciutils = ""
diff --git a/meta/recipes-devtools/distcc/distcc_3.2.bb b/meta/recipes-devtools/distcc/distcc_3.2.bb
index ff0e22f..9f752ed 100644
--- a/meta/recipes-devtools/distcc/distcc_3.2.bb
+++ b/meta/recipes-devtools/distcc/distcc_3.2.bb
@@ -7,13 +7,6 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=94d55d512a9ba36caa9b7df079bae19f"
 
 DEPENDS = "avahi binutils"
 
-PACKAGECONFIG ??= "popt"
-PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
-# use system popt by default
-PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
-
-RRECOMMENDS_${PN} = "avahi-daemon"
-
 SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
            file://separatebuilddir.patch \
            file://0001-zeroconf-Include-fcntl.h.patch \
@@ -21,12 +14,26 @@ SRC_URI = "git://github.com/akuster/distcc.git;branch=${PV} \
            file://distccmon-gnome.desktop \
            file://distcc \
            file://distcc.service"
+
 SRCREV = "d8b18df3e9dcbe4f092bed565835d3975e99432c"
+
 S = "${WORKDIR}/git"
 
 inherit autotools pkgconfig update-rc.d useradd systemd
 
-EXTRA_OECONF += "--disable-Werror PYTHON='' --disable-pump-mode"
+PACKAGECONFIG ??= "popt"
+
+PACKAGECONFIG[gtk] = "--with-gtk,--without-gtk --without-gnome,gtk+"
+# use system popt by default
+PACKAGECONFIG[popt] = "--without-included-popt,--with-included-popt,popt"
+
+EXTRA_OECONF += " \
+    --disable-pump-mode \
+    --disable-Werror \
+    PYTHON='' \
+"
+
+ASNEEDED = ""
 
 USERADD_PACKAGES = "${PN}"
 USERADD_PARAM_${PN} = "--system \
@@ -50,18 +57,22 @@ do_install_append() {
     sed -i -e 's,@BINDIR@,${bindir},g' ${D}${systemd_unitdir}/system/distcc.service
     ${DESKTOPINSTALL}
 }
+
 DESKTOPINSTALL = ""
 DESKTOPINSTALL_libc-glibc () {
     install -d ${D}${datadir}/distcc/
     install -m 0644 ${WORKDIR}/distccmon-gnome.desktop ${D}${datadir}/distcc/
 }
+
 PACKAGES += "distcc-distmon-gnome"
 
 FILES_${PN} = " ${sysconfdir} \
 		${bindir}/distcc \
-    ${bindir}/lsdistcc \
+		${bindir}/lsdistcc \
 		${bindir}/distccd \
 		${bindir}/distccmon-text \
 		${systemd_unitdir}/system/distcc.service"
 FILES_distcc-distmon-gnome = "  ${bindir}/distccmon-gnome \
 				${datadir}/distcc"
+
+RRECOMMENDS_${PN} = "avahi-daemon"
-- 
1.9.1


