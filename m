Return-Path: <maxin.john@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 876E2731CB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 08:20:28 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by fmsmga101.fm.intel.com with ESMTP; 04 May 2016 01:20:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,576,1455004800"; d="scan'208";a="96881380"
Received: from linux.intel.com ([10.23.219.25])
	by fmsmga004.fm.intel.com with ESMTP; 04 May 2016 01:20:28 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 299326A4007
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 May 2016 02:08:02 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 May 2016 11:20:17 +0300
Message-Id: <1462350024-29932-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
References: <1462350024-29932-1-git-send-email-maxin.john@intel.com>
Subject: [PATCH 03/10] pkgconfig: update to version 0.29.1
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
X-List-Received-Date: Wed, 04 May 2016 08:20:29 -0000

87152c0  : Update to 0.29.1
753f0ba  : glib: Fix OSX build with internal glib
5164b9d  : Revert "Quote pc_path virtual variable"
a3e58e7  : check: More thoroughly test variable usage
1c564a3  : Only unquote --variable when it appears quoted
e6d33fb  : Revert "Unquote values of requested variables"
8d19fad  : Also match -Wl,-framework for OSX framework
ae0a8b1  : Allow overriding package variables with env vars
9ef2d34  : Pass key into parse_package_key so it can be set early
52baea8  : README.win32: Add info on building with MSVC
5f70074  : build: Add NMake makefiles for Visual Studio builds
1ed3367  : build: Add a pre-configure config.h template for MSVC builds
56061ef  : build: Split Out Source Listing
dd57ff3  : pkg.c: Port from dirent to GDir

Signed-off-by: Maxin B. John <maxin.john@intel.com>
---
 meta/recipes-devtools/pkgconfig/pkgconfig_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
index d34f608..d7634e3 100644
--- a/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
+++ b/meta/recipes-devtools/pkgconfig/pkgconfig_git.bb
@@ -12,8 +12,8 @@ DEPENDS = "glib-2.0"
 DEPENDS_class-native = ""
 DEPENDS_class-nativesdk = ""
 
-SRCREV = "5914edfe9604abfedd220103cbac382fc4d268bb"
-PV = "0.29+git${SRCPV}"
+SRCREV = "87152c05be88ca8be71a3a563f275b3686d32c28"
+PV = "0.29.1+git${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/pkg-config \
            file://pkg-config-native.in \
-- 
2.4.0


