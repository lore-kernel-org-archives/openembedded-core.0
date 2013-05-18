Received: from mail-ea0-f172.google.com ([209.85.215.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1Udd10-0006S1-HW
	for openembedded-core@lists.openembedded.org;
	Sat, 18 May 2013 11:01:25 +0200
Received: by mail-ea0-f172.google.com with SMTP id d10so3019046eaj.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 18 May 2013 01:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=x-received:from:to:subject:date:message-id:x-mailer:in-reply-to
	:references:mime-version:content-type:content-transfer-encoding;
	bh=mbSxB8LljZ/GzTFU6h13P1s1Aig5EHyzXFEaFYlwXJY=;
	b=jMYzFbIxOVNX1YreBVkF2q7F1V3yxPPsx0fMGC66pkLxbMdMzACNxGWdSpO+uqX1Ue
	0QWRoTVXCXZy39PU2cfGqcPUoLoNuFPuTdGk8RTQ6qmeJq878CaNY4e+EyByXx2Ao+ZF
	5BOgO8LOefLVl5Fzem+ZuO5QVere257q9njS3Cb5hFMSmIyrrRxrVuO0OoOL9LzsY2L7
	aBjM9sp6GhZg6DMeEZiaPWPr8WjT5b9nZkYOEDdPcCk5b/lI4ShAEgcqpfUogutSHljG
	vYcjrpcGWDiKJDS0XiXNm639Oj/G4ZPOuE1K2ffb0WUG7ieDL8BT2iEGw8QXXMTITsDE
	dH9A==
X-Received: by 10.15.33.195 with SMTP id c43mr100247853eev.2.1368866585760;
	Sat, 18 May 2013 01:43:05 -0700 (PDT)
Received: from localhost.localdomain (p4FDF11F2.dip0.t-ipconnect.de.
	[79.223.17.242])
	by mx.google.com with ESMTPSA id t9sm24534586eeo.11.2013.05.18.01.43.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Sat, 18 May 2013 01:43:05 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 18 May 2013 10:42:52 +0200
Message-Id: <1368866573-18112-2-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 1.7.4.4
In-Reply-To: <1368866573-18112-1-git-send-email-schnitzeltony@googlemail.com>
References: <1368866573-18112-1-git-send-email-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH/V2 1/2] glib-2.0: update to 2.36.2
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
X-List-Received-Date: Sat, 18 May 2013 09:01:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch was build- (gcc 4.7.2/4.8.0) and run-tested with my standard
xfce-/gnome2-images

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../{glib-2.0_2.36.1.bb => glib-2.0_2.36.2.bb}     |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-core/glib-2.0/{glib-2.0_2.36.1.bb => glib-2.0_2.36.2.bb} (92%)

diff --git a/meta/recipes-core/glib-2.0/glib-2.0_2.36.1.bb b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
similarity index 92%
rename from meta/recipes-core/glib-2.0/glib-2.0_2.36.1.bb
rename to meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
index 9ab7554..935a493 100644
--- a/meta/recipes-core/glib-2.0/glib-2.0_2.36.1.bb
+++ b/meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb
@@ -18,8 +18,8 @@ SRC_URI = "${GNOME_MIRROR}/glib/${SHRT_VER}/glib-${PV}.tar.xz \
 
 SRC_URI_append_class-native = " file://glib-gettextize-dir.patch"
 
-SRC_URI[md5sum] = "a3bbee44a13facb5a3cab18be5ece14c"
-SRC_URI[sha256sum] = "7de37586794e92c024feebe5d306bf5f245fef4803c3666af1ae8dac6ee10b24"
+SRC_URI[md5sum] = "d791774ac49eaf8ba59792427bb74af7"
+SRC_URI[sha256sum] = "5ea98451fb57d0ba523a1e836545f0a919b498863056fdd9da69d148c1347f80"
 
 BBCLASSEXTEND = "native nativesdk"
 
-- 
1.7.4.4



