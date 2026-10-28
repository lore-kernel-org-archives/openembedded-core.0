Received: from mailrelay-egress16.pub.mailoutpod3-cph3.one.com (mailrelay-egress16.pub.mailoutpod3-cph3.one.com [46.30.212.3])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39083.1793179965583826609
 for <openembedded-core@lists.openembedded.org>;
 Wed, 28 Oct 2026 02:32:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@embetrix.com header.s=rsa1 header.b=SAAMiRJN;
 dkim=pass header.i=@embetrix.com header.s=ed1 header.b=HHGvWWCl;
 spf=none, err=permanent DNS error (domain: embetrix.com, ip: 46.30.212.3, mailfrom: ayoub.zaki@embetrix.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1793179963; x=1793784763;
	d=embetrix.com; s=rsa1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=HjIvqNMOUyBVFU3g9HSHv7+kxgKxMmxajd4uwzy7kBg=;
	b=SAAMiRJN1owdYnf8kJ2756sRCSFK14fQVykBe362o9NFTB9lnQbcuEMY7KSbDnQYNGoa2CMYfEj8V
	 wIbFKvGX74e2x4laBPrtwHCTYNrAgT9iidnt88NSRM4Rczi6QFdtiPChMJIZjIG5UVegdo2LJTViaM
	 ortePouN6pPwiJfV2Z6OCBRgfbYjSLQRv29TFST4ITAt4cYE69tWTOWDyjPEWX61SP1Voljlhc6nmE
	 OhMIdjRVR/th9aYlktNIVTqdAHPV0dzj+HKpe3WOqf/EMPs9lHAPiWdfqYByRx5xQj4gIEqFf22nxJ
	 XoCRHSnLYiWxKEJy0tApEWT2a8nGfTA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1793179963; x=1793784763;
	d=embetrix.com; s=ed1;
	h=content-transfer-encoding:mime-version:message-id:date:subject:cc:to:from:
	 from;
	bh=HjIvqNMOUyBVFU3g9HSHv7+kxgKxMmxajd4uwzy7kBg=;
	b=HHGvWWClvecgI2Y8HM1mCYBOoAHQyb60CUW/M7ps1+Zi1l1LmkA1rJRnVsWd3m1TaLyi3fCtQNaCK
	 ZXbOVnJCw==
X-HalOne-ID: 857ae036-d2b2-11f1-a3d0-154560f4cd7b
Received: from xps-13.fritz.box (dynamic-2a02-3102-8c10-1ae0-c98b-5300-3c35-71e4.310.pool.telefonica.de [2a02:3102:8c10:1ae0:c98b:5300:3c35:71e4])
	by mailrelay5.pub.mailoutpod3-cph3.one.com (Halon) with ESMTPSA
	id 857ae036-d2b2-11f1-a3d0-154560f4cd7b;
	Wed, 28 Oct 2026 09:32:42 +0000 (UTC)
From: "Ayoub Zaki" <ayoub.zaki@embetrix.com>
To: openembedded-core@lists.openembedded.org
Cc: Ayoub Zaki <ayoub.zaki@embetrix.com>
Subject: [RFC PATCH v2] pkcs11-provider: import version 1.3.0 from meta-oe
Date: Wed, 28 Oct 2026 10:32:40 +0100
Message-ID: <20261028093240.345039-1-ayoub.zaki@embetrix.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 28 Oct 2026 09:49:52 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248803
Content-Type: text/plain; charset="utf-8"

OpenSSL 4.x removed the ENGINE API. Add pkcs11-provider to OE-Core
to support token-backed keys for target applications and native signing
tools without requiring meta-oe. Token drivers and provider activation
remain product-specific.

Imported from meta-oe/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb

Signed-off-by: Ayoub Zaki <ayoub.zaki@embetrix.com>
---
 meta/conf/distro/include/maintainers.inc      |  1 +
 .../pkcs11-provider/pkcs11-provider_1.3.0.bb  | 21 +++++++++++++++++++
 2 files changed, 22 insertions(+)
 create mode 100644 meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb

diff --git a/meta/conf/distro/include/maintainers.inc b/meta/conf/distro/include/maintainers.inc
index 74db3e44e9..10cf20a885 100644
--- a/meta/conf/distro/include/maintainers.inc
+++ b/meta/conf/distro/include/maintainers.inc
@@ -604,6 +604,7 @@ RECIPE_MAINTAINER:pn-piglit = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pigz = "Kris Gavvala <kris.gavvala@windriver.com>"
 RECIPE_MAINTAINER:pn-pinentry = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pixman = "Unassigned <unassigned@yoctoproject.org>"
+RECIPE_MAINTAINER:pn-pkcs11-provider = "Unassigned <unassigned@yoctoproject.org>"
 RECIPE_MAINTAINER:pn-pkgconf = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pm-utils = "Ross Burton <ross.burton@arm.com>"
 RECIPE_MAINTAINER:pn-pointercal-xinput = "Unassigned <unassigned@yoctoproject.org>"
diff --git a/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb b/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
new file mode 100644
index 0000000000..bd51625b8e
--- /dev/null
+++ b/meta/recipes-support/pkcs11-provider/pkcs11-provider_1.3.0.bb
@@ -0,0 +1,21 @@
+SUMMARY = "An OpenSSL provider for accessing PKCS#11 tokens"
+DESCRIPTION = "An OpenSSL provider to access hardware or software tokens through \
+the PKCS#11 Cryptographic Token Interface."
+HOMEPAGE = "https://github.com/openssl-projects/pkcs11-provider"
+BUGTRACKER = "https://github.com/openssl-projects/pkcs11-provider/issues"
+SECTION = "libs"
+LICENSE = "Apache-2.0"
+LIC_FILES_CHKSUM = "file://COPYING;md5=b53b787444a60266932bd270d1cf2d45"
+
+DEPENDS = "openssl p11-kit"
+
+SRC_URI = "git://github.com/openssl-projects/${BPN}.git;branch=main;protocol=https;tag=v${PV}"
+SRCREV = "b55b94344af87a058fd84d6e15390760a5585b1d"
+
+CVE_PRODUCT = "latchset:pkcs11-provider"
+
+inherit meson pkgconfig
+
+FILES:${PN} += "${libdir}/ossl-modules/pkcs11.so"
+
+BBCLASSEXTEND = "native"
-- 
2.53.0

