Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f174.google.com (mail-wi0-f174.google.com
	[209.85.212.174])
	by mail.openembedded.org (Postfix) with ESMTP id D68D6707EA
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 21:58:26 +0000 (UTC)
Received: by mail-wi0-f174.google.com with SMTP id d1so8628410wiv.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jul 2014 14:58:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9H+wyCSQ/6bNQHuVSrdioOI5Nc6hZIh99meqR4nr3hE=;
	b=YV+Rvxj6Ou0V4RJkX+zPHJYvgZsb+Hn098ne5lmKPvY5g2/qHp1/OcLILKa9KDPPQ2
	mGPeZJc6IpSrYY/8tUq3+1w98XjYS8R8Nqh43SOPgCE6dc3JNhbb63445735h1my0ioL
	yjn4cdbtsAES+U9soH65+H3f17TXMULCs1Wg21QxHq0GUxel7+9WW3W7wJ4EwMl1imHe
	DLi4ZvQDwAlyzTnnOkACg3G4FeglxydMYX4vOVQxzRuFxosckxyTn3pT5228OGGWgXmb
	Rl9x096Y2wc/ipKh6RTjvQPBz1tO54lB54IQUN24CKzL2i+/Vl4vkmZ5CxzquuEyFLzL
	tATA==
X-Gm-Message-State: ALoCoQmtmSnbyxhm+XkhWgW3gaJfFEEF6UrbtOY+wWoC9aZ+6VwSaOrGB5PZxArP97wLKq8E2J2T
X-Received: by 10.180.7.230 with SMTP id m6mr6908725wia.3.1406152707074;
	Wed, 23 Jul 2014 14:58:27 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id
	pl1sm14090074wic.17.2014.07.23.14.58.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Jul 2014 14:58:26 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Jul 2014 22:58:13 +0100
Message-Id: <1406152694-6242-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1406152694-6242-1-git-send-email-ross.burton@intel.com>
References: <1406152694-6242-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/4] xf86-video-evdev: upgrade to 2.9.0
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
X-List-Received-Date: Wed, 23 Jul 2014 21:58:28 -0000

Build-dependency on libevdev added.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../{xf86-input-evdev_2.8.2.bb => xf86-input-evdev_2.9.0.bb}     |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta/recipes-graphics/xorg-driver/{xf86-input-evdev_2.8.2.bb => xf86-input-evdev_2.9.0.bb} (80%)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.2.bb b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.0.bb
similarity index 80%
rename from meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.2.bb
rename to meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.0.bb
index 6cbe165..4ab6ad1 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.8.2.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-evdev_2.9.0.bb
@@ -14,7 +14,7 @@ xorg.conf for each input device that will use this driver. "
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=fefe33b1cf0cacba0e72e3b0fa0f0e16"
 
-DEPENDS += "mtdev"
+DEPENDS += "mtdev libevdev"
 
-SRC_URI[md5sum] = "be7f91905c41bb3c3a0eb54063c7e4bf"
-SRC_URI[sha256sum] = "750461749a83bdee7771592aa5c0db5e267b18d847078a4b8622f55b04797eb3"
+SRC_URI[md5sum] = "9076ae2646f7aeb30963056e0bbfccf0"
+SRC_URI[sha256sum] = "0c0c4aa393cb027a2304967944867a21a340bcad2e5efe630291b6906c3abc35"
-- 
1.7.10.4


