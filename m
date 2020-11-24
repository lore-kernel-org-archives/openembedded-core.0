Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
 by mx.groups.io with SMTP id smtpd.web12.53261.1606230843860019449
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2020 07:14:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=kq4Rj+Mq;
 spf=pass (domain: konsulko.com, ip: 209.85.128.68, mailfrom: pbarker@konsulko.com)
Received: by mail-wm1-f68.google.com with SMTP id d142so2708588wmd.4
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2020 07:14:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ZXMoKN7zo6r/FShXFiFaRd4LwHIgssVFfNFNUiaPRls=;
        b=kq4Rj+Mq2H/jwVe7W/gU5j0sBxLH0M5amcqGTg5Y48TxEclxDAtNY1Rd2vgS/sDUQL
         rN2O79MtRz1LcEGcBsxknIZzG+HEZogLUeeRQ3f/pEPpbTc6z8AA8HPHC/HBUPRe7j5L
         ttVKHiLdblHD8+HqJ81F9AGPc//pdBPhixc/M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ZXMoKN7zo6r/FShXFiFaRd4LwHIgssVFfNFNUiaPRls=;
        b=OS8mV6IUY+tPjrgjOsPSelCLn9ztfPW9RfGcjIr+BnMMEMttDf1WptaErKOXsVzkVn
         6dbpZ7WmtRVTsK/GrApgtkfYc2j0viuXdDQGsLYY8ecodu2RSjaLKHFexsxlwCqf3gtq
         FX+nn2bW3PCTpGZwimtDsB78k0agG7vh5FSD4SXiHDS0OVBfJaSKJMoYOs7u/Z5/PJ6c
         SvzSP1IxNo+IehG0D0mszZxKcAyWw3QxhxxYFexyCsUBdTXs06xx7Pc2qPCYDUoI6Qi8
         Sd/973MZ5kgUsOhFO/dh+064PH/SRUtEmoeHqhHzNXNuXv0tN/YklZXIdA4vgvXTf7v/
         2vJQ==
X-Gm-Message-State: AOAM5303hnQTUjcZSMsGDgk9vsb2XwU9Z89SKImnEE+xlniJXTY01I42
	wnJ0jbTWym0qGJemxrkotPdhWp08O5vqYw==
X-Google-Smtp-Source: ABdhPJz4A5x52Bzrq7UgSNa7eWVsbC2IAEYRR6RSBycANhrQ6X14p7+CH9DQMWH7qUS78e/nrXhEbA==
X-Received: by 2002:a05:600c:255:: with SMTP id 21mr5074496wmj.69.1606230842167;
        Tue, 24 Nov 2020 07:14:02 -0800 (PST)
Return-Path: <pbarker@konsulko.com>
Received: from alpha.home.b5net.uk (cpc76148-clif11-2-0-cust524.12-4.cable.virginm.net. [82.1.54.13])
        by smtp.gmail.com with ESMTPSA id 140sm6039909wme.14.2020.11.24.07.14.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2020 07:14:01 -0800 (PST)
From: "Paul Barker" <pbarker@konsulko.com>
To: openembedded-core@lists.openembedded.org
Cc: Paul Barker <pbarker@konsulko.com>
Subject: [PATCH 2/2] poky.conf: Drop fedora-30 from tested distros
Date: Tue, 24 Nov 2020 15:13:58 +0000
Message-Id: <20201124151358.30845-2-pbarker@konsulko.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201124151358.30845-1-pbarker@konsulko.com>
References: <20201124151358.30845-1-pbarker@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The autobuilder no longer contains a worker for this distro.

Signed-off-by: Paul Barker <pbarker@konsulko.com>
---
 meta-poky/conf/distro/poky.conf | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-poky/conf/distro/poky.conf b/meta-poky/conf/distro/poky.conf
index bdf46f4038..35c9b1a27c 100644
--- a/meta-poky/conf/distro/poky.conf
+++ b/meta-poky/conf/distro/poky.conf
@@ -49,7 +49,6 @@ SANITY_TESTED_DISTROS ?= " \
             ubuntu-16.04 \n \
             ubuntu-18.04 \n \
             ubuntu-20.04 \n \
-            fedora-30 \n \
             fedora-31 \n \
             fedora-32 \n \
             fedora-33 \n \
-- 
2.26.2

