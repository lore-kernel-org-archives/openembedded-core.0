Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 5535B6B89E
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 12:25:52 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id y10so308143pdj.39
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 05:25:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=PJOD3i5OAjKBikqY8JbDVA6hKfsUD8MMzVrFO1Ajgqg=;
	b=hH0mnBU1zjgMnCaoJJE0db1M9ROUhVYeF0QAEs/fzMMa2lOqpTQPTF+9Aw6p5v2b2v
	DBMemFGlOA+PzxmaWLTCX5VcVSLbGSa3nFU3vO+xTrQB99lS93qgyLABLHMbmRGsIPmX
	aVocVBHsm5ie+OdEfbpB+7fmaBkzDCN2pevLmuQQoLA1shoq4F/zhgz2XT5GW2gaOEHU
	rl6Li+YaNUiwxq2Pj+FXwgz0xeqc04XihdzUC/lK6zKTC1iztG3npz8MdK9ecHKOJKJ+
	KSAFK9RiL8BYF4eHNyV2IPbQn8T64oBXucS+MiB+6wPP2YD8zxeM5BgKLqGAN51mw01n
	smIQ==
X-Received: by 10.68.236.168 with SMTP id uv8mr1535142pbc.124.1377001553375;
	Tue, 20 Aug 2013 05:25:53 -0700 (PDT)
Received: from 60-242-179-244.static.tpgi.com.au
	(60-242-179-244.static.tpgi.com.au. [60.242.179.244])
	by mx.google.com with ESMTPSA id ai6sm3553191pad.15.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 20 Aug 2013 05:25:52 -0700 (PDT)
From: Jonathan Liu <net147@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 20 Aug 2013 22:21:18 +1000
Message-Id: <1377001278-18822-1-git-send-email-net147@gmail.com>
X-Mailer: git-send-email 1.8.3.4
Subject: [PATCH] xf86-video-vesa: remove duplicate xf86driproto from DEPENDS
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
X-List-Received-Date: Tue, 20 Aug 2013 12:25:52 -0000

Signed-off-by: Jonathan Liu <net147@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
index 7373f85..fb285ea 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-vesa_2.3.2.bb
@@ -14,7 +14,7 @@ supports depths 8, 15 16 and 24."
 PR = "${INC_PR}.0"
 
 DEPENDS += "virtual/libx11 libxvmc drm xf86driproto glproto \
-	    virtual/libgl xineramaproto xf86driproto libpciaccess"
+            virtual/libgl xineramaproto libpciaccess"
 
 COMPATIBLE_HOST = '(i.86|x86_64).*-linux'
 
-- 
1.8.3.4


