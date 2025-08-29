Return-Path: <martin.jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31A34C8303F
	for <webhook@archiver.kernel.org>; Fri, 29 Aug 2025 09:05:00 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.web10.9262.1756458293299407686
 for <openembedded-core@lists.openembedded.org>;
 Fri, 29 Aug 2025 02:04:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Oc+B6Gw9;
 spf=pass (domain: gmail.com, ip: 209.85.128.53, mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-45a20c51c40so15135665e9.3
        for <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 02:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756458292; x=1757063092; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hFntu8xwguwG7xZLcy+0fAoAjI18LymrzFJEUz3kkXA=;
        b=Oc+B6Gw9o8MBrVioSWiE2m1muz6iLsLi+if8TGmMYWqxObnRoB2/vdsnm4o5/YHeyZ
         N/GMkHS2VHOqSjkwJAb8MXqZj+WXFVHZ1S9aKs24xqZRGGdArSJcGcRMJFSuzWgs4L1i
         Wz/uS32BKtFqiNIfzlj6EE8dLqe6XBxkEOEg8gZOwcr+oh5hW7DolLViQYxzB9clNjZB
         p81q/Jmmjek9tkOHKKNwdh6zR3/zPt85UcQKopqiIa+B2Fcg7qzNGoZ9TeD+Xy8NFcu0
         88g7VHuB2kDiWR4RM8r6lu4I66lTI60MUaTXApubdhvrmm0WFqOmeeyotq8M1N6zZbXD
         OVzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756458292; x=1757063092;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hFntu8xwguwG7xZLcy+0fAoAjI18LymrzFJEUz3kkXA=;
        b=eOgHCdgXuscVv/MiSGgHCmb54gg4DY7UmDmiiYG5i9BJylM9PIelhALzYz/TVKmjcc
         JvG20XSP1Ur/9KySlcNyFsgcyIU4rJ4frbGrAamXua+1M5iygJPB5CDchoPzh7wbtg2r
         Hmm2koswrzXNpP12uzPDudjVjEyFD/S6IT0/ZpLcYJXRI38hjbRmwwnyGze7jvk9s0QQ
         PcPEoalj4ZWF9bwBZxkMIFiu+OUlFbW28DTpFIhVA2471M5EJo8ucu31DSRLAmTMv55G
         SgjHOx3AHEt7MqQ2Mpnffc2EFz3s9R7EPWEAWkUK9KQu/HQoMd0hV2KeC0N12VNR5DaG
         l8xg==
X-Gm-Message-State: AOJu0YyCNOW4QQds2mOGzqY671BafWFernhPzdKRYR0RMurNyTNCAKFT
	1yJEVzX4Tx3PGAjzoodOsiIIoc/7cuNha3mc4M9Fl6PN4DpWE8hK2RBvuIDAJQ==
X-Gm-Gg: ASbGncvkpQz77ABJyizy15J2YIyd9sCypv14pyc/XNaLV5kjOap/iqwL9/KLwNrtBnT
	tyroO/95ULYpk9SEvtEoMMqMF689qtIjBsySXRhqEDVZabiFpErT1KcGyD8mAB72zCnURcD7SeM
	B0NH4Yv6B+RMcCe13vFLorrtQ5EmpjRsKBbAXU2ObanylQVFv+B5iMhgyWqV0GQ2B1/Q30/jfbo
	i2mpWIGzdkMi1l/6451PdLO9xrl1/twQW0bt57evW3ae9Qrw6FsglUQvtKmDHY42eblXpNBQ5+n
	Ix1hT4IX8agOB1yny83ebv6sAx41uLWqLdUwyhrC2EHOToTIVWbi4psOwJwe2lBEShpl7oALGuQ
	mioJZv4PMZCOm7KVTiJ/VCmBQ4uql0LqozMgJyaF9DLKERezLSF8ljG13
X-Google-Smtp-Source: AGHT+IHpMTSeB6zMvI50xDPO2exJ85pATdqvfP7zurRqblFkmX4J44rhtTKlsZkgg17p9TJUxlb0Ww==
X-Received: by 2002:a05:600c:45d4:b0:458:f70d:ebdd with SMTP id 5b1f17b1804b1-45b5179eb97mr317611345e9.16.1756458291328;
        Fri, 29 Aug 2025 02:04:51 -0700 (PDT)
Received: from localhost (ip-109-238-218-228.aim-net.cz. [109.238.218.228])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b6f306bffsm108502645e9.16.2025.08.29.02.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Aug 2025 02:04:50 -0700 (PDT)
From: martin.jansa@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Martin Jansa <martin.jansa@gmail.com>
Subject: [PATCH] license.py: drop visit_Str
Date: Fri, 29 Aug 2025 11:04:48 +0200
Message-ID: <20250829090448.10066-1-martin.jansa@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 29 Aug 2025 09:05:00 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222606

From: Martin Jansa <martin.jansa@gmail.com>

In https://git.openembedded.org/openembedded-core/commit/?h=kirkstone&id=abc93390a3f19bc4cc159c5690a478b9e2270906
visit_Constant was added for compatibility with Python 3.8 and newer, but
visit_Str was kept, because at that time bitbake did require Python 3.6.

Now latest bitbake requires 3.9 and even version 2.4 used in mickledore
builds requires 3.8 since:
https://git.openembedded.org/bitbake/commit/?h=2.4&id=744310f360d2288ac2ef07745abc86852126b5b9
so we can safely remove these.

Signed-off-by: Martin Jansa <martin.jansa@gmail.com>
---
 meta/lib/oe/license.py | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/meta/lib/oe/license.py b/meta/lib/oe/license.py
index ca779d3d83..bd28a247c9 100644
--- a/meta/lib/oe/license.py
+++ b/meta/lib/oe/license.py
@@ -84,9 +84,6 @@ class FlattenVisitor(LicenseVisitor):
         self.licenses = []
         LicenseVisitor.__init__(self)
 
-    def visit_Str(self, node):
-        self.licenses.append(node.s)
-
     def visit_Constant(self, node):
         self.licenses.append(node.value)
 
@@ -240,9 +237,6 @@ class ListVisitor(LicenseVisitor):
     def __init__(self):
         self.licenses = set()
 
-    def visit_Str(self, node):
-        self.licenses.add(node.s)
-
     def visit_Constant(self, node):
         self.licenses.add(node.value)
 

