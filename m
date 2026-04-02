Return-Path: <adam.blank.g@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7135DD6AAE2
	for <webhook@archiver.kernel.org>; Thu,  2 Apr 2026 15:39:46 +0000 (UTC)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.18704.1775144384103535202
 for <openembedded-core@lists.openembedded.org>;
 Thu, 02 Apr 2026 08:39:44 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=Jvn+k6Hu;
 spf=pass (domain: gmail.com, ip: 209.85.218.51, mailfrom: adam.blank.g@gmail.com)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so124377966b.1
        for <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 08:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775144382; x=1775749182; darn=lists.openembedded.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CLQ26SROjLaf+bU0PGYWx8zrwQBHbdW8/rebvKGWllU=;
        b=Jvn+k6HujZ1qCB8hE7dzkX2bz9AAtoaZRUj+I68xG1ErQ2VSE/O4Oq1HdRKVD+8DvB
         Ud2ym6rxk5n+vR6XxP1Ybpf26A3+Wd9ZEROQvkufI7IvZYIkg4xie/GugtPWL8tv8Qoc
         pTI0k9n+K63EO4mYZGRj+0rHZ+g1jBJX41n/NFN/TtMFpg7EHBOsIbMzBheBnCVqU9/B
         ZPN2/nRIW6vCxy9j2rG7+cvjvc58GcECCaR5sXhj+AuV/Kz5QdMsM4j04DGOz3mofGnG
         wWsPx8fLv1xgw8nQWr4kqdbKqox9IUode8n/U62+r4uT7w0HYDiWAxglfyUFcz2Ewnfd
         Mcew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775144382; x=1775749182;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=CLQ26SROjLaf+bU0PGYWx8zrwQBHbdW8/rebvKGWllU=;
        b=YH852SVaBVgxzkrUMgXb8BES1SavQQV4hVuO5B9V3Bldd4UiLAAkZ59dZq5RfoRA/J
         sQ6S0AWWEZYBWBtSFc+r/G9eTZ6+1oNnR74qLWoE5H3WYkxxSvqj/n9/dg+3ehSvFjtH
         cVqyLPrAcJbgRZ9GV88xm+jWAdYz6TwzM3VjVo6iTqCdv+NmWYrfNID615t6EAr2zB9F
         KdZWpilaIvGlIuErLwWnOz+hko9fh6Gt1vCIFI0TK2wXqtL9926cYzpMNYnwg0c8h3eN
         77jeS2/k19nKGmFKxrCPyKUpEQ1PWQnVmTQF4lx2HaQtf7eiWZYkta8iE/WcLMIzFn6i
         jx2Q==
X-Gm-Message-State: AOJu0YwV/agjeA5cdl3UJW5GZq0uh04QVfufASMg3nZTBWZrSCXw+66b
	jrph7/qiEwTYOOjwT9vt5XwZhrisf8SSakxvsjfNaEe/aq1ElmDG24xD
X-Gm-Gg: ATEYQzwF5+WRy170zPxOP7pho6p3uDghn47Qb3RotbQJLZ35gKdyrUJKtmKE4+ugG1d
	dpWfd38fBU4Y7TK3SvZnNWhfjZPYIJ0PzuYqM2ns6rnmya0ep91N3LuyYyFy9KD2+7RyzBPQxbJ
	1Ola2gxxoaJF2A4JEi61asZiK7/au0FaniDkOCGDiR1BqHQ1um+XiFrJD82v7BxaHChvYaW7w6k
	+Ggw5l0snR6pSAAFQ9E3cgg5J/uBxBwZi08MC9rzWIRRZ/LuwiZfdQX+RU6/pOChyNogMXRVmHn
	/RgKSpv0GG3eNdCAsC5BXkkT5VP0xdBUDvrdzzVyZ/PLEDzhVgfzzrzBvCaovpVqDDUTGPwXkxa
	VZSyA8MvecpwGRBULaG+hoOaJI00eN3Bzvhym43Lnr0GPb7gaO8GsoQoqXIj51KIakTqo5mYsfs
	h3P+VD37L9TaSs1Rh35oFgRj445auZrg==
X-Received: by 2002:a17:907:c1a:b0:b97:ca81:e89a with SMTP id a640c23a62f3a-b9c133af529mr498051166b.0.1775144382375;
        Thu, 02 Apr 2026 08:39:42 -0700 (PDT)
Received: from [127.0.1.1] ([2a02:a312:c8a8:7a00:fb7f:9298:379f:1206])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cff130fsm101831066b.47.2026.04.02.08.39.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 08:39:41 -0700 (PDT)
From: Adam Blank <adam.blank.g@gmail.com>
Date: Thu, 02 Apr 2026 17:39:38 +0200
Subject: [PATCH v2 2/4] package_pkgdata: fix typo to stop calling undefined
 function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-dead_code_and_unification-v2-2-259169372299@gmail.com>
References: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
In-Reply-To: <20260402-dead_code_and_unification-v2-0-259169372299@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Adam Blank <adam.blank.g@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775144377; l=1107;
 i=adam.blank.g@gmail.com; s=20251027; h=from:subject:message-id;
 bh=EyVWYhsHSZD3ytYYrXxoSq08+MtFI2MZq9cO+ifvjzc=;
 b=F+P+MZli6iv5S29WEK7Y2zmpDVp2/XVDANZFPXEMnhlMoL+m70noD8M+kjAVOrhFPnRHZSgr6
 t3XE1ib0ykeDcJNhiP4j9upwYJwcdkzoM9tPMNwVo37qFiWwnbh8yxr
X-Developer-Key: i=adam.blank.g@gmail.com; a=ed25519;
 pk=5t8u8IPKPL1CUykIX2JYa+1iHdXRdN5MqI7ik/fbvEM=
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 02 Apr 2026 15:39:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/234541

The function is named 'package_populate_pkgdata_dir' but the
call was to 'staging_package_populate_pkgdata_dir'.

Signed-off-by: Adam Blank <adam.blank.g@gmail.com>
---
 meta/classes-global/package_pkgdata.bbclass | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/classes-global/package_pkgdata.bbclass b/meta/classes-global/package_pkgdata.bbclass
index f653bd9240..5312ca873c 100644
--- a/meta/classes-global/package_pkgdata.bbclass
+++ b/meta/classes-global/package_pkgdata.bbclass
@@ -47,7 +47,7 @@ python package_prepare_pkgdata() {
     # Detect bitbake -b usage
     nodeps = d.getVar("BB_LIMITEDDEPS") or False
     if nodeps:
-        staging_package_populate_pkgdata_dir(pkgdatadir, d)
+        package_populate_pkgdata_dir(pkgdatadir, d)
         return
 
     start = None
@@ -169,5 +169,3 @@ python package_prepare_pkgdata() {
 }
 package_prepare_pkgdata[cleandirs] = "${WORKDIR_PKGDATA}"
 package_prepare_pkgdata[vardepsexclude] += "MACHINE_ARCH PACKAGE_EXTRA_ARCHS SDK_ARCH BUILD_ARCH SDK_OS BB_TASKDEPDATA SSTATETASKS"
-
-

-- 
2.43.0


