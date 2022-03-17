Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85068C433EF
	for <webhook@archiver.kernel.org>; Thu, 17 Mar 2022 11:57:15 +0000 (UTC)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by mx.groups.io with SMTP id smtpd.web12.9217.1647518234151712486
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=FarYvSTh;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f41.google.com with SMTP id h23so6414000wrb.8
        for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Mar 2022 04:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=+6AEcveVrUjaW+p0ICdmTl3EKajer1G8c1Bkhef04fI=;
        b=FarYvSThNrpdwXitnN0k3IOkbfjYbxW2BBjTxxUT/Kbn1abWHmTN/leMuyrqUkExUV
         16/jEKIT6DOs30vhGnPzur5hCR6EL32TjVWP/xpd3Q9aeYUuwVmdTQJI8qWsLUpkym2S
         PSWzENndnjfdBbgJodDMUtWm2skle6jn4Gxss=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=+6AEcveVrUjaW+p0ICdmTl3EKajer1G8c1Bkhef04fI=;
        b=lxNBMTBPE3Nir53l60MT1+xKomaHTGbVh8ACTDtZvh1s8XXtIvyboWh+AVrxSQbmjO
         pTUuahy3yeUjajVWIiVkMaV1b6br30/PLFsfP8snnlfr6P6zX3Pfy6gAcR3IypRG0ZWS
         FofA6LwR3ZhplzDyGgBwRqi/1nvKoc8SD3TC3+o1YqnpUTR0A6h2g1Lro5E0gg83jmhO
         z55PJtjdZ+JfMiNBzatIfKYOIpsSVFTbOhD+VPAQUojMhrBbjsLo/X/zRl6BbTo/ArZI
         YbcgjSNJxI6IJZ/+lCYA+VQx3cyQqRoU5M8MTPp5BABagMha+wA1z17u0XGt/Ikr5w/I
         bJpg==
X-Gm-Message-State: AOAM532k2GhljKjJHtEKXvuUQAJ12OrFMXskHU6OYmhKuCxSeOjVAhmE
	8LWvlIt47mTwoRY+xuTzgXqzzpLr5YcGnG9M
X-Google-Smtp-Source: 
 ABdhPJwuwOIe42KiRD7/PY2/DDK+u/gQJxB+fsjv/1gXN36VCXndZyvoGa4D0U6diKjI1tRqQI35Ow==
X-Received: by 2002:a05:6000:1a88:b0:203:8de9:47cc with SMTP id
 f8-20020a0560001a8800b002038de947ccmr3656236wry.182.1647518232385;
        Thu, 17 Mar 2022 04:57:12 -0700 (PDT)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:64d8:6f1c:d663:861])
        by smtp.gmail.com with ESMTPSA id
 f22-20020a1cc916000000b00380d3e49e89sm3892315wmb.22.2022.03.17.04.57.11
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Mar 2022 04:57:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 10/26] python3-pysocks: Add from meta-oe/meta-python
Date: Thu, 17 Mar 2022 11:56:44 +0000
Message-Id: <20220317115700.993924-11-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
References: <20220317115700.993924-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Mar 2022 11:57:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/163396

---
 .../python/python3-pysocks_1.7.1.bb           | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python3-pysocks_1.7.1.bb

diff --git a/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
new file mode 100644
index 00000000000..91444017031
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pysocks_1.7.1.bb
@@ -0,0 +1,20 @@
+DESCRIPTION = "A Python SOCKS client module"
+HOMEPAGE = "http://python-requests.org"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=1d457bcffb9661b45f799d4efee72f16"
+
+SRC_URI[md5sum] = "89b1a6865c61bae67a32417517612ee6"
+SRC_URI[sha256sum] = "3f8804571ebe159c380ac6de37643bb4685970655d3bba243530d6558b799aa0"
+
+PYPI_PACKAGE = "PySocks"
+inherit pypi setuptools3
+
+RDEPENDS:${PN}:class-target += "\
+    ${PYTHON_PN}-email \
+    ${PYTHON_PN}-io \
+    ${PYTHON_PN}-logging \
+    ${PYTHON_PN}-netclient \
+    ${PYTHON_PN}-shell \
+"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.32.0


