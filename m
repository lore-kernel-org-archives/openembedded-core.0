Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7ECBB77045
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 12:58:21 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id n5so78451750wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Jan 2016 04:58:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding;
	bh=jdSr3/nLEKYz0RgdVJRFwfMuvIsmY5cscB7JK/MFB9g=;
	b=vjfSyS8MW97Py31rcqvefa4R20H8/ZRm2x+E0ASdNhaJp7hiBjTsMvx8Gcj0jn4Y4r
	5P6XtqFi94/N7u02qpC4PVZTcd35AtY4fdU8ZNOHyb7fGG4dGf69nLfVAYGvdqqMgHAg
	8Z80tpqYEv/1j7sfdAzgcwncAcYE/1i4m7fW7SdujI84pIqb8xzJerhyWPm/8IUES45H
	MA+rhW3593lhEz9SmzlndlTF59+PpN1ZFA2xO2mhGrNCAXplCm3UYkoHoWMb+jhCm1rE
	6Gg1stPNAnejRvdC8+3m63fjOSHdBj9l4CUThREuvBMgP9cROkJRXXmcil6jBBLzqbpX
	XbbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-type:content-transfer-encoding;
	bh=jdSr3/nLEKYz0RgdVJRFwfMuvIsmY5cscB7JK/MFB9g=;
	b=GlQE4zgekJNYAjsx4dagWhqTCb2nqilVeOcb2tcfb5QsW/R/w9bKLgyXbrg3Wyga2e
	Gah3JEgNyjktaSisxfJypFQMNLO3SkpUYM1/kO3wdVT2sIkBjUhvT0mX6d3gHD0Fu1DJ
	FM+1OPzePZiCG6QLG11Q2lcPmbfILiC+8shWrrmuidyWuWq2m9OSvLFJQlst4fVHZW7Z
	m0Jy3KQ2tTewvmDW2ziJKzSn6FMqnNO8j1vPzNXIYEefmBn3ukRfdPcVwD9x2BTUPqWH
	qtRi3wKIuxHIERKsJ5F2ZDA5hZCqX6rdmxlFn9AvPGdnNu4lKOh3NSrIpKt41uYNu5WR
	/71A==
X-Gm-Message-State: AG10YOThDD5D4o+2AhfqhlCs/YOuvZkzPZhtDEl3TMBMrrUvwnVjovLo9M9fSu5McXBG/A==
X-Received: by 10.28.223.67 with SMTP id w64mr18896127wmg.28.1453726701610;
	Mon, 25 Jan 2016 04:58:21 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-198-253-155.hsi05.unitymediagroup.de. [176.198.253.155])
	by smtp.googlemail.com with ESMTPSA id
	m206sm16044667wmf.16.2016.01.25.04.58.20
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 25 Jan 2016 04:58:21 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 25 Jan 2016 13:57:52 +0100
Message-Id: <1453726672-7954-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.0
MIME-Version: 1.0
Subject: [PATCH] xf86-input-libinput: initial add 0.16.0
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
X-List-Received-Date: Mon, 25 Jan 2016 12:58:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Some distributions already use this as input default. It is planned to include
it in xorg server 1.20. To

* prepare usage now
* make merge more easier later

include it in oe-core now.

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 .../xorg-driver/xf86-input-libinput_0.16.0.bb                 | 11 +++++++++++
 1 file changed, 11 insertions(+)
 create mode 100644 meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.16.0.bb

diff --git a/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.16.0.bb b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.16.0.bb
new file mode 100644
index 0000000..0252baf
--- /dev/null
+++ b/meta/recipes-graphics/xorg-driver/xf86-input-libinput_0.16.0.bb
@@ -0,0 +1,11 @@
+require xorg-driver-input.inc
+
+SUMMARY = "Generic input driver for the X.Org server based on libinput"
+LIC_FILES_CHKSUM = "file://COPYING;md5=5e6b20ea2ef94a998145f0ea3f788ee0"
+
+DEPENDS += "libinput"
+
+SRC_URI[md5sum] = "2c8cb520f88da7bafaceebc0b34ea1d4"
+SRC_URI[sha256sum] = "fdade531e91e79acf6dce8ac55fa4f65abe3f1358c5d3d777ae48dbc74b76f49"
+
+FILES_${PN} += "${datadir}/X11/xorg.conf.d"
-- 
2.5.0


