Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tijxs-0003DO-2A
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Dec 2012 11:55:03 +0100
Received: from mail-bk0-f69.google.com ([209.85.214.69])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 12 Dec 2012 02:39:35 -0800
Received: by mail-bk0-f69.google.com with SMTP id jg9so404504bkc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2012 02:40:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=YLK3YJ50wQkCY17m3l+aziWPAGnsrCmCRrd0bIV+KzU=;
	b=RPRyd+BhfElTD3gn+eAP1d+k7IUbCbnnZYLUNCud8NUGoNKgxFuqVW/xARzIuKBghS
	lhB3V2F0dzegfqflvpDhE4FLvPlH1HpxZtGUbOOvTpgbSn8xZWagYJDmxLzhOpCKJdmU
	LRIDdXlIuiquBpcCsvurOLY0153KEkk834Bq2dh2Mi/6/b37+X79++a1w61MLuidM8HD
	MhZ8gC6ILny8gHEf/33q0nn+ls1Esb3X1BG7nNdvVz3k3K56Re7DpF3Xm82plrRZGOsj
	JhIXVAZG9HHy382hFFJBcnfJpoIWhOhbhPQI3SRjuLFEmbbmxSJwZfsSKjub3nvsqpQk
	U98Q==
Received: by 10.181.11.234 with SMTP id el10mr21995312wid.7.1355308823104;
	Wed, 12 Dec 2012 02:40:23 -0800 (PST)
Received: by 10.181.11.234 with SMTP id el10mr21995292wid.7.1355308822947;
	Wed, 12 Dec 2012 02:40:22 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id eo10sm20652130wib.9.2012.12.12.02.40.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 12 Dec 2012 02:40:21 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 12 Dec 2012 10:38:42 +0000
Message-Id: <1355308722-16075-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQm1wOG4wLcSGxfGZ2oNvs85IFgNBE9ekmp6M4VR/m2NXSwnmYklbtLssLRyaYR/rCIivR5GsnzYTc2jinrSe6XBmDnmNyPFMrRE91QATFmMYPjlJOU0YB+SVy/eG6juZ9srAR5jS99NySbHziA9I7FiJ9lXP8wKb90fYTbdrkEOYcgrs3XeUfdR5EiswDYBrN9dK6o2
Subject: [PATCH] mesa: package osmesa.pc
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
X-List-Received-Date: Wed, 12 Dec 2012 10:55:07 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index c11d402..1d3655f 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=03ccdc4c379c4289aecfb8892c546f67"
 
-INC_PR = "r7"
+INC_PR = "r8"
 PE = "2"
 
 DEPENDS = "libxml2-native makedepend-native flex-native bison-native"
@@ -98,6 +98,6 @@ FILES_libglapi-dev = "${libdir}/libglapi.*"
 FILES_libgles1-mesa-dev = "${libdir}/libGLESv1*.* ${includedir}/GLES ${libdir}/pkgconfig/glesv1*.pc"
 FILES_libgles2-mesa-dev = "${libdir}/libGLESv2.* ${includedir}/GLES2 ${libdir}/pkgconfig/glesv2.pc"
 FILES_libgles3-mesa-dev = "${includedir}/GLES3"
-FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
+FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h ${libdir}/pkgconfig/osmesa.pc"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/* ${libdir}/egl/.debug/*"
-- 
1.7.10



