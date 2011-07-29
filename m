Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QmgrX-0006Vg-4h
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jul 2011 08:47:59 +0200
Received: by mail-fx0-f47.google.com with SMTP id 11so2229244fxg.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jul 2011 23:43:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=FSEKMLe1XyPfS1ifTwqea6Q73a4mIqNYAcjWB3GkUwI=;
	b=dVP1KT7Qh1+tmRjMATcatMKSK5cpL81kVmMU0UBYAmIFZv0a18xlQzyxnnFk30dGlP
	pCY5xVBX0hMRBwFEBWToK5NgArbt11cdqmN0Qqz6YUS0nTHHaXMSn1x5bW3f3k8wckj7
	Hhm8FQRWylUXwY5Zfwx23ldq18eA2IdxO+WsE=
Received: by 10.223.160.131 with SMTP id n3mr711749fax.111.1311921825146;
	Thu, 28 Jul 2011 23:43:45 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id g20sm378081fai.21.2011.07.28.23.43.43
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 28 Jul 2011 23:43:44 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 29 Jul 2011 08:43:36 +0200
Message-Id: <1311921816-28895-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.6
Subject: [PATCH] libfm: depend on intltool-native instead of intltool
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
X-List-Received-Date: Fri, 29 Jul 2011 06:47:59 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-support/libfm/libfm_0.1.14.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-support/libfm/libfm_0.1.14.bb b/meta/recipes-support/libfm/libfm_0.1.14.bb
index 5c7e95c..38f1d73 100644
--- a/meta/recipes-support/libfm/libfm_0.1.14.bb
+++ b/meta/recipes-support/libfm/libfm_0.1.14.bb
@@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=59530bdf33659b29e73d4adb9f9f6552 \
                     file://src/base/fm-config.h;endline=23;md5=ad0fc418c3cf041eea35ddb3daf37f17"
 
 SECTION = "x11/libs"
-DEPENDS = "gtk+ menu-cache intltool"
+DEPENDS = "gtk+ menu-cache intltool-native"
 
 PR = "r3"
 
-- 
1.7.6



