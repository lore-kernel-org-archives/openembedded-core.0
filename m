Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f68.google.com (mail-ed1-f68.google.com
	[209.85.208.68])
	by mail.openembedded.org (Postfix) with ESMTP id 2C73960166
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 12:56:03 +0000 (UTC)
Received: by mail-ed1-f68.google.com with SMTP id r18so3732900edl.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jan 2020 04:56:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=LxlwhU58vLv0pnPxYkxIjkt1DZiJASpMbJH+FPhBPV0=;
	b=uvl9WHWPt41r2YwM7urISSkii2opIa/35wiQIrz3tFj8Ih13frjda4fnFrI7GZPlh2
	4sSB6JS4rOY87XVaO1rwO2qi6WEcgb4CJ2vm+dSHynavtOC+hRWoCHI4E3ABfYJGCEAD
	4G4sc6606nK7GiDA0sC6t1Oan4qMRa7j5NEbkq1ucpDZYpzl6eW1OXP020nz8gmOieyf
	ODUwq4MSmBCOopFD9X2yBnh8icU7txjT2c9/2pHXon59jrAVZjtCg4Eh/oidgnolEb2F
	GDmayCyPIKuawvrVjBzI1dhFc9YjAHJedbDyNNtzmZrUQl5nXH4r/eXxue3kcYjcozY2
	DSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=LxlwhU58vLv0pnPxYkxIjkt1DZiJASpMbJH+FPhBPV0=;
	b=nXATl1gqwWaaUSsvrCFVkQoXFtXGF93SRbaxXZlZrz6HC9WCZGerVgV08ibO2OGUjP
	bAH7b7jHCpvsWnK5SDMoRxjYUaLVjLuQJ8uMqU0dsn1FXma7dezhByI2YL6j8nl1M5lN
	El9AjThMtsBKSAsHukw/6QuS2Z9nhUEnbnCDbV4I1CmaByqt086009aF6lMEVsM7TdQZ
	A2RlglUSFtGPPkFQWojM9SnzQypxCsdjJCDQcVbPAunFuo/25dPFUl83LRAA74CO+ru5
	eIzqfm1Ga/CS3JffnLVvYQHPTc7H5eCf7stfEcAwHI9ONszBF+yy75h3fHdHDAspf4rv
	u59Q==
X-Gm-Message-State: APjAAAVtuRbO1iACc27vB4SIDNS5tkWcpGKb31A5NFbc6OfPqztbD7yU
	3TNbQFWZol4sRb1vks+3gDwKoiAy
X-Google-Smtp-Source: APXvYqzwPt0LOeHQJrZAS7siWtvUwpvZykM95Tbeq5UrdLlle2Bfe2DgCjCTUWQE+pLH9l9zpsylHA==
X-Received: by 2002:adf:97d6:: with SMTP id t22mr33662732wrb.407.1580288893296;
	Wed, 29 Jan 2020 01:08:13 -0800 (PST)
Received: from linux-f9zs.box (cable-95-168-152-69.cust.telecolumbus.net.
	[95.168.152.69]) by smtp.gmail.com with ESMTPSA id
	a62sm1550224wmh.33.2020.01.29.01.08.12
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Wed, 29 Jan 2020 01:08:12 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 29 Jan 2020 10:07:23 +0100
Message-Id: <20200129090738.1398-9-alex.kanavin@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129090738.1398-1-alex.kanavin@gmail.com>
References: <20200129090738.1398-1-alex.kanavin@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/24] linux-firmware: upgrade to latest revision
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
X-List-Received-Date: Fri, 31 Jan 2020 09:28:12 -0000
Content-Transfer-Encoding: 8bit

License-Update: Copyright years, file lists
Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 ...ux-firmware_20190815.bb => linux-firmware_20200117.bb} | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20190815.bb => linux-firmware_20200117.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
index d83000b64f0..8111c410161 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20190815.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20200117.bb
@@ -66,7 +66,7 @@ LICENSE = "\
 LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.adsp_sst;md5=615c45b91a5a4a9fe046d6ab9a2df728 \
                     file://LICENCE.agere;md5=af0133de6b4a9b2522defd5f188afd31 \
-                    file://LICENSE.amdgpu;md5=ab515ef6495ab5c5a3b08ab2db62df11 \
+                    file://LICENSE.amdgpu;md5=d357524f5099e2a3db3c1838921c593f \
                     file://LICENSE.amd-ucode;md5=3c5399dc9148d7f0e1f41e34b69cf14f \
                     file://LICENSE.amlogic_vdec;md5=dc44f59bf64a81643e500ad3f39a468a \
                     file://LICENCE.atheros_firmware;md5=30a14c7823beedac9fa39c64fdd01a13 \
@@ -88,6 +88,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.i2400m;md5=14b901969e23c41881327c0d9e4b7d36 \
                     file://LICENSE.i915;md5=2b0b2e0d20984affd4490ba2cba02570 \
                     file://LICENCE.ibt_firmware;md5=fdbee1ddfe0fb7ab0b2fcd6b454a366b \
+                    file://LICENSE.ice;md5=742ab4850f2670792940e6d15c974b2f \
                     file://LICENCE.IntcSST2;md5=9e7d8bea77612d7cc7d9e9b54b623062 \
                     file://LICENCE.it913x;md5=1fbf727bfb6a949810c4dbfa7e6ce4f8 \
                     file://LICENCE.iwlwifi_firmware;md5=3fd842911ea93c29cd32679aa23e1c88 \
@@ -98,6 +99,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.myri10ge_firmware;md5=42e32fb89f6b959ca222e25ac8df8fed \
                     file://LICENCE.Netronome;md5=4add08f2577086d44447996503cddf5f \
                     file://LICENCE.nvidia;md5=4428a922ed3ba2ceec95f076a488ce07 \
+                    file://LICENCE.NXP;md5=58bb8ba632cd729b9ba6183bc6aed36f \
                     file://LICENCE.OLPC;md5=5b917f9d8c061991be4f6f5f108719cd \
                     file://LICENCE.open-ath9k-htc-firmware;md5=1b33c9f4d17bc4d457bdb23727046837 \
                     file://LICENCE.phanfw;md5=954dcec0e051f9409812b561ea743bfa \
@@ -123,7 +125,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     file://LICENCE.xc4000;md5=0ff51d2dc49fce04814c9155081092f0 \
                     file://LICENCE.xc5000;md5=1e170c13175323c32c7f4d0998d53f66 \
                     file://LICENCE.xc5000c;md5=12b02efa3049db65d524aeb418dd87ca \
-                    file://WHENCE;md5=37a01e379219d1e06dbccfa90a8fc0ad \
+                    file://WHENCE;md5=cdcd9f664a404c681bb745bcac6253a3 \
                     "
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
@@ -192,7 +194,7 @@ NO_GENERIC_LICENSE[WHENCE] = "WHENCE"
 
 PE = "1"
 
-SRCREV = "07b925b450bfb4cf3e141c612ec5b104658cd020"
+SRCREV = "9c340bd1bdabf53808a9178a7be98c5f2ad599a7"
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git"
 
-- 
2.25.0


