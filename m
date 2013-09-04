Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ye0-f174.google.com (mail-ye0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id 1275C6B9AC
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Sep 2013 21:39:22 +0000 (UTC)
Received: by mail-ye0-f174.google.com with SMTP id q4so318063yen.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Sep 2013 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=gpY2zWo5p42mH6+L1Xq4LcjefldNqbDXWVYtlBtzss0=;
	b=oyNfjsXF/+1D525yfp1wuFa/q7/Gor/wNGW4ZLcOpjDZ056OJRobFSniDd22P4tDPa
	ca5wmUbtfqG46ZyRiorTj92Pf2wcQ+7Ni67n1ROAmO6yG21Tffr7HkmtSkKqtIpuD9JQ
	Z2tzVyvP0ya13vjBmIySC1pYS/tCizs4xh2fX7RwV/XD6Y2qmPVIMIrjWY/ByXyZUYzC
	77SKPgmpTUcdQ2GsH2uSSF+3sgb5Q8bguKFF3BTEuAMLAoEu7qFKiqTwF2efSXF8EDjE
	7jlPLqWjaeUJi1lJHdLamz7p6tigqgkffZf7FO/7HzPHuuuZwUnc/DOU2KRM1Z/VtzuF
	yapA==
X-Received: by 10.236.148.138 with SMTP id v10mr4870832yhj.27.1378330764612;
	Wed, 04 Sep 2013 14:39:24 -0700 (PDT)
Received: from nano.lab.ossystems.com.br ([187.23.155.55])
	by mx.google.com with ESMTPSA id
	r39sm31945363yhp.16.1969.12.31.16.00.00
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 04 Sep 2013 14:39:24 -0700 (PDT)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed,  4 Sep 2013 18:39:09 -0300
Message-Id: <1378330751-29127-1-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.8.4.rc3
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH v3 1/3] core-image-weston: Ensure wayland distro feature is enabled
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
X-List-Received-Date: Wed, 04 Sep 2013 21:39:23 -0000

Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---
Changes in v3: None
Changes in v2:
- New patch

 meta/recipes-graphics/images/core-image-weston.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/images/core-image-weston.bb b/meta/recipes-graphics/images/core-image-weston.bb
index 064133f..187523c 100644
--- a/meta/recipes-graphics/images/core-image-weston.bb
+++ b/meta/recipes-graphics/images/core-image-weston.bb
@@ -4,6 +4,8 @@ IMAGE_FEATURES += "splash package-management"
 
 LICENSE = "MIT"
 
-inherit core-image
+inherit core-image distro_features_check
+
+REQUIRED_DISTRO_FEATURES = "wayland"
 
 CORE_IMAGE_BASE_INSTALL += "weston weston-init weston-examples gtk+3-demo clutter-1.0-examples"
-- 
1.8.4.rc3


