Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EE42C04A95
	for <webhook@archiver.kernel.org>; Thu, 29 Sep 2022 08:58:45 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web09.8214.1664441916628844652
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 01:58:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=NGo43kMv;
 spf=pass (domain: gmail.com, ip: 209.85.221.48,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-wr1-f48.google.com with SMTP id h7so1073455wru.10
        for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Sep 2022 01:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date;
        bh=ivG21rabgXwbYpd+zindqVRKLJgL2ZacRlXICe2SaZA=;
        b=NGo43kMvE8s6gCrEKo4hXjB8sZx2ohcouwqMzm071ZtDfPQpe/h3uRXTF9ODJYqiVh
         SdnvtkF9Ibo/mwN5h80jyJiXp7LuJvU8v9yGywQwgRytASjOyjESniZbv7+ybeADYiCl
         tBZYEiJ/Oluw0daFuAWImWJo59A7t3r5jgntK4lGOVgKhRAg6MfIk69C9ZMlyK+7zxa+
         IChIYPFUczG5Bxb6g3gt5Hn6UH+SV4ApGIGzmXjSPUP5B0BEE6/TVkit0H0VjfV8pxb8
         XcuvvkspCGKHSKAG8pQEsKwnSO2/xa7Ki3o7SGM+XFRlwKT/cEJaEkAptZbqxJW0rQjx
         3usw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date;
        bh=ivG21rabgXwbYpd+zindqVRKLJgL2ZacRlXICe2SaZA=;
        b=uLmr5ubCjNSmBl1OaneDeaPV4/FiO8hEYwudfnEXIWIfTEh/d8LByyY46tnk5c/0vR
         QCLACJAWif8hmPlzmCk5g4PwkxMcivKLCQJ94Xti0cKi3SWU+xuIn/IRGFnKiVe9zsQj
         vlrOLaRMRFtlzxPNWOCksa0po8xJ/IDFtr5uof0fak3+b/lGLOZsAphj8MxlI//zGnlM
         zuhKg7zl0PPLbtvIahsmerWGfHHVcd2uM466Aa9nCDwxomvp9lXWjfdv6/SO64yryu5c
         XPyd/KDEd4XyZO3LP+vsxGh6rFsXGzYzqsvqowm3/MgWMEF71duwBZ2XK2Z9twonWbeM
         EmvQ==
X-Gm-Message-State: ACrzQf0OfyOjfRDfGeuhtZTGe4613bLpKumJvQTZaKBlhpT64R/JG/HO
	EQwQCVl/yIqLKz1SAqoQ28PT7hVsnj4=
X-Google-Smtp-Source: 
 AMsMyM7eDmd3e8ITA4jSxgDLddd1ZsZx7hiHsB4DcfeWKMEfhym8PHPzIC9UQtmU6jEHtb2xrMj5Yw==
X-Received: by 2002:a5d:6da1:0:b0:22b:774:52c3 with SMTP id
 u1-20020a5d6da1000000b0022b077452c3mr1415228wrs.172.1664441914915;
        Thu, 29 Sep 2022 01:58:34 -0700 (PDT)
Received: from Zen2.lab.linutronix.de. (drugstore.linutronix.de.
 [80.153.143.164])
        by smtp.gmail.com with ESMTPSA id
 d3-20020a5d4f83000000b0022cc157bf26sm5670322wru.85.2022.09.29.01.58.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 01:58:34 -0700 (PDT)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Google-Original-From: Alexander Kanavin <alex@linutronix.de>
To: openembedded-core@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>
Subject: [PATCH] tzdata: update to 2022d
Date: Thu, 29 Sep 2022 10:58:31 +0200
Message-Id: <20220929085831.2287644-1-alex@linutronix.de>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 29 Sep 2022 08:58:45 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171176

Signed-off-by: Alexander Kanavin <alex@linutronix.de>
---
 meta/recipes-extended/timezone/timezone.inc | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/meta/recipes-extended/timezone/timezone.inc b/meta/recipes-extended/timezone/timezone.inc
index d032fed356..d3c78e9157 100644
--- a/meta/recipes-extended/timezone/timezone.inc
+++ b/meta/recipes-extended/timezone/timezone.inc
@@ -6,7 +6,7 @@ SECTION = "base"
 LICENSE = "PD & BSD-3-Clause"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=c679c9d6b02bc2757b3eaf8f53c43fba"
 
-PV = "2022c"
+PV = "2022d"
 
 SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz;name=tzcode \
            http://www.iana.org/time-zones/repository/releases/tzdata${PV}.tar.gz;name=tzdata \
@@ -14,6 +14,6 @@ SRC_URI =" http://www.iana.org/time-zones/repository/releases/tzcode${PV}.tar.gz
 
 UPSTREAM_CHECK_URI = "http://www.iana.org/time-zones"
 
-SRC_URI[tzcode.sha256sum] = "3e7ce1f3620cc0481907c7e074d69910793285bffe0ca331ef1a6d1ae3ea90cc"
-SRC_URI[tzdata.sha256sum] = "6974f4e348bf2323274b56dff9e7500247e3159eaa4b485dfa0cd66e75c14bfe"
+SRC_URI[tzcode.sha256sum] = "d644ba0f938899374ea8cb554e35fb4afa0f7bd7b716c61777cd00500b8759e0"
+SRC_URI[tzdata.sha256sum] = "6ecdbee27fa43dcfa49f3d4fd8bb1dfef54c90da1abcd82c9abcf2dc4f321de0"
 
-- 
2.30.2


