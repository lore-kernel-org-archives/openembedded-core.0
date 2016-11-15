Return-Path: <diego.ml@zoho.com>
Received: from sender153-mail.zoho.com (sender153-mail.zoho.com
	[74.201.84.153])
	by mail.openembedded.org (Postfix) with ESMTP id A830B71A1D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2016 11:02:36 +0000 (UTC)
DomainKey-Signature: a=rsa-sha1; q=dns; c=nofws; s=zapps768; d=zoho.com; 
	h=from:to:cc:subject:date:message-id; 
	b=EDKdpScjIIES/tzbIJcq83H3xt3XTNCzKb/YI1V8xn7k9DnOfMHKfI0GMyVhA7YelpypEDmkf8aT
	xaP8XLWH007BQNPWGjhHz+V+gACFkRwrtXmnW/XYprSU9zXkjl9Z  
Received: from ip-172-31-0-222.eu-west-1.compute.internal
	(ec2-52-48-117-71.eu-west-1.compute.amazonaws.com
	[52.48.117.71]) by mx.zohomail.com
	with SMTPS id 1479207748114388.03647647098774;
	Tue, 15 Nov 2016 03:02:28 -0800 (PST)
From: Diego Rondini <diego.ml@zoho.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Nov 2016 11:08:29 +0000
Message-Id: <1479208109-20859-1-git-send-email-diego.ml@zoho.com>
X-Mailer: git-send-email 1.9.1
Cc: Diego Rondini <diego.ml@zoho.com>
Subject: [PATCH v2] xinput-calibrator: use up-to-date git version
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
X-List-Received-Date: Tue, 15 Nov 2016 11:02:36 -0000

Use up-to-date version from git. While currently there aren't official releases
newer than 0.7.5, quite some new features have been added in git, for example
the ability to disable the calibration screen timeout.

Signed-off-by: Diego Rondini <diego.ml@zoho.com>
---
 meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
index 57c3a7a..87f09e7 100644
--- a/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
+++ b/meta/recipes-graphics/xinput-calibrator/xinput-calibrator_git.bb
@@ -11,7 +11,7 @@ inherit autotools pkgconfig distro_features_check
 # depends on virtual/libx11
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRCREV = "c01c5af807cb4b0157b882ab07a893df9a810111"
+SRCREV = "03dadf55109bd43d3380f040debe9f82f66f2f35"
 SRC_URI = "git://github.com/tias/xinput_calibrator.git \
            file://30xinput_calibrate.sh \
            file://Allow-xinput_calibrator_pointercal.sh-to-be-run-as-n.patch \
-- 
1.9.1



