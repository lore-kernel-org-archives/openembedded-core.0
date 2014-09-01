Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f53.google.com (mail-pa0-f53.google.com
	[209.85.220.53])
	by mail.openembedded.org (Postfix) with ESMTP id 5E12F6FCE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  1 Sep 2014 05:23:02 +0000 (UTC)
Received: by mail-pa0-f53.google.com with SMTP id fa1so11412023pad.12
	for <openembedded-core@lists.openembedded.org>;
	Sun, 31 Aug 2014 22:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=ss5pgRe6TGD9zgwwgcnp8dkh8vVxJGI0FJh79d9hdtE=;
	b=OKDAFXsgrTJni8V5wX/0SAzeNMNxdYKIBRwuZAsqCx4Gw+2X64/Ty/gpR7EMeDZgDZ
	nrBstR3QbuVvlvzirGCqw0/OsZ0yTySQB/F5GR1TbVsgKm6YFpkkk0hrAM0DzM5VPysf
	E0MrN4tigeP7SeqcTxRgP+XCww+oO0NE7lEWrdd6+YYabgrnuf3pcwZc7MkcI+liqAnw
	QpKcgIvamQhocskXm24uqrDnUECD9v+WLUb6DPbKsyAq22iizchPQNRCjKrFz/jxmrwg
	Sj8KhzIWrW0lynPHP7WTcnbXEkkq+sQ9BFWryMegYWPLgjXAKeBr82f9v/Gm+9DIQgoq
	ppMg==
X-Received: by 10.68.213.6 with SMTP id no6mr25613312pbc.53.1409548983115;
	Sun, 31 Aug 2014 22:23:03 -0700 (PDT)
Received: from Pahoa2.hsd1.ca.comcast.net (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by mx.google.com with ESMTPSA id st7sm24171745pab.7.2014.08.31.22.23.01
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 31 Aug 2014 22:23:02 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 31 Aug 2014 22:22:58 -0700
Message-Id: <1409548978-29327-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] lz4: update to version 122
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
X-List-Received-Date: Mon, 01 Sep 2014 05:23:04 -0000

Makefile md5sum changed its is where they bump the version.

r122 fixes:
Fix : AIX & AIX64 support (SamG)
Fix : mips 64-bits support (lew van)
Added : Examples directory, using code examples from Takayuki Matsuoka
Updated : Framing specification, to v1.4.1
Updated : xxHash, to r36

r121 fixes:
Fix : make install for OS-X and BSD, thanks to Takayuki Matsuoka
Added : make install for kFreeBSD and Hurd (Nobuhiro Iwamatsu)
Fix : LZ4 HC streaming bug

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-support/lz4/lz4_svn.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-support/lz4/lz4_svn.bb b/meta/recipes-support/lz4/lz4_svn.bb
index adbe098..bbd5d93 100644
--- a/meta/recipes-support/lz4/lz4_svn.bb
+++ b/meta/recipes-support/lz4/lz4_svn.bb
@@ -3,10 +3,10 @@ DESCRIPTION = "LZ4 is a very fast lossless compression algorithm, providing comp
 
 LICENSE = "BSD"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=0b0d063f37a4477b54af2459477dcafd \
-                    file://Makefile;md5=ca9db31c873dc45240e2792a866ab0b5"
+                    file://Makefile;md5=68938168b5cee826476a13e1b8d1f480"
 
 # Upstream names releases after SVN revs
-SRCREV = "120"
+SRCREV = "122"
 PV = "r${SRCREV}"
 
 SRC_URI = "svn://lz4.googlecode.com/svn/;module=trunk;protocol=http"
-- 
1.9.1


