Return-Path: <Maxin.John@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 551E47229E
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Jan 2015 13:19:29 +0000 (UTC)
Received: from sestofb10.enea.se (172.21.3.145) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 19 Jan 2015 14:19:28 +0100
Received: by sestofb10.enea.se (Postfix, from userid 4454)	id 452012800CB;
	Mon, 19 Jan 2015 14:19:28 +0100 (CET)
From: "Maxin B. John" <maxin.john@enea.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Jan 2015 14:19:08 +0100
Message-ID: <1421673548-8982-1-git-send-email-maxin.john@enea.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Received-SPF: None (SESTOEX03.enea.se: maxin.john@enea.com does not
	designate permitted sender hosts)
Cc: "Maxin B. John" <maxin.john@enea.com>
Subject: [PATCH] curl: Add PACKAGECONFIG for samba
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
X-List-Received-Date: Mon, 19 Jan 2015 13:19:34 -0000
Content-Type: text/plain

curl 7.40.0 added support for the SMB/CIFS protocol. So provide
a PACKAGECONFIG option for smb.

Reported-by: Andre McCurdy <armccurdy@gmail.com>
Signed-off-by: Maxin B. John <maxin.john@enea.com>
---
 meta/recipes-support/curl/curl_7.40.0.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/curl/curl_7.40.0.bb b/meta/recipes-support/curl/curl_7.40.0.bb
index 209ed94..d4b4ee3 100644
--- a/meta/recipes-support/curl/curl_7.40.0.bb
+++ b/meta/recipes-support/curl/curl_7.40.0.bb
@@ -29,6 +29,7 @@ PACKAGECONFIG[gnutls] = "--with-gnutls,--without-gnutls,gnutls"
 PACKAGECONFIG[zlib] = "--with-zlib=${STAGING_LIBDIR}/../,--without-zlib,zlib"
 PACKAGECONFIG[rtmpdump] = "--with-librtmp,--without-librtmp,rtmpdump"
 PACKAGECONFIG[libssh2] = "--with-libssh2,--without-libssh2,libssh2"
+PACKAGECONFIG[smb] = "--enable-smb,--disable-smb,samba"
 
 EXTRA_OECONF = "--without-libidn \
                 --enable-crypto-auth \
-- 
1.9.1


