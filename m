Return-Path: <makchrbiz@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08E8FC282DE
	for <webhook@archiver.kernel.org>; Sun, 16 Mar 2025 19:16:44 +0000 (UTC)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
 by mx.groups.io with SMTP id smtpd.web11.35631.1742152602736656666
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Mar 2025 12:16:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=D5w7d+Qb;
 spf=pass (domain: gmail.com, ip: 209.85.208.45, mailfrom: makchrbiz@gmail.com)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-5e5e63162a0so5549980a12.3
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 12:16:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742152601; x=1742757401; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ag5ZVcAOapIyEwNvyNM0Rgse0tjFVebNAnxfb0aD5Kc=;
        b=D5w7d+QbEKfm71sU/neJKKLiLEJM6EmJyUOeqEXJ/LZgMJhoHFIByWABJGoeIbh5tn
         zGRWKm03bli8hO2rGWLsyWguI+nRoHcGWjzQc+ONnDDGclVUK2zWpVtQ2UhwnYmwrll/
         kI3Y7BpHOGBE/OBcV5pMPngKY7Ukrm1Rm629XMtf4ImCfpohXS+sDwP1N8NWnTQ7OZ7f
         kGIFmgn7bNEc+Ue9+oodDqUi5fxqDxWFHJpoz+EIRTrXlt5SjsDoooqqcmUOm0PRLjUy
         Gk/ehe4hQe3Mh38nmiyDuZWxvZJ/bY4ubrpEntqboI7Pm1hRO7qMJZF0abYOnm4KAL6W
         JthQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742152601; x=1742757401;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ag5ZVcAOapIyEwNvyNM0Rgse0tjFVebNAnxfb0aD5Kc=;
        b=rmeke1bifKlGJ13vKeRt54S0FAeCkmDDLbWBr3Ss+6cxRMRd1i46KJb77ZhyKbAfOM
         3Qhwz5EwfWPiHsFupInokvVUNIe9bdnJNi3JRtNbX60vDpE11zm98Ed1oQgog+NAAu38
         rwbbg5wqNXnmdFKIqJGK6FOj4RoaIX8EgTMgguC4WM1n1Z4n6097rsUSuRVUB5pFaF7B
         P+7Vf/qv8DnDi/24eOBDyVMvuE7HzMnUkclJHFHmeMYw8L9arz9ceDWtaAyVFUa2+uic
         zXeaFVYkD9L/tFCzVYAvDtpNeg1MQRpLPjD5lFPdZ9I6TDBA/bNB0cz3N0INr1785s50
         tL1g==
X-Gm-Message-State: AOJu0YxDRbAgQRoIe+cOrepTAONmDlLRcln4F8WEQBK7KtRhOpxskAqu
	zqiLxgfQlscXeDGAGMwynsxIDVyL36C5bwWXVnW4YyZCpP/0yd/9OGPclCtuhs0=
X-Gm-Gg: ASbGncuf84eWHI/nsmDAVZtq4WWzKkZpLz2wPSGc6OH2o0J5553uADX7Ql/YPeVduoe
	nfIOhTNqWDxhylLSlM5EAGujU/4IG+Neyhak+u+WT2ns6LrpcDHWqzxCoMkxLInGtaywD11JmXz
	tmqfbIXgFkW/7sukMKwGjc2dn/C8w09m8m/MgQa/ctlLY4F5SnTjK6Xm8350uds4CKYvOqariAB
	pa+3hWzLAaxnuHYT15Ge2K+qzuy9jDPpgAuxbF05PVSMeuSWQyReGta0PVmsg3DLBXQGEhmqKGk
	EOlbS+juVYFLMoCmpS8NXRSTUQgrN4W044pz7La4dLS0ouvNlrzxe+LoD8ZXS7YAhDpcIeX75NY
	yRZCyBGW7bA==
X-Google-Smtp-Source: AGHT+IEcbl6MsB+v9Uo68bPqnxR5zRO6sxh9xr8Cr8li1QvtWuwdLdZf7wsEW94OOtUYpv/0OdfNuA==
X-Received: by 2002:a17:907:2d0f:b0:abf:718f:ef27 with SMTP id a640c23a62f3a-ac330105a88mr1090869966b.1.1742152600491;
        Sun, 16 Mar 2025 12:16:40 -0700 (PDT)
Received: from localhost.localdomain (athedsl-286910.home.otenet.gr. [85.73.168.92])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac314aa7d10sm531496066b.185.2025.03.16.12.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 12:16:40 -0700 (PDT)
From: Makarios Christakis <makchrbiz@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Makarios Christakis <makchrbiz@gmail.com>
Subject: [meta-oe][PATCH] icu: Adjust ICU_DATA_DIR path on big endian targets
Date: Sun, 16 Mar 2025 21:13:43 +0200
Message-Id: <20250316191343.2621-2-makchrbiz@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250316191343.2621-1-makchrbiz@gmail.com>
References: <20250316191343.2621-1-makchrbiz@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Mar 2025 19:16:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213057

On big-endian systems the preprocessor define ICU_DATA_DIR
is currently being set to a path ending with the ${PV} of
the recipe.

The PV version string has changed to a '-' separator
since oe-core commit cebe8439cdc656d53355506a31a3782312bf03c5
whereas the build system installs the data files into a
path ending with the dot-separated version of ICU.

This causes the ICU data file to not be detected at runtime,
consequently breaking any dependant applications.

We therefore substitute ${PV} with the dot-separated version
string of ICU, as returned from the icu_install_folder function,
on the ICU_DATA_DIR define on big-endian targets.

Signed-off-by: Makarios Christakis <makchrbiz@gmail.com>
---
 meta/recipes-support/icu/icu_76-1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-support/icu/icu_76-1.bb b/meta/recipes-support/icu/icu_76-1.bb
index 08dabde3ae..f0890fc890 100644
--- a/meta/recipes-support/icu/icu_76-1.bb
+++ b/meta/recipes-support/icu/icu_76-1.bb
@@ -25,7 +25,7 @@ EXTRA_OECONF:class-native = "--disable-icu-config"
 EXTRA_OECONF:class-nativesdk = "--with-cross-build=${STAGING_ICU_DIR_NATIVE} --disable-icu-config"
 
 EXTRA_OECONF:append:class-target = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' --with-data-packaging=archive', '', d)}"
-TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${PV}\\""', '', d)}"
+TARGET_CXXFLAGS:append = "${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'be', ' -DICU_DATA_DIR=\\""${datadir}/${BPN}/${@icu_install_folder(d)}\\""', '', d)}"
 
 ASNEEDED = ""
 

