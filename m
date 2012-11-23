Received: from mail-ea0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1TbheU-0005fB-Ov
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 02:01:54 +0100
Received: by mail-ea0-f175.google.com with SMTP id h11so3319904eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 16:47:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=FZa3lmLQ1RlW5pmHA1YD+kIs+IoDQrkIDysMQNXQIQQ=;
	b=gMccDUuKDGIRXGRmmNiHAIQfKzhnyDBoEKPS6uAUL/F2d+vVWLy+bqLKLq4NJDZ4JT
	G8j2dMlXhv4dNZhgjFL36jVIp64F2w+WI9OkudoW1AxqIyGdmEoYjCztVeheWyk4j2o0
	MRlzaWSPcNIxWDuQEe99vo+WT5MYpDfCld3xu+We1aOB0wkhjX3RdSua1vhfMY84vQgh
	PNwjwkqjHVdr4UuIPt+BZtu2RPLih4w6+2NFmFg3cPr1b/+zwfkdsDvIZ5ZpugKVBHtv
	I6VVFSGqmBdkb0gAcUOow4B2VJEv7In2iqYmlIh+C35GQ0mJgc8y0MCcv/76RuYyQ9Dm
	kSvA==
Received: by 10.14.194.71 with SMTP id l47mr7142809een.6.1353631669966;
	Thu, 22 Nov 2012 16:47:49 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id b44sm10260022eep.12.2012.11.22.16.47.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 22 Nov 2012 16:47:49 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Nov 2012 01:47:18 +0100
Message-Id: <726eb45be2db3fb3b2263953112b4194f81c018c.1353631583.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.0
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1353631583.git.Martin.Jansa@gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
Subject: [PATCH 4/4] xf86-video-omap: drop RPROVIDES/RREPLACES/RCONFLICTS
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
X-List-Received-Date: Fri, 23 Nov 2012 01:01:54 -0000

* without _${PN} suffix they are invalid:
  opkg install bash-4.2# opkg install xf86-video-omapfb
  Package xf86-video-omap-doc is already installed on root.

* it's not upgrade to omapfb driver but different driver,
  so let BSP maintainers decide which one works for their MACHINE

* without this xf86-video-omap (or -doc, -dbg, ...) can be pulled
  to image even when XSERVER clearly says xf86-video-omapfb

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
index a965859..dea8ca2 100644
--- a/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
+++ b/meta/recipes-graphics/xorg-driver/xf86-video-omap_git.bb
@@ -24,12 +24,8 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=10ce5de3b111315ea652a5f74ec0c602"
 DEPENDS += "virtual/libx11 libdrm xf86driproto"
 
-RPROVIDES = "xf86-video-omapfb"
-RCONFLICTS = "xf86-video-omapfb"
-RREPLACES = "xf86-video-omapfb"
-
 SRCREV = "ae0394e687f1a77e966cf72f895da91840dffb8f"
-PR = "${INC_PR}.2"
+PR = "${INC_PR}.3"
 PV = "0.4.2+gitr${SRCPV}"
 
 SRC_URI = "git://anongit.freedesktop.org/xorg/driver/xf86-video-omap;protocol=git \
-- 
1.8.0



