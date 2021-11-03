Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3F40C433EF
	for <webhook@archiver.kernel.org>; Wed,  3 Nov 2021 07:20:30 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.web08.4230.1635924029525640515
 for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 00:20:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Bw/9ugSB;
 spf=pass (domain: gmail.com, ip: 209.85.221.51,
 mailfrom: rybczynska@gmail.com)
Received: by mail-wr1-f51.google.com with SMTP id r8so2045356wra.7
        for <openembedded-core@lists.openembedded.org>;
 Wed, 03 Nov 2021 00:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv0hqbRb1yaRuX4pTJzmVafdaGICfGyzy7Re7rIH2xM=;
        b=Bw/9ugSBq2gDsPzbiJRUbWoCLBsA6y6kYmEyBsu/yOrnBQwYIRpjOcCOjkt/xpbRI+
         h0ztFNl4bGGE5Rn22BGVUEnRrTJQUzHXiXU4+6QjiF2Kvj9SKw9htiYymSI2dijNygWn
         y9eMkN0fZ7qa0UoSTyKuSMeoXwRsEXhSdOxwWbHRNFEnMugaO/kZFiCKInOxBoGdvBV/
         8L79mt0FZGqS5/XzDBTti8FMQzUn/aCdcTMvDH445oYfVE3ApbCn1RIa1vPdl3oIl+ab
         LXBHRIBITmO3EM4rPVSmXo9fFJZDNpvuFt+rqpnY7sXW4bUbbsrilejwiRmx/9wFfl9E
         E9hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=Cv0hqbRb1yaRuX4pTJzmVafdaGICfGyzy7Re7rIH2xM=;
        b=wu9ESOcYCCsmATatPAc1Dx5jIlpJNZiipzlBam26LomoZiSQcAPg2LwxBlIAWeJi76
         IMl8522oLWJgKSJipuuuQKlD9N4Vpjyn5lpP2gL+C6AmNo837KjJmhp3nj0v9dlg8QcH
         IBAHm8RSOMc5OLcAqEKFjOCdWadIdpeGkCFuC++AqEBXNwnwxto245U5+j8WsIecNchU
         LtHwR1PBML2VpYN+FFKA2UDr+RnT5mJXbKQ8XjHRmhgQkk2JiU6Vtv/Toopp8Jro+j0q
         5vZr9Vt8UgotQK0fyZcG1fGh7GjdLHcCUgFb3S3oujEqLu7j2wJhCFaUb9gJ4Fhaidqd
         +zqg==
X-Gm-Message-State: AOAM530zvXOy85OfzByoNGJ/dKG462gqWToamNnyNtwAlNuo14lqaK2n
	BEWdR3G53ddM33LE+zrHC+suy67GUnD1Rw==
X-Google-Smtp-Source: 
 ABdhPJwQS3DCqagavrDNm0S4nh0mQ6fYVSmLyPBlkJh/o6tunjvgRfYoYpxM7+pLiuxAyhC/fVYKOA==
X-Received: by 2002:a5d:4b0f:: with SMTP id
 v15mr10838966wrq.264.1635924027433;
        Wed, 03 Nov 2021 00:20:27 -0700 (PDT)
Received: from localhost.localdomain ([80.215.138.144])
        by smtp.gmail.com with ESMTPSA id
 h15sm671790wmq.32.2021.11.03.00.20.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Nov 2021 00:20:26 -0700 (PDT)
From: Marta Rybczynska <rybczynska@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: steve@sakoman.com,
	Marta Rybczynska <rybczynska@gmail.com>,
	Marta Rybczynska <marta.rybczynska@huawei.com>
Subject: [dunfell][meta-oe][PATCH] networkmanager: update to 1.22.16
Date: Wed,  3 Nov 2021 08:20:15 +0100
Message-Id: <20211103072015.7401-1-rybczynska@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 03 Nov 2021 07:20:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157821

NetworkManager 1.22.16 contains a fix for CVE-2020-10754.

This version includes an additional option by default for firewalld zones,
--enable-firewalld-zone that installs additional files. Disable it to
keep the old behaviour if no firewalld.

Also include a patch for fixing reallocarray usage from gatesgarth
meta-openembedded 165ad9ad4c86c9e63f3afcf3172c8e1d3629f3a5 required
for the build.

Signed-off-by: Marta Rybczynska <marta.rybczynska@huawei.com>
---
 .../fix_reallocarray_check.patch              | 27 +++++++++++++++++++
 ...r_1.22.10.bb => networkmanager_1.22.16.bb} |  7 ++++-
 2 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
 rename meta-networking/recipes-connectivity/networkmanager/{networkmanager_1.22.10.bb => networkmanager_1.22.16.bb} (95%)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
new file mode 100644
index 000000000..0a8de5410
--- /dev/null
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager/fix_reallocarray_check.patch
@@ -0,0 +1,27 @@
+reallocarray() is coming from stdlib.h which maybe indirectly included
+by malloc.h but not on all libc implementations
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/meson.build
++++ b/meson.build
+@@ -114,7 +114,7 @@ config_h.set10('HAVE_GETRANDOM', use_sys
+ # FIXME secure_getenv check is not useful?
+ config_h.set('HAVE_SECURE_GETENV', cc.has_function('secure_getenv'))
+ config_h.set('HAVE___SECURE_GETENV', cc.has_function('__secure_getenv'))
+-config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <malloc.h>'))
++config_h.set10('HAVE_DECL_REALLOCARRAY', cc.has_function('reallocarray', prefix: '#include <stdlib.h>'))
+ config_h.set10('HAVE_DECL_EXPLICIT_BZERO', cc.has_function('explicit_bzero', prefix: '#include <string.h>'))
+ config_h.set10('HAVE_DECL_MEMFD_CREATE', cc.has_function('memfd_create', prefix: '#include <sys/mman.h>'))
+ 
+--- a/configure.ac
++++ b/configure.ac
+@@ -82,7 +82,7 @@ AC_CHECK_DECLS([
+ AC_CHECK_DECLS([
+ 	reallocarray],
+ 	[], [], [[
+-#include <malloc.h>
++#include <stdlib.h>
+ ]])
+ 
+ AC_CHECK_DECLS([
diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
similarity index 95%
rename from meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
rename to meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
index 33a2b7c0c..ff784b8ce 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.10.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.22.16.bb
@@ -26,6 +26,7 @@ SRC_URI = " \
     file://${BPN}.initd \
     file://0001-Fixed-configure.ac-Fix-pkgconfig-sysroot-locations.patch \
     file://0002-Do-not-create-settings-settings-property-documentati.patch \
+    file://fix_reallocarray_check.patch \
 "
 SRC_URI_append_libc-musl = " \
     file://musl/0001-Fix-build-with-musl-systemd-specific.patch \
@@ -33,7 +34,7 @@ SRC_URI_append_libc-musl = " \
     file://musl/0003-Fix-build-with-musl-for-n-dhcp4.patch \
     file://musl/0004-Fix-build-with-musl-systemd-specific.patch \
 "
-SRC_URI[sha256sum] = "2b29ccc1531ba7ebba95a97f40c22b963838e8b6833745efe8e6fb71fd8fca77"
+SRC_URI[sha256sum] = "377aa053752eaa304b72c9906f9efcd9fbd5f7f6cb4cd4ad72425a68982cffc6"
 
 S = "${WORKDIR}/NetworkManager-${PV}"
 
@@ -71,6 +72,7 @@ PACKAGECONFIG[bluez5] = "--enable-bluez5-dun,--disable-bluez5-dun,bluez5"
 # consolekit is not picked by shlibs, so add it to RDEPENDS too
 PACKAGECONFIG[consolekit] = "--with-session-tracking=consolekit,,consolekit,consolekit"
 PACKAGECONFIG[modemmanager] = "--with-modem-manager-1=yes,--with-modem-manager-1=no,modemmanager"
+PACKAGECONFIG[firewalld] = "--enable-firewalld-zone,--disable-firewalld-zone,firewalld"
 PACKAGECONFIG[ppp] = "--enable-ppp,--disable-ppp,ppp,ppp"
 # Use full featured dhcp client instead of internal one
 PACKAGECONFIG[dhclient] = "--with-dhclient=${base_sbindir}/dhclient,,,dhcp-client"
@@ -151,6 +153,9 @@ ALTERNATIVE_${PN} = "${@bb.utils.contains('DISTRO_FEATURES','systemd','resolv-co
 ALTERNATIVE_TARGET[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv-conf.NetworkManager','',d)}"
 ALTERNATIVE_LINK_NAME[resolv-conf] = "${@bb.utils.contains('DISTRO_FEATURES','systemd','${sysconfdir}/resolv.conf','',d)}"
 
+# Issue introduced in 1.26
+CVE_CHECK_WHITELIST = "CVE-2021-20297 "
+
 do_install_append() {
     install -Dm 0755 ${WORKDIR}/${BPN}.initd ${D}${sysconfdir}/init.d/network-manager
 
-- 
2.33.0


