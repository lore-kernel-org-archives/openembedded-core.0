Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f180.google.com (mail-lb0-f180.google.com
	[209.85.217.180])
	by mail.openembedded.org (Postfix) with ESMTP id 4DA2B77308
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 13:10:22 +0000 (UTC)
Received: by lbbcs9 with SMTP id cs9so53291908lbb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Nov 2015 05:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=xGiV4mux4MQCHDPiM6qd8GJ3OfSf8066z9g/5Bf0sXw=;
	b=IGajHCgdWXSpK5YqrofmcHUHZOXn9nFP+IYADjZV4yANB91EBzshhpWN3LQxsyrCye
	6FCvPdMM3AS7VuUJBUtv8geXhepR+nigtoywI7s3gmOHk1oMnCwEn7962DyJV2UGtMO2
	w0Ki1NHmdvWU9QPB6AEK5UbxBrL9DDnNpyOcrqlNTrTf+dCfVLB6GiAWoPkRIp9b3WmZ
	I1HGWwzDDElOwwYS1Mf0Z2W70UYLzb4/FV3KwUJl0kPS5/vWCHd4HOd8eO3I8MAvGHaJ
	MSNxWobm0xuRNLokM4xOdX9y4xn8lnaLYI6THkd5ad/b68v4FEdIz/ptZD7YOx3A6Mo/
	HRLg==
X-Received: by 10.112.154.7 with SMTP id vk7mr10332084lbb.48.1447420221784;
	Fri, 13 Nov 2015 05:10:21 -0800 (PST)
Received: from localhost.localdomain (m83-185-243-97.cust.tele2.se.
	[83.185.243.97]) by smtp.gmail.com with ESMTPSA id
	f194sm3120646lfg.37.2015.11.13.05.10.20
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 13 Nov 2015 05:10:21 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 13 Nov 2015 14:10:14 +0100
Message-Id: <1447420214-18048-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] image-vm.bbclass: uses IMAGE_LINK_NAME
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
X-List-Received-Date: Fri, 13 Nov 2015 13:10:26 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Uses ${IMAGE_LINK_NAME} instead of ${IMAGE_BASENAME}-${MACHINE}.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/classes/image-vm.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/image-vm.bbclass b/meta/classes/image-vm.bbclass
index 5ddd1cb..575a4b7 100644
--- a/meta/classes/image-vm.bbclass
+++ b/meta/classes/image-vm.bbclass
@@ -10,7 +10,7 @@ do_bootdirectdisk[depends] += "${@'${INITRD_IMAGE}:do_rootfs' if '${INITRD_IMAGE
 
 # need to define the dependency and the ROOTFS for directdisk
 do_bootdirectdisk[depends] += "${PN}:do_rootfs"
-ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_BASENAME}-${MACHINE}.ext4"
+ROOTFS ?= "${DEPLOY_DIR_IMAGE}/${IMAGE_LINK_NAME}.ext4"
 
 # creating VM images relies on having a hddimg so ensure we inherit it here.
 inherit boot-directdisk
-- 
1.9.1


