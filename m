Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwYHI-0004qR-Rd
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 14:43:53 +0200
Received: from mail-wi0-f178.google.com ([209.85.212.178])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 05:31:55 -0700
Received: by wibhr14 with SMTP id hr14so3065627wib.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 05:31:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=72lD5AEi+IZhIhoPKNqLzeyxncgcK+WuQHZ5ALRoJkk=;
	b=FN+TKLbvOc/CFVRz5Jik3isw957aRFWXzuy35VPwhTvDsPlWgdCmN8OtfclKHbe6ol
	kyNw7cTefUrw6cxXDvznOm+xDo7fH46rpUounFc4zqKqsllBKGHBHMy2h9p1kO/mH6nX
	+9QZBaWTSAmWSytlQAEaXNz4M4dBJqbqWUUMS3vAqAh3QDkYVk8V6g0jn4gcStyH+IEI
	mYx88VNN+k0GiDc/7GC8E/sQTdRPxSmHMhRk+Dq9Gy5lkiIoOD5+YnXVjTGjJYbOoIuU
	n7LXo4DkN0ZFMuqC+RUBkz+l47j7hXz3pBHahMBj8qLYyI3OmbdFmpYFj1NAsXbemoRr
	8BPA==
Received: by 10.180.86.226 with SMTP id s2mr16194120wiz.9.1343824313690;
	Wed, 01 Aug 2012 05:31:53 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm8444981wid.1.2012.08.01.05.31.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 01 Aug 2012 05:31:53 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  1 Aug 2012 13:31:08 +0100
Message-Id: <5f931c6e5e89bad9d6bf1f8563b27db449d6d24b.1343823907.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
In-Reply-To: <cover.1343823907.git.ross.burton@intel.com>
References: <cover.1343823907.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnWaQ8yPNzLiMijX9AjrKwJIwfBEjMNltAfpDuYslRKEfFSAKEQf79lt34/6XaZL/UaKvEN
Subject: [PATCH 02/12] mesa: move glu.pc to libglu-dev
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
X-List-Received-Date: Wed, 01 Aug 2012 12:43:54 -0000


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



