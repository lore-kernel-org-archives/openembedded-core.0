Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5A49C433F5
	for <webhook@archiver.kernel.org>; Sun, 28 Nov 2021 21:59:16 +0000 (UTC)
Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com
 [209.85.216.53])
 by mx.groups.io with SMTP id smtpd.web10.53483.1638136755563820310
 for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:15 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=zAzaI5R3;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.53,
 mailfrom: steve@sakoman.com)
Received: by mail-pj1-f53.google.com with SMTP id gt5so11014699pjb.1
        for <openembedded-core@lists.openembedded.org>;
 Sun, 28 Nov 2021 13:59:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=hvaLMayxYdJVfXOW6WrzTw3ytpYYqjEHdq1ZlvhbovI=;
        b=zAzaI5R3lmo+rR4APCB56+/VbVGkDVT8lUVHKriG0ohF3wfG8iTPNuzYeYKbRR9yOm
         F/TZPvoyxY0U5UXZWOqlt3YYs1M0B0Fe+E3Xt6rTINrfKXKROYlwnBA3vZPOg/g6SkP0
         IzDel3ofDa4qM4DhKm4GiEGF2T7xPn4Qg1hEEB0fas2R8XmNqc4tJvyum0HvoBALazHz
         1LAUdoCrKAUoEQOfFdudieVWHuKLBj81YGqXnT8mHP0pAXY9oXGiXZ5FvAlyl7GuA4vX
         VASl4RSSRiEYbdwyi37g79isQSTPRMlsfAJJ4zTNmJVbvDl8EyR5iM5h7XB7fRB4Lx8m
         3m5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=hvaLMayxYdJVfXOW6WrzTw3ytpYYqjEHdq1ZlvhbovI=;
        b=s+UD9m99ToDnNIj3P14s2la0e0vhtLyZjIh5oVUmCMdbce36CVSi1EvhKIBSfrMx2G
         XbalePhFRtUpb/DRbV9HDl86/DilkIjye95N3L/e2vK264BnH7tThVlFOGBEqU2QTQpO
         YzX4enPGWIruDz4tK7ZrxHhgq4PMRBN4fjfJCCh1WszysBe3hAGdTA8gjOTsTT87fmSG
         NDXbAODdD1QDwCG3dPlyVfGg3IlN+dr/98cGRUYypWmG59eAkfM1wemut4aw4a9MabDd
         viDzclj2K1mm8HCPDvMWr85EcEYSc9LCI5Zwx3gNfTTBJ0W3IlyD/0ni6y2bo9gr9XqZ
         zxvw==
X-Gm-Message-State: AOAM532lWlgFXUnDQ+a3KzRT+eCgg2qvVkHHRgZfsrPU/sXX0VTh4Uko
	ue+6y2XQ1G9/HTrns42o9zqOuMHs+xdCd4bOaag=
X-Google-Smtp-Source: 
 ABdhPJxDFSJ9pyD25UZET8WuBBCTlnynLWwyd0LoAY1dCa/m0jJSomuilRgopPqiSv6vBA7cLTV+JA==
X-Received: by 2002:a17:90a:909:: with SMTP id
 n9mr33665941pjn.1.1638136754521;
        Sun, 28 Nov 2021 13:59:14 -0800 (PST)
Received: from localhost.localdomain (rrcs-66-91-142-162.west.biz.rr.com.
 [66.91.142.162])
        by smtp.gmail.com with ESMTPSA id
 y32sm14769050pfa.145.2021.11.28.13.59.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Nov 2021 13:59:13 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][dunfell 22/42] docbook-xml: patch is not upstreamable
Date: Sun, 28 Nov 2021 11:57:34 -1000
Message-Id: 
 <5bb66499b081c4354b3dd7c84c3f05d1d5333b89.1638136329.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1638136329.git.steve@sakoman.com>
References: <cover.1638136329.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 28 Nov 2021 21:59:16 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/158904

From: Alexander Kanavin <alex.kanavin@gmail.com>

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 9ca29d47755929c5c26c96150cb5e2e353182c70)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
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
2.25.1


