Return-Path: <mcfrisk@kapsi.fi>
Received: from mail.kapsi.fi (mail.kapsi.fi [91.232.154.25])
	by mail.openembedded.org (Postfix) with ESMTP id 259377D960
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Apr 2019 16:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=kapsi.fi;
	s=20161220; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=w0VR48rOcSrwovtVNGGzGQmx4yxEnO/F32xCavXPPHg=;
	b=yJtZHUbu4f69kchoc3VaMw/9AI
	nWqh8cDde/ECS8YaxYv4UXGQWR/BfiGyKUnA0CEBeF1JTYOeNZitkKUSooTCiTOtYDtS7FVkJSs1I
	A0VsS4lpCe6zTPDli9VdA8cof734/lzGqty5lXLQ2wBwqz5bljC0/3+hydImTAkfWdiwdldmS650s
	r/pXLzCxTr8hEnUaB6qr6vAOp9HNmLOc5XugDVqsMsZlt3FG97dLXByEMijxzXi0O14VoxyATmJMU
	IBce6YLgN2EFIRWhv4S0JhdTxHEyW/yckQ6ikUP9o9sch339vH706IwD7IUYjWCyi++IGPS/v6Emo
	Vhj0MmQg==;
Received: from kapsi.fi ([91.232.154.11] helo=lakka.kapsi.fi)
	by mail.kapsi.fi with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
	(Exim 4.89) (envelope-from <mcfrisk@kapsi.fi>)
	id 1hEc8u-0006Km-Bs; Thu, 11 Apr 2019 19:01:36 +0300
Received: from mcfrisk by lakka.kapsi.fi with local (Exim 4.84_2)
	(envelope-from <mcfrisk@lakka.kapsi.fi>)
	id 1hEc8k-00071b-7M; Thu, 11 Apr 2019 19:01:26 +0300
From: Mikko Rapeli <mikko.rapeli@bmw.de>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Apr 2019 19:01:23 +0300
Message-Id: <1554998483-26536-1-git-send-email-mikko.rapeli@bmw.de>
X-Mailer: git-send-email 2.1.4
X-SA-Exim-Connect-IP: 91.232.154.11
X-SA-Exim-Mail-From: mcfrisk@kapsi.fi
X-SA-Exim-Scanned: No (on mail.kapsi.fi); SAEximRunCond expanded to false
Subject: [PATCH] elfutils: remove Elfutils-Exception and include GPLv2 for shared libraries
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
X-List-Received-Date: Thu, 11 Apr 2019 16:01:37 -0000

Elfutils-Exception no longer exists after upstream release 0.154
and commit:

commit de2ed97f33139af5c7a0811e4ec66fc896a13cf2
Author: Mark Wielaard <mjw@redhat.com>
Date:   Tue Jun 5 17:15:16 2012 +0200

NEWS file in the sources says this about switch from GPLv2 to
GPLv3 license:

https://sourceware.org/git/?p=elfutils.git;a=blob;f=NEWS;h=5a06047f255e3c9a63828953759fd18a4ba9a3f3;hb=HEAD#l362

 362 The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
 363 programs. There is now also a formal CONTRIBUTING document describing how to
 364 submit patches.

libasm, libdw and libelf are thus covered optionally by GPLv2 license.

See also Debian copyright summary for elfutils:

https://tracker.debian.org/media/packages/e/elfutils/copyright-0.176-1

Signed-off-by: Mikko Rapeli <mikko.rapeli@bmw.de>
---
 meta/conf/licenses.conf                          |  2 +-
 meta/files/common-licenses/Elfutils-Exception    | 12 ------------
 meta/recipes-devtools/elfutils/elfutils_0.176.bb | 14 +++++++++++++-
 3 files changed, 14 insertions(+), 14 deletions(-)
 delete mode 100644 meta/files/common-licenses/Elfutils-Exception

v1: http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281124.html

v2: http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281127.html
 * removed Elfutils-Exception

v3: http://lists.openembedded.org/pipermail/openembedded-core/2019-April/281137.html
 * rebase to latest master branch with elfutils 0.176

v4:
 * fixed typo in comment; GPLv3+ -> LGPLv3+
 * update commit message Debian copyright URL to same 0.176 version

diff --git a/meta/conf/licenses.conf b/meta/conf/licenses.conf
index 1058084..7b01c57 100644
--- a/meta/conf/licenses.conf
+++ b/meta/conf/licenses.conf
@@ -16,7 +16,7 @@ SRC_DISTRIBUTE_LICENSES += "CC-BY-SA-1.0 CC-BY-SA-2.0 CC-BY-SA-2.5 CC-BY-SA-3.0
 SRC_DISTRIBUTE_LICENSES += "CDDL-1.0 CECILL-1.0 CECILL-2.0 CECILL-B CECILL-C"
 SRC_DISTRIBUTE_LICENSES += "ClArtistic CPAL-1.0 CPL-1.0 CUA-OPL-1.0 DSSSL"
 SRC_DISTRIBUTE_LICENSES += "ECL-1.0 ECL-2.0 eCos-2.0 EDL-1.0 EFL-1.0 EFL-2.0"
-SRC_DISTRIBUTE_LICENSES += "Elfutils-Exception Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
+SRC_DISTRIBUTE_LICENSES += "Entessa EPL-1.0 EPL-2.0 ErlPL-1.1"
 SRC_DISTRIBUTE_LICENSES += "EUDatagrid EUPL-1.0 EUPL-1.1 Fair Frameworx-1.0"
 SRC_DISTRIBUTE_LICENSES += "FreeType GFDL-1.1 GFDL-1.2 GFDL-1.3 GPL-1.0"
 SRC_DISTRIBUTE_LICENSES += "GPL-2.0 GPL-2.0-with-autoconf-exception"
diff --git a/meta/files/common-licenses/Elfutils-Exception b/meta/files/common-licenses/Elfutils-Exception
deleted file mode 100644
index 627d769..0000000
--- a/meta/files/common-licenses/Elfutils-Exception
+++ /dev/null
@@ -1,12 +0,0 @@
-   This file describes the limits of the Exception under which you are allowed
-   to distribute Non-GPL Code in linked combination with Red Hat elfutils.
-   For the full text of the license, please see one of the header files
-   included with the source distribution or the file COPYING found in the
-   top level directory of the source.
-
-   The Approved Interfaces are the functions declared in the files:
-
-   libelf.h
-   libdw.h
-   libdwfl.h
-
diff --git a/meta/recipes-devtools/elfutils/elfutils_0.176.bb b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
index fd901c9..4602544 100644
--- a/meta/recipes-devtools/elfutils/elfutils_0.176.bb
+++ b/meta/recipes-devtools/elfutils/elfutils_0.176.bb
@@ -1,7 +1,7 @@
 SUMMARY = "Utilities and libraries for handling compiled object files"
 HOMEPAGE = "https://sourceware.org/elfutils"
 SECTION = "base"
-LICENSE = "(GPLv3 & Elfutils-Exception)"
+LICENSE = "GPLv2 & LGPLv3+ & GPLv3+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 DEPENDS = "libtool bzip2 zlib virtual/libintl"
 DEPENDS_append_libc-musl = " argp-standalone fts "
@@ -53,6 +53,18 @@ BBCLASSEXTEND = "native nativesdk"
 
 # Package utilities separately
 PACKAGES =+ "${PN}-binutils libelf libasm libdw"
+
+# shared libraries are licensed GPLv2 or LGPLv3+, binaries GPLv3+
+# according to NEWS file:
+# "The license is now GPLv2/LGPLv3+ for the libraries and GPLv3+ for stand-alone
+# programs. There is now also a formal CONTRIBUTING document describing how to
+# submit patches."
+LICENSE_${PN}-binutils = "GPLv3+"
+LICENSE_${PN} = "GPLv3+"
+LICENSE_libelf = "GPLv2 | LGPLv3+"
+LICENSE_libasm = "GPLv2 | LGPLv3+"
+LICENSE_libdw = "GPLv2 | LGPLv3+"
+
 FILES_${PN}-binutils = "\
     ${bindir}/eu-addr2line \
     ${bindir}/eu-ld \
-- 
1.9.1


