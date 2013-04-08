Received: from mail-wg0-f47.google.com ([74.125.82.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1UPANe-0003vt-MN
	for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 13:36:59 +0200
Received: by mail-wg0-f47.google.com with SMTP id y10so5489563wgg.26
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Apr 2013 04:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=briBzlK/2Nac2eD8BfmII7ceCre4PcMcowarkN+N3/8=;
	b=WB1UXxYRwxzeGolo5IiVAA/RJRHqidioaosFGEnXaMBylhgKKWRFLP2BS1o+xYIya7
	FDJ3T6xsgVIo+v6hx1fkM+mXG+I30d9xzyoYZmG0IlN/NnKrMpRCGj53tjVEbRqvW+y3
	Qhd6sxaEWtYEFGTE9Lc4uZKwwF6VBJKIOCH8zI7NeUarFqOPREtXC/9RBrVpFzV+XRDS
	/huI2UsjCSd6SRyFLASmAmV62yVNFdfPkmscZBDVTF2roCpol8kWupMjXYazxyNhQsH3
	1sbWIJhi7U9v9whYeHi2mgEbxmStNvRojcKQMJevI8Oa/QdklBgBBUA3/Y7ckcvdU16U
	2l8g==
X-Received: by 10.194.23.105 with SMTP id l9mr8835675wjf.41.1365419980036;
	Mon, 08 Apr 2013 04:19:40 -0700 (PDT)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id fv2sm21461174wib.6.2013.04.08.04.19.39
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 08 Apr 2013 04:19:39 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  8 Apr 2013 13:19:40 +0200
Message-Id: <1365419980-19384-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.5
Subject: [PATCH] tinylogin: Fix mix of tabs and spaces for SRC_URI indentation
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
X-List-Received-Date: Mon, 08 Apr 2013 11:37:01 -0000

---
 meta/recipes-core/tinylogin/tinylogin_1.4.bb | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/meta/recipes-core/tinylogin/tinylogin_1.4.bb b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
index 6e08011..d1da0e2 100644
--- a/meta/recipes-core/tinylogin/tinylogin_1.4.bb
+++ b/meta/recipes-core/tinylogin/tinylogin_1.4.bb
@@ -12,13 +12,13 @@ PR = "r9"
 inherit update-alternatives
 
 SRC_URI = "http://www.angstrom-distribution.org/unstable/sources/tinylogin-${PV}.tar.bz2 \
-	file://cvs-20040608.patch \
-	file://add-system.patch \
-	file://adduser-empty_pwd.patch \
-	file://remove-index.patch \
-	file://use_O2_option.patch \
-	file://passwd_rotate_check.patch \
-	file://avoid_static.patch \
+        file://cvs-20040608.patch \
+        file://add-system.patch \
+        file://adduser-empty_pwd.patch \
+        file://remove-index.patch \
+        file://use_O2_option.patch \
+        file://passwd_rotate_check.patch \
+        file://avoid_static.patch \
         file://glibc_crypt_fix.patch \
         "
 
-- 
1.8.1.5



