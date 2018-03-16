Return-Path: <otavio.salvador@gmail.com>
Received: from mail-qk0-f193.google.com (mail-qk0-f193.google.com
	[209.85.220.193])
	by mail.openembedded.org (Postfix) with ESMTP id 44DF871A70
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 21:45:30 +0000 (UTC)
Received: by mail-qk0-f193.google.com with SMTP id o184so12576850qkd.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2018 14:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:organization;
	bh=9Lj/KHV1L3i5vL8vue/4o+JYaMGxMEaRzQkyMoU1qYQ=;
	b=mTpRWKPAAqdi/B+eYkoM7HqHs9nCL/QQq8NA0Ng79/DjAZGDfUDq/Ks9scF74IdYZ7
	8Kut47xsoQzV/vmYK8OhY9Xyp+8IPzSLPQn/J+sxxbwnktsNdeDyLnib30VvDU1nDYfs
	rp7jISyQUdysQHLNkUacGWO8Xe0yXf1CF9kSstziWDr5q0O3IqsC+fN8b+tyOPstjZ8O
	vs+pflIPFEdXakO0Qlk+tBvzXINNp3ho8m998aDjJ4V55JIT4T5zOG0DxJHpQmuvYiYQ
	9DWnybZYaatN1ntRhY+KMnmxPV+kU1j3W91KZyYJkYnmse7rCUJt/zj4IftSJn022no0
	gStQ==
X-Gm-Message-State: AElRT7HvLPOL18uTGNDCKxqcKourqTqae0KX8Fawix9TuRbVU/4PEoFH
	IAQIMlsWqUB1KYy5JHE3eAyTpg==
X-Google-Smtp-Source: AG47ELvKKS+F2auFb9S+IAMUVMvp1rwIbTogeB7HNSAgKFgDcJeZy3FZoHuOzmznkREi8uMO5ygENw==
X-Received: by 10.55.31.165 with SMTP id n37mr4902469qkh.184.1521236730398;
	Fri, 16 Mar 2018 14:45:30 -0700 (PDT)
Received: from localhost.localdomain ([181.220.79.73])
	by smtp.gmail.com with ESMTPSA id
	u27sm1413005qtj.51.2018.03.16.14.45.27
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 16 Mar 2018 14:45:29 -0700 (PDT)
Received: by localhost.localdomain (sSMTP sendmail emulation);
	Fri, 16 Mar 2018 18:45:23 -0300
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Mar 2018 18:45:22 -0300
Message-Id: <20180316214522.18211-1-otavio@ossystems.com.br>
X-Mailer: git-send-email 2.16.2
Organization: O.S. Systems Software LTDA.
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH] linux-firmware: upgrade to 4c0bf11 revision
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
X-List-Received-Date: Fri, 16 Mar 2018 21:45:31 -0000

License-Update: new releases and copyright years updated.
Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
---

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
index 816c7a0d78f..c96588473b6 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_git.bb
@@ -118,7 +118,7 @@ LIC_FILES_CHKSUM = "\
     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-    file://WHENCE;md5=99d352987a7e29460bcf9b26d146a95a \
+    file://WHENCE;md5=ec6f70c8a1104ff87f6aa144d926f0dd \
 "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -181,7 +181,7 @@ NO_GENERIC_LICENSE[Firmware-xc5000] = "LICENCE.xc5000"
 NO_GENERIC_LICENSE[Firmware-xc5000c] = "LICENCE.xc5000c"
 NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
-SRCREV = "65b1c68c63f974d72610db38dfae49861117cae2"
+SRCREV = "4c0bf113a55975d702673e57c5542f150807ad66"
 PE = "1"
 PV = "0.0+git${SRCPV}"
 
-- 
2.16.2


