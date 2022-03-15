Return-Path: <changhyeok.bae@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B2B8C433EF
	for <webhook@archiver.kernel.org>; Tue, 15 Mar 2022 23:16:17 +0000 (UTC)
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by mx.groups.io with SMTP id smtpd.web09.18702.1647386176153545144
 for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 16:16:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZVWwsTGQ;
 spf=pass (domain: gmail.com, ip: 209.85.218.46,
 mailfrom: changhyeok.bae@gmail.com)
Received: by mail-ej1-f46.google.com with SMTP id qt6so705229ejb.11
        for <openembedded-core@lists.openembedded.org>;
 Tue, 15 Mar 2022 16:16:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id;
        bh=NPiIvjuFhmhZls+mgwCFRYKBJK23jLmtZpOWIhcfghE=;
        b=ZVWwsTGQEmmsFCDVl+XnrEZN2kUeuynWXemtuCNCGc4hmAgSTgN0IQAjqlizACf0gC
         zLUxJzXf3iA5UoIrUPSANexiQj1uKwSI2kWEz6ckiiaKzWnTQairoFWJ7Th5jwWKqAlR
         jO5t8SSaxxoPihwP3XUjt/CD590VddWwgTX7XvbVvh83MQ7IQeqNSgnVFQrf2cFYbOQ3
         orOxgsVgkPz9Awab3pa2/t93mu2UW0/h26E3jPr1XzaAKhHcQJYByPVjn06IVB2CG3fw
         HUV9b+I03g/pNA0Bd7xL83pteA82w58QerBf33IOaOLuobenVKFRcZZlWK4+xz/yfwQY
         O4mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=NPiIvjuFhmhZls+mgwCFRYKBJK23jLmtZpOWIhcfghE=;
        b=yq7YSf3z3r8HNPAop+2G5E+wywfWZvqmJJPOAzVvKB7h+i4OH4ktFfeivF6WiomDbq
         X5WaybVWDnL8IZ457Bz4xbM0SNY43XRKnTFDLoXwhtgMvJo2N7XoRMv2EDPK3aXe2E4H
         Xrhorne8uehtCfM453LZhTAdPjDuARCQuAJ30T1A387w4RWFPQ7ZJZNJubKM27MZpolK
         CCKCm2OeFy/3n5dh2lr9PdSIZeQko3MNroeVSwIJQk3cRYsFjSwZkY8MbKDPtQ68KGyl
         HpJJvNYzznGKZ6QWf9N2AorjNBCDvxLHAtWih4rzs3FaytmBHDqQrBz3NQlvd4ZRb+hZ
         PGoQ==
X-Gm-Message-State: AOAM531SLkYHOg0xgqDH8R6RBhrl3VJc4me04HHjwGLU88G0RdIclkUp
	IEul4OcuulYUar/s7f5Q4cTRKeX/p28=
X-Google-Smtp-Source: 
 ABdhPJzrZFEc0LaA2yHt+BXJJZ9go+79UdYFD2zsYK7vJpAL0uGATAVHmp+m1GvZRSyUy2L0STQRqA==
X-Received: by 2002:a17:907:7e96:b0:6da:f7ee:4a25 with SMTP id
 qb22-20020a1709077e9600b006daf7ee4a25mr24890960ejc.436.1647386174274;
        Tue, 15 Mar 2022 16:16:14 -0700 (PDT)
Received: from localhost.localdomain (ip5f5aec99.dynamic.kabel-deutschland.de.
 [95.90.236.153])
        by smtp.gmail.com with ESMTPSA id
 b24-20020a170906491800b006db31196e2bsm141992ejq.218.2022.03.15.16.16.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Mar 2022 16:16:13 -0700 (PDT)
From: Changhyeok Bae <changhyeok.bae@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Changhyeok Bae <changhyeok.bae@gmail.com>
Subject: [OE-core][PATCH] mobile-broadband-provider-info: upgrade 20210805 ->
 20220315
Date: Tue, 15 Mar 2022 23:16:08 +0000
Message-Id: <20220315231608.43543-1-changhyeok.bae@gmail.com>
X-Mailer: git-send-email 2.17.1
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 15 Mar 2022 23:16:17 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163317

Signed-off-by: Changhyeok Bae <changhyeok.bae@gmail.com>
---
 .../mobile-broadband-provider-info_git.bb                  | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
index 4246f4dcbd..781b9216c5 100644
--- a/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
+++ b/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_git.bb
@@ -4,11 +4,12 @@ DESCRIPTION = "Mobile Broadband Service Provider Database stores service provide
 SECTION = "network"
 LICENSE = "PD"
 LIC_FILES_CHKSUM = "file://COPYING;md5=87964579b2a8ece4bc6744d2dc9a8b04"
-SRCREV = "11f2247eccd3c161b8fd9b41143862e9fb81193c"
-PV = "20210805"
+
+SRCREV = "4cbb44a9fe26aa6f0b28beb79f9488b37c097b5e"
+PV = "20220315"
 PE = "1"
 
-SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=master"
+SRC_URI = "git://gitlab.gnome.org/GNOME/mobile-broadband-provider-info.git;protocol=https;branch=main"
 S = "${WORKDIR}/git"
 
 inherit autotools
-- 
2.17.1


