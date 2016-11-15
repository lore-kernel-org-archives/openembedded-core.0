Return-Path: <diego.ml@zoho.com>
X-Greylist: delayed 902 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 15 Nov 2016 09:49:04 UTC
Received: from sender153-mail.zoho.com (sender153-mail.zoho.com
	[74.201.84.153])
	by mail.openembedded.org (Postfix) with ESMTP id A05ED7199A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 09:49:04 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=e1r0FaW7caWc6jtIC8gKGJ7K4RG95JD1iigt35/il59NuyKKXkj4bQVnwtVNbAiDmnS8toUt8yBt
	Gw3Nd3ERMjg4djcgmaKgfga1i5vvTX53iC43zdd+oaIjRFsP5nHa  
Received: from ip-172-31-0-222.eu-west-1.compute.internal
	(ec2-52-48-117-71.eu-west-1.compute.amazonaws.com
	[52.48.117.71]) by mx.zohomail.com
	with SMTPS id 1479202439653843.0229522004327;
	Tue, 15 Nov 2016 01:33:59 -0800 (PST)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 09:39:45 +0000
Message-Id: <1479202785-20652-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.9.1
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [PATCH] xinput-calibrator: use up-to-date git version
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
X-List-Received-Date: Tue, 15 Nov 2016 09:49:05 -0000

Use up-to-date version from git. While currently there aren't official releases
newer than 0.7.5, quite some new features have been added in git, for example
the ability to disable the calibration screen timeout.

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 57c3a7a..791895a 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -5,13 +5,13 @@ LIC_FILES_CHKSUM = "file://src/calibrator.cpp;endline=22;md5=1bcba08f67cdb56f340
 DEPENDS = "virtual/libx11 libxi"
 
 PV = "0.7.5+git${SRCPV}"
-PR = "r6"
+PR = "r7"
 
 inherit autotools pkgconfig distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
+SRCREV = "03dadf55109bd43d3380f040debe9f82f66f2f35"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
-- 
1.9.1



