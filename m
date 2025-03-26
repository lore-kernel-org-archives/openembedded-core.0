Return-Path: <hiagofranco@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23859C36010
	for <webhook@archiver.kernel.org>; Wed, 26 Mar 2025 20:30:22 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web11.33385.1743021017549718427
 for <openembedded-core@lists.openembedded.org>;
 Wed, 26 Mar 2025 13:30:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=YPGkGAFd;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: hiagofranco@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2255003f4c6so6764705ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 13:30:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743021016; x=1743625816; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZtcqEZn27yy+9MK3ZC4xLEK2pJdKgVolWWqzs2P+CD4=;
        b=YPGkGAFdF0gLTl5MyMmOtpgftuJ6/GIifkQv2HSNBlEkA4bPEJuJv/WZcPlxrVMok7
         z9nixzZpbrEph9V0Bm0vqw796e9Gmd5YltT95iAXxlGcSc5pokbpAB9TAg/8UmFbM0Cb
         Yehxxq6ZJC0fa3Hurgj1epAVCu/YzwhyCPJd7u/ROg3g4WiEavRZCXVl0r8kAuNX4DFU
         Ab6B5W4ObSlbxug2TErdJGBSq26HLiEJREn6uALvZWDTY2lKvR9qs++akCyvaP9f/4F4
         w7+eJL4UcM9ITesBjK5KlMDZP8/VSlOttPYmw6u2gQRGas0ke1P3wTPlk8E6ejJUhPiG
         qaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743021016; x=1743625816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZtcqEZn27yy+9MK3ZC4xLEK2pJdKgVolWWqzs2P+CD4=;
        b=cjii2FUpbaMTeVMs9byW5LnCqViJlGpoFNh33wa9nlnvpp6zFQ88WiVE1ZPiyjoD9Y
         SNNHvMFXbnmBrdrmMzUkk7YRcq3lgQKM8PgpkgIznS08XBF6L2b99KAkucLrX/HTioWZ
         QBYZJKTNMdRs22V/ncmBphf71QdxQv2jhzOIXSMHKMLsE11nuy2yy/NbcxCoeGR72QO5
         oFeHA/kgU1S8JjNUv5hLRdDzswna71LpFwvVA/f30Kxey6F4cJ7DqfX4iZnjJ3UJ6uF3
         gw6bRpPh6OHTZQ5UmjZ5OLEB3LFzd4IChGCq04FfStHn65UF4dd4GxOSaa6zoJvXnpxn
         0zGg==
X-Gm-Message-State: AOJu0YygbJrV3sfYlLARU/tH8plTx8OlIAy1dHnHPWZPqPJAZjxfRpoc
	IATcOU8X2JmuImHiF7nO6jrxer2Qc5cTecWOnHU8PyDQHpuzkvYDYqMROmxK
X-Gm-Gg: ASbGnct3j0+whSH6QmOh284GEG1lWfrMKt60FPEYjblOFTgizXob3rQEpD3knpqcujP
	oB9AuuzNgAMWec2hKOt8wWAz/ajKPE/gPicR31NDy3iSeWoHYgxFx9yf95j7KfrvHFL1Z8o6GNe
	RY7ds+cinv9KpXaCyfloFEcyAOfS7xep1zg8Le3yB5YB8bW+21RELtAfI2gaX9u0DBLEMiWg9Qn
	zGt9TUBzmR0uXnDKYd5LTuEA0TzTNwftloBoKrr+gxG2Z4gNg/zP4+um12Rhr6pO1w3xtoO0fDJ
	jm6x2MTuK7H4ilPcXjjnpU7bojKjjEfIS8qQxww0tr5BXxVuQ0OTeMfodVDNdOZA/ZqBwGmg4Gg
	8zg==
X-Google-Smtp-Source: AGHT+IGpZZ+6uu7o0J2gmSjLBi/Ktf0XMGfsx6O4130KFyPjQTpcb0f50uc1ghHDLkvvf4yIHSIWlA==
X-Received: by 2002:a17:903:1663:b0:220:f7bb:842 with SMTP id d9443c01a7336-2280492a177mr16772595ad.42.1743021016397;
        Wed, 26 Mar 2025 13:30:16 -0700 (PDT)
Received: from hiagof-nb.corp.toradex.com ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3039f1d4b6asm661625a91.38.2025.03.26.13.30.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Mar 2025 13:30:15 -0700 (PDT)
From: Hiago De Franco <hiagofranco@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: quentin.schulz@cherry.de,
	steve@sakoman.com,
	Richard Purdie <richard.purdie@linuxfoundation.org>,
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
	Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Subject: [styhead][PATCH v2 28/31] linux-firmware: make linux-firmware-qcom-qcm6490-wifi provide -qcs6490-
Date: Wed, 26 Mar 2025 17:28:14 -0300
Message-Id: <20250326202817.64437-29-hiagofranco@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326202817.64437-1-hiagofranco@gmail.com>
References: <20250326202817.64437-1-hiagofranco@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 26 Mar 2025 20:30:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213688

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

The package linux-firmware-qcom-qcm6490-wifi also provides a symlink
qcom/qcs6490/wpss.mbn. Follow the pattern established by
linux-firmware-qcom-qcm6490-audio and -compute packages and make this
package RPROVIDE the qcs6490 name.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Mathieu Dubois-Briand <mathieu.dubois-briand@bootlin.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit c18be7fb4aa2969dc1e15067f99ff7d317eb906f)
---
 meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
index ec5329760acd..aec36a7a7fcc 100644
--- a/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
+++ b/meta/recipes-kernel/linux-firmware/linux-firmware_20250211.bb
@@ -1944,6 +1944,7 @@ RDEPENDS:${PN}-qcom-qcm6490-compute = "${PN}-qcom-license"
 RPROVIDES:${PN}-qcom-qcm6490-compute = "${PN}-qcom-qcs6490-compute"
 RDEPENDS:${PN}-qcom-qcm6490-ipa = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-license"
+RPROVIDES:${PN}-qcom-qcm6490-wifi = "${PN}-qcom-qcs6490-wifi"
 RDEPENDS:${PN}-qcom-qcs615-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-adreno = "${PN}-qcom-license"
 RDEPENDS:${PN}-qcom-qrb4210-audio = "${PN}-qcom-license"
-- 
2.39.5


