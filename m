Return-Path: <qianl.fnst@cn.fujitsu.com>
Received: from heian.cn.fujitsu.com (unknown [59.151.112.132])
	by mail.openembedded.org (Postfix) with ESMTP id CF78D725F0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 04:15:45 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.04,848,1406563200"; d="scan'208";a="56447447"
Received: from unknown (HELO edo.cn.fujitsu.com) ([10.167.33.5])
	by heian.cn.fujitsu.com with ESMTP; 22 Jan 2015 12:12:16 +0800
Received: from G08CNEXCHPEKD01.g08.fujitsu.local (localhost.localdomain
	[127.0.0.1])
	by edo.cn.fujitsu.com (8.14.3/8.13.1) with ESMTP id t0M4F6sw004065
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Jan 2015 12:15:06 +0800
Received: from Fedora.g08.fujitsu.local (10.167.226.40) by
	G08CNEXCHPEKD01.g08.fujitsu.local (10.167.33.89) with Microsoft SMTP
	Server (TLS) id 14.3.181.6; Thu, 22 Jan 2015 12:15:55 +0800
From: Qian Lei <qianl.fnst@cn.fujitsu.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Jan 2015 12:15:15 +0800
Message-ID: <1421900115-13736-1-git-send-email-qianl.fnst@cn.fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.226.40]
Subject: [PATCH] lighttpd: Enable openssl
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
X-List-Received-Date: Thu, 22 Jan 2015 04:15:55 -0000
Content-Type: text/plain

Enabled openssl defalutly to use https, just like ubuntu do.

Signed-off-by: Qian Lei <qianl.fnst@cn.fujitsu.com>
---
 meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
index 20d5c1c..b320486 100644
--- a/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
+++ b/meta/recipes-extended/lighttpd/lighttpd_1.4.35.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=e4dac5c6ab169aa212feb5028853a579"
 PR = "r1"
 
 SECTION = "net"
-DEPENDS = "zlib libpcre"
+DEPENDS = "zlib libpcre openssl"
 RDEPENDS_${PN} += " \
                lighttpd-module-access \
                lighttpd-module-accesslog \
@@ -37,7 +37,7 @@ EXTRA_OECONF = " \
              --with-pcre \
              --without-webdav-props \
              --without-webdav-locks \
-             --without-openssl \
+             --with-openssl \
              --disable-static \
 "
 
-- 
1.8.3.1


