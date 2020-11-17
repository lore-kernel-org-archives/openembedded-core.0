Received: from mail-qt1-f196.google.com (mail-qt1-f196.google.com [209.85.160.196])
 by mx.groups.io with SMTP id smtpd.web11.9454.1605626694069357401
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 07:24:54 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=XTA7838C;
 spf=pass (domain: gmail.com, ip: 209.85.160.196, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f196.google.com with SMTP id t5so15825815qtp.2
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 07:24:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fXWFIUwo9AgPc60l4arjE+DHZlKvCnvQ9D9D2odVCEA=;
        b=XTA7838CGXci7ygFzjmfjZnJkxJh/3FA8S9BxT3ea5Vi06B3GMtYaaGlhKIYcgXA7D
         U4CZp2hdMNbDNNLAWEtf+jWwDnaKALkMuC/lqhFf03/rCiICziQ+2AjPnBmbSTm2FKqA
         9WskWYsSTDMxz7OGwerQ7WoltRYlXZT1CzIJ5wBTOGIn3ykM7fOLMDydpsX9cVLHn8Zi
         nMjZS/iY+5vqYeuxmTzohs5Hq6kugNsATiv+AH4hj0g3UBoUYrndmkk15Eox5BX53ApD
         iPQ9/UNNEXwk8TVCq7ptXP4bzBUEw8m7R/Xd7IEQwOLf/826aoAYXoT4TNcm5KCC+3+2
         vJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fXWFIUwo9AgPc60l4arjE+DHZlKvCnvQ9D9D2odVCEA=;
        b=fCCFxWRrGQ2PeudXlhkhnucYLvIPhWXdtoxfndGu9JawHjFhxg7And5HYUpQ2TxapS
         MwLCA15VCskr64+iAM1ir9w4ah341kZOtYo+0ZJSfEAVkk7ToyUau0Ad7ic++LV2Ttvg
         /+71YFsn1+0EjmPoc+LDeDmGhKQg54CbYThpPfseLiT+DjIYyoi50o6t7B5JThtyNZ37
         Jyrzsh1dKgEjh3b+6NEu/nPeoBuczsnrt6OyvZxdQ3cPfHF1AuTAKeZWtbUOkNZiZ95Q
         Mn9I6304ZgsQl7yiDkxcJrtbqleHDOnyoH3VJ/b/0SPgD23Dx82bNmTdrhBdeIVAcs93
         L78Q==
X-Gm-Message-State: AOAM533wShIEa+j0z977voXT9UATGQrgz4EIKvRuWPIOqit6XCWayzXv
	twtkZpg25nZvpJxA02fwm4ds7fG0HHFZ5PE6
X-Google-Smtp-Source: ABdhPJyDY29d4VnFe2MBnwWBFqT7D0xmp+vgRtZ1PckBRDxIGOrwID+X3i6yQwZIlulecXDRjPnkWw==
X-Received: by 2002:ac8:5304:: with SMTP id t4mr141032qtn.77.1605626693248;
        Tue, 17 Nov 2020 07:24:53 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from localhost.localdomain (cpe04d4c4975b80-cm64777d5e8820.cpe.net.cable.rogers.com. [174.112.165.127])
        by smtp.gmail.com with ESMTPSA id u24sm14537923qtb.33.2020.11.17.07.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2020 07:24:52 -0800 (PST)
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
To: richard.purdie@linuxfoundation.org
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 09/11] linux-yocto/5.8: config cleanup / warnings
Date: Tue, 17 Nov 2020 10:24:35 -0500
Message-Id: <141e58104ae415ad7c619ac0887b1caefc536ea4.1605626488.git.bruce.ashfield@gmail.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <cover.1605626488.git.bruce.ashfield@gmail.com>
References: <cover.1605626488.git.bruce.ashfield@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bruce Ashfield <bruce.ashfield@gmail.com>

Integrating the following commit(s) to:

    d5ca337b7e9 bsp/mti-malta64: fix warning of CONFIG_SCSI_VIRTIO on qemumips64
    63c7a70c90f net/l2tp.cfg: fix CONFIG_PPPOL2TP mismatched warnings

Signed-off-by: Bruce Ashfield <bruce.ashfield@gmail.com>
---
 meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb   | 2 +-
 meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb | 2 +-
 meta/recipes-kernel/linux/linux-yocto_5.8.bb      | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
index 8b6a742834..d0f3ecb8c8 100644
--- a/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-rt_5.8.bb
@@ -12,7 +12,7 @@ python () {
 }
 
 SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
+SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
 
 SRC_URI = "git://git.yoctoproject.org/linux-yocto.git;branch=${KBRANCH};name=machine \
            git://git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-5.8;destsuffix=${KMETA}"
diff --git a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
index 5045f6aa5a..536bc26c5e 100644
--- a/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto-tiny_5.8.bb
@@ -17,7 +17,7 @@ KCONF_BSP_AUDIT_LEVEL = "2"
 
 SRCREV_machine_qemuarm ?= "c548e45d83f9cdf224d2a7e318d68aecf390f3bd"
 SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
+SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
 
 PV = "${LINUX_VERSION}+git${SRCPV}"
 
diff --git a/meta/recipes-kernel/linux/linux-yocto_5.8.bb b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
index d4f780ce44..c468170968 100644
--- a/meta/recipes-kernel/linux/linux-yocto_5.8.bb
+++ b/meta/recipes-kernel/linux/linux-yocto_5.8.bb
@@ -21,7 +21,7 @@ SRCREV_machine_qemux86 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
 SRCREV_machine_qemux86-64 ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
 SRCREV_machine_qemumips64 ?= "a92b9df163d6e6b05bf1e7137d6868760537f326"
 SRCREV_machine ?= "d0ff030adc1f65129e29c7110c9be2adaa0533f2"
-SRCREV_meta ?= "cc4fd81dde0725d813f988fe3dd4787d2084f997"
+SRCREV_meta ?= "d5ca337b7e9b5834c83b629b5456bb4744efa644"
 
 # remap qemuarm to qemuarma15 for the 5.8 kernel
 # KMACHINE_qemuarm ?= "qemuarma15"
-- 
2.19.1

