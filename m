Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f193.google.com (mail-ob0-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2B67422C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jan 2016 05:37:35 +0000 (UTC)
Received: by mail-ob0-f193.google.com with SMTP id is5so2010267obc.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 21:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=DvbgkKYEnTMXCOM2eORbcndyc0nLErr469X0KYjsxCk=;
	b=hGD3i59MPlINdbDE2vZBeNFBm2lUIVWT0Dr/7WDOD8+0IFuTk5jLPd8WYDm9UMAWkm
	OukqNAlDNeOaaIxii6yz74APDW9Cn8t9CS/b35H18zFB29mr6XNbN8NpXRLY6RqCLZmg
	WBgCEAy9Ab2AGK8CB0MlHy2UzfaVANJ5oqo8E4cQCzFygGmaz4+llQY03SY4uGqI6SRh
	CCjB4m/ZedNmz81Y1fU90d9TfefLKR3DPjsJfzzO2xuGwT3ncf+1W2bwoOG5K1uV+pO0
	X8Io9hQ6bSU4458wLx/r6pI7ePO4i2GFgN2ybK4WP9u0NkaNaYN8n4i0350H49ZNbuTL
	zUTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=DvbgkKYEnTMXCOM2eORbcndyc0nLErr469X0KYjsxCk=;
	b=bfpKncByOfjLx+hFm8GRRnerm5S+O1pG9NsmE/xFu7HYZUDJnRGWh+OIJYE4AD2+cy
	xSJSINbB01EYFf185keeJqwJkYSvX0iE5nD9Y1c1FKufXYtAYW9vE9h0rwzbu9TCpyjy
	mtrzBcJF6sIwTyOzMPpGYWecPWw/7YRfW+hVy3zWQc6FW2u7nTOqf33gRHPDqNyfm6Hv
	Xd5ZMKbi/FOp+5Nx6mLwB1xpUO9bL5qQdc21oiofajxNX9FmNa5aeU6uZDdoVzmgzagT
	TsyDvVvoyqRylEKKFib6kYHRdT15klawVhD+1GJNANzeqQNJQzSfVTe8DC4YqQBi8YiF
	3y9A==
X-Gm-Message-State: AG10YOQ3mNIs8dYTTQI+oLykDSPo4piiAiVX7rei6S9aexR6VinFPRLbjz0e2zhtc41xCg==
X-Received: by 10.182.58.109 with SMTP id p13mr44585obq.49.1453354656202;
	Wed, 20 Jan 2016 21:37:36 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	w143sm19735990oiw.16.2016.01.20.21.37.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 21:37:35 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 20 Jan 2016 21:36:34 -0800
Message-Id: <1453354610-19218-17-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
References: <1453354610-19218-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 16/32] gstreamer1.0-plugins-bad.inc: don't set ${S} or apply version specific patch
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
X-List-Received-Date: Thu, 21 Jan 2016 05:37:35 -0000

gstreamer1.0-plugins-bad.inc is shared by both the 1.6.2 and git
recipes, so must not set ${S} or apply any version specific patches.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc      | 4 ----
 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb | 5 ++++-
 2 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
index 4aa2f56..689d3ad 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad.inc
@@ -4,10 +4,6 @@ LICENSE = "GPLv2+ & LGPLv2+ & LGPLv2.1+"
 
 DEPENDS += "gstreamer1.0-plugins-base libpng jpeg"
 
-SRC_URI += "file://configure-allow-to-disable-libssh2.patch"
-
-S = "${WORKDIR}/gst-plugins-bad-${PV}"
-
 inherit gettext bluetooth
 
 # opengl packageconfig factored out to make it easy for distros
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
index c1c322b..004d053 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.6.2.bb
@@ -5,7 +5,10 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
                     file://gst/tta/crc32.h;beginline=12;endline=29;md5=27db269c575d1e5317fffca2d33b3b50 \
                     file://gst/tta/filters.h;beginline=12;endline=29;md5=8a08270656f2f8ad7bb3655b83138e5a"
 
-SRC_URI += "file://0001-glimagesink-Downrank-to-marginal.patch"
+SRC_URI += " \
+    file://configure-allow-to-disable-libssh2.patch \
+    file://0001-glimagesink-Downrank-to-marginal.patch \
+"
 
 SRC_URI[md5sum] = "7c73bec1d389f0e184ebbbbb9e9f883d"
 SRC_URI[sha256sum] = "650855e39ff56a8bb6cb0c192109c5926ce12f536d06e19ebf829de71ef396fe"
-- 
1.9.1


