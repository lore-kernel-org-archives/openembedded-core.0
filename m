Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75F92C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:11 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.6551.1635842590557138819
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:10 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C93Wj60L;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id t30so7185883wra.10
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=xm7xpa15useOcTzma5cy6uEj3qS6JZvdVdzJbDiFtbk=;
        b=C93Wj60LkqMavQkfCL6/Er07FV9mkQ34ifXKtjVj+n7zAB8vZizGo+fS+3kk3sUl/6
         HFs0Khd55WRMNoeYrrvk9gxSFodDyRpfDx7d5rFamzLn6lkeC3r0RPrAwNPhl6+qCcWx
         37ZyGth6QYZZCfvMW5osmj8Ga1MfTMF5ETqZgQSE9sTu3i/KXSAvCKgbr7b8hMVP3vC1
         ocZm5h0JvGwNSSM2GHS6VsGKNCTx+W8ILuV4xUvC+s2k55KtLV098047mi4EKp3F828H
         98lWNXhMii0qYGflY6cCuMGNgPbhmLBhFziL6Abft9DiV/H/IeT6WLLKzfw44QqP2DSM
         NpDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=xm7xpa15useOcTzma5cy6uEj3qS6JZvdVdzJbDiFtbk=;
        b=h/Lon1slXq73IEBuYDcS70wcOGiQahczAiRhk3oEkNWmMdOY6o0JIqsdXubUl4fSfr
         FdS12UOrp6HLzCkJQW0BgVKfamn1xbq6gujU/aC08L1xZnK3bUhK2E158upVaGR6MYHk
         /3PoiyG9/AUz8ctHeWLaHGjul4A8nG+llDFZuIEdjgwyVITaB+YpAQKHoI9Xx/YzifkU
         qOMosHx1izVeOSvGPsRN4vcR5Z5QlsnvJT8bJxvCIjsxLx9GAJSp9UxMoXsKzvlf9aGK
         cingpV3/MoSHalGXJAZdFOykgMabN1NC9HzR0sP/GejJifzsN6zAMuARSkHToqNAtiLC
         J4uQ==
X-Gm-Message-State: AOAM530FxoibyuHQgZFlnFzMSxARXcPY+ixeHuRDsx5ZFusKgmky6oKx
	UVuz6RQC7FRyRAbd1sT8Q4Dhof8GVSk=
X-Google-Smtp-Source: 
 ABdhPJxxPZLMV3pQ56XwUZ8SJZCjYfaqp4u4040+PBN+Fv/Jl5yds2VRhG6dN7zSZHgyL8IuUtVFtA==
X-Received: by 2002:adf:e742:: with SMTP id c2mr18447284wrn.232.1635842589142;
        Tue, 02 Nov 2021 01:43:09 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:08 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 07/33] python3-docutils: upgrade 0.17.1 -> 0.18
Date: Tue,  2 Nov 2021 09:42:37 +0100
Message-Id: <20211102084303.2974802-7-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:11 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157745

From: Alexander Kanavin <alex.kanavin@gmail.com>

License-Update: additional files listed

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 .../{python3-docutils_0.17.1.bb => python3-docutils_0.18.bb}  | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/python/{python3-docutils_0.17.1.bb => python3-docutils_0.18.bb} (60%)

diff --git a/meta/recipes-devtools/python/python3-docutils_0.17.1.bb b/meta/recipes-devtools/python/python3-docutils_0.18.bb
similarity index 60%
rename from meta/recipes-devtools/python/python3-docutils_0.17.1.bb
rename to meta/recipes-devtools/python/python3-docutils_0.18.bb
index 54a809847f..979eea27fb 100644
--- a/meta/recipes-devtools/python/python3-docutils_0.17.1.bb
+++ b/meta/recipes-devtools/python/python3-docutils_0.18.bb
@@ -2,9 +2,9 @@ SUMMARY = "Docutils is a modular system for processing documentation into useful
 HOMEPAGE = "http://docutils.sourceforge.net"
 SECTION = "devel/python"
 LICENSE = "PSF & BSD-2-Clause & GPLv3"
-LIC_FILES_CHKSUM = "file://COPYING.txt;md5=836a1950177996968a49ff477a4a61c4"
+LIC_FILES_CHKSUM = "file://COPYING.txt;md5=01aec8e28f975e3f369e06b5eb2af9b9"
 
-SRC_URI[sha256sum] = "686577d2e4c32380bb50cbb22f575ed742d58168cee37e99117a854bcd88f125"
+SRC_URI[sha256sum] = "c1d5dab2b11d16397406a282e53953fe495a46d69ae329f55aa98a5c4e3c5fbb"
 
 inherit pypi setuptools3
 
-- 
2.20.1


