Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1REJae-00043l-82
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 13:36:44 +0200
Received: by mail-bw0-f47.google.com with SMTP id t8so435342bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 04:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=QMLvyWpPPyGp6GtWyHU10NXPsCfD4eilsy1ux7u9Bw8=;
	b=wVZnU31rN8lfTsMh00/gyoRTcauYOvbrQAOF1ZBD+qP6ZxtH5O8C/rM+Xm/UmCGT5k
	F4prk6fq69rgWlQWWGbkCCyhmURhRkQZ46O2tIfH9wDexCq20WuWZc41qix4D1xnf4LJ
	+CK4Et2DXcDNMgl1j21Elfpf8X3gXYxRul2AY=
Received: by 10.204.157.131 with SMTP id b3mr2384238bkx.41.1318505462747;
	Thu, 13 Oct 2011 04:31:02 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id z9sm3263106bkn.7.2011.10.13.04.31.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 13 Oct 2011 04:31:01 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Oct 2011 13:30:21 +0200
Message-Id: <ad911e855c554d2a32262efc0f99018c85129643.1318505196.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.7
In-Reply-To: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
References: <bf4f1d2b7aab8e0825c54831c4282207cf7a9bc3.1318505196.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1318505196.git.Martin.Jansa@gmail.com>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
Subject: [oe-core 03/20] xorg-driver-common: bump PE for upgrade path for meta-oe users
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
X-List-Received-Date: Thu, 13 Oct 2011 11:36:44 -0000

* mostly because of xf86-video-omapfb
  Not downgrading package xf86-video-omapfb on root from
  1:0.1.1+r16+gitr28c006c94e57ea71df11ec4fff79d7ffcfc4860f-r16 to
  1:0.1.1+gitr1+28c006c94e57ea71df11ec4fff79d7ffcfc4860f-r17.5.

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xorg-driver-common.inc             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 097060e..9a474b7 100644
--- a/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -4,7 +4,7 @@ BUGTRACKER = "https://bugs.freedesktop.org"
 SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 
-PE = "1"
+PE = "2"
 INC_PR = "r17"
 
 DEPENDS = "virtual/xserver xproto randrproto util-macros"
-- 
1.7.7



