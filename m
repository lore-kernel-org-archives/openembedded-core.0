Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SujIr-0003qv-G1
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:05:57 +0200
Received: from mail-wg0-f44.google.com ([74.125.82.44])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 04:54:05 -0700
Received: by wgbdr13 with SMTP id dr13so1834325wgb.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:54:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=7UYlVCmdhfBBfqeSOCmSyVb84++tYZEiDpC6siwY9EY=;
	b=XNWMBR103ruoXLhoh6fD/ohKaF+NVAedaAgar2CSmBkYbF/Y67Q0ZmOzMEsfs9KL4W
	5tdkNTt21lxxFzJ+n31e1SPdLcHmYOA/B8RcJaCcpHPHIRBkstXLWjZzBK53foDFNhmf
	BKF04EZ1cgU7h0HWdK4AyuJGobdXorR8crI+nI7V6cCgvvvxR0FYq6SFMny1nIG6EKOQ
	vUvzljTE2fTxqCvfJ/qB9crJs5a1Ztb0Sr9CK2M5ZqjR5Jzl8RQhF3aB7iDCHDNGfR7A
	Obve/mlk4zHrT3Zq3GSG11/zb0Rm1rL5VO8E5pLvSHYo1XKRckHtNg4ytnARJjALUVfN
	Yu2w==
Received: by 10.180.87.232 with SMTP id bb8mr21629063wib.0.1343390043777;
	Fri, 27 Jul 2012 04:54:03 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm13523563wiw.9.2012.07.27.04.54.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:54:03 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 12:53:35 +0100
Message-Id: <e1d46358cbbbf61bd50d268e52c6ed05e6a6bdbf.1343389943.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQnueaA/3qpnUplEHMLnNd+kDnhUSpN6JNOoehl+o9zs2rsQCCqxKp15wsDlN73ZtVQs108+
Subject: [PATCH 1/4] drm: move to PR/INC_PR, starting at r1 as libdrm_git was at r1
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
X-List-Received-Date: Fri, 27 Jul 2012 12:05:57 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc       |    2 ++
 meta/recipes-graphics/drm/libdrm_2.4.35.bb |    2 +-
 meta/recipes-graphics/drm/libdrm_git.bb    |    2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index 20d7f1f..8a2c760 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -10,6 +10,8 @@ SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs udev cairo virtual/libx11"
 
+INC_PR = "r1"
+
 #libpciaccess is required starting from libdrm 2.4.26
 DEPENDS += " libpciaccess"
 
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.35.bb b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
index 3677b8d..9d9ada1 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.35.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
@@ -2,7 +2,7 @@ require libdrm.inc
 
 LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 
-PR = "r0"
+PR = "${INC_PR}.0"
 
 SRC_URI += "file://installtests.patch \
             file://GNU_SOURCE_definition.patch \
diff --git a/meta/recipes-graphics/drm/libdrm_git.bb b/meta/recipes-graphics/drm/libdrm_git.bb
index c2f9855..d71b7f7 100644
--- a/meta/recipes-graphics/drm/libdrm_git.bb
+++ b/meta/recipes-graphics/drm/libdrm_git.bb
@@ -6,4 +6,4 @@ S = "${WORKDIR}/git"
 
 SRCREV = "3f3c5be6f908272199ccf53f108b1124bfe0a00e"
 PV = "2.4.15+git${SRCPV}"
-PR = "r1"
+PR = "${INC_PR}.0"
-- 
1.7.10



