Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TIdIx-0002PP-9T
	for openembedded-core@lists.openembedded.org;
	Mon, 01 Oct 2012 12:32:51 +0200
Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Oct 2012 03:19:52 -0700
Received: by mail-wi0-f171.google.com with SMTP id hj13so1967068wib.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Oct 2012 03:19:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:x-gm-message-state;
	bh=0i39Rv3hGMKOpj4LCda6kSSjYH4Crpph7B8EuHH1SHg=;
	b=kVJsDzFQqTSD6/Z2HkD482LluUxyBYPH43xszAjYPQYT4dhfhAZ57St8ur7iPxoWJJ
	U8KUpSKhPZhlBTenHjOi4UQOCisWu2Ap68jgI7is/0JmOqzxXvRJgKzHgW7d7dWys8xD
	DKoPcpUyyiRUzNqnJ13QEwegju8tEZFQQAvsUNcxUdKqKkiBg9qkz6FDFzwqW4hjWeqE
	FIyKMs8dHhKdsLBWgkWQQqBHuzXH9ALn7rLrNUJ2z72WdiTAXKRlKaWSmBwJuEzR+3/l
	biG5FQxUMdSz85L1rz4+W2d2bxvLkGbQ19z2dVl6F8DBfFBva+KN2tIj9JsRjbSSJ16s
	z0Dg==
Received: by 10.180.82.164 with SMTP id j4mr13565565wiy.18.1349086790297;
	Mon, 01 Oct 2012 03:19:50 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPS id fb20sm17858720wid.1.2012.10.01.03.19.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 01 Oct 2012 03:19:49 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  1 Oct 2012 11:18:51 +0100
Message-Id: <1349086731-2818-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10
X-Gm-Message-State: ALoCoQkckBtLkNVtuu5a0WYKm3vuxuEz1YhUPo8CeQDPgTIaUBcD4qMbsSpcQXTbunJlybauBDeC
Subject: [PATCH] xf86-video-intel: drop libxvmc dependency
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
X-List-Received-Date: Mon, 01 Oct 2012 10:32:51 -0000

xvmc is explicitly disabled, so remove the dependency.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb |    4 ++--
 meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb    |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
index fe7408b..fe4dfbd 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_2.19.0.bb
@@ -9,9 +9,9 @@ Infrastructure (DRI)."
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=8730ad58d11c7bbad9a7066d69f7808e"
 
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
-DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
+DEPENDS += "virtual/libx11 drm xf86driproto glproto \
 	    virtual/libgl xineramaproto xf86driproto libpciaccess"
 
 
diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
index ed1f269..83a24ce 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-intel_git.bb
@@ -7,12 +7,12 @@ chipsets. The driver supports depths 8, 15, 16 and 24. On some chipsets, \
 the driver supports hardware accelerated 3D via the Direct Rendering \
 Infrastructure (DRI)."
 
-DEPENDS += "virtual/libx11 libxvmc drm dri2proto glproto \
+DEPENDS += "virtual/libx11 drm dri2proto glproto \
 	    virtual/libgl xineramaproto libpciaccess"
 
 SRCREV = "87ea531c5dc5b39809395b277c330854aaaaf019"
 PV = "2.10.0+git${SRCPV}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 EXTRA_OECONF += "--disable-xvmc --enable-dri --disable-static"
 
-- 
1.7.10



