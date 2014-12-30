Return-Path: <ross.burton@intel.com>
Received: from mail-we0-f178.google.com (mail-we0-f178.google.com
	[74.125.82.178])
	by mail.openembedded.org (Postfix) with ESMTP id 47C28610F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 18:05:12 +0000 (UTC)
Received: by mail-we0-f178.google.com with SMTP id p10so1382680wes.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Dec 2014 10:05:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CEG4inRqhI2TX/ORKaKZ0EvUOfEWlvpRHcA6L99j9xg=;
	b=HWD1ZPdorXB5E5r5gZosbDOuRZFco+3xdwzLaTEOFHO/eMLxEdE/fhL2N7038BYguG
	niimags7C8PCKQf5WxZAv6z3s9RZf2yL7g4SR0YixHiO+r5dcQrcq9qczAnAi8XJCttY
	tPGeEA7xyvP7UPCpHFnBJ6qbfPEIwjlVQ3UFfzGQHxm/7NQOCWeRpr7bTN6IkIxPyyfb
	G4T2tXkepyKS1mli6ASaGJCUKctnUQTIpZC8bYSNgwXwCdUi9PhQmKj58Yjp30bFwjy5
	XKtxIKbC02oV3AlRcllrSjxloOyuIUlfguO8KgupsnQ7//PdAG65pd6FkJ+n18dvln4S
	a2jA==
X-Gm-Message-State: ALoCoQmu4MNlfS9G6vsuw8IWVpGXqXaskig0WIkko40f+jBY2NTrOCVJa05BrxNIGA+DXhorYU6L
X-Received: by 10.194.24.195 with SMTP id w3mr9748488wjf.135.1419962712869;
	Tue, 30 Dec 2014 10:05:12 -0800 (PST)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by mx.google.com with ESMTPSA id
	hl1sm28854285wjc.18.2014.12.30.10.05.11
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Dec 2014 10:05:12 -0800 (PST)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Dec 2014 18:04:01 +0000
Message-Id: <1419962645-26989-3-git-send-email-ross.burton@intel.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
References: <1419962645-26989-1-git-send-email-ross.burton@intel.com>
Subject: [PATCH 3/7] gstreamer1.0-plugins-bad: upgrade to 1.4.5
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
 ...1.0-plugins-bad_1.4.1.bb => gstreamer1.0-plugins-bad_1.4.5.bb} |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)
 rename meta/recipes-multimedia/gstreamer/{gstreamer1.0-plugins-bad_1.4.1.bb => gstreamer1.0-plugins-bad_1.4.5.bb} (78%)

diff --git a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.1.bb b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
similarity index 78%
rename from meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.1.bb
rename to meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
index f0116c0..59065de 100644
--- a/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.1.bb
+++ b/meta/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.4.5.bb
@@ -7,7 +7,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=73a5855a8119deb017f5f13cf327095d \
 
 SRC_URI += "file://0001-gl-do-not-check-for-GL-GLU-EGL-GLES2-libs-if-disable.patch"
 
-SRC_URI[md5sum] = "20cb190b18dc63017326321cdb7c91e5"
-SRC_URI[sha256sum] = "0268db2faaf0bb22e5b709a11633abbca4f3d289b1f513bb262d0bf3f53e19ae"
+SRC_URI[md5sum] = "e0bb39412cf4a48fe0397bcf3a7cd451"
+SRC_URI[sha256sum] = "152fad7250683d72f9deb36c5685428338365fe4a4c87ffe15e38783b14f983c"
+
 S = "${WORKDIR}/gst-plugins-bad-${PV}"
 
-- 
1.7.10.4


