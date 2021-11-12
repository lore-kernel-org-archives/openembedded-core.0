Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EE6FC433F5
	for <webhook@archiver.kernel.org>; Fri, 12 Nov 2021 17:14:48 +0000 (UTC)
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by mx.groups.io with SMTP id smtpd.web09.19.1636737287463719121
 for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:14:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=ae5PcY48;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.128.41,
 mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wm1-f41.google.com with SMTP id 133so8346835wme.0
        for <openembedded-core@lists.openembedded.org>;
 Fri, 12 Nov 2021 09:14:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1hsyJI7brER7wkStH5QEY5UyWaNiL1Qau5eSZpqTEXs=;
        b=ae5PcY48o1lpPDCgE0EvjRC4ZRkwxeIH5elNQmzoqoqMw8m8l0wrCoty68zIlJ6Q1q
         zHrVr5uU0yUW15WKrl+AQajcHE9JYHGmTxgTxBfOPd5obuP/4o1Ih4UCrxoxvNwaNOqR
         Awj5V5670tyHaOHfcB/nABgMs5RWn9NSxnr/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=1hsyJI7brER7wkStH5QEY5UyWaNiL1Qau5eSZpqTEXs=;
        b=P9WXFVC5g1vAlGyuYk6SR83Ka1pyeJ2OGpLjYPNmlB9BSneh36oQiSw9QyCsREia+r
         eITrvFlGLrE0UbJt3o40BHjuZYUOfZ6m38/Z2w34Zy8GgE8tmnEonbW5o6a2btaoIbxx
         WX2O7ej9TxpDEBdG0G1+ISB2TmhSeGMKzhJDJH1LVJx5Sgv58cn295eTKEYGBwnemKKl
         yDFhcOpkEoG+zMrcP20JuplKVd74ebQscvR4iKRs5b/Tw2x4HlN/pv20Od9pXsaop6sK
         NMSqKGRV09xAgvQ0Lo/8bsXUwYkkQM2+vLXgwNbdDVrFhPM0qCDkk/J79ZN5oMqNQUFO
         /GpQ==
X-Gm-Message-State: AOAM531dF54HhPBuJ+/BY2vMmeTSHlMHqjW0doyg3QMuFAlaKfOGdZhG
	CrXKvehIAuZSvGMfVkwNdlRv8VeXq9PA8g==
X-Google-Smtp-Source: 
 ABdhPJza+joUutJlE0DOKfhit53KerWaU/94U3GrQD3FZA8xshSL8t01d5PK3fclLpDFy+fYr23l5A==
X-Received: by 2002:a7b:c452:: with SMTP id l18mr18847667wmi.46.1636737285738;
        Fri, 12 Nov 2021 09:14:45 -0800 (PST)
Received: from hex.int.rpsys.net ([2001:8b0:aba:5f3c:c0bd:72b4:105a:2914])
        by smtp.gmail.com with ESMTPSA id e3sm6263833wrp.8.2021.11.12.09.14.44
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 09:14:45 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 1/4] packagegroup-core-buildessential: Mark as TUNE_PKGARCH
 specific
Date: Fri, 12 Nov 2021 17:14:41 +0000
Message-Id: <20211112171444.3898562-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 12 Nov 2021 17:14:48 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158227

The libstdc++ dependency is debian renamed so this shouldn't be allarch,
mark accordingly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 .../packagegroups/packagegroup-core-buildessential.bb          | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
index 32f4ac35861..2cd67ad05f8 100644
--- a/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
+++ b/meta/recipes-core/packagegroups/packagegroup-core-buildessential.bb
@@ -5,6 +5,9 @@
 
 SUMMARY = "Essential build dependencies"
 
+# libstdc++ gets debian renamed
+PACKAGE_ARCH = "${TUNE_PKGARCH}"
+
 inherit packagegroup
 
 RDEPENDS:packagegroup-core-buildessential = "\
-- 
2.32.0


