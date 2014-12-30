Return-Path: <ross.burton@intel.com>
Received: from mail-wi0-f178.google.com (mail-wi0-f178.google.com
	[209.85.212.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3743D60809
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:05:11 +0000 (UTC)
Received: by mail-wi0-f178.google.com with SMTP id em10so24352295wid.11
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 10:05:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=cNcs1ES3kdDz1/OdCfOfDZ7+1o2Y5T5slnq2ofVliFc=;
	b=KwumVv3S6nTVPpDsNlutuVYxZBh9MYBBltCJk7g00WaMryImzZ347niBEDuDDrZeMu
	t++0EPnBOlzTftI3kc04xxh4eTl4vvU9egbZciM+gBnk0r2Sv1CFDKeO8Pan302uts9J
	8cp3MFJrq5lQ++dXCvy/V8mpAC/qfbT+3Lb+U1ZvOAoV2HTKi0paSk8Ux1i039W5Gs3l
	oipFKlgzPD8Wdrw5V3+y3+l8zA+x4JdC9ydk8TvTcKA4Nx1Hyz8qQ7bj9T/g6citsV11
	uMoGcammydbbipIg7sVqdmihVP74QXONDjfk9gAYRUU9eSTMIvskPMiWmsqvlOFpQhJF
	3TMA==
X-Gm-Message-State: ALoCoQk+xj5pjIAtncxxhzfqckCnJ63y/kUOPI2Vovye/9DSYFdPwKXNx+MuXRbS+usIQ8Eyi+IK
X-Received: by 10.180.79.200 with SMTP id l8mr102745863wix.65.1419962711673;
	Tue, 30 Dec 2014 10:05:11 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	hl1sm28854285wjc.18.2014.12.30.10.05.10
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 10:05:10 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 18:04:00 +0000
Message-Id: <1419962645-26989-2-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
References: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 2/7] gstreamer1.0-plugins-base: upgrade to 1.4.5
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
X-List-Received-Date: Tue, 30 Dec 2014 18:05:18 -0000


Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 ...0-plugins-base_1.4.1.bb => gstreamer1.0-plugins-base_1.4.5.bb} |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 mode change 100755 => 100644 meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-base_1.4.1.bb => gstreamer1.0-plugins-base_1.4.5.bb} (80%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base/taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
old mode 100755
new mode 100644
diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
similarity index 80%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
index 27b8774..11cf8b4 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-base_1.4.5.bb
@@ -10,6 +10,7 @@ SRC_URI += "file://do-not-change-eos-event-to-gap-event-if.patch \
             file://taglist-not-send-to-down-stream-if-all-the-frame-cor.patch \
 "
 
-SRC_URI[md5sum] = "a825628225bd0a58c0df87cdd2a5db91"
-SRC_URI[sha256sum] = "aea9e25be6691bd3cc0785d005b2b5d70ce313a2c897901680a3f7e7cab5a499"
+SRC_URI[md5sum] = "357165af625c0ca353ab47c5d843920e"
+SRC_URI[sha256sum] = "77bd8199e7a312d3d71de9b7ddf761a3b78560a2c2a80829d0815ca39cbd551d"
+
 S = "${WORKDIR}/gst-plugins-base-${PV}"
-- 
1.7.10.4


