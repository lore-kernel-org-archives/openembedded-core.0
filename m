Return-Path: <armccurdy@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id EACF465CBB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Apr 2016 00:28:39 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id g185so709664ioa.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Apr 2016 17:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=n74iAwrhnZEJrUrkoyO17pEk5wcsOHu20Nwerr7rjwc=;
	b=i2MsGULNPtYNrTHyO7fFZCB0tpowBSSJVPY5/+bQgVynk7cPJGCD6p2lmcH2FvD2sX
	oCKFnIfESc9QKhrRvEgtGlvXI1pxaDC7SPmv1E6GybLdnwPb17K6bG20enpvEusvpLfb
	HWFKpFaBpQtYTgMir2NKCQIqvFinapuBa7aBVUQ3BGkRZEMmga4H1zG9aSjCgXN4EaQw
	n+K5RNzLoiG5jntHUpkGMHKfVT/tmhz8n0s22IIUqTp+dmw57JB49hinaEPTg+dopsBs
	eA5JOT82CFatDCg6yc/cHnDLz2KjJRYH+RS3vm6ffTrA0X7Ytq/lF+EPz5vXz/ZPVR29
	SS5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=n74iAwrhnZEJrUrkoyO17pEk5wcsOHu20Nwerr7rjwc=;
	b=AYOBMxhQRkVlcyeBBRvy4Fg3qcEPSjpzFJ6SqR9KxIhYLBjZPrXHB3MdSMbNwaOZE6
	RkBdO1Ss4Yx8A1OTGlcobFJTQWhBpo8M2GwLRZhsR9DLh2gObUb6+/XJa1mdZfyqcapD
	rdsAUi6C0XDM8+STwIX5KDaiReFdrolCIOgdd4SX/pojZJaEPV5kZVtDGG/H6TkC8U4G
	jdDUbTuGmm0H9RYAcdueUoUKMz94coptGh2fO9wHwkmmS2FZsKkCbDqu9y411xLp5Xw+
	S4cf1pO7/ybIJtWu46iH6vTWfBw6FI5mswNntXDeHD0OEugpaFCr/B83cDBmGzfGLKPf
	tx7w==
X-Gm-Message-State: AOPr4FVm7mF+oHwFT2kGOcOS9aNSn1l2TRKPV3kTyEtLLLlt6I8xumrOBETakP01blSImw==
X-Received: by 10.107.158.134 with SMTP id h128mr827539ioe.153.1460420919756; 
	Mon, 11 Apr 2016 17:28:39 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id
	j34sm18580510ioo.20.2016.04.11.17.28.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 11 Apr 2016 17:28:38 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 11 Apr 2016 17:28:27 -0700
Message-Id: <1460420908-16890-2-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1460420908-16890-1-git-send-email-armccurdy@gmail.com>
References: <1460420908-16890-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 1/2] pbzip2: fix LIC_FILES_CHKSUM following 1.1.12 -> 1.1.13 upgrade
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
X-List-Received-Date: Tue, 12 Apr 2016 00:28:40 -0000

The 1.1.3 update to COPYING changes a reference to pbzip2's version
number and release date. LIC_FILES_CHKSUM should have been updated
accordingly as part of the 1.1.12 -> 1.1.13 upgrade:

  http://git.openembedded.org/openembedded-core/commit/?id=80712b7c0959c197ccb21efd5e7a963d1d2e83ae

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
index b3c5975..77e70fc 100644
--- a/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
+++ b/meta/recipes-extended/pbzip2/pbzip2_1.1.13.bb
@@ -6,7 +6,7 @@ newer (ie: anything compressed with pbzip2 can be decompressed with bzip2)."
 HOMEPAGE = "http://compression.ca/pbzip2/"
 SECTION = "console/utils"
 LICENSE = "BSD"
-LIC_FILES_CHKSUM = "file://COPYING;md5=4c4f2edec9679d5abef3514a816b54a4"
+LIC_FILES_CHKSUM = "file://COPYING;md5=398b8832c6f840cfebd20ab2be6a3743"
 
 DEPENDS = "bzip2"
 DEPENDS_append_class-native = " bzip2-replacement-native"
-- 
1.9.1


