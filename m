Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fahad.usman@gmail.com>) id 1TxKe9-00016D-Jf
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 17:54:57 +0100
Received: by mail-wg0-f44.google.com with SMTP id dr12so3883113wgb.35
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 08:39:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:sender:from:to:cc:subject:date:message-id:x-mailer;
	bh=Hl1fiKEiKzqc75K1svFUhJ56b6n6sz9UpBjLZJv6s60=;
	b=XmUVJNXQUesE4oudTtFtpG08Sj5v7U2zjp7m5nJeUtY0oBagUiQobx+ZVjPMVth9RZ
	Ux6wSHgEZzqKegupcw9BXRMqJohdNCjQbdyS+976gvXvA1Vf0FwwB3UlYZa63CTAqjrv
	DY9xJqt6t4hHB49f25F9Y1gMFvy0YRpg9rA8qpuNspxMQ17u3i3e7U9SJg+XzzVpqTqf
	2sXBnmidCH0Nvmj6pt+YiUAGYNyF1i87+Fou/Dy0M0cEud6QsZB8hbl93ivb5gluOHdz
	LABIqc1+gOI/N3HMhm7DL7+4H/NrsuDu5lXFBKSpUOj9EbMrwE/thQdE0WpuuPgcmBJ7
	oCwQ==
X-Received: by 10.180.108.236 with SMTP id hn12mr16547908wib.6.1358786368743; 
	Mon, 21 Jan 2013 08:39:28 -0800 (PST)
Received: from fahad-u1204.mgc.mentorg.com ([110.93.212.98])
	by mx.google.com with ESMTPS id ex6sm19441797wid.3.2013.01.21.08.39.26
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 21 Jan 2013 08:39:27 -0800 (PST)
Sender: Fahad Usman <fahad.usman@gmail.com>
From: Fahad Usman <fahad_usman@mentor.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 21 Jan 2013 21:39:11 +0500
Message-Id: <1358786351-20789-1-git-send-email-fahad_usman@mentor.com>
X-Mailer: git-send-email 1.7.9.5
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	Fahad Usman <fahad_usman@mentor.com>
Subject: [meta-browser][PATCH] nss: fix access to https websites
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
X-List-Received-Date: Mon, 21 Jan 2013 16:54:58 -0000

Signed-off-by: Fahad Usman <fahad_usman@mentor.com>
---
 recipes-support/nss/nss_3.13.3.bb |    4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/recipes-support/nss/nss_3.13.3.bb b/recipes-support/nss/nss_3.13.3.bb
index bb602b1..a841397 100644
--- a/recipes-support/nss/nss_3.13.3.bb
+++ b/recipes-support/nss/nss_3.13.3.bb
@@ -1,7 +1,7 @@
 DESCRIPTION = "Mozilla's SSL and TLS implementation"
 HOMEPAGE = "http://www.mozilla.org/projects/security/pki/nss/"
 
-PR = "r1"
+PR = "r2"
 
 LICENSE = "MPL1.1 GPL LGPL"
 LIC_FILES_CHKSUM = "file://security/nss/manifest.mn;md5=d71978748f23eae3156c38ac2a691924"
@@ -66,6 +66,8 @@ do_install() {
 		NS_USE_GCC=1 \
 		NSS_USE_SYSTEM_SQLITE=1 \
 		NSS_ENABLE_ECC=1 \
+		FREEBL_CHILD_BUILD=1 \ 
+		CC="${CC}" \
 		SOURCE_LIB_DIR="${TD}/${libdir}" \
 		SOURCE_BIN_DIR="${TD}/${bindir}"
 
-- 
1.7.9.5



