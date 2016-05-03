Return-Path: <maxin.john@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE727317D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 14:49:50 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by fmsmga103.fm.intel.com with ESMTP; 03 May 2016 07:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.24,572,1455004800"; d="scan'208";a="696140373"
Received: from linux.intel.com ([10.23.219.25])
	by FMSMGA003.fm.intel.com with ESMTP; 03 May 2016 07:49:52 -0700
Received: from mbabyjoh-desk.fi.intel.com (mbabyjoh-desk.fi.intel.com
	[10.237.72.71])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 6B7746A4006
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 08:37:25 -0700 (PDT)
From: "Maxin B. John" <maxin.john@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  3 May 2016 17:49:42 +0300
Message-Id: <1462286989-22848-4-git-send-email-maxin.john@intel.com>
X-Mailer: git-send-email 2.4.0
In-Reply-To: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
References: <1462286989-22848-1-git-send-email-maxin.john@intel.com>
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
X-List-Received-Date: Tue, 03 May 2016 14:49:51 -0000

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


