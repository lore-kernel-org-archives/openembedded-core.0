Return-Path: <martin.jansa@gmail.com>
Received: from mail-wi0-f175.google.com (mail-wi0-f175.google.com
	[209.85.212.175])
	by mail.openembedded.org (Postfix) with ESMTP id 021C972DA5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 14:52:16 +0000 (UTC)
Received: by mail-wi0-f175.google.com with SMTP id fb4so12474654wid.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jan 2015 06:52:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=MbuHKC/mIwXwkryfeNhqT0FG6boqUAvEwIf5PYB/7tQ=;
	b=PFQysU12axo5HkwufqcSfW5W6UfbUNm4ir6NTJeB9xSf6Tykgu4V9UiUDt4OsPxupJ
	lqtRyj8YjrTDm/1pt3DeDit8673VqZz/ZgYEHv3GbXer8nCbGx00fWw1SvqVVmIEJ9RE
	NI0fohMtCvHewxFGv51lxN42JOpKv8V8KLc34lFbnpqUTgTVsJpnbt7w3qfOk8DkM8JC
	35pTRedElw8Ovjqb3VKMp2bdqWi0a3O2Co7pusu/Y25iAe6aR7MtE88wn1QtrJgN8cmr
	Y46I8LTLl6Pfyf0gveEy8T/c0fMtGIk6k9PtNRdS3BKvARjGM37xOX1QD/60/GaTjlPD
	59cg==
X-Received: by 10.180.198.44 with SMTP id iz12mr7886940wic.36.1422456735714;
	Wed, 28 Jan 2015 06:52:15 -0800 (PST)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	et4sm6427797wjd.15.2015.01.28.06.52.14
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 28 Jan 2015 06:52:14 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 28 Jan 2015 15:52:09 +0100
Message-Id: <b31c28264a3a3c79442a21e46bbc49c1af531655.1422456689.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1422456689.git.Martin.Jansa@gmail.com>
References: <cover.1422456689.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1422456689.git.Martin.Jansa@gmail.com>
References: <cover.1422456689.git.Martin.Jansa@gmail.com>
Subject: [PATCHv4 2/4] xorg-driver: add x11 to required DISTRO_FEATURES
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
X-List-Received-Date: Wed, 28 Jan 2015 14:52:20 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xorg-driver-common.inc | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 17fac8b..7a710dc 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -16,7 +16,9 @@ S = "${WORKDIR}/${BPN}-${PV}"
 FILES_${PN} += " ${libdir}/xorg/modules/drivers/*.so"
 FILES_${PN}-dbg += " ${libdir}/xorg/modules/drivers/.debug"
 
-inherit autotools pkgconfig
+inherit autotools pkgconfig distro_features_check
+# depends on virtual/xserver
+REQUIRED_DISTRO_FEATURES = "x11"
 
 # FIXME: We don't want to include the libtool archives (*.la) from modules
 # directory, as they serve no useful purpose. Upstream should fix Makefile.am
-- 
2.2.1


