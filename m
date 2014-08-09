Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id C033A60B05
	for <openembedded-core@lists.openembedded.org>;
	Sat,  9 Aug 2014 16:07:40 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so2382556wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 09 Aug 2014 09:07:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=O91OpvqSWEQaXH8/5vXwAsY2hB5rSsYABxKJYkvpY7E=;
	b=Jeuh3T7ZSAUGYKfCp27vD9AxxD/ANDKWI65ifcWC10Z2gZLx9pxQq+y+HHF6ougGy2
	x66syxNGcpL9jJIDYnhAePKMkRpnbZOpqI44DDHfVApbKLrskHlLKQl/zYtl3todw+GY
	JamO0Y2tvQ4njYOqCizD0vzFoleuyCmcNVaKp6odO5w/p7Ik9E0ILR10LiG1vYLCf/2X
	2IiUjB2FYk6LwgZkB58Aau5k4pIp0goXu9UJXcnEIWQhPTROoG/sg9sl8QOfdn0Io2qw
	BGMIyzPh1Hzex5ac95f+VmwYnUtI5sZXMYLya/ONjqiRFWlsPSzeat+mNpPfN305CYom
	wo7A==
X-Received: by 10.180.7.163 with SMTP id k3mr6010682wia.0.1407600461246;
	Sat, 09 Aug 2014 09:07:41 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fc7sm25509748wjc.37.2014.08.09.09.07.40 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 09 Aug 2014 09:07:40 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sat,  9 Aug 2014 18:08:01 +0200
Message-Id: <1407600483-31215-6-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.4
In-Reply-To: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
References: <1407600483-31215-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 6/8] midori: add dependency on libxscrnsaver
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
X-List-Received-Date: Sat, 09 Aug 2014 16:07:42 -0000

* fixes floating dependency:
  midori/midori/latest lost dependency on  libxscrnsaver

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-sato/midori/midori_0.5.5.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-sato/midori/midori_0.5.5.bb b/meta/recipes-sato/midori/midori_0.5.5.bb
index b359037..a9379e7 100644
--- a/meta/recipes-sato/midori/midori_0.5.5.bb
+++ b/meta/recipes-sato/midori/midori_0.5.5.bb
@@ -2,7 +2,7 @@ SUMMARY = "A lightweight web browser"
 HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique"
+DEPENDS = "webkit-gtk libsoup-2.4 openssl python-native python-docutils-native librsvg-native libnotify libunique libxscrnsaver"
 
 SRC_URI = "http://www.midori-browser.org/downloads/${BPN}_${PV}_all_.tar.bz2 \
 "
-- 
2.0.4


