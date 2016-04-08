Return-Path: <Rongqing.Li@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A4B2B73285
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Apr 2016 06:42:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u386gqvK024036
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 7 Apr 2016 23:42:53 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 7 Apr 2016 23:42:51 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 8 Apr 2016 14:36:29 +0800
Message-ID: <1460097389-31309-1-git-send-email-rongqing.li@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH] curl: add krb5 to PACKAGECONFIG
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
X-List-Received-Date: Fri, 08 Apr 2016 06:42:52 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

Signed-off-by: Roy Li <rongqing.li@windriver.com>
---
 meta/recipes-support/curl/curl_7.44.0.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta/recipes-support/curl/curl_7.44.0.bb b/meta/recipes-support/curl/curl_7.44.0.bb
index 84894eb..856f002 100644
--- a/meta/recipes-support/curl/curl_7.44.0.bb
+++ b/meta/recipes-support/curl/curl_7.44.0.bb
@@ -32,6 +32,11 @@ PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
 PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,"
+PACKAGECONFIG[krb5] = "--with-gssapi-libdir=${STAGING_LIBDIR}/ \
+                       --with-gssapi-includes=${STAGING_INCDIR}/gssapi/, \
+                       --without-gssapi,krb5"
+
+export KRB5CONFIG="${STAGING_BINDIR_CROSS}/krb5-config"
 
 EXTRA_OECONF = "--without-libidn \
                 --enable-crypto-auth \
-- 
1.9.1


