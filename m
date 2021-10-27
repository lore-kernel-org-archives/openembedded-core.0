Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77937C433F5
	for <webhook@archiver.kernel.org>; Wed, 27 Oct 2021 09:07:53 +0000 (UTC)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by mx.groups.io with SMTP id smtpd.web12.9296.1635325672949288125
 for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=QLk7frG3;
 spf=pass (domain: gmail.com, ip: 209.85.221.52,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f52.google.com with SMTP id d3so2857766wrh.8
        for <openembedded-core@lists.openembedded.org>;
 Wed, 27 Oct 2021 02:07:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NDS4hi4luWhZhOzd97G0MmJRfUYo1A4IfKdbAluEnSo=;
        b=QLk7frG3JDZfJfBZpP3By26B7sDADvhKgpYN/4MR/5yrbmXrQCqUWP6hsADyCIBxn9
         xPJSXLJy57RUfaAumLH0t/tZ1dJC70T5d7H7KyCguYwAqp7t7AwxO6Vm9O9OBN33JBZd
         QTEfpmzZiD7/qF91FF+P+oPfFAPeMMabMlB7OwKqt713q10MrhiDLtTJIhu46HXcCMhI
         OzYncOww1roctV08fvM3dV7M0oxl/t0ZGkzSuWgbn1XznYzLxXpsjN6C0vg6X8bucNCT
         zuP/S303NTfWC4fXEPR1wZDfbCNPpbO+vdxSnWXhvQbu0ywWnFEixPXP4tUx5ArsWk1x
         I+KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NDS4hi4luWhZhOzd97G0MmJRfUYo1A4IfKdbAluEnSo=;
        b=XwVBGh+M8MTnXtaYDzZrIQ9NTDzUhO5sKFCLXTRepwoISQQo50CWXs+vItywi1hWqH
         6PbORFX0jzb8cznd1n3qWmhzZDt8Iy5gQ4EIexQxgOCWC2DoaND//L0GHQusrS7DKqFq
         BG5RJxJmEOH84iHdv6ctE6Pr/UGAAj8pjNzgz9ma22RDMDWof5WnRrzZcnTjJLsx+n3h
         xN5DB1P2Be5Y4F3sJYLBVdlKe7UHDLNOAHENO4LA/vsKeF3XHyM0iBl9/DC31ViK3Bz3
         QwCGOczl7BrG4c+cRChE0COc7ldcT2Vc8dBupWiWp90WcGx2FNGZ68pNZ2MerbzK4RVg
         GHiw==
X-Gm-Message-State: AOAM530lpM+4ko+hoBxzQTDpb4GzrqGQe3R8iGjej1pBLmN7jED0V5rs
	g41hhdGcC9DWYkSQEqH9mKQUt1HvM/w=
X-Google-Smtp-Source: 
 ABdhPJy0a81ZRDgGIQEQxskb2/kL0SEZ1t5C++Rw/4hlhyNohINidl4IVHojSPU95uKn8AiijgTT/w==
X-Received: by 2002:a05:6000:1b8f:: with SMTP id
 r15mr38891344wru.27.1635325671517;
        Wed, 27 Oct 2021 02:07:51 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id 3sm2962790wms.5.2021.10.27.02.07.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Oct 2021 02:07:51 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 20/30] tzdata: update 2021d -> 2021e
Date: Wed, 27 Oct 2021 11:07:26 +0200
Message-Id: <20211027090736.2546759-20-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211027090736.2546759-1-alex@linutronix.de>
References: <20211027090736.2546759-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 27 Oct 2021 09:07:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157496

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index 6221ff9c60..43d14d7f12 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2021d"
+PV = "2021e"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "ed0d02be79b54f4449ba1f239aeaf9315da490bf32f401d302dcbba4921f591d"
-SRC_URI[tzdata.sha256sum] = "d7c188a2b33d4a3c25ee4a9fdc68c1ff462bfdb302cf41343d84ca5942dbddf6"
+SRC_URI[tzcode.sha256sum] = "584666393a5424d13d27ec01183da17703273664742e049d4f62f62dab631775"
+SRC_URI[tzdata.sha256sum] = "07ec42b737d0d3c6be9c337f8abb5f00554a0f9cc4fcf01a703d69403b6bb2b1"
 
-- 
2.20.1


