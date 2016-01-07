Return-Path: <armccurdy@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 3E5576FF97
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jan 2016 20:53:23 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id wp13so201964619obc.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jan 2016 12:53:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RKRc2BglZTKG6ll3A+vdI/ZXz/B0S3ADswvoE0eQWUU=;
	b=i+Kvh5nfdfJFSssQ7Stg3bZYPEG67YlHnGz4liWitld/I2Jyt0/T3gj2KgPSQjfyEM
	sfObpWoWUfu/OV4kgybscp1zryLJ7pdiXD2ufXtG5UJxczd4OoXqTju+7WF0O0b+gAdB
	zlJQJTA2KlZjRD5cHpoc7ibCXRoGJjsOZpJMx74E7n4XmamcwyPIju2vUGJ08fNWX9dD
	93NWmfM8Bo9aUiyarc0D5+Be4EXdDowBEtC9IQqcXp0fMKGJu0EFclJ8xmSlLnJXSyRz
	YPi9eyai4/JSI/VSa5oZsqyDaCLYyy8NZqcyo9J6MhUTUHMYkYV+jdtHmeG99aNXje+v
	Qbvg==
X-Received: by 10.182.73.225 with SMTP id o1mr80687077obv.80.1452200004418;
	Thu, 07 Jan 2016 12:53:24 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	mm4sm42079156obb.1.2016.01.07.12.53.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 07 Jan 2016 12:53:23 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  7 Jan 2016 12:53:10 -0800
Message-Id: <1452199993-3885-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
References: <1452199993-3885-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/4] qemu.bbclass: duplicate armv7a over-ride for armv7ve
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
X-List-Received-Date: Thu, 07 Jan 2016 20:53:24 -0000

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/qemu.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/qemu.bbclass b/meta/classes/qemu.bbclass
index 315c17f..4ec7657 100644
--- a/meta/classes/qemu.bbclass
+++ b/meta/classes/qemu.bbclass
@@ -43,6 +43,7 @@ QEMU_OPTIONS[vardeps] += "QEMU_EXTRAOPTIONS_${PACKAGE_ARCH}"
 QEMU_EXTRAOPTIONS_iwmmxt    = " -cpu pxa270-c5"
 QEMU_EXTRAOPTIONS_armv6     = " -cpu arm1136"
 QEMU_EXTRAOPTIONS_armv7a    = " -cpu cortex-a8"
+QEMU_EXTRAOPTIONS_armv7ve   = " -cpu cortex-a8"
 QEMU_EXTRAOPTIONS_ppce500v2 = " -cpu e500v2"
 QEMU_EXTRAOPTIONS_ppce500mc = " -cpu e500mc"
 QEMU_EXTRAOPTIONS_ppce5500 = " -cpu e5500"
-- 
1.9.1


