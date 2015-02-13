Return-Path: <armccurdy@gmail.com>
Received: from mail-ie0-f173.google.com (mail-ie0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id CAEF665CF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 23:23:25 +0000 (UTC)
Received: by iebtr6 with SMTP id tr6so12535091ieb.7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Feb 2015 15:23:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=4c/ZZxCTQNcbpuKuBKqnHB2LETe5SJPmeL+t3j0EFus=;
	b=p1CVmNEu0e7GfVER1XUgUdhFp/qwDR9EMOq9SUEkWlCv5l4/YT6vAR2P7ZWLNj+alV
	If2m0SGRH/gDY8hoMtLZ85Qk2vZfSrzgt6pTTHhTToMrqgtRp1VZ8AR3P0HbjTg0Ko6p
	60IS1mHlUZclb2HvaSNKXaapIPGcvNiIjQL43/OJ0/M173Wk/SOq1uMUtGqzcu0q8B7q
	mVnhVhXTddN6TT1r22RlCHaR04wG2rwpf8MI0/bHEH44nzymjLNnu/LO0//lgW+7jQtF
	EJY4hqnC0pAe8j392gDLUGmVI+lIJJ9bT3lXkUzjvM5p3PVlNVWizSmkBA4o2nCN3Hh/
	GZyA==
X-Received: by 10.42.198.14 with SMTP id em14mr1534829icb.32.1423869806150;
	Fri, 13 Feb 2015 15:23:26 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id w9sm4104480igl.0.2015.02.13.15.23.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Feb 2015 15:23:25 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Feb 2015 15:23:11 -0800
Message-Id: <1423869791-7417-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] neon: update 0.30.0 -> 0.30.1
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
X-List-Received-Date: Fri, 13 Feb 2015 23:23:26 -0000

pkgconfig.patch needed a minor refresh due to the following fix for
static linking using neon.pc being merged upstream:

  http://lists.manyfish.co.uk/pipermail/neon/2013-October/001568.html

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 .../neon/{neon-0.30.0 => neon}/pkgconfig.patch                | 11 ++++-------
 meta/recipes-support/neon/{neon_0.30.0.bb => neon_0.30.1.bb}  |  4 ++--
 2 files changed, 6 insertions(+), 9 deletions(-)
 rename meta/recipes-support/neon/{neon-0.30.0 => neon}/pkgconfig.patch (73%)
 rename meta/recipes-support/neon/{neon_0.30.0.bb => neon_0.30.1.bb} (84%)

diff --git a/meta/recipes-support/neon/neon-0.30.0/pkgconfig.patch b/meta/recipes-support/neon/neon/pkgconfig.patch
similarity index 73%
rename from meta/recipes-support/neon/neon-0.30.0/pkgconfig.patch
rename to meta/recipes-support/neon/neon/pkgconfig.patch
index 1a2550c..239dba8 100644
--- a/meta/recipes-support/neon/neon-0.30.0/pkgconfig.patch
+++ b/meta/recipes-support/neon/neon/pkgconfig.patch
@@ -4,15 +4,12 @@ Upstream-Status: Inappropriate [configuration]
  neon.pc.in |    2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
---- neon-0.28.1.orig/neon.pc.in
-+++ neon-0.28.1/neon.pc.in
-@@ -4,8 +4,8 @@ libdir=@libdir@
- includedir=@includedir@
- 
- Name: neon
+--- neon-0.30.1.orig/neon.pc.in
++++ neon-0.30.1/neon.pc.in
+@@ -7,5 +7,5 @@ Name: neon
  Description: HTTP/WebDAV client library
  Version: @NEON_VERSION@
+ Libs: -L${libdir} -lneon @NEON_PC_LIBS@
 -Libs.private: @NEON_LIBS@
 +Libs.private: -L${libdir} -lz -lgcrypt -lgpg-error -lexpat -lgnutls
- Libs: -L${libdir} -lneon @NEON_PC_LIBS@
  Cflags: -I${includedir}/neon @NEON_CFLAGS@
diff --git a/meta/recipes-support/neon/neon_0.30.0.bb b/meta/recipes-support/neon/neon_0.30.1.bb
similarity index 84%
rename from meta/recipes-support/neon/neon_0.30.0.bb
rename to meta/recipes-support/neon/neon_0.30.1.bb
index 61bd7d9..9245244 100644
--- a/meta/recipes-support/neon/neon_0.30.0.bb
+++ b/meta/recipes-support/neon/neon_0.30.1.bb
@@ -11,8 +11,8 @@ BBCLASSEXTEND = "native"
 
 SRC_URI = "http://www.webdav.org/${BPN}/${BPN}-${PV}.tar.gz \
            file://pkgconfig.patch"
-SRC_URI[md5sum] = "fb60b3a124eeec441937a812c456fd94"
-SRC_URI[sha256sum] = "2962cfcb5d30f3272e3d2fa0e473434419770a3801afe3d46e5d1650787990c2"
+SRC_URI[md5sum] = "231adebe5c2f78fded3e3df6e958878e"
+SRC_URI[sha256sum] = "00c626c0dc18d094ab374dbd9a354915bfe4776433289386ed489c2ec0845cdd"
 
 BINCONFIG = "${bindir}/neon-config"
 
-- 
1.9.1


