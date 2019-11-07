Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id C33DD7F777
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2019 00:11:59 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id t1so843823wrv.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Nov 2019 16:12:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o8ReOZ6XXNMKzQKNATFIKMkeakJRLJ22u88b9rZjJyw=;
	b=Rzuydh5NRL1IbbIgpel5A4pmegkkvJEDDZ06WQgqnl78r53DbIapSMjB0wavQYMsrF
	bjKcvoL2PJYDWM1qu+J+aqRwwnejrDvWkzA+0QqehIi3QyZs7W7+d/oThb0012kdg8KE
	ZhLajHl6s7DPADILbYulsWUw96/H7Wi7HVoi9S8ZcSBoaiqr6017tkZCqLAAPqOkpOuG
	XhXf+nNZEJ1MZ2t0H8RA2PSSpJ4fFYHwlpo9dzpXGc+4OYd3Hg52Qn+iRvMQkMokkh4B
	NpBoDD7lPeLL9D6LSqhCPS6Gtw6NYwoC3EZKVOFMrPCev1oQoyF68TCFGEuVup4Bs+vU
	EtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=o8ReOZ6XXNMKzQKNATFIKMkeakJRLJ22u88b9rZjJyw=;
	b=ULe8VGIwz4Vm+afYDMDVm2BHRBCLZm7EcHBjWFYsz2jDTFgh4sK8OH7bDITCxzhqcM
	UxhETD5OqvT1GHTMJxve0OxvqqaAWaivygBRsgmfHaCRqkuEs2mKc/t2PhJi5JlA497/
	CJkLAu0/gftSfx+zRToB6HVIxDRQmQDSHLuJEOKFrDYZnSbVc8d7Qi98W4sf4H5nyXwp
	MfmG/g3uam9fXbFXLYNP4XKOH7bHJAX2r2KHeB63pBy4KWa9WCRB1Mx4OZnS7+Els0vD
	B4dWwcZSteQUwZsBEIDz2ia89CwOW9x0JhCraQkNkFMjw8HtAtxeuGnK2efTtZjSZSgR
	2wow==
X-Gm-Message-State: APjAAAV+atmFvqjHKi+xYX+FFZlX698SPYCK5b+4Gp0Vg1gsgzQAp59t
	eTyeFRicEhrOnrd4F8JNfsQNZZyw
X-Google-Smtp-Source: APXvYqz9OwzMSVfoQH849pnsb3cJ/JR8WP8qFWaBWf1mnkCC5Qe1DrzGvDNMqWOY/hCxLC19zHzNlQ==
X-Received: by 2002:a5d:414a:: with SMTP id c10mr259245wrq.100.1573085520015; 
	Wed, 06 Nov 2019 16:12:00 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F438C581B49BA34826387FE.dip0.t-ipconnect.de.
	[2003:f0:7f43:8c58:1b49:ba34:8263:87fe])
	by smtp.gmail.com with ESMTPSA id n22sm203302wmk.19.2019.11.06.16.11.59
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 06 Nov 2019 16:11:59 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Nov 2019 01:11:49 +0100
Message-Id: <20191107001150.15288-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [PATCH] webkitgtk: upgrade 2.26.1 -> 2.26.2
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
X-List-Received-Date: Thu, 07 Nov 2019 00:12:01 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From announcement:

What's new in the WebKitGTK 2.26.2 release?
===========================================

  - Improve performance of querying system fallback fonts.
  - Don't use prgname in dbus-proxy socket path.
  - Fix thread-safety issues in image decoders.
  - Fix the build with WebDriver disabled.
  - Disable accelerated compositing when we fail to initialize the EGL dispaly under Wayland.
  - Fill the objects category in emoji picker.
  - Fix several crashes and rendering issues.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../webkit/{webkitgtk_2.26.1.bb => webkitgtk_2.26.2.bb}       | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-sato/webkit/{webkitgtk_2.26.1.bb => webkitgtk_2.26.2.bb} (97%)

diff --git a/meta/recipes-sato/webkit/webkitgtk_2.26.1.bb b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
similarity index 97%
rename from meta/recipes-sato/webkit/webkitgtk_2.26.1.bb
rename to meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
index 77e51e7d29..c3560e811b 100644
--- a/meta/recipes-sato/webkit/webkitgtk_2.26.1.bb
+++ b/meta/recipes-sato/webkit/webkitgtk_2.26.2.bb
@@ -21,8 +21,8 @@ SRC_URI = "http://www.webkitgtk.org/releases/${BPN}-${PV}.tar.xz \
            file://include_array.patch \
            "
 
-SRC_URI[md5sum] = "08145bd6c1587230f135921c142bc150"
-SRC_URI[sha256sum] = "6b4b21801d2b1008422a1075dbd6fb4ae8b5127503faf657cf9671289d9cd155"
+SRC_URI[md5sum] = "65e06fe73ee166447894aaea95038e3b"
+SRC_URI[sha256sum] = "6b80f0637a80818559ac8fd50db3b394f41cb61904fb9b3ed65fa51635806512"
 
 inherit cmake pkgconfig gobject-introspection perlnative distro_features_check upstream-version-is-even gtk-doc
 
-- 
2.21.0


