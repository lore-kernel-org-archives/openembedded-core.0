Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id DCEB6737B4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 14:16:48 +0000 (UTC)
Received: by wesk11 with SMTP id k11so20637495wes.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Feb 2015 06:16:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=K/HKsQeNaoNNy/+V5qb8yDL+y+fUooxvG8jaPHean9s=;
	b=hxXQS5aViOxM4ixRN3W7LdeGJKSs6ynIkDLV2D9NImEejozYqRSlyVlY1zl7QvJkLV
	X8ZN+LI0RqDywui6YnNjk1wu7K7b5tDqeNcpWXq+KALQScPy8TjaVLPeEAOIhsNM/Jdv
	rQBDGGsJaBPVRK1wAl4V0HlUOHKDapBMJtx0w+FyjYVyMgaU03otWGz4B2s4jJ7PdeGQ
	JeD7LRsc1dJLGUSoSzrLl/LE1terzHERxqRtc73ZTn+3ZA/dMMGdPurDpuafJEbudS45
	kLUH+wzVDaHwfII36lwemR79qIobn0f3C6yRqn9+HyfEtqKtV/XAsqMOWSBjtWaJMWb9
	F1ww==
X-Gm-Message-State: ALoCoQkqJ5oWU5Z50WoK3D/EIWIWZYF3wY8K1XxNthuthmU2bkHxOFVwjw9WwZX/cpX2p/NE/E4V
X-Received: by 10.180.83.129 with SMTP id q1mr6977664wiy.46.1425046609419;
	Fri, 27 Feb 2015 06:16:49 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35])
	by mx.google.com with ESMTPSA id dm6sm2991830wib.22.2015.02.27.06.16.47
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 Feb 2015 06:16:48 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 27 Feb 2015 14:14:21 +0000
Message-Id: <1425046462-10303-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1425046462-10303-1-git-send-email-ross.burton@intel.com>
References: <1425046462-10303-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/3] packagegroups: use gst-player instead of owl-video
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
X-List-Received-Date: Fri, 27 Feb 2015 14:16:49 -0000

owl-video is a bad video player that doesn't work very well, use gst-player
instead for testing.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
index 33a3eee..4177c45 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-tools-testapps.bb
@@ -30,7 +30,7 @@ X11GLTOOLS = "\
 
 X11TOOLS = "\
     fstests \
-    owl-video \
+    gst-player-bin \
     x11perf \
     xrestop \
     xwininfo \
-- 
1.7.10.4


