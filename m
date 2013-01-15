Received: from mail-ea0-f179.google.com ([209.85.215.179])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Tv30R-00049w-Go
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Jan 2013 10:40:32 +0100
Received: by mail-ea0-f179.google.com with SMTP id i12so2033697eaa.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 01:25:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:x-gm-message-state;
	bh=lY3X9+hc0wciU8CfUNadkmFB3s0DHMBrD7FdFWVkTN8=;
	b=ozPAzwWkwQzhj4bFUfpMKaf2HA+xpi/lFFKmonDFGH3RN5AwN09DLg0ntR/aU9sGtd
	ZgCcnAdomLtMC/XOAFcKSKKNMlly4/KAdFdFugfzpKV5Ej/WIZpO7f0ICIZ72S5at2Ae
	mewqqMPhuF/qdlLra+HWRFAtrHT2mqCMF3BIoCNN9DA1E+YrDOMD393Mq+mtbTgewe3y
	rkvjboAeROsxeNgl10e/rd+8u3dK2QFzSvNau9MnRmlRbQ57mVQUknhRTwQnr/kEcbZ5
	YfN5IYhT2KvWe06QyHAU27ztPLgKDNianfwAuaRqZy235If597xvwTgAi/CIpwUAX/gy
	E7pA==
X-Received: by 10.14.221.5 with SMTP id q5mr239242725eep.33.1358241911605;
	Tue, 15 Jan 2013 01:25:11 -0800 (PST)
Received: from localhost.localdomain (ip4da2a5ae.direct-adsl.nl.
	[77.162.165.174])
	by mx.google.com with ESMTPS id f49sm24802960eep.12.2013.01.15.01.25.10
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 15 Jan 2013 01:25:10 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Jan 2013 10:24:38 +0100
Message-Id: <1358241880-3921-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.1
In-Reply-To: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
References: <1358241880-3921-1-git-send-email-koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQnGlG7FKtWej2mTejkdrer2jtUhVlsOEyKOdMBVG3mA0dBDd8yNMm0CTK5IehYM57XVOPK9
Cc: scott.a.garmin@intel.com
Subject: [for-denzil][Fedora 18 fixes][PATCH 2/4] libtasn1: Update to 2.12
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Jan 2013 09:40:33 -0000

From: Saul Wold <sgw@linux.intel.com>

Use the GUN_MIRROR correctly

Signed-off-by: Saul Wold <sgw@linux.intel.com>
---
 meta/recipes-support/gnutls/libtasn1_2.11.bb | 20 --------------------
 meta/recipes-support/gnutls/libtasn1_2.12.bb | 20 ++++++++++++++++++++
 2 files changed, 20 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-support/gnutls/libtasn1_2.11.bb
 create mode 100644 meta/recipes-support/gnutls/libtasn1_2.12.bb

diff --git a/meta/recipes-support/gnutls/libtasn1_2.11.bb b/meta/recipes-support/gnutls/libtasn1_2.11.bb
deleted file mode 100644
index 1a87fc8..0000000
--- a/meta/recipes-support/gnutls/libtasn1_2.11.bb
+++ /dev/null
@@ -1,20 +0,0 @@
-DESCRIPTION = "Library for ASN.1 and DER manipulation"
-HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
-
-LICENSE = "GPLv3+ & LGPLv2.1+"
-LICENSE_${PN}-bin = "GPLv3+"
-LICENSE_${PN} = "LGPLv2.1+"
-LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
-                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
-                    file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
-
-PR = "r0"
-
-SRC_URI = "ftp://ftp.gnu.org/gnu/libtasn1/libtasn1-${PV}.tar.gz"
-
-SRC_URI[md5sum] = "ee8076752f2afcbcd12f3dd9bc622748"
-SRC_URI[sha256sum] = "f4d43c77c12ceabf1a72911472fc8c67e43728b328dfb1b83fd519ed5d079afb"
-
-inherit autotools binconfig lib_package
-
-BBCLASSEXTEND = "native"
diff --git a/meta/recipes-support/gnutls/libtasn1_2.12.bb b/meta/recipes-support/gnutls/libtasn1_2.12.bb
new file mode 100644
index 0000000..aae409e
--- /dev/null
+++ b/meta/recipes-support/gnutls/libtasn1_2.12.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "Library for ASN.1 and DER manipulation"
+HOMEPAGE = "http://www.gnu.org/software/libtasn1/"
+
+LICENSE = "GPLv3+ & LGPLv2.1+"
+LICENSE_${PN}-bin = "GPLv3+"
+LICENSE_${PN} = "LGPLv2.1+"
+LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504 \
+                    file://COPYING.LIB;md5=4fbd65380cdd255951079008b364516c \
+                    file://README;endline=8;md5=c3803a3e8ca5ab5eb1e5912faa405351"
+
+PR = "r0"
+
+SRC_URI = "${GNU_MIRROR}/libtasn1/libtasn1-${PV}.tar.gz"
+
+SRC_URI[md5sum] = "4eba39fb962d6cf5a370267eae8ff52b"
+SRC_URI[sha256sum] = "0e257a8a01c80e464f73262e13c226e04a15165c2ad087a340f53902281a1c5d"
+
+inherit autotools binconfig lib_package
+
+BBCLASSEXTEND = "native"
-- 
1.8.1



