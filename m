Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by mail.openembedded.org (Postfix) with ESMTP id 407F36110E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 13:48:24 +0000 (UTC)
Received: by mail-we0-f176.google.com with SMTP id u56so7984476wes.35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Sep 2013 06:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=X7+JAnJ/y7WOKr+BsMpLas1reMhxC0Wxpb7Y7Hq2qiE=;
	b=C4rUsYPXuCkaP+e6G23HcwQNp0lazysuN+zetj7ha+Ae0GVWC33gdE0jPLI8Y+kkh4
	ajuc/9lhwtQi0k/dOUQZjqLmS5habQ5HdKqknLuTtm1AdJbspT3K2P2seGxgC8FJpovq
	Ev8h+4yyo4/VAdGoPGd96a5M7thGUu5snXP3KiJtkenP17u5vEFgOGqMLTzv0InV0L5U
	xooEAKJw2hv6RM7NVxSBkzk6oMQhc2AiWICGvEoCvr5ihkngEVd9VS2ATqDufAVs/Dsp
	OYvHpgS3mtvLsNJMNGJIImerEffjlqxEzf4/GITlPwnrQmWaS/MGs9lymPaRS424101V
	bPmg==
X-Gm-Message-State: ALoCoQkA2V8Me+//hlMaXx1kSlbYpBrboPorej9xRh4wfiExd5REZGozrtZ60h9ovTCkfLhjIjKV
X-Received: by 10.194.249.97 with SMTP id yt1mr1556476wjc.49.1378907305789;
	Wed, 11 Sep 2013 06:48:25 -0700 (PDT)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id e5sm10786622wiy.2.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 11 Sep 2013 06:48:24 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 11 Sep 2013 14:48:19 +0100
Message-Id: <1378907299-15627-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH] x11vnc: add dependencies for xrandr/xfixes/xdamage/xtst
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
X-List-Received-Date: Wed, 11 Sep 2013 13:48:24 -0000

Inspired by a patch by Martin Jansa but with these libraries required, as a VNC
server without them is suboptimal.  Don't add an option for Xinerama as our X
server always disables it.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
index 4b8bed4..0abc84a 100644
--- a/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
+++ b/meta/recipes-graphics/x11vnc/x11vnc_0.9.13.bb
@@ -7,7 +7,7 @@ LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f \
                     file://x11vnc/x11vnc.h;endline=33;md5=6f95dc6535467d7ee1563fd434fb372e"
 
-DEPENDS = "openssl virtual/libx11 libxext avahi jpeg zlib"
+DEPENDS = "openssl virtual/libx11 libxext avahi jpeg zlib libxfixes libxrandr libxdamage libxtst"
 
 PR = "r0"
 
-- 
1.7.10.4


