Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF0BC433FE
	for <webhook@archiver.kernel.org>; Wed, 10 Nov 2021 19:39:53 +0000 (UTC)
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com
 [209.85.128.42])
 by mx.groups.io with SMTP id smtpd.web09.373.1636573192305380852
 for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:52 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fxScE71T;
 spf=pass (domain: gmail.com, ip: 209.85.128.42,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wm1-f42.google.com with SMTP id
 b184-20020a1c1bc1000000b0033140bf8dd5so2768876wmb.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 10 Nov 2021 11:39:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=hqq59mIT6SPehRG5aNj20rZU6NLCYfJSg4GHo8jgHeQ=;
        b=fxScE71TxjK972pGdjEOuF0kzS/jhCR4tDLtDhZIHy3vx1Hf/6c5ny+IQsRPwHJD5i
         wE2oc4X+NGsbxbaoQU+qGkFIpAjD7I6ZrhKrSKz2jXEm6u61XaGnbBBRfUehFgxPTZkF
         tsLbxezqIHTQWtPI/m3Pvy84FHxRItHhkT0xTBk5CSn7b8DaXkKN5DKRJof8Sc/yA0DC
         ZAfzC7zqNt4FtiacbrkXwFmqioRsVgIvUQcLh7KGCEQG63RUhy43b908iOtMHf4fs+vV
         NSPtWefNaB9vCgni+J748C4JGSxV/DW2lR3GUGPD1klpG2/sW2UmjtsPAYadBdj7LmgX
         TB7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hqq59mIT6SPehRG5aNj20rZU6NLCYfJSg4GHo8jgHeQ=;
        b=yQOt5OS01ON8yxUrrKSVGUznLPmBCUJ6p8ARfgEZz2K/t/1jTzxnBaaMxbmr5tpfiF
         uMzYwaQfuUd7I/7wNdT6deIRMeEzW4czrDW0z8uqzzceOiUGzFo7ZfiVUh16jY1Rwpji
         jFeXW28Knbj2iRKNHUqX7OsTQTDM0K/XxWlqgHM/MGOs61c2C5UTnm4MNXMxefa+SzxA
         ePv1V6AXBzW7jHcwjFTIh694WkeQkFP/Vl3cd6/m+hP/ihjHpe21pcEP0SWzrtA9Y7IR
         ho8fqU5KqrMsnJHtWj4QjPBCGFFT/1eVcl0NC6X8C8So+dRy+GdX/pcCxZwhJes4SHET
         QGcQ==
X-Gm-Message-State: AOAM530Fdvr7lABO64C5OMiTHQME/HSreEYPE6X9vwvE/t1TFwoMuzTV
	QrSQMDioPZ4aZPKgspdp/6NKrIrbtPc=
X-Google-Smtp-Source: 
 ABdhPJwXC0SDiwmJAEr/XZfXWOHl7DfDrr/7whdllPwhKr+tl79mkOY/EAmHNwpAaUHcHzCDdh6M3g==
X-Received: by 2002:a1c:1bd8:: with SMTP id
 b207mr19186925wmb.114.1636573190792;
        Wed, 10 Nov 2021 11:39:50 -0800 (PST)
Received: from nereus.lab.linutronix.de. (b2b-109-90-143-203.unitymedia.biz.
 [109.90.143.203])
        by smtp.gmail.com with ESMTPSA id
 q18sm6865124wmc.7.2021.11.10.11.39.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Nov 2021 11:39:50 -0800 (PST)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex.kanavin@gmail.com>
Subject: [PATCH 13/24] python3-pbr: upgrade 5.6.0 -> 5.7.0
Date: Wed, 10 Nov 2021 20:39:26 +0100
Message-Id: <20211110193937.2606747-13-alex@linutronix.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110193937.2606747-1-alex@linutronix.de>
References: <20211110193937.2606747-1-alex@linutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 10 Nov 2021 19:39:53 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158097

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
---
 meta/recipes-devtools/python/python3-pbr_5.6.0.bb | 4 ----
 meta/recipes-devtools/python/python3-pbr_5.7.0.bb | 4 ++++
 2 files changed, 4 insertions(+), 4 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3-pbr_5.6.0.bb
 create mode 100644 meta/recipes-devtools/python/python3-pbr_5.7.0.bb

diff --git a/meta/recipes-devtools/python/python3-pbr_5.6.0.bb b/meta/recipes-devtools/python/python3-pbr_5.6.0.bb
deleted file mode 100644
index 132e6e52b6..0000000000
--- a/meta/recipes-devtools/python/python3-pbr_5.6.0.bb
+++ /dev/null
@@ -1,4 +0,0 @@
-inherit setuptools3
-require python-pbr.inc
-
-SRC_URI[sha256sum] = "42df03e7797b796625b1029c0400279c7c34fd7df24a7d7818a1abb5b38710dd"
diff --git a/meta/recipes-devtools/python/python3-pbr_5.7.0.bb b/meta/recipes-devtools/python/python3-pbr_5.7.0.bb
new file mode 100644
index 0000000000..12aeb7e8fa
--- /dev/null
+++ b/meta/recipes-devtools/python/python3-pbr_5.7.0.bb
@@ -0,0 +1,4 @@
+inherit setuptools3
+require python-pbr.inc
+
+SRC_URI[sha256sum] = "4651ca1445e80f2781827305de3d76b3ce53195f2227762684eb08f17bc473b7"
-- 
2.20.1


