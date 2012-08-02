Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwymI-0006J6-Hh
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 19:01:38 +0200
Received: from mail-we0-f180.google.com ([74.125.82.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 02 Aug 2012 09:49:57 -0700
Received: by weyt11 with SMTP id t11so5421622wey.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 09:49:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=eKF0wkbjsjMdG1igKdHoMMiNKKkqrgdeo1x88+DxVzQ=;
	b=J1bG/9V+ZH9TLIauSDdtGqxhjqi5DSSdODjquG6PBudazQrFpazvaZwtvPhOkxMbKl
	8cPduldunkDhZE1+bmfvFfvAaAy+lPGJuz9xnWwR+TUpppqjvPyZlvz2wKbEtCBAVYWV
	Jtj/bms6rbdIGIRvvBA8T97KrWUmdrasH1nMJWIswa9yyqwEXdKF8zwJyVtUMAhml89u
	fSzgP1gt6mH4rrTsAxEdzpoYBHbkWSr5q+h2D8J6X5Tad7gqAg6sfr7vZ2w7gJyK6ymt
	6ZVSblSbPxd2Bs3r76bDoc3Z5zqBXd9UWxNs1hjH+ltn2kyMiYldYYbzKtNlmSxnlEH9
	mGfg==
Received: by 10.180.107.2 with SMTP id gy2mr6203792wib.2.1343926194390;
	Thu, 02 Aug 2012 09:49:54 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id z11sm18460713wiv.10.2012.08.02.09.49.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 02 Aug 2012 09:49:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  2 Aug 2012 17:48:57 +0100
Message-Id: <138358cbd3a01c8f78a39bc2ef1a0dcee2d4bec2.1343926021.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
In-Reply-To: <cover.1343926021.git.ross.burton@intel.com>
References: <cover.1343926021.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQn5pYWrlGBjq1vxnSbub4wKer4cPRamD1GYNiyAb12xAhWnjB/Zzc2xGG6+M70Uswb3lrCt
Subject: [PATCH V3 03/11] mesa: move glu.pc to libglu-dev
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
X-List-Received-Date: Thu, 02 Aug 2012 17:01:38 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/mesa/mesa-common.inc |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/mesa/mesa-common.inc b/meta/recipes-graphics/mesa/mesa-common.inc
index da628b3..e508b6d 100644
--- a/meta/recipes-graphics/mesa/mesa-common.inc
+++ b/meta/recipes-graphics/mesa/mesa-common.inc
@@ -52,7 +52,7 @@ FILES_libosmesa = "${libdir}/libOSMesa.so.*"
 
 FILES_libegl-dev = "${libdir}/libEGL.* ${includedir}/EGL"
 FILES_libgl-dev = "${libdir}/libGL.* ${includedir}/GL ${libdir}/pkgconfig/gl.pc"
-FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h"
+FILES_libglu-dev = "${libdir}/libGLU.* ${includedir}/GL/glu*.h ${libdir}/pkgconfig/glu.pc"
 FILES_libosmesa-dev = "${libdir}/libOSMesa.* ${includedir}/osmesa.h"
 
 FILES_${PN}-dbg += "${libdir}/dri/.debug/*"
-- 
1.7.10



