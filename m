Received: from mail-pa0-f53.google.com ([209.85.220.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U57wi-0001SB-WC
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 05:58:21 +0100
Received: by mail-pa0-f53.google.com with SMTP id bg4so3400284pad.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Feb 2013 20:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer;
	bh=k3KCdO8yqUtXKmkFmPfwJTjJIRiJVoPOtCDxgqmNtVw=;
	b=AHXY6CkKQKJzq9RFPhA3yj8/44kLexvuaBTtkEy/+dXUGVW2So5s9I1xZ/swPV0Gxz
	QozrOR4sKaIloPwe+jy4ii/R8TRgQ4YVO49H9VtCNO5yPWwVMsgFPSxnojYAiuyLTNSg
	F5BdttMt0oj4nk6J1riOgc7x+f+X1ttgaj83q0wN+mUkPWEJ/FEyJQlJIVfYA1eftMOI
	VrHV+4M7/rhm3fCjXcAglAJ2caWR1O30zqWHbL+EQ6UHwLSwNF/X095AZnk7e3lfbzmu
	7wyTmj68/QntxTQDOV6QZ33eik4IW8U2a1BwiQWQc1ONsBVln0yjLzOCOycW7LMLhC31
	VgVQ==
X-Received: by 10.66.79.135 with SMTP id j7mr48455415pax.0.1360644141242;
	Mon, 11 Feb 2013 20:42:21 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id d8sm71729429pax.23.2013.02.11.20.42.18
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 11 Feb 2013 20:42:19 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 12 Feb 2013 05:42:12 +0100
Message-Id: <1360644132-21484-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
Subject: [PATCH] zip: explictly disable bzip2 support
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
X-List-Received-Date: Tue, 12 Feb 2013 04:58:23 -0000

* we don't depends on bzip2, so make sure it's not autodetected in
  sysroot

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-extended/zip/zip.inc | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-extended/zip/zip.inc b/meta/recipes-extended/zip/zip.inc
index 265d9a8..c73571a 100644
--- a/meta/recipes-extended/zip/zip.inc
+++ b/meta/recipes-extended/zip/zip.inc
@@ -12,9 +12,9 @@ EXTRA_OEMAKE = "'CC=${CC}' 'BIND=${CC}' 'AS=${CC} -c' 'CPP=${CPP}' \
 		'BINFLAGS=0755' 'INSTALL_D=install -d'"
 
 do_compile() {
-	oe_runmake -f unix/Makefile flags
+	oe_runmake -f unix/Makefile flags IZ_BZIP2=no_such_directory
 	sed -i 's#LFLAGS1=""#LFLAGS1="${LDFLAGS}"#' flags
-	oe_runmake -f unix/Makefile generic
+	oe_runmake -f unix/Makefile generic IZ_BZIP2=no_such_directory
 }
 
 do_install() {
-- 
1.8.1.2



