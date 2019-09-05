Return-Path: <nathan@nathanrossi.com>
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
	[209.85.210.177])
	by mail.openembedded.org (Postfix) with ESMTP id 45EE16C3B2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Sep 2019 13:44:26 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id d15so1777835pfo.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Sep 2019 06:44:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=nathanrossi.com; s=google;
	h=date:message-id:from:to:cc:subject:content-transfer-encoding
	:mime-version; bh=RsO1LeSz5JSD4zZs5Rbpq2oFXdhkzv2KkNkK0QBoQ1o=;
	b=NXw3yCBpjVbG2TFfShnAJv2e+TKMtegd6UUAlnBK8udkVq6k8KSxrZuC+whZiyuZVH
	Na8vSShvfMsaH8mB3htUruILgg8TeqwFT9PFkGjTPGvX73+U/cEZV874rxChfjsFTETi
	tJ4rEhQkgPtqYOoMyZ/JzfyYpFWkmt4exRcNilyvn9qnXGU/6sWcXbumEICSbwmxb4ml
	PUp7JczY6v59CJiTHgkD76XFHy6dlyf24D+P8LpXz5kCJk19auOtTvPlurafo4fRZTRu
	iMG3tLaTDW8qvsPy7wTz0jNyXh3zbcX8zwcrZW4W0kruCnuM70cxTRpyCREJ6Efr8If6
	zZZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:message-id:from:to:cc:subject
	:content-transfer-encoding:mime-version;
	bh=RsO1LeSz5JSD4zZs5Rbpq2oFXdhkzv2KkNkK0QBoQ1o=;
	b=kv9O15Zk7ysqciP3hczvcomcL2wGicKAH7I4ENsagDLG7xcaoCjuJUgzhSD7vJWDyN
	cPW+okjSsvrjZMygAagYyfQzGL6NhE64w+DsQbfLr/WZryVbhoBCuLXM0NgHKTiIGbwz
	9tooyX7CEnEWbUknsXgKp+attr49zFoS4qbUYOiqRRTZZmvWXVHd/YFMxau2VhnOnzvT
	5f5gaTp5Ib2cDqUYCy67r32o+suA8KggzdRreObmtsz5eClzrsjkzmBehLyJII7WvCHZ
	8qKAQRMnsF0x2R3idLC8mIJxdBfY9AxijBsFQ72GJhslu1WmVdBsrgqFy0za9itS8L3F
	8fmQ==
X-Gm-Message-State: APjAAAW16q3xXk+hm9eDAubrpVBLGA1cXOqIgg+ngkfJBrRX4X3XWiKN
	NivjQ2TGzamv+OVqyfkx2FuNoPlzH2QhDQ==
X-Google-Smtp-Source: APXvYqy3UEV/CdyjIqo/oFDo343pBXWae8WN4eel4h275+Mfs4RRixQRShxZH7MMFES5r1rkGF8aRA==
X-Received: by 2002:a65:5382:: with SMTP id x2mr3245760pgq.422.1567691066743; 
	Thu, 05 Sep 2019 06:44:26 -0700 (PDT)
Received: from [127.0.1.1] ([101.184.76.229])
	by smtp.gmail.com with UTF8SMTPSA id
	v18sm2283027pgl.87.2019.09.05.06.44.24
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 05 Sep 2019 06:44:26 -0700 (PDT)
Date: Thu, 05 Sep 2019 13:44:15 +0000
Message-Id: <20190905134415.26785-1-nathan@nathanrossi.com>
From: Nathan Rossi <nathan@nathanrossi.com>
To: openembedded-core@lists.openembedded.org
MIME-Version: 1.0
Subject: [PATCH 1/3] Clean up remnants of glibc-initial
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
X-List-Received-Date: Thu, 05 Sep 2019 13:44:26 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

Remove remnants of the glibc-initial recipe.

Signed-off-by: Nathan Rossi <nathan@nathanrossi.com>
---
 meta/classes/staging.bbclass                | 2 +-
 meta/conf/distro/include/maintainers.inc    | 1 -
 meta/conf/distro/include/security_flags.inc | 2 --
 meta/conf/distro/include/tcmode-default.inc | 4 ----
 meta/recipes-core/glibc/glibc-package.inc   | 9 +--------
 5 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/meta/classes/staging.bbclass b/meta/classes/staging.bbclass
index cdc342dbb9..55a9b52ed2 100644
--- a/meta/classes/staging.bbclass
+++ b/meta/classes/staging.bbclass
@@ -197,7 +197,7 @@ def staging_populate_sysroot_dir(targetsysroot, nativesysroot, native, d):
     for pkgarch in pkgarchs:
         for manifest in glob.glob(d.expand("${SSTATE_MANIFESTS}/manifest-%s-*.populate_sysroot" % pkgarch)):
             if manifest.endswith("-initial.populate_sysroot"):
-                # skip glibc-initial and libgcc-initial due to file overlap
+                # skip libgcc-initial due to file overlap
                 continue
             if not native and (manifest.endswith("-native.populate_sysroot") or "nativesdk-" in manifest):
                 continue
diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index aaae55ac86..566641a895 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -217,7 +217,6 @@ RECIPE_MAINTAINER_pn-glew = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-glib-2.0 = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-glib-networking = "Anuj Mittal <anuj.mittal@intel.com>"
 RECIPE_MAINTAINER_pn-glibc = "Khem Raj <raj.khem@gmail.com>"
-RECIPE_MAINTAINER_pn-glibc-initial = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-locale = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-mtrace = "Khem Raj <raj.khem@gmail.com>"
 RECIPE_MAINTAINER_pn-glibc-scripts = "Khem Raj <raj.khem@gmail.com>"
diff --git a/meta/conf/distro/include/security_flags.inc b/meta/conf/distro/include/security_flags.inc
index 620978a8ed..758bd89c3e 100644
--- a/meta/conf/distro/include/security_flags.inc
+++ b/meta/conf/distro/include/security_flags.inc
@@ -36,7 +36,6 @@ SECURITY_CFLAGS_remove_powerpc = "${SECURITY_PIE_CFLAGS}"
 SECURITY_CFLAGS_pn-libgcc_powerpc = ""
 
 SECURITY_CFLAGS_pn-glibc = ""
-SECURITY_CFLAGS_pn-glibc-initial = ""
 SECURITY_CFLAGS_pn-gcc-runtime = ""
 SECURITY_CFLAGS_pn-grub = ""
 SECURITY_CFLAGS_pn-grub-efi = ""
@@ -60,7 +59,6 @@ TARGET_LDFLAGS_append_class-target = " ${SECURITY_LDFLAGS}"
 
 SECURITY_STACK_PROTECTOR_pn-gcc-runtime = ""
 SECURITY_STACK_PROTECTOR_pn-glibc = ""
-SECURITY_STACK_PROTECTOR_pn-glibc-initial = ""
 # All xorg module drivers need to be linked this way as well and are
 # handled in recipes-graphics/xorg-driver/xorg-driver-common.inc
 SECURITY_LDFLAGS_pn-xserver-xorg = "${SECURITY_X_LDFLAGS}"
diff --git a/meta/conf/distro/include/tcmode-default.inc b/meta/conf/distro/include/tcmode-default.inc
index 5c28386c4f..d8f434609b 100644
--- a/meta/conf/distro/include/tcmode-default.inc
+++ b/meta/conf/distro/include/tcmode-default.inc
@@ -14,8 +14,6 @@ PREFERRED_PROVIDER_virtual/${SDK_PREFIX}g++ = "gcc-crosssdk-${SDK_SYS}"
 PREFERRED_PROVIDER_virtual/${SDK_PREFIX}compilerlibs = "nativesdk-gcc-runtime"
 
 # Default libc config
-PREFERRED_PROVIDER_virtual/${TARGET_PREFIX}libc-initial = "${TCLIBC}-initial"
-PREFERRED_PROVIDER_virtual/nativesdk-${SDK_PREFIX}libc-initial ?= "nativesdk-glibc-initial"
 PREFERRED_PROVIDER_virtual/gettext ??= "gettext"
 
 GCCVERSION ?= "9.%"
@@ -62,8 +60,6 @@ PREFERRED_VERSION_glibc-locale             ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-mtrace             ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_glibc-scripts            ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_nativesdk-glibc          ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_glibc-initial            ?= "${GLIBCVERSION}"
-PREFERRED_VERSION_nativesdk-glibc-initial  ?= "${GLIBCVERSION}"
 PREFERRED_VERSION_cross-localedef-native   ?= "${GLIBCVERSION}"
 
 PREFERRED_VERSION_qemu ?= "${QEMUVERSION}"
diff --git a/meta/recipes-core/glibc/glibc-package.inc b/meta/recipes-core/glibc/glibc-package.inc
index f796876a87..9b1e7b7903 100644
--- a/meta/recipes-core/glibc/glibc-package.inc
+++ b/meta/recipes-core/glibc/glibc-package.inc
@@ -88,14 +88,7 @@ do_install_append () {
 		rm -f ${D}${sysconfdir}/ld.so.conf
 		rm -f ${D}${base_sbindir}/ldconfig
 		# This directory will be empty now so remove it too.
-		# But check whether it exists first, since it won't for glibc-initial.
-		if [ -d ${D}${sysconfdir} ]; then
-			rmdir ${D}${sysconfdir}
-		fi
-	fi
-
-	if echo ${PN}|grep -q "glibc-initial"; then
-		return
+		rmdir ${D}${sysconfdir}
 	fi
 
 	install -d ${D}${sysconfdir}/init.d
---
2.23.0.rc1

