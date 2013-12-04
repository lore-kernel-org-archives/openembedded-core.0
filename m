Return-Path: <ross.burton@intel.com>
Received: from mail-wg0-f47.google.com (mail-wg0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 80A466D915
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2013 11:00:21 +0000 (UTC)
Received: by mail-wg0-f47.google.com with SMTP id n12so13894798wgh.14
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Dec 2013 03:00:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=bX0/zCbUg9EitQOTdLr6KXIF4c2y/FrRaYX8DHIg1mE=;
	b=eJzqMkrpiNopmwdHu7H6Wm32jA3j1H92bj+/zOMwg6vwXUoqcBReTpu5Jh+l84YJ4t
	PauMzDAPJlxvcz0ORkTt62Gyb40TtmpRFxWPAMK5OguMJNBY92XUD5RkQ8pW1FUnifJ9
	TAeRruyXVJq2KX6m28KCmedjVm0AmKRoFbBR2B3T930IxDRs8vOfyG/J/ZeqIVacC5tF
	jmQhBqc4GXDl4A5PEi8klgCU59DqmOufNNhe0RbS0S+AeqSBCIMLwWpyy3MMUYCmIXWn
	gy2CRj4qtbZDtjXFYDuYxG40JjbR+DmqugqdIm8aWPL7uTWOj4vi5EX3opXnU2zFUvpn
	x9sw==
X-Gm-Message-State: ALoCoQnH08HJtIsI0Mz0fiRULyg3iffcub0lM6Y5fD+959M1+1TKielc5bJPH0LnFj8fiIKbnmt5
X-Received: by 10.194.119.106 with SMTP id kt10mr6573965wjb.72.1386154820766; 
	Wed, 04 Dec 2013 03:00:20 -0800 (PST)
Received: from melchett.burtonini.com (35.106.2.81.in-addr.arpa. [81.2.106.35])
	by mx.google.com with ESMTPSA id fu1sm5836207wib.8.2013.12.04.03.00.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 04 Dec 2013 03:00:19 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2013 11:00:14 +0000
Message-Id: <1386154815-18982-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
Subject: [PATCH 1/2] gstreamer1.0-plugins-bad: respect directfb DISTRO_FEATURE
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
X-List-Received-Date: Wed, 04 Dec 2013 11:00:21 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index c382758..718c6ff 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -13,7 +13,8 @@ PACKAGECONFIG ??= " \
     ${@base_contains('DISTRO_FEATURES', 'wayland', 'wayland', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'opengl', 'eglgles', '', d)} \
     ${@base_contains('DISTRO_FEATURES', 'bluetooth', 'bluez', '', d)} \
-    orc curl uvch264 directfb neon \
+    ${@base_contains('DISTRO_FEATURES', 'directfb', 'directfb', '', d)} \
+    orc curl uvch264 neon \
     hls sbc dash bz2 smoothstreaming \
     "
 # rsvg plugin requires librsvg >= 2.36
-- 
1.7.10.4


