Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T2bHZ-00020q-Tp
	for openembedded-core@lists.openembedded.org;
	Sat, 18 Aug 2012 07:09:10 +0200
Received: by daks35 with SMTP id s35so1296690dak.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 21:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=aszfrlKBIaF/STr8RtWBK9LcOtYPAapdMkwTTb/aLeI=;
	b=vhwHLcxqW9xJT7+jZyFWEqQ4fOshMunaFxE4XteCQp3HTGIxZYwyh8ykcRqXOkG2Ke
	lUxVy5S/cFLkrWHIZYnUt2PzqaNMTP43F+AxuLVpITSX33Xe4Eel8xpl/I1XiiYd8ieW
	IqtDVso1YGBz7o/2HhcIn9zGRrPctmMg8wyvVPR7OS8bFsgwo+E7RNQkzMhXYw3zy7xD
	k5jB8WCAkgkQU81Rr90XLpXFA0W3ExS1sl4vUdRQWLlSeMAh1/ZZtdau4WnPFA033yPH
	L3pOq39dUp+8BlGMU8oxzdLj+UXV6+El5iWlgO3tfJXUJVvDUKrnarjCp6GzhsSZRNII
	ELfg==
Received: by 10.68.130.37 with SMTP id ob5mr16829517pbb.62.1345265829448;
	Fri, 17 Aug 2012 21:57:09 -0700 (PDT)
Received: from agate.agate.openembedded.org (oldbuilder.nslu2-linux.org.
	[140.211.169.168])
	by mx.google.com with ESMTPS id uj3sm6266915pbc.39.2012.08.17.21.57.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 17 Aug 2012 21:57:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 Aug 2012 21:56:41 -0700
Message-Id: <1345265802-16783-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 1/2] libpam: Update recipes from 1.1.5 -> 1.1.6
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
X-List-Received-Date: Sat, 18 Aug 2012 05:09:10 -0000

Drop include-sys-resource.patch already fixed upstream
LIC_FILE_CHKSUM change is due to deletion of space in
COPYING file see
http://git.fedorahosted.org/cgit/linux-pam.git/commit/COPYING?id=1814aec611a5f9e03eceee81237ad3a3f51c954a

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../pam/libpam/include-sys-resource.patch          |   12 ------------
 .../pam/{libpam_1.1.5.bb => libpam_1.1.6.bb}       |   12 ++++--------
 2 files changed, 4 insertions(+), 20 deletions(-)
 delete mode 100644 meta/recipes-extended/pam/libpam/include-sys-resource.patch
 rename meta/recipes-extended/pam/{libpam_1.1.5.bb => libpam_1.1.6.bb} (90%)

diff --git a/meta/recipes-extended/pam/libpam/include-sys-resource.patch b/meta/recipes-extended/pam/libpam/include-sys-resource.patch
deleted file mode 100644
index 0108a88..0000000
--- a/meta/recipes-extended/pam/libpam/include-sys-resource.patch
+++ /dev/null
@@ -1,12 +0,0 @@
-Index: Linux-PAM-1.1.5/modules/pam_unix/pam_unix_acct.c
-===================================================================
---- Linux-PAM-1.1.5.orig/modules/pam_unix/pam_unix_acct.c	2012-07-04 12:37:44.881136025 -0700
-+++ Linux-PAM-1.1.5/modules/pam_unix/pam_unix_acct.c	2012-07-04 12:38:00.601136785 -0700
-@@ -47,6 +47,7 @@
- #include <time.h>		/* for time() */
- #include <errno.h>
- #include <sys/wait.h>
-+#include <sys/resource.h>
- 
- #include <security/_pam_macros.h>
- 
diff --git a/meta/recipes-extended/pam/libpam_1.1.5.bb b/meta/recipes-extended/pam/libpam_1.1.6.bb
similarity index 90%
rename from meta/recipes-extended/pam/libpam_1.1.5.bb
rename to meta/recipes-extended/pam/libpam_1.1.6.bb
index f776e76..dd03df1 100644
--- a/meta/recipes-extended/pam/libpam_1.1.5.bb
+++ b/meta/recipes-extended/pam/libpam_1.1.6.bb
@@ -7,22 +7,18 @@ SECTION = "base"
 # /etc/pam.d comes from Debian libpam-runtime in 2009-11 (at that time 
 # libpam-runtime-1.0.1 is GPLv2+), by openembedded
 LICENSE = "GPLv2+ | BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=ca0395de9a86191a078b8b79302e3083"
+LIC_FILES_CHKSUM = "file://COPYING;md5=7eb5c1bf854e8881005d673599ee74d3"
 
-PR = "r6"
-
-SRC_URI = "https://fedorahosted.org/releases/l/i/linux-pam/Linux-PAM-${PV}.tar.bz2 \
+SRC_URI = "http://linux-pam.org/library/Linux-PAM-${PV}.tar.bz2 \
            file://99_pam \
            file://pam.d/* \
            file://libpam-xtests.patch \
-           file://include-sys-resource.patch \
           "
+SRC_URI[md5sum] = "7b73e58b7ce79ffa321d408de06db2c4"
+SRC_URI[sha256sum] = "bab887d6280f47fc3963df3b95735a27a16f0f663636163ddf3acab5f1149fc2"
 
 SRC_URI_append_libc-uclibc = " file://pam-no-innetgr.patch"
 
-SRC_URI[md5sum] = "927ee5585bdec5256c75117e9348aa47"
-SRC_URI[sha256sum] = "65def4df04254dc4c5156859d36c34ad6d7afbcf3adbf2780530ebc4dbf2a116"
-
 DEPENDS = "bison flex flex-native cracklib"
 
 EXTRA_OECONF = "--with-db-uniquename=_pam \
-- 
1.7.9.5



