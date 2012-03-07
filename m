Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1S5Jna-0006uD-4c
	for openembedded-core@lists.openembedded.org;
	Wed, 07 Mar 2012 17:33:10 +0100
Received: by ggcy3 with SMTP id y3so2847461ggc.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Mar 2012 08:24:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=JS6OI0Dw4eg4I7BtSyI0AKeYOfJGvz4aJI6pA+QoBbY=;
	b=V350cCrWPlm1DW4Z2Q27zrbPd4+sIKrYgSQJVhwZJlJbjGO4KWZ+F6QM+++bHZamu8
	yi8U+LLOYcSVo331Z69tXtuTyNNilxKQECAFCIdkSWQ/cMbNBjXMTl4AFFi4F6ClvTNb
	iTE6slpiYhQ9n8+J7XmR0SfjSO89ySM/DAWSFgM2W+rE5s4jsH0OQFEKlPpweNwFU5+R
	1KqWaL3yvKlS7T+PcvVI2plVxv/V1TbR5GNVOfTMkZZ3Rqo3uQ3L7jrGmyTUgO/Yh+Z3
	ZSKgwO8AzK2VSi8MPeP7uUY4FgEwdrzA+oKv7irkpM7N3RDdMVXAc0HMP6/Sagx5glxM
	ZaRQ==
Received: by 10.236.175.36 with SMTP id y24mr5200515yhl.64.1331137471884;
	Wed, 07 Mar 2012 08:24:31 -0800 (PST)
Received: from localhost.localdomain (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPS id z27sm59374291yhh.8.2012.03.07.08.24.29
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 07 Mar 2012 08:24:30 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Mar 2012 10:24:25 -0600
Message-Id: <1331137465-24763-1-git-send-email-kergoth@gmail.com>
X-Mailer: git-send-email 1.7.7
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH] external-csl-toolchain: override PKGV, not PKGV_${PN}
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 07 Mar 2012 16:33:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

This is needed to ensure that the RDEPENDS_${PN}-dev,
RDEPENDS_${PN}-staticdev, and RRECOMMENDS_${PN}-dbg are accurate with respect
to the PKGV of the ${PN} package, and incidentally fixes an rpm packaging
issue, as rpm dislikes the recipe PV as PKGV.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-core/meta/external-csl-toolchain.bb |   17 +----------------
 1 files changed, 1 insertions(+), 16 deletions(-)

diff --git a/meta/recipes-core/meta/external-csl-toolchain.bb b/meta/recipes-core/meta/external-csl-toolchain.bb
index 07c3e30..3e820ff 100644
--- a/meta/recipes-core/meta/external-csl-toolchain.bb
+++ b/meta/recipes-core/meta/external-csl-toolchain.bb
@@ -106,22 +106,7 @@ PKG_${PN}-extra-nss = "eglibc-extra-nss"
 PKG_${PN}-thread-db = "eglibc-thread-db"
 PKG_${PN}-pcprofile = "eglibc-pcprofile"
 
-PKGV_${PN} = "${CSL_VER_LIBC}"
-PKGV_${PN}-dev = "${CSL_VER_LIBC}"
-PKGV_${PN}-staticdev = "${CSL_VER_LIBC}"
-PKGV_${PN}-doc = "${CSL_VER_LIBC}"
-PKGV_${PN}-dbg = "${CSL_VER_LIBC}"
-PKGV_${PN}-pic = "${CSL_VER_LIBC}"
-PKGV_${PN}-utils = "${CSL_VER_LIBC}"
-PKGV_${PN}-gconv = "${CSL_VER_LIBC}"
-PKGV_${PN}-extra-nss = "${CSL_VER_LIBC}"
-PKGV_${PN}-thread-db = "${CSL_VER_LIBC}"
-PKGV_${PN}-pcprofile = "${CSL_VER_LIBC}"
-PKGV_catchsegv = "${CSL_VER_LIBC}"
-PKGV_libsegfault = "${CSL_VER_LIBC}"
-PKGV_sln = "${CSL_VER_LIBC}"
-PKGV_nscd = "${CSL_VER_LIBC}"
-PKGV_ldd = "${CSL_VER_LIBC}"
+PKGV = "${CSL_VER_LIBC}"
 PKGV_libgcc = "${CSL_VER_GCC}"
 PKGV_libgcc-dev = "${CSL_VER_GCC}"
 PKGV_libstdc++ = "${CSL_VER_GCC}"
-- 
1.7.8



