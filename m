Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SujIs-0003qv-92
	for openembedded-core@lists.openembedded.org;
	Fri, 27 Jul 2012 14:05:58 +0200
Received: from mail-wi0-f170.google.com ([209.85.212.170])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 27 Jul 2012 04:54:08 -0700
Received: by wibhq12 with SMTP id hq12so583877wib.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 04:54:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references:x-gm-message-state;
	bh=1o/mKUE6Oqq1S5PtUYoboQmJoSUo9XK7GG7PVnquwus=;
	b=ENuOxQVeSj2ohcvKYqK7wk5/opB0TbisLgpsOsp2j/WEscKsfEUROluGlvcfbqObnv
	xqEKFGTK3+g1SeLbUXjsIshCHzVdL6OG6q8JPV6bP28UF4fJN0L9rQ7G4YcAEV95wO91
	+EC4uwASfyuKJEQLsTN88er3jpO6f5PcfCSWND6wbeEgEyCrOxPIyZqYvNYl/SHYhY7/
	+FCGB+t9vD2IiO0cqojS29HHATXogAqWmI9LaCOAWEaNEPS2nz0flzd26g/27/5bche2
	v0iGGsE9o56OsUmaC1jnoniqHz7xMD+p5iWC/SMclIlrbpl1FOAg4OPJmN7pbq88U/Kj
	r08A==
Received: by 10.180.78.135 with SMTP id b7mr5575004wix.11.1343390046452;
	Fri, 27 Jul 2012 04:54:06 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id y5sm13523563wiw.9.2012.07.27.04.54.05
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jul 2012 04:54:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Jul 2012 12:53:37 +0100
Message-Id: <27e4145f3a334623a76f292f8ea900d5338e09db.1343389943.git.ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
In-Reply-To: <cover.1343389943.git.ross.burton@intel.com>
References: <cover.1343389943.git.ross.burton@intel.com>
X-Gm-Message-State: ALoCoQkbRxfEfI36LpusKre3uIG0h8IxamzGhSSSPkLLdu5KOqOH7J2xahe6DceE/hBKcRCPq8lm
Subject: [PATCH 3/4] libdrm: Put the license md5sum in the common include
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
X-List-Received-Date: Fri, 27 Jul 2012 12:05:58 -0000

From: Damien Lespiau <damien.lespiau@intel.com>

With this, libdrm_git now does have LIC_FILES_CHKSUM as well.

Signed-off-by: Damien Lespiau <damien.lespiau@intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/drm/libdrm.inc       |    1 +
 meta/recipes-graphics/drm/libdrm_2.4.35.bb |    2 --
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/drm/libdrm.inc b/meta/recipes-graphics/drm/libdrm.inc
index e9ca2f9..5ddab85 100644
--- a/meta/recipes-graphics/drm/libdrm.inc
+++ b/meta/recipes-graphics/drm/libdrm.inc
@@ -6,6 +6,7 @@ accelerated OpenGL drivers."
 HOMEPAGE = "http://dri.freedesktop.org"
 SECTION = "x11/base"
 LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
 SRC_URI = "http://dri.freedesktop.org/libdrm/libdrm-${PV}.tar.bz2"
 PROVIDES = "drm"
 DEPENDS = "libpthread-stubs udev cairo"
diff --git a/meta/recipes-graphics/drm/libdrm_2.4.35.bb b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
index 9d9ada1..58ee449 100644
--- a/meta/recipes-graphics/drm/libdrm_2.4.35.bb
+++ b/meta/recipes-graphics/drm/libdrm_2.4.35.bb
@@ -1,7 +1,5 @@
 require libdrm.inc
 
-LIC_FILES_CHKSUM = "file://xf86drm.c;beginline=9;endline=32;md5=c8a3b961af7667c530816761e949dc71"
-
 PR = "${INC_PR}.0"
 
 SRC_URI += "file://installtests.patch \
-- 
1.7.10



