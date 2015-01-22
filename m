Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id 03EC0725F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 07:00:39 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56454148"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jan 2015 14:57:11 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0M60bPF010124
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 14:00:38 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 22 Jan 2015 14:01:26 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 14:01:09 +0800
Message-ID: <1421906469-15560-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1421900115-13736-1-git-send-email-qianl.fnst@cn.fujitsu.com>
References: <1421900115-13736-1-git-send-email-qianl.fnst@cn.fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH v2] lighttpd: Use PACKAGECONFIG to enable openssl
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
X-List-Received-Date: Thu, 22 Jan 2015 07:00:45 -0000
Content-Type: text/plain

Enabled openssl defalutly to use https, just like ubuntu do.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
index 20d5c1c..0cf5aa2 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
@@ -29,6 +29,9 @@ SRC_URI = "http://download.lighttpd.net/lighttpd/releases-1.4.x/lighttpd-${PV}.t
 SRC_URI[md5sum] = "f7a88130ee9984b421ad8aa80629750a"
 SRC_URI[sha256sum] = "4a71c1f6d8af41ed894b507720c4c17184dc320590013881d5170ca7f15c5bf7"
 
+PACKAGECONFIG ??= "openssl"
+PACKAGECONFIG[openssl] = "--with-openssl, --without-openssl, openssl"
+
 EXTRA_OECONF = " \
              --without-bzip2 \
              --without-ldap \
@@ -37,7 +40,6 @@ EXTRA_OECONF = " \
              --with-pcre \
              --without-webdav-props \
              --without-webdav-locks \
-             --without-openssl \
              --disable-static \
 "
 
-- 
1.8.3.1


