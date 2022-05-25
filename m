Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C32D1C433F5
	for <webhook@archiver.kernel.org>; Wed, 25 May 2022 03:48:53 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.18])
 by mx.groups.io with SMTP id smtpd.web09.2858.1653450524836410053
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 20:48:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=fEi9QjE2;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.18,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653450522; i=@fujitsu.com;
	bh=IeC6icDzlRHIrw5qVkfrkYvjBD1emMshOuCPSf8fGtQ=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=fEi9QjE2BD+XnJnSSf2CGUqzI8p10D47sOB3xCkLF8pNS1VRxrieUqGUbz7F8Um47
	 kTgY+92ww77wHX7clLTWtN2cw/bYTWPzLJDt0ijYylpdMfRkc/l7ur34yP7GgZlbfu
	 jM/ZMporVUXzRW26d9eYg8g2xpi+C54dZ7MfUZE112L5HmhZwvXh7sth7JemJTaE6d
	 fRBFoknCwnGh3exagx4U/8EfZ6q0xpbnIian2hZuvwCPcmo+oQwMgTjvJ/ZDjbvFpt
	 hnS7zabdbmHsy8YsXGFkZMQFgSKV/aPCXM9bcjri2DRNCVx+Vg/Pb+Ar0nqoOj/JGr
	 jggOGrLwuYPSQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpCu5vDf
  J4OACVYs7P9+xOzB6nNu4gjGAMYo1My8pvyKBNWPKxX/sBb/kKyZszW9g7JXpYuTiEBJ4wCgx
  99c7dgjnDJPEvC9LWSGcvYwSTSsmAjmcHGwCGhK7p15m7mLk4BAR0JO4+k8UJMwsoCZx9OVPZ
  hBbWMBC4s7MJ4wgNouAqsSEw6fA4rwCrhJfd18AGyMhoCAx5eF7qLigxMmZT1gg5khIHHzxgh
  miRkni7aU9jBB2hcTrw5eg4moSV89tYp7AyD8LSfssJO0LGJlWMVolFWWmZ5TkJmbm6BoaGOg
  aGprqAklTE73EKt1EvdRS3fLU4hJdQ73E8mK91OJiveLK3OScFL281JJNjMCQTClmmLWDcVbf
  T71DjJIcTEqivO9n9SYJ8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuBNWQKUEyxKTU+tSMvMAcYHT
  FqCg0dJhPf+YqA0b3FBYm5xZjpE6hSjMcfOLZf3MnNcvXJlL7MQS15+XqqUOK/lMqBSAZDSjN
  I8uEGwuL3EKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZj3w1KgKTyZeSVw+14BncIEdEo+L9g
  pJYkIKakGposu05e+TdvLYxUtKzFxxqr9Rmvv3176r8Vl+qQVCgXqBxNZF7tGshzW1fpRt+Di
  SsXXabwrpLgOeXtbrBAu6GjfyLPhu2dWWPtib4vmE5M/5ceeS53C3PUmKOew+KmeZcdF0j+Vt
  SbwcYRen9i1lcuf/YTTXg2BOKWJ6oGL5/fp5DdcnLQmzOB35P7WIEvDwvDqvV9/veY3L2eW0v
  xXNC3/ovic2DW+QS68n2XllNf7yHH8kTOpYHRK0TvSKpBxNmsFh+6pgztMz2k4L/U8J/D64tJ
  UuXw/yZAKmxaRE9NPWlw7tUQ38/UZoT+Latt6JTzWTIlZZVG7yN72+MzqnM9+8xWXLshesktU
  J7JWiaU4I9FQi7moOBEAM7gEs1YDAAA=
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1653450521!79441!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14664 invoked from network); 25 May 2022 03:48:41 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 May 2022 03:48:41 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 2F3DBB55
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 04:48:41 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id 23C3EB51
	for <openembedded-core@lists.openembedded.org>;
 Wed, 25 May 2022 04:48:41 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Wed, 25 May 2022 04:48:19 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v5] gnutls: Added fips option.
Date: Wed, 25 May 2022 11:48:09 +0800
Message-ID: <1653450489-16290-1-git-send-email-leimaohui@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.227]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 25 May 2022 03:48:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166092

- Added a patch to avoid excute fipshmac command. Because *.hmac
file should be created on target instead of on build environment.
- Added pkg_postinst_ontarget to make sure necessary files are
created on target.

Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
---
 ...ile-should-be-excuted-in-target-envi.patch | 28 +++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_3.7.5.bb   | 24 +++++++++++++++-
 2 files changed, 51 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch

diff --git a/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
new file mode 100644
index 0000000000..f4a2f0cd35
--- /dev/null
+++ b/meta/recipes-support/gnutls/gnutls/0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch
@@ -0,0 +1,28 @@
+From b729a356538d499fe25e82bfc78ea663bdaca0a8 Mon Sep 17 00:00:00 2001
+From: Lei Maohui <leimaohui@fujitsu.com>
+Date: Mon, 23 May 2022 10:44:43 +0900
+Subject: [PATCH] Creating .hmac file should be excuted in target environment,
+ so deleted it from build process.
+
+Upstream-Status: Inappropriate [https://gitlab.com/gnutls/gnutls/-/issues/1373]
+Signed-off-by: Lei Maohui <leimaohui@fujitsu.com>
+---
+ lib/Makefile.am | 3 +--
+ 1 file changed, 1 insertion(+), 2 deletions(-)
+
+diff --git a/lib/Makefile.am b/lib/Makefile.am
+index 0b43ef9..cf263f0 100644
+--- a/lib/Makefile.am
++++ b/lib/Makefile.am
+@@ -206,8 +206,7 @@ hmac_files = .libs/.gnutls.hmac
+
+ all-local: $(hmac_files)
+
+-.libs/.gnutls.hmac: libgnutls.la fipshmac
+-	$(AM_V_GEN) $(builddir)/fipshmac > $@-t && mv $@-t $@
++.libs/.gnutls.hmac:
+
+ CLEANFILES = $(hmac_files)
+ endif
+--
+2.25.1
diff --git a/meta/recipes-support/gnutls/gnutls_3.7.5.bb b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
index 5feedb7fdc..b796494b8d 100644
--- a/meta/recipes-support/gnutls/gnutls_3.7.5.bb
+++ b/meta/recipes-support/gnutls/gnutls_3.7.5.bb
@@ -21,6 +21,7 @@ SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
 SRC_URI = "https://www.gnupg.org/ftp/gcrypt/gnutls/v${SHRT_VER}/gnutls-${PV}.tar.xz \
            file://arm_eabi.patch \
+           file://0001-Creating-.hmac-file-should-be-excuted-in-target-envi.patch \
            "
 
 SRC_URI[sha256sum] = "1f85028475b4f255cc5b480af0c37e61eab43024c1507c8b75d6be506c0553ad"
@@ -36,6 +37,7 @@ PACKAGECONFIG[libidn] = "--with-idn,--without-idn,libidn2"
 PACKAGECONFIG[libtasn1] = "--with-included-libtasn1=no,--with-included-libtasn1,libtasn1"
 PACKAGECONFIG[p11-kit] = "--with-p11-kit,--without-p11-kit,p11-kit"
 PACKAGECONFIG[tpm] = "--with-tpm,--without-tpm,trousers"
+PACKAGECONFIG[fips] = "--enable-fips140-mode --with-libdl-prefix=${STAGING_BASELIBDIR}"
 
 EXTRA_OECONF = " \
     --enable-doc \
@@ -59,10 +61,30 @@ do_configure:prepend() {
 	done
 }
 
-PACKAGES =+ "${PN}-openssl ${PN}-xx"
+do_install:append:class-target() {
+        if ${@bb.utils.contains('PACKAGECONFIG', 'fips', 'true', 'false', d)}; then
+          install -d ${D}${bindir}/bin
+          install -m 0755 ${B}/lib/.libs/fipshmac ${D}/${bindir}/
+        fi
+}
+
+PACKAGES =+ "${PN}-openssl ${PN}-xx ${PN}-fips"
 
 FILES:${PN}-dev += "${bindir}/gnutls-cli-debug"
 FILES:${PN}-openssl = "${libdir}/libgnutls-openssl.so.*"
 FILES:${PN}-xx = "${libdir}/libgnutlsxx.so.*"
+FILES:${PN}-fips = "${bindir}/fipshmac"
 
 BBCLASSEXTEND = "native nativesdk"
+
+pkg_postinst_ontarget:${PN}-fips () {
+    if test -x ${bindir}/fipshmac
+    then
+        mkdir ${sysconfdir}/gnutls
+        touch ${sysconfdir}/gnutls/config
+        ${bindir}/fipshmac ${libdir}/libgnutls.so.30.*.* > ${libdir}/.libgnutls.so.30.hmac
+        ${bindir}/fipshmac ${libdir}/libnettle.so.8.* > ${libdir}/.libnettle.so.8.hmac
+        ${bindir}/fipshmac ${libdir}/libgmp.so.10.*.* > ${libdir}/.libgmp.so.10.hmac
+        ${bindir}/fipshmac ${libdir}/libhogweed.so.6.* > ${libdir}/.libhogweed.so.6.hmac
+    fi
+}
-- 
2.25.1


