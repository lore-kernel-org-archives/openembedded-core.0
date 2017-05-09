Return-Path: <maxin.john@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 92244719B7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 16:19:00 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	09 May 2017 09:19:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,315,1491289200"; d="scan'208";a="99940983"
Received: from linux.intel.com ([10.54.29.200])
	by fmsmga006.fm.intel.com with ESMTP; 09 May 2017 09:19:01 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	by linux.intel.com (Postfix) with ESMTP id 9FC5E6A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 May 2017 09:18:47 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  9 May 2017 19:19:21 +0300
Message-Id: <1494346762-7270-2-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1494346762-7270-1-git-send-email-maxin.john@intel.com>
References: <1494346762-7270-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 2/3] DEBIAN_MIRROR: switch from ftp to http
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
X-List-Received-Date: Tue, 09 May 2017 16:19:00 -0000

All public-facing debian.org FTP services will be shut down on November 1, 2017
The mirrors should just be accessed using HTTP instead.

https://www.debian.org/News/2017/20170425

Fixes [YOCTO #11413]

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/classes/mirrors.bbclass | 34 +++++++++++++++++-----------------
 meta/conf/bitbake.conf       |  4 ++--
 2 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 1174ef6..9c83463 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -2,23 +2,23 @@ MIRRORS += "\
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20120328T092752Z/debian/pool \n \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20110127T084257Z/debian/pool \n \
 ${DEBIAN_MIRROR}	http://snapshot.debian.org/archive/debian-archive/20090802T004153Z/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.de.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.au.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.cl.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.hr.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.fi.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.hk.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.hu.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.ie.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.it.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.jp.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.no.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.pl.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.ro.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.si.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.es.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.se.debian.org/debian/pool \n \
-${DEBIAN_MIRROR}	ftp://ftp.tr.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.de.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.au.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.cl.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.hr.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.fi.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.hk.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.hu.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.ie.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.it.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.jp.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.no.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.pl.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.ro.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.si.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.es.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.se.debian.org/debian/pool \n \
+${DEBIAN_MIRROR}	http://ftp.tr.debian.org/debian/pool \n \
 ${GNU_MIRROR}	ftp://mirrors.kernel.org/gnu \n \
 ${KERNELORG_MIRROR}	http://www.kernel.org/pub \n \
 ${GNUPG_MIRROR}	ftp://ftp.gnupg.org/gcrypt \n \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index a24be05..83158fd 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -600,7 +600,7 @@ BBLAYERS_FETCH_DIR ??= "${COREBASE}"
 ##################################################################
 
 APACHE_MIRROR = "http://archive.apache.org/dist"
-DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
+DEBIAN_MIRROR = "http://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://git.gnome.org"
 GNOME_MIRROR = "http://ftp.gnome.org/pub/GNOME/sources"
@@ -634,7 +634,7 @@ SRC_URI[vardepsexclude] += "\
 "
 
 # You can use the mirror of your country to get faster downloads by putting
-#  export DEBIAN_MIRROR = "ftp://ftp.de.debian.org/debian/pool"
+#  export DEBIAN_MIRROR = "http://ftp.de.debian.org/debian/pool"
 #     into your local.conf
 
 FETCHCMD_svn = "/usr/bin/env svn --non-interactive --trust-server-cert"
-- 
2.4.0


