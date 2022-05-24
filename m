Return-Path: <leimaohui@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BD94FC433EF
	for <webhook@archiver.kernel.org>; Tue, 24 May 2022 01:29:03 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.66])
 by mx.groups.io with SMTP id smtpd.web08.4357.1653355735543302009
 for <openembedded-core@lists.openembedded.org>;
 Mon, 23 May 2022 18:28:56 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=pBrfEvCY;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.66,
 mailfrom: leimaohui@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1653355733; i=@fujitsu.com;
	bh=NW1lja8Zc0yeDE3zYZ90MgzdoBazLZU37vXurgCrkdM=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=pBrfEvCYoCF4ndZmBk4Y6VIAtKIofg5e0K0NVHmvKvLA02N0N45X4/H6eBsQ12OVJ
	 3Se45kPDVzr6QxEQqcsPBNbUihAHObIz1buCyLwAOFIW3hwvL5aeyaJlzSJ5+fJrke
	 77X3kmtuffG3nbv77aa78CNre8yrzSfbV3JdI7Sa9XrcaHjykr0v6J71MUxsP3d23N
	 oikNNI9QTiPzREZDNVxTBfwIWUJqVW24wQ2scYXd85QP2wIslP9Rz7uhYPIeP0r656
	 K9bVZop8gdkQORjEJBkLV7dYk2aA0UmVDn4sPTu4/s8Q//Np16wYjMjChw0DAzYg9C
	 RXMlBlcnuqwhg==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrMIsWRWlGSWpSXmKPExsViZ8ORpHvZpCf
  JYEeLlMWdn+/YHRg9zm1cwRjAGMWamZeUX5HAmnHgL1/BN/mKg7NWszQwdsp0MXJxCAk8YJRY
  enMLO4Rzhkli8uItrBDOXkaJs+veMXYxcnKwCWhI7J56mbmLkYNDREBP4uo/UZAws4CaxNGXP
  5lBbGEBC4kTDw6wg9gsAqoSN/fsYAKxeQVcJbbd3cgKYksIKEhMefieGSIuKHFy5hMWiDkSEg
  dfvGCGqFGSeHtpDyOEXSHx+vAlqLiaxNVzm5gnMPLPQtI+C0n7AkamVYxWSUWZ6RkluYmZObq
  GBga6hoamuia6RsaWeolVuol6qaW65anFJbqGeonlxXqpxcV6xZW5yTkpenmpJZsYgSGZUszy
  fgdjU99PvUOMkhxMSqK8F693JwnxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4LUy6kkSEixKTU+tS
  MvMAcYHTFqCg0dJhFdRGSjNW1yQmFucmQ6ROsVozLFzy+W9zBxXr1zZyyzEkpeflyolzntJDa
  hUAKQ0ozQPbhAsbi8xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEubdaww0hSczrwRu3yugU5i
  ATumV6AQ5pSQRISXVwNQewF/78H6zmj4fi8ucAxbpRQ7yvE9iC/b/vv12HsMmK79CD/Pn5/ZP
  WHjM68H3j3VZ+WoaF/PnfrCP/HFjwqLDEx68YLl3WnwS29PoU/Ii91aydr17+vjK1/+MthHXr
  35t62s0N//zNOJbvTZ3ayqLXtRz3r0vGQz2iy5Z4/cvWE1x3axCXcU/lhG3S73WiSue3ahU9q
  Dq2Y8jHKkn6qw2zZy7+OOFk5133+dztphlca+sW8oQuyTsofHJFs6PCtN+Le86aivLv2hmTZN
  67yK1XD7tvDcathoJ02o0Hs06/oO/PDto2/usrib26aonNszZYZu5sOPXPCfpKT9rg7nVGX5N
  NU9c1/LPn0Vq2SwlluKMREMt5qLiRAAQsYLeVgMAAA==
X-Env-Sender: leimaohui@fujitsu.com
X-Msg-Ref: server-5.tower-591.messagelabs.com!1653355731!70944!1
X-Originating-IP: [62.60.8.98]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 7624 invoked from network); 24 May 2022 01:28:51 -0000
Received: from unknown (HELO n03ukasimr03.n03.fujitsu.local) (62.60.8.98)
  by server-5.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 24 May 2022 01:28:51 -0000
Received: from n03ukasimr03.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTP id 02024B5C
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 02:28:51 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr03.n03.fujitsu.local (Postfix) with ESMTPS id EB118B55
	for <openembedded-core@lists.openembedded.org>;
 Tue, 24 May 2022 02:28:50 +0100 (BST)
Received: from localhost.localdomain (10.167.225.227) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 24 May 2022 02:28:47 +0100
From: Lei Maohui <leimaohui@fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
CC: Lei Maohui <leimaohui@fujitsu.com>
Subject: [OE-core] [PATCH v4] gnutls: Added fips option.
Date: Tue, 24 May 2022 09:28:35 +0800
Message-ID: <1653355715-22875-1-git-send-email-leimaohui@fujitsu.com>
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
 <openembedded-core@lists.openembedded.org>; Tue, 24 May 2022 01:29:03 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/166043

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
+Upstream-Status: Submitted [https://gitlab.com/gnutls/gnutls/-/issues/1373]
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


