Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f46.google.com (mail-wm0-f46.google.com [74.125.82.46])
	by mail.openembedded.org (Postfix) with ESMTP id 95DC260745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 22:34:26 +0000 (UTC)
Received: by wmnn186 with SMTP id n186so141826306wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 14:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=QA5a9MR8Mje5jqPEI16koqJmz9UCGfBB8C00irLnlWc=;
	b=UoT/nUw+myxhThraXRHx7iYjCUg9pbzBs7WJJWIVGz1QE4GLdi/Y+EC9XqEg9Z1AAT
	93bwxtW3Ap48iaHw8TsfQg9joNSK8qWGhRD98mRsVTZibOuki+Wvh3OQ56WwjMiu/E2h
	/MYQmZtAwTTh5zOdUAQ2E5NX9AwJU+VfyrQjkiMVnQVfo/2lzw1/37NrN+fiZVtxR8kW
	DL47Ms6uKGivl7eCUY6LRxIkDu2wbhZs0SForOQ7MawnovMX6T/6CPA2/NsN+o+aDI28
	RoINc/NcqzuYrPzm0as9Z6kmQVeqIe8JvXC33rPqx4173QTKUShkfRCzMPwM/Po6HCeF
	Gq9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=QA5a9MR8Mje5jqPEI16koqJmz9UCGfBB8C00irLnlWc=;
	b=QqN+ADciyghRTimeVXLdvWg/tySEEZCzBnr9AMTZ0Hy1CplK1cYbfxCfoM/Tzo1yV/
	zwuvKgcFuZnz8VzCung9y+NiY5r1gLIlyTm1LWzRgVbS6rIkgDDPgnd1iEP+GNCfW+ni
	6jvX7zG55DDBzBYGW0e+on0Fq/dgcQVGISjpERswwgMWfuxUgtI7ThNzYhR9cZApTAEN
	P9WZNZkbOdNQWkcA0Dbc8jMVr11MdLZ7cJGdTeCQE/GBFWOzAkXQP0DjxMMn2Lc1ag3K
	01q/Je5SHqjx1FuOLEWJ0f9NTxi29oyBo7CLj0ooSZ2Bcn+MMQlKdH2EA+6KbJEOdenP
	OWEw==
X-Gm-Message-State: ALoCoQlqKvYE5x1MAATBLUhkxAeOBnkNBqXwOG7KMOuARJiq1n0JBgx+xtiTsnlrtqoOkpYmfUMru5PvmexFMTURX9MpwdAbrg==
X-Received: by 10.28.218.17 with SMTP id r17mr643285wmg.90.1450132466683;
	Mon, 14 Dec 2015 14:34:26 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	i84sm18161573wmc.20.2015.12.14.14.34.25
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 14 Dec 2015 14:34:26 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 22:34:24 +0000
Message-Id: <1450132464-14675-1-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH] clutter-gst-3.0: add missing gudev build dependency
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
X-List-Received-Date: Mon, 14 Dec 2015 22:34:27 -0000

This is an auto-detected build dependency but upstream doesn't have an option to
toggle it.  As GStreamer builds with gudev enabled, simply enable it here.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-graphics/clutter/clutter-gst-3.0.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
index 5aeeac6..6a189f2 100644
--- a/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
+++ b/meta/recipes-graphics/clutter/clutter-gst-3.0.inc
@@ -8,7 +8,7 @@ REQUIRED_DISTRO_FEATURES ?= "opengl"
 
 SRC_URI += "file://0001-Install-example-binary-needed-for-core-image-clutter.patch"
 
-DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0"
+DEPENDS = "gstreamer1.0-plugins-base gstreamer1.0-plugins-bad clutter-1.0 gudev"
 RDEPENDS_${PN} += "gstreamer1.0-meta-base"
 PACKAGES  =+ "${PN}-examples"
 
-- 
2.1.4


