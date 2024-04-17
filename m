Return-Path: <ppjadhav456@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 190C4C04FFE
	for <webhook@archiver.kernel.org>; Wed, 17 Apr 2024 12:50:13 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
 by mx.groups.io with SMTP id smtpd.web10.11890.1713358211936205682
 for <openembedded-core@lists.openembedded.org>;
 Wed, 17 Apr 2024 05:50:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XbIMPcey;
 spf=pass (domain: gmail.com, ip: 209.85.214.182, mailfrom: ppjadhav456@gmail.com)
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1e424bd30fbso42913085ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 05:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713358211; x=1713963011; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9su0HQH88SzEvUgg5Juj3eU8hW8sDwBzURITx1r5O3U=;
        b=XbIMPceyzKZxtfuA/nS6nJe/tKpG5uuyuD+g6NdjCLZKC8SaOY+HGiyNCb0pqYHQRk
         1OYBZIukqA0rBLHpajEyrfsasmSdxZb/jq9obQhr2vFEFuG+HYrnW/m44NNH8ySjR9u8
         KqqsiMKoie4hsKa5YYxsDMY9MZFuUQERsrnE46oQEdbgVwlB35pCgUhs8Ol5jybXqa4N
         hk9aUVUTK2boqQGU3ky9UucBX7DI2pvnYVdtbAWT3OjvanQkHcBA55FxKU4OGG52w1z1
         u4OUjVhjW/vYF/hZZ/fLvxZWwIvi0TW/n79hrYiXa4aWu5qNSq73p41Kciv+Hn1iqx0s
         KfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713358211; x=1713963011;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9su0HQH88SzEvUgg5Juj3eU8hW8sDwBzURITx1r5O3U=;
        b=dIbf9OH7qXCTbGmcAw/q4ankV4iM34BCcOfxxoI2VSoyGUFFLEMXON+PINfImyEnNG
         BQpQWGX514zyKbOoZZF6nA9qy/bby2BFj5qJT7mVt20g6O5cM8N16FL3L9jna7qV6Q/O
         /odEh0D0/XkcfYq1WLsKgPOt4oqtY81v9fqHUjY2MV6eR3hQ3Rs06Owh47kJQZBmUdRu
         IUgbgxE/4RNJMR9n0EhglsV0WyRsbuI1xb5jIo3x0JpKf9Tbrs1eBit/0gmoIqEux5WJ
         Lk/bNtToYU/ie0Nb+z4XdaAOSQixHcTz5GJ/M8F7KxOOUrflH32kpSIvIWNebJNw8SaT
         OwpA==
X-Gm-Message-State: AOJu0YxSXqNOp/phlEnveKll7Que+joHmpBfGhEOUDnOPFGkcmfrwl6P
	wfpMG0hUXxcfDOFrr2CsjsG/YQPfFNabFjxpEKhwcWrles8AJrKREowI/w==
X-Google-Smtp-Source: AGHT+IFBBdQyW6akV6wJrxiGEoXr6gh/P1lhbm3yr1JO7lbU6/EYA5MmIuDkTk6D+T1FpsCupBsnLg==
X-Received: by 2002:a17:903:32cd:b0:1e2:90c6:839a with SMTP id i13-20020a17090332cd00b001e290c6839amr21705987plr.31.1713358211203;
        Wed, 17 Apr 2024 05:50:11 -0700 (PDT)
Received: from L-14805.kpit.com ([43.231.237.174])
        by smtp.gmail.com with ESMTPSA id mo3-20020a1709030a8300b001e510b3e807sm11480715plb.263.2024.04.17.05.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Apr 2024 05:50:10 -0700 (PDT)
From: Poonam Jadhav <ppjadhav456@gmail.com>
X-Google-Original-From: Poonam Jadhav <poonam.jadhav@kpit.com>
To: openembedded-core@lists.openembedded.org,
	poonam.jadhav@kpit.com
Cc: ranjitsinh.rathod@kpit.com
Subject: [OE-core][kirkstone][PATCH] ppp: Add RSA-MD in LICENSE
Date: Wed, 17 Apr 2024 18:20:00 +0530
Message-Id: <20240417125000.239386-1-poonam.jadhav@kpit.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Apr 2024 12:50:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/198465

ppp package has "RSA Data Security" license text
in Message-Digest Algorithm source file md5.c and md4.c
Add RSA-MD in LICENSE field for ppp package

Signed-off-by: Poonam Jadhav <poonam.jadhav@kpit.com>
---
 meta/recipes-connectivity/ppp/ppp_2.4.9.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
index 7e3ae43b58..b7f71b673d 100644
--- a/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
+++ b/meta/recipes-connectivity/ppp/ppp_2.4.9.bb
@@ -5,7 +5,7 @@ SECTION = "console/network"
 HOMEPAGE = "http://samba.org/ppp/"
 BUGTRACKER = "http://ppp.samba.org/cgi-bin/ppp-bugs"
 DEPENDS = "libpcap openssl virtual/crypt"
-LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD"
+LICENSE = "BSD-3-Clause & BSD-3-Clause-Attribution & GPL-2.0-or-later & LGPL-2.0-or-later & PD & RSA-MD"
 LIC_FILES_CHKSUM = "file://pppd/ccp.c;beginline=1;endline=29;md5=e2c43fe6e81ff77d87dc9c290a424dea \
                     file://pppd/plugins/passprompt.c;beginline=1;endline=10;md5=3bcbcdbf0e369c9a3e0b8c8275b065d8 \
                     file://pppd/tdb.c;beginline=1;endline=27;md5=4ca3a9991b011038d085d6675ae7c4e6 \
-- 
2.25.1


