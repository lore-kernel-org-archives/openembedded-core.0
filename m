Return-Path: <janklare@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 464376BC7A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 14:10:05 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id r12so31596870edo.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2019 07:10:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=ly2gZWF0NHUcUzYQrk0Et9yV4ukB+jdI8HIJSPZ6QcM=;
	b=MZhAHi5Y1QIlO11YKSjGCPG3eq9AC/VRq3M7c23COOpHBWlbf2htFoM0rs0ow863fH
	zMQbWgseSBdfO9D5vA6KQs46+DxARZIq2Ctx7gigSoi6OYE2jsJWNdPrvkxQMUSs/0k5
	nlCuv8xF8n9d3LH01vWfSUsa39a0fPXSBj9LzeGXAqaKvkmOdutCfB1/IPe6du5xY8Gc
	azSfaKke69vFoRdY44z135vUk0JNn/VZMQ6pfBgMKs//Qd6UDrIk46Bg0KUKh1TQ2/RI
	kzsJC7WvikGEFZw2YPJZGW4Ms6qimkLpptNHJeuI4QTLua9452YIzW7/oSLhSCVe1Tpe
	5Ylg==
X-Gm-Message-State: APjAAAXAt6muIrJm2sHwDmpEQp4Zy3FQ5ZDxcb6OTpGCsojD75C143NB
	DFeUqlIRDBh8uxtMsLBB55hjiU3k
X-Google-Smtp-Source: APXvYqwLdcnaxMtFrfQKcIsmiJ1VAT77WMn6ShDo1JbcZOoMs+g5hmMQiH/ANigYSou7bHScDdwiuQ==
X-Received: by 2002:a17:906:4048:: with SMTP id
	y8mr22010371ejj.35.1566915005852; 
	Tue, 27 Aug 2019 07:10:05 -0700 (PDT)
Received: from localhost.localdomain ([185.27.182.30])
	by smtp.gmail.com with ESMTPSA id j2sm3809885ejj.34.2019.08.27.07.10.05
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 27 Aug 2019 07:10:05 -0700 (PDT)
From: Jan Klare <jan.klare@bisdn.de>
To: openembedded-core@lists.openembedded.org
Date: Tue, 27 Aug 2019 16:10:02 +0200
Message-Id: <20190827141002.32302-1-jan.klare@bisdn.de>
X-Mailer: git-send-email 2.20.1 (Apple Git-117)
MIME-Version: 1.0
Subject: [PATCH] update SRCREV for systemd v241-stable branch to latest
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
X-List-Received-Date: Tue, 27 Aug 2019 14:10:06 -0000
Content-Transfer-Encoding: 8bit

* this update allows to pull in the latest backports that have been
applied to systemd v241-stable

Signed-off-by: Jan Klare <jan.klare@bisdn.de>
---
 meta/recipes-core/systemd/systemd.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/systemd/systemd.inc b/meta/recipes-core/systemd/systemd.inc
index 5bd88ed6ed..2b9c291959 100644
--- a/meta/recipes-core/systemd/systemd.inc
+++ b/meta/recipes-core/systemd/systemd.inc
@@ -14,7 +14,7 @@ LICENSE = "GPLv2 & LGPLv2.1"
 LIC_FILES_CHKSUM = "file://LICENSE.GPL2;md5=751419260aa954499f7abaabaa882bbe \
                     file://LICENSE.LGPL2.1;md5=4fbd65380cdd255951079008b364516c"
 
-SRCREV = "c1f8ff8d0de7e303b8004b02a0a47d4cc103a7f8"
+SRCREV = "511646b8ac5c82f210b16920044465756913d238"
 SRCBRANCH = "v241-stable"
 SRC_URI = "git://github.com/systemd/systemd-stable.git;protocol=git;branch=${SRCBRANCH}"
 
-- 
2.20.1 (Apple Git-117)


