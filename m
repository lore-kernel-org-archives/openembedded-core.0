Return-Path: <alexander.kanavin@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id E1E2A6FFEA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Dec 2015 14:43:13 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 09 Dec 2015 06:43:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.20,403,1444719600"; d="scan'208";a="837661935"
Received: from kanavin-desktop.fi.intel.com ([10.237.68.161])
	by orsmga001.jf.intel.com with ESMTP; 09 Dec 2015 06:43:13 -0800
From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  9 Dec 2015 16:40:27 +0200
Message-Id: <91b12be58798efa4bcd8742b50d48077aa3ae6bd.1449671297.git.alexander.kanavin@linux.intel.com>
X-Mailer: git-send-email 2.6.2
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
In-Reply-To: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
References: <cover.1449671297.git.alexander.kanavin@linux.intel.com>
Subject: [PATCH 07/10] mirrors: replace references to archive.apache.org
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
X-List-Received-Date: Wed, 09 Dec 2015 14:43:14 -0000

archive.apache.org does not contain current releases, only historical ones,
so upstream checks aren't accurate. It's replaced with official mirrors
containing current versions.

Signed-off-by: Alexander Kanavin <alexander.kanavin@linux.intel.com>
---
 meta/classes/mirrors.bbclass | 2 +-
 meta/conf/bitbake.conf       | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index b96c071..0f98479 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -40,7 +40,7 @@ ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://ftp.tux.org/pub/sites/vic
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://gd.tuwien.ac.at/utils/admin-tools/lsof/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://sunsite.ualberta.ca/pub/Mirror/lsof/ \n \
 ftp://lsof.itap.purdue.edu/pub/tools/unix/lsof/  ftp://the.wiretapped.net/pub/security/host-security/lsof/ \n \
-http://www.apache.org/dist  http://archive.apache.org/dist \n \
+http://www.eu.apache.org/dist  http://www.us.apache.org/dist \n \
 http://downloads.sourceforge.net/watchdog/ http://fossies.org/linux/misc/ \n \
 ${SAVANNAH_GNU_MIRROR} http://download-mirror.savannah.gnu.org/releases \n \
 ${SAVANNAH_NONGNU_MIRROR} http://download-mirror.savannah.nongnu.org/releases \n \
diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 06971da..3491b12 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -567,7 +567,7 @@ BBLAYERS_FETCH_DIR ??= "${COREBASE}"
 # Download locations and utilities.
 ##################################################################
 
-APACHE_MIRROR = "http://archive.apache.org/dist"
+APACHE_MIRROR = "http://www.eu.apache.org/dist/"
 DEBIAN_MIRROR = "ftp://ftp.debian.org/debian/pool"
 GENTOO_MIRROR = "http://distfiles.gentoo.org/distfiles"
 GNOME_GIT = "git://git.gnome.org"
-- 
2.6.2


