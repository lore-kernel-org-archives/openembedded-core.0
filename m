Return-Path: <fabrice.coulon@axis.com>
Received: from bastet.se.axis.com (bastet.se.axis.com [195.60.68.11])
	by mail.openembedded.org (Postfix) with ESMTP id A223B6FD16
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 08:22:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by bastet.se.axis.com (Postfix) with ESMTP id B9A791817A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 10:22:42 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at bastet.se.axis.com
Received: from bastet.se.axis.com ([IPv6:::ffff:127.0.0.1])
	by localhost (bastet.se.axis.com [::ffff:127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 8bcaFQzZ74fT
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 10:22:38 +0200 (CEST)
Received: from boulder.se.axis.com (boulder.se.axis.com [10.0.2.104])
	by bastet.se.axis.com (Postfix) with ESMTP id 476EC18178
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 10:22:38 +0200 (CEST)
Received: from boulder.se.axis.com (localhost [127.0.0.1])
	by postfix.imss71 (Postfix) with ESMTP id 302951041
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 10:22:38 +0200 (CEST)
Received: from thoth.se.axis.com (thoth.se.axis.com [10.0.2.173])
	by boulder.se.axis.com (Postfix) with ESMTP id 23D158B3
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Oct 2014 10:22:38 +0200 (CEST)
Received: from lnxfabrice2.se.axis.com (lnxfabrice2.se.axis.com [10.92.161.3])
	by thoth.se.axis.com (Postfix) with ESMTP id 218CA34226;
	Fri,  3 Oct 2014 10:22:38 +0200 (CEST)
Received: by lnxfabrice2.se.axis.com (Postfix, from userid 9523)
	id 5600A8009B6; Fri,  3 Oct 2014 10:21:57 +0200 (CEST)
From: Fabrice Coulon <fabrice.coulon@axis.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  3 Oct 2014 10:21:49 +0200
Message-Id: <1412324509-640-1-git-send-email-fabrice.coulon@axis.com>
X-Mailer: git-send-email 1.9.1
Cc: Fabrice Coulon <fabrice@axis.com>, Olof Johansson <olofjn@axis.com>
Subject: [PATCH] curl: add PACKAGECONFIG option to use libssh2
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
X-List-Received-Date: Fri, 03 Oct 2014 08:22:42 -0000

From: Fabrice Coulon <fabrice@axis.com>

The user can enable libssh2 via conf/local.conf or custom distro
configuration, this will pull in libssh2, which is not used by default.

For example, a curl_x.y.z.bbappend file containing the following line:
PACKAGECONFIG += "libssh2"

Signed-off-by: Fabrice Coulon <fabrice.coulon@axis.com>
Signed-off-by: Olof Johansson <olof.johansson@axis.com>
---
 meta/recipes-support/curl/curl_7.37.1.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/curl/curl_7.37.1.bb b/meta/recipes-support/curl/curl_7.37.1.bb
index e2852e3..39ded80 100644
--- a/meta/recipes-support/curl/curl_7.37.1.bb
+++ b/meta/recipes-support/curl/curl_7.37.1.bb
@@ -28,9 +28,9 @@ PACKAGECONFIG[ssl] = "--with-ssl --with-random=/dev/urandom,--without-ssl,openss
 PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
+PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
 
-EXTRA_OECONF = "--without-libssh2 \
-                --without-libidn \
+EXTRA_OECONF = "--without-libidn \
                 --enable-crypto-auth \
                 --disable-ldap \
                 --disable-ldaps \
-- 
1.9.1


