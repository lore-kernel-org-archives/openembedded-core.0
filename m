Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id 652F276ED5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 19:12:10 +0000 (UTC)
Received: by wicmx12 with SMTP id mx12so8444968wic.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Aug 2015 12:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=3ZVk1EGiqkqnwTISk7Wl5vkOdjcHLu13bI1kdBZoO5g=;
	b=V3sxblMtFakhtK99/Fit8m7dIhsebR9wsf2hevLUyP/E+aSo3MvLgULb0WeGweu9Vu
	hO1kAn+Ta1gY7zp+v4izBPY0xIdtssSJ6zQDSoK4AQKrap8kS7okA4fbCh9XtaT3JjA9
	QyMa7Zvbmg+QgrEKNGZ4JtxqzqBbLcJnTFFZym6ESKNSA65u+X7xh4Z5FT6qe1kquEEx
	9Uxmq4CpXPiGe8e0y04qm8FQcUpxMaiHTJkzihp8+6GsDkZXueVWbCvU7vNgqbyz6KVp
	zw+uZILoueDoqW6eFahpI7o77HBzMHB+K5BPrEnbQceYHR/eZBiLdiBjXM42VpFO30vK
	gT2Q==
X-Received: by 10.180.92.225 with SMTP id cp1mr151731wib.2.1441048330269;
	Mon, 31 Aug 2015 12:12:10 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	pu6sm23568430wjc.34.2015.08.31.12.12.08
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 31 Aug 2015 12:12:09 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 31 Aug 2015 12:12:01 -0700
Message-Id: <02054faced424f2d07fb72f8ac92ee93521c519e.1441048182.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1441048182.git.chris_larson@mentor.com>
References: <cover.1441048182.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCHv2 1/3] packagegroup-core-x11-sato: obey the pulseaudio distro feature
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
X-List-Received-Date: Mon, 31 Aug 2015 19:12:10 -0000

From: Christopher Larson <chris_larson@mentor.com>

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
index 04d1e99..e0b1f51 100644
--- a/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
+++ b/meta/recipes-sato/packagegroups/packagegroup-core-x11-sato.bb
@@ -39,8 +39,7 @@ RDEPENDS_${PN}-base = "\
     libsdl \
     ${NETWORK_MANAGER} \
     udev-extraconf \
-    pulseaudio-server \
-    pulseaudio-client-conf-sato \
+    ${@bb.utils.contains('DISTRO_FEATURES', 'pulseaudio', 'pulseaudio-server pulseaudio-client-conf-sato', '', d)} \
     "
 
 # pcmanfm doesn't work on mips
-- 
2.2.1


