Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E64C3600E
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:29:42 +0000 (UTC)
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
 by mx.groups.io with SMTP id smtpd.web10.33404.1743020973821978558
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:29:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=CMT73Eiy;
 spf=pass (domain: gmail.com, ip: 209.85.216.50, mailfrom: hiagofranco@gmail.com)
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-301c4850194so262205a91.2
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:29:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743020973; x=1743625773; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HGyPwcCKQqT8wVsHgb7C1lDXSroZDgr7pB0rpOrOD5I=;
        b=CMT73Eiy6WNlrPWua4PthZ+qDA3p3L7VcvBuXuWq2OlhNckEryEvPAKtI+lXKrkAr4
         O3GD46fwokSbhijhxljF87k6Ttvd1W0X9b4QIAZkgSxsW+GbEXGyluJQVslX4j8zguf3
         E4WG+SkEH35Z+ZP9VZfC+8mew8A/DiQKHbxTJVIExeV68muIc0tptl7USRzsEjIHLQr/
         GFFZNI5oe9FlVTUrL9SAs9FaaoooUQUKG69bhw9m0tO/9iiHPN5PWSOaHhuU0c09srG3
         w3wb/0AbNvtZdxeCptTmklKDpEspGMoqkkXndAboFqpUJhbi5cCjMWqUymdX9WfdTfFh
         QE3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743020973; x=1743625773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HGyPwcCKQqT8wVsHgb7C1lDXSroZDgr7pB0rpOrOD5I=;
        b=nvTKRm2csWr1LslCLq558t1C0xb3oB7Czss4LGp4sC7WG7UED3FC/j492XQEU2oHk+
         S9ciXwjx8EytAJT4I//fUM3jSN2ahOH8CDiDbI7WWhoKj8Y072mI/L6YeDO/1DhUKzWg
         QOtUBMHXnHz/UBzsWYbZAjowIYy+SbwNcTlKJ+yU1GwxfbSnZysLluCvbgt20H/7iB3b
         fKzymWzGocLPVrqtBa87WPgHUqw3Y6r9QJ1XjPtCPhydYCNn/4gK+dxEb5I/UYx83JoL
         utWBtjzNRpvLHzdlsUJSp0ixgz3zQOjfDML0yKwdt8iCDu0nWlukHFO+IMKiYS5zLW4+
         8stg==
X-Gm-Message-State: AOJu0YyBjAyDnURIlxJQuf2YTBNRbj2IJKBm5rqHgW7pb3J1Q/+9MHHW
	dbC1GaVpXdUC3qZifkAE/84/AuUT34IVT9yMHu1Fc/nOknNClgcUF4hj6dvC
X-Gm-Gg: ASbGncvGDmGQJuk4L9ppCDwBymN9b2FiSUHJOrrrTu1bTc0vLkv9IEvvCbV1sD9d3r/
	r7ypzSAZmQvX/AmIEvETFUQ5HhGuTIuVbVrf/BF2iKeoTjQjj+54CzwgBZDojXtiped0jAC1dOi
	ZfOnFQGyZ+a4MTjW83qatCoPprJ8iF4P6v+k+A4TXMe6xeEBUzmN1lySwd2b4gbi8MWD2xZcHH+
	y/SYLYZjVTzi6yy3PmbdHdbb6HHkHSURyvMJgOqhTQaQnRL9WmcPFBRalPZu4BN1sVOYAfiLxID
	78zTgWyMN0Pwo3h6Il6AxRMEMHWE/5B/O53GtEEbO93fgf7mvj0/+I5Riyng9zf8HSH6+UEQCcQ
	UMg==
X-Google-Smtp-Source: AGHT+IHljjvM9N9RZiUKlOyq9PdZXX5wYFIEFe3aSTiF2/voTx01VAGy8UrTl6l9l7pBdgsEA7ZSKg==
X-Received: by 2002:a17:90b:278c:b0:2ff:6fc3:79c4 with SMTP id 98e67ed59e1d1-303a85c80b8mr1527574a91.27.1743020972867;
        Wed, 26 Mar 2025 13:29:32 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:29:32 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 11/31] linux-firmware: upgrade 20241017 -> 20241110
Date: Wed, 26 Mar 2025 17:27:57 -0300
Message-Id: <20250326202817.64437-12-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:29:42 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213671

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

License-Update: additional files

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 59f41bcfd3e5fc266335e6e417e5160254e387d8)
---
 ...om-Add-link-for-QCS6490-GPU-firmware.patch | 31 -------------------
 ...20241017.bb => linux-firmware_20241110.bb} |  5 ++-
 2 files changed, 2 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
 rename meta/recipes-kernel/linux-firmware/{linux-firmware_20241017.bb => linux-firmware_20241110.bb} (99%)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch b/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
deleted file mode 100644
index 7a07ef97f114..000000000000
--- a/meta/recipes-kernel/linux-firmware/linux-firmware/0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch
+++ /dev/null
@@ -1,31 +0,0 @@
-From 62fa39d0b4384be8f14d837ea79183ad93d0996c Mon Sep 17 00:00:00 2001
-From: Akhil P Oommen <quic_akhilpo@quicinc.com>
-Date: Fri, 1 Nov 2024 21:52:24 +0530
-Subject: [PATCH] qcom: Add link for QCS6490 GPU firmware
-
-Create a symlink between qcom/qcm6490/a660_zap.mbn and
-qcom/qcs6490/a660_zap.mbn.
-
-Signed-off-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
-Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
-Upstream-Status: Submitted [https://lore.kernel.org/linux-firmware/ctvtlkh4t54wdtwcw3jnbyi7xwks534k5ksvjtv6pt2zrr72wn@h5k6vfk7bzqe]
----
- WHENCE | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/WHENCE b/WHENCE
-index bdee94fe33fc..b7ef9bdd5b59 100644
---- a/WHENCE
-+++ b/WHENCE
-@@ -6145,6 +6145,7 @@ File: qcom/sm8250/a650_zap.mbn
- File: qcom/a660_gmu.bin
- File: qcom/a660_sqe.fw
- File: qcom/qcm6490/a660_zap.mbn
-+Link: qcom/qcs6490/a660_zap.mbn -> ../qcm6490/a660_zap.mbn
- File: qcom/a702_sqe.fw
- File: qcom/leia_pfp_470.fw
- File: qcom/leia_pm4_470.fw
--- 
-2.39.5
-
diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
similarity index 99%
rename from meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
rename to meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
index 708c28b63205..6475277a079a 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20241017.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20241110.bb
@@ -158,7 +158,7 @@ LIC_FILES_CHKSUM = "file://LICENCE.Abilis;md5=b5ee3f410780e56711ad48eadc22b8bc \
                     "
 # WHENCE checksum is defined separately to ease overriding it if
 # class-devupstream is selected.
-WHENCE_CHKSUM  = "7dde9aa13fc4707189ecd7d35ee94d92"
+WHENCE_CHKSUM  = "cc90b04cb170ac983b67b00f4ec8f73d"
 
 # These are not common licenses, set NO_GENERIC_LICENSE for them
 # so that the license files will be copied from fetched source
@@ -240,7 +240,6 @@ PE = "1"
 
 SRC_URI = "\
   ${KERNELORG_MIRROR}/linux/kernel/firmware/${BPN}-${PV}.tar.xz \
-  file://0001-qcom-Add-link-for-QCS6490-GPU-firmware.patch \
 "
 
 BBCLASSEXTEND = "devupstream:target"
@@ -248,7 +247,7 @@ SRC_URI:class-devupstream = "git://git.kernel.org/pub/scm/linux/kernel/git/firmw
 # Pin this to the 20220509 release, override this in local.conf
 SRCREV:class-devupstream ?= "b19cbdca78ab2adfd210c91be15a22568e8b8cae"
 
-SRC_URI[sha256sum] = "a26c38ef5a83272f2b98ce8bf8ca1865a852a3deea49ce5a8dd804b914351273"
+SRC_URI[sha256sum] = "32e6d3eb5c7fcb69fe5d58976c6deafa0d6552719c6e74835064aff049d25bd7"
 
 inherit allarch
 
-- 
2.39.5


