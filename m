Received: from mail-ea0-f170.google.com ([209.85.215.170])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UdOUL-0008JC-M9
	for openembedded-core@lists.openembedded.org;
	Fri, 17 May 2013 19:30:50 +0200
Received: by mail-ea0-f170.google.com with SMTP id f15so2619848eak.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 May 2013 10:12:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:mime-version
	:content-type:content-transfer-encoding;
	bh=Ix+0hdKqIW4axsHM3kPmX2XF/I70SK7oPJwBXDMXtKY=;
	b=rDHL8hjkkTtltZmQL5ljai8R+tyBQ8Mz+eAJET7Hlus1LWaDRWHrgnP+i9yKG3CxxX
	OUtc2yqyNUKgjxI361T8vzjxZ7v81biyQZJJaimyQD8X12tSiDoNKFwN6Mpxy4Zwnre5
	4TkeiFpwE4NvOJj6AG6SHxb91bs45+/nwgEwTbKRPd5M+7c/w+pHvLVOmwx2rbIYzS3x
	ux+DGSBM2pxhbj8P6m/9ni4GKOBZKsNZs8APEsF6Sx2giDtNt3+FFauogyngHK9gLpKF
	bbTP/bsRaoyytQ/J9BJP83I3N/JvbJtBzPZVYejAY3jwWM0XXy7yvt0DcX3Ckwli7t0g
	BpBw==
X-Received: by 10.14.42.9 with SMTP id i9mr131144350eeb.18.1368810745178;
	Fri, 17 May 2013 10:12:25 -0700 (PDT)
Received: from localhost.localdomain (p5B0A3D55.dip0.t-ipconnect.de.
	[91.10.61.85]) by mx.google.com with ESMTPSA id
	bj12sm20069257eeb.8.2013.05.17.10.12.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 17 May 2013 10:12:24 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 17 May 2013 19:12:11 +0200
Message-Id: <1368810732-29468-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
MIME-Version: 1.0
Subject: [PATCH 1/2] glib-2.0: update to 2.36.2
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
X-List-Received-Date: Fri, 17 May 2013 17:30:56 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While updating the C++ bindings in meta-oe (glibmm/cairomm/pangomm) a
dependency on glib 2.36.1 came up.

This patch was build- (gcc 4.7.2/4.8.0) and run-tested with my standard
xfce-/gnome2-images

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{glib-2.0_2.36.0.bb => glib-2.0_2.36.2.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.0.bb => glib-2.0_2.36.2.bb} (93%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
similarity index 93%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
index a042972..2e710c9 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.0.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "2047dff287473450593edecb18f79c17"
-SRC_URI[sha256sum] = "455a8abe8692c5174bcc7ffa15b96a7521a2f2f9fb47594405927c35cb9bb227"
+SRC_URI[md5sum] = "d791774ac49eaf8ba59792427bb74af7"
+SRC_URI[sha256sum] = "5ea98451fb57d0ba523a1e836545f0a919b498863056fdd9da69d148c1347f80"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.4.4



