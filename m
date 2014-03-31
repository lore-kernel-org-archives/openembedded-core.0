Return-Path: <Matthieu.CRAPET@ingenico.com>
Received: from smtp1.ingenico.com (smtp1.ingenico.com [217.108.148.240])
	by mail.openembedded.org (Postfix) with ESMTP id 832806EA2F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Mar 2014 14:41:16 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="4.97,765,1389740400"; d="scan'208";a="43589514"
Received: from cosnadexc22.usr.ingenico.loc ([10.31.4.222])
	by antispam1.usr.ingenico.loc with ESMTP; 31 Mar 2014 16:41:16 +0200
Received: from COSNADEXC12.usr.ingenico.loc (10.31.4.212) by
	COSNADEXC22.usr.ingenico.loc (10.31.4.222) with Microsoft SMTP Server
	(TLS) id 14.2.318.1; Mon, 31 Mar 2014 16:41:16 +0200
Received: from u75.usr.ingenico.loc (10.23.7.75) by
	COSNADEXC12.usr.ingenico.loc (10.31.4.212) with Microsoft SMTP Server
	id 14.2.328.9; Mon, 31 Mar 2014 16:41:16 +0200
From: Matthieu Crapet <Matthieu.Crapet@ingenico.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Mar 2014 17:39:55 +0200
Message-ID: <1396280395-24687-1-git-send-email-Matthieu.Crapet@ingenico.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH] libomxil-0.9.3: fix configure unrecognised option
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
X-List-Received-Date: Mon, 31 Mar 2014 14:41:19 -0000
Content-Type: text/plain

Drop --disable-ffmpegcomponents which is deprecated since libomxil-bellagio-0.9.1
Components are external and are available separately here:
http://sourceforge.net/projects/omxil/files/components/
---
 meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
index 4a7633d..103d789 100644
--- a/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
+++ b/meta/recipes-multimedia/libomxil/libomxil_0.9.3.bb
@@ -1,11 +1,13 @@
-SUMMARY = "Bellagio OpenMAX Integration Layer"
+SUMMARY = "Bellagio OpenMAX Integration Layer (IL)"
+DESCRIPTION = "Bellagio is an opensource implementation of the Khronos OpenMAX \
+               Integration Layer API to access multimedia components."
 HOMEPAGE = "http://omxil.sourceforge.net/"
+
 LICENSE = "LGPLv2.1+"
 LICENSE_FLAGS = "commercial"
 LIC_FILES_CHKSUM = "file://COPYING;md5=ae6f0f4dbc7ac193b50f323a6ae191cb \
                     file://src/omxcore.h;beginline=1;endline=27;md5=806b1e5566c06486fe8e42b461e03a90"
 
-
 SRC_URI = "${SOURCEFORGE_MIRROR}/omxil/libomxil-bellagio-${PV}.tar.gz \
            file://configure-fix.patch \
            file://parallel-make.patch \
@@ -19,7 +21,7 @@ S = "${WORKDIR}/${BPN}-bellagio-${PV}"
 
 inherit autotools
 
-EXTRA_OECONF += "--disable-ffmpegcomponents --disable-Werror"
+EXTRA_OECONF += "--disable-doc --disable-Werror"
 
 FILES_${PN} += "${libdir}/bellagio/*${SOLIBS} \
                 ${libdir}/omxloaders/*${SOLIBS}"
-- 
1.8.5.4


