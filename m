Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id 381116F894
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 17:34:31 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id bj1so9129397pad.30
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Mar 2014 10:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=Njm26SiHk28HmGHqDymiF8L+Q1uNzZBR15pefvsp8Iw=;
	b=woSyeGeCpTGQCDAa5XKFqTt3qHYV/N8EA90fWZYNY4kpfeoqSfzZTVDn8iiTshaiRu
	/kns6paZ/mSxn47mZOYdMfNlCgXDTh7Ve9inWSqQhJbu2fFsT4wiaeu0TlpnG0JhTtJQ
	vDxhqQKpyOUru9P4e6FHClIBClEC6DiXs6dSrdS4LAMJ3V1v+7qcMzVz4xUtCkdQhepI
	c2rpc6X0lmRbFs9Qx2owa+kFriWkGJ/1P8gUCGqDGNFi5mony1Q4hXbtP2duZLEgPH+9
	9krrKNgcsLi4JdpCQsE+8JmfdAO+WoidDyaAti/IFaK3fVpG7qTf4EIpNPkWEcVOMgws
	SXCg==
X-Received: by 10.68.196.226 with SMTP id ip2mr48605820pbc.106.1394559272405; 
	Tue, 11 Mar 2014 10:34:32 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-140-30.lightspeed.sntcca.sbcglobal.net. [99.57.140.30])
	by mx.google.com with ESMTPSA id
	it4sm76936668pbc.39.2014.03.11.10.34.31 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 11 Mar 2014 10:34:31 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Mar 2014 10:36:00 -0700
Message-Id: <1394559360-27718-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.0
Subject: [PATCH] pulseaudio: Upgrade 4.0 -> 5.0
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
X-List-Received-Date: Tue, 11 Mar 2014 17:34:32 -0000

bluetooth-proximity has been removed in 5.0

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-multimedia/pulseaudio/pulseaudio.inc                    | 2 --
 .../pulseaudio/{pulseaudio_4.0.bb => pulseaudio_5.0.bb}              | 5 ++---
 2 files changed, 2 insertions(+), 5 deletions(-)
 rename meta/recipes-multimedia/pulseaudio/{pulseaudio_4.0.bb => pulseaudio_5.0.bb} (63%)

diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
index 103f72e..3d35b6b 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio.inc
@@ -5,7 +5,6 @@ SECTION = "libs/multimedia"
 LICENSE = "GPLv2+ & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://GPL;md5=4325afd396febcb659c36b49533135d4 \
                     file://LGPL;md5=2d5025d4aa3495befef8f17206a5b0a1 \
-                    file://src/modules/bluetooth/proximity-helper.c;beginline=1;endline=25;md5=e4cc710e40a4d900c2c294167bc58270 \
                     file://src/pulsecore/resampler.h;beginline=4;endline=23;md5=c3d539b93f8c82a1780bfa3cfa544a95"
 
 DEPENDS = "libatomics-ops liboil libsamplerate0 libsndfile1 libtool"
@@ -145,7 +144,6 @@ RDEPENDS_pulseaudio-module-console-kit =+ "consolekit"
 RDEPENDS_pulseaudio-misc += "pulseaudio-module-cli-protocol-unix"
 
 FILES_pulseaudio-module-gconf += "${libexecdir}/pulse/gconf-helper"
-FILES_pulseaudio-module-bluetooth-proximity += "${libexecdir}/pulse/proximity-helper"
 FILES_pulseaudio-module-alsa-card += "${datadir}/pulseaudio/alsa-mixer"
 
 RDEPENDS_pulseaudio-server += "\
diff --git a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
similarity index 63%
rename from meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
rename to meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
index b419c54..f02359a 100644
--- a/meta/recipes-multimedia/pulseaudio/pulseaudio_4.0.bb
+++ b/meta/recipes-multimedia/pulseaudio/pulseaudio_5.0.bb
@@ -2,9 +2,8 @@ require pulseaudio.inc
 
 SRC_URI = "http://freedesktop.org/software/pulseaudio/releases/pulseaudio-${PV}.tar.xz \
            file://volatiles.04_pulse"
-
-SRC_URI[md5sum] = "591f211db2790a7e4d222f2dc6858db3"
-SRC_URI[sha256sum] = "35ceb36bb1822fe54f0b5e4863b4f486769fdfb8ff2111f01fd8778928f9cdae"
+SRC_URI[md5sum] = "c43749838612f4860465e83ed62ca38e"
+SRC_URI[sha256sum] = "99c13a8b1249ddbd724f195579df79484e9af6418cecf6a15f003a7f36caf939"
 
 do_compile_prepend() {
     mkdir -p ${S}/libltdl
-- 
1.9.0


