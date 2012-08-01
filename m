Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwbAC-0001pu-GR
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:48:44 +0200
Received: from mail-wi0-f172.google.com ([209.85.212.172])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 08:37:05 -0700
Received: by mail-wi0-f172.google.com with SMTP id hm11so3229024wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 08:37:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=2vclHh6su1bJrKWfCgo9JNirRxN3UoRF3DhFM9tcSJg=;
	b=F6FDD/h60C3NuNbCzdZMGeXmiptKjDv75E0HYRF6hrMMjks15A8wWX85ycTj7IFi0i
	pux+Ds7CaHXYANJOaHfH/btk3KStX/uStFzGM5t/SvoNR+zQ0Wq/I8Pjb+10talewDNs
	PrQs1mm5gJLu+gaUqsEnLf1dt7WhrY1gYHil8/3LvoywegieSTMvZZcHDYh2y8Siv/1c
	mlypEDYVvhAacwNtwSEpQBlVuYa7EhLjFQVUzhl0bT1uYGVtaexlUoSC8timhtHOpP1u
	xR5OjS7zTjoONy/t9f74IydRjExOd5JFc5PoJYuRx54f/W1i/VSOy5a9fCKdItDPZAT1
	Jyvg==
Received: by 10.180.100.37 with SMTP id ev5mr17491975wib.5.1343835425033;
	Wed, 01 Aug 2012 08:37:05 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm9489001wiv.10.2012.08.01.08.37.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 08:37:04 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 16:36:29 +0100
Message-Id: <036052fe81724e23e04be20a34cb1d06830b5ca3.1343835237.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
In-Reply-To: <cover.1343835237.git.ross.burton@intel.com>
References: <cover.1343835237.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkoUG0XISQ7sj8nvNHivhHW1+wtm8Hg0pFG8GAMGQcrUXfwGVGhAfxZqBkY2M/uY5A0jag+
Subject: [PATCH 02/11] mesa: move glu.pc to libglu-dev
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
X-List-Received-Date: Wed, 01 Aug 2012 15:48:44 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index 2385f9d..4aa7f5f 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -12,7 +12,7 @@ SECTION = "x11"
 LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://docs/license.html;md5=7a3373c039b6b925c427755a4f779c1d"
 
-INC_PR = "r15"
+INC_PR = "r16"
 PE = "2"
 
 
@@ -52,7 +52,7 @@ FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
+FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-- 
1.7.10



