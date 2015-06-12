Return-Path: <lixin.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 7D14E75886
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 03:40:43 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.01,1,1399996800"; 
   d="scan'208";a="96899554"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 12 Jun 2015 11:44:57 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t5C3d953020687
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jun 2015 11:39:09 +0800
Received: from localhost.localdomain (10.167.226.85) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Fri, 12 Jun 2015 11:40:42 +0800
From: Li xin <lixin.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jun 2015 11:40:36 +0800
Message-ID: <1434080436-1650-1-git-send-email-lixin.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
X-Originating-IP: [10.167.226.85]
Subject: [PATCH] curl: Modify PACKAGECONFIG to enable openssl
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
X-List-Received-Date: Fri, 12 Jun 2015 03:40:44 -0000
Content-Type: text/plain

Enabled openssl defalutly to use https, just like Ubuntu and Red Hat do.

Signed-off-by: Li Xin <lixin.fnst@cn.fujitsu.com>
---
 meta/recipes-support/curl/curl_7.42.1.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-support/curl/curl_7.42.1.bb b/meta/recipes-support/curl/curl_7.42.1.bb
index 8b0ccb8..ce39892 100644
--- a/meta/recipes-support/curl/curl_7.42.1.bb
+++ b/meta/recipes-support/curl/curl_7.42.1.bb
@@ -19,7 +19,7 @@ SRC_URI[sha256sum] = "e2905973391ec2dfd7743a8034ad10eeb58dab8b3a297e7892a41a7999
 
 inherit autotools pkgconfig binconfig multilib_header
 
-PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} gnutls zlib"
+PACKAGECONFIG ??= "${@bb.utils.contains("DISTRO_FEATURES", "ipv6", "ipv6", "", d)} ssl zlib"
 PACKAGECONFIG_class-native = "ipv6 ssl zlib"
 PACKAGECONFIG_class-nativesdk = "ipv6 ssl zlib"
 
@@ -36,6 +36,7 @@ EXTRA_OECONF = "--without-libidn \
                 --disable-ldap \
                 --disable-ldaps \
                 --with-ca-bundle=${sysconfdir}/ssl/certs/ca-certificates.crt \
+                --with-libssh2 \
 "
 # see https://lists.yoctoproject.org/pipermail/poky/2013-December/009435.html
 # We should ideally drop ac_cv_sizeof_off_t from site files but until then
-- 
1.8.4.2


