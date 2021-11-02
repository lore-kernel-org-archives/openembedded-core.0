Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D709C433F5
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 08:43:27 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web10.6619.1635842606636651160
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=PEVhUaeQ;
 spf=pass (domain: gmail.com, ip: 209.85.221.50,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id i5so24372154wrb.2
        for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Nov 2021 01:43:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Ytl8h460ujgq6JMSTjaBdzdHIyyLbY27C6/x6MdZA2M=;
        b=PEVhUaeQZ2lewGqRZNYGzeiF2vz09PzTEk8ZmOCB1rAhJ22dDf6DD0/qxHvkru2Okv
         gmtJUDHCx+boJhEaC17CrcpOp99PPqqCNysgCGodaBDfhseRjosVQmP4Lq97lpGXZwEa
         jQK9/Hwu3g2i07tMqT1a3irgECE1gsnhZGYbwcxO5bj3MVaS9Xt+1vnWcQj1HrjAJRAu
         IxA6WD/TseiZx1QM7VIcnA8AjDsE3WGLZJ5fqzvwe6/KOHjvdsubxc6sdt9NNnJn1Ool
         ZdmptXzJVRJ13N/tPtxc+vYX8mc1oAHc+VDb9vqvxkq2WpuA0UY3SMokBpAByVZaS4hU
         nYww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Ytl8h460ujgq6JMSTjaBdzdHIyyLbY27C6/x6MdZA2M=;
        b=AyOAv+DU/UGIp1VONu6PiUJ2uaMsZmVQl/SkO1wKGehQx01bscNeASezEQq9z8Qah5
         XUI1lsFr8RIT/HcchzegldprOyuEX806EIByLUY59/UDlmio1iAGqLQ+o292oEKXVY9D
         zxt1XzuubqLqHx6ZB3wXVbPKB6GrjVQlcdv0/im6HzJ1Hlgd1obk500OIX2ILDWJCa9o
         mRQ8Pj0ex02+SUhRjQZ06LqDAFlWLCjmXZwlnCGbhFYCUQyZC5/AfCEiYbi7bWDsCQKA
         zHJYi/3+lyilc2p/8P6adZ5ex0US229lgZRLwB+lPDZaeTJfdfiU5AsgGadZPBwYLvOb
         lPtQ==
X-Gm-Message-State: AOAM531IiL30enQwQqDR+V6rpkNaaesq1KCe11J3aLFjo/zTfh4l4mkE
	akwHaLJvirDaV5fNOZMbBNdYxediivA=
X-Google-Smtp-Source: 
 ABdhPJwCLDNhbR5xkRyFNtUVJQRJhYkHCzx2j8aFsKj368IsQnXvF58tXPW5dAqzqxoiczOLzSIVtg==
X-Received: by 2002:a5d:59aa:: with SMTP id p10mr44843861wrr.45.1635842605256;
        Tue, 02 Nov 2021 01:43:25 -0700 (PDT)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 v191sm1761890wme.36.2021.11.02.01.43.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Nov 2021 01:43:25 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH 31/33] docbook-xml: patch is not upstreamable
Date: Tue,  2 Nov 2021 09:43:01 +0100
Message-Id: <20211102084303.2974802-31-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211102084303.2974802-1-alex@linutronix.de>
References: <20211102084303.2974802-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Nov 2021 08:43:27 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157769

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 .../docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch       | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
index 59703609ca..c1385631d7 100644
--- a/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
+++ b/meta/recipes-devtools/docbook-xml/docbook-xml-dtd4/docbook-xml-update-catalog.xml.patch
@@ -2,7 +2,7 @@ docbook-xml: update catalog.xml
 
 Refer Ubuntu 13.04 to update catalog.xml
 
-Upstream-Status: Pending
+Upstream-Status: Inappropriate [docbook 4.x development has ceased, docbook 5 is entirely different]
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 ---
  docbook-4.0/catalog.xml   | 72 +++++++++++++++++++++++++++++++++++++++++++++++
-- 
2.20.1


