Return-Path: <philip@balister.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5274CCD193
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 16:13:27 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.17168.1760450192612242373
 for <openembedded-core@lists.openembedded.org>;
 Tue, 14 Oct 2025 06:56:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Zb9O8pgc;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: phanirajkiran.a@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2897522a1dfso50037345ad.1
        for <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 06:56:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760450192; x=1761054992; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Jq6RrIgRHQyCTIBBY4hFyOiYwnCKEr2meocmtBMkJqk=;
        b=Zb9O8pgcOr9B2QJIGkYmdo0j2251SYRQJc+qoFQld1qISJnGwS2lJKuf3ozRJTrO8s
         kJcVCO1wEORChAwxRiOCYCUlaKFP0hjyII/qk/WVPLG2bQLOVvQK3B89DHA410mXwF/l
         ovZEgEIyef+zn4A1AULeiXtVA4MCIV0UNCS9Fx5hB+kB7HhvsCPK/K+TIik7/tICyucU
         p8GIVX9qInTx3QHt27VJxNPqslJN+wcXK86e+K8sI9gN/rr/wt4eQh7WscW0jEJJ8Pcy
         RP+YEoSJSxCGpL+exHKvtzr8CUQRXAH/NWLJZc6EH8spSktCUkEDVlrmNcZmzIp1SR80
         rZUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760450192; x=1761054992;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Jq6RrIgRHQyCTIBBY4hFyOiYwnCKEr2meocmtBMkJqk=;
        b=JeXBG4faUZbJr/+ClMNl8TC61iz+DJZodsqVtNV79K3F5yaSAbCTZPQvGhTVhQCV1Y
         0NDhVVQoG0noI4VRc1Myjx6B0liM/f8w6WeqW1FCesKTsZf+CzhnnhVs2jnWjwN+O9jQ
         Q2tTz+T79fK/UwfFt6SRvEnd6ARjMUGEsKLZ0cNVJFHqy+6j63DoyQnFmazpsQ/1W+S6
         +xQoPHBa51jmQDXnwHYNkcREwchAeg256NWdnSM2Qipn+Th37ZAkIJ8KcZ0QHYDQ+kZZ
         f3OmMLYJWwGj+Wio55OobvqmP0EAdwQEAlgGFIb6fdFeav0O7eKtnSyoam6ZaCxoX9+1
         tkNQ==
X-Gm-Message-State: AOJu0YxDLYj+G6ZYu7F8MMrmnnJZEg965ZJlBAf/60u2+6K1WBt9TtL/
	D1MUBJNL3Urph8aak0EL2wy1UI+zEgb85mSmELPziYvrQd6Qb0I5V+S1iNWcRw==
X-Gm-Gg: ASbGncu/OjSm4tkNUi4aD7XmB0g5OpUMphgzImurw8q/+E7qRuy8IjXjdg9zxDNMHHQ
	DGoMUKCOnrccNHsb4fA4g4PpEzpogmKJzsNLHGBayeE018OG0dhRaRuWmT7dFvu70VRAwb2zORU
	G2KY1hNqBbDw0H243O0/cTX4y2fi4VvFAYaoRS2nQL236EKc9k7rGU5VLaXkF+MXnNKgGU435e6
	IcNN6nm6iu1ZkguqnqJH2hSCoWgMG0TLFinCJN6F7AwC7PjclVfujrOKQ8LEpaoQis6QK1uklpO
	ScKaFD3BygJ+GwjKyCw+bEGCy/GV5zH3SpxF5yHaOnnVKUszgDHWKv6ki3Lqn9Fd4CICCUttswK
	7vPgk4QzikyPNWloV8VWef+swgisNVN62HVgxfTU1UPc5qyY6sBlALF1vG74CpW8=
X-Google-Smtp-Source: AGHT+IFEvanwzDXZP2z8FcsQOdon3zeqFlRypYXdEPszQTGYAZmr/cMsJbMmN4SlcIxGJnPKDF/eYA==
X-Received: by 2002:a17:903:4b2f:b0:267:a5df:9b07 with SMTP id d9443c01a7336-2902721332amr316858765ad.12.1760450191417;
        Tue, 14 Oct 2025 06:56:31 -0700 (PDT)
Received: from pop-os.. ([59.93.89.240])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f36408sm165390295ad.91.2025.10.14.06.56.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Oct 2025 06:56:30 -0700 (PDT)
From: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
Subject: [PATCH] Author: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com> Date: Tue Oct 14 02:19:57 2025 +0530
Date: Tue, 14 Oct 2025 19:26:06 +0530
Message-Id: <20251014135606.6328-1-phanirajkiran.a@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 14 Oct 2025 16:13:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224840

    [scarthgap] musl: backport fix for CVE-2025-26519 to LTS branches

    Fixes [YOCTO #15932]

    The musl libc code in LTS (Scarthgap) is missing
    the fix addressing CVE-2025-26519.  This patch backports the upstream
    changes (or applies the required fix) so that LTS builds include it.

    Reference:
    https://nvd.nist.gov/vuln/detail/CVE-2025-26519

    (From OE-Core rev: 7af6b75221d5703ba5bf43c7cd9f1e7a2e0ed20b)

    Signed-off-by: Mallapuram Phani raj kiran <phanirajkiran.a@gmail.com>
    Signed-off-by: Gunda Swetha <swetha12g@gmail.com>

    Reported-by: Cristian Morales Vega
---
 ...1-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch
index 3f0b14a5d0..4acedb34ef 100644
--- a/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch
+++ b/meta/recipes-core/musl/musl/0001-musl-backport-fix-for-CVE-2025-26519-to-LTS-branches.patch
@@ -1,7 +1,7 @@
 From 7ee0592397ea0e3d4b47018631642864864d443d Mon Sep 17 00:00:00 2001
 From: Mallapuram Phanirajkiran <phanirajkiran.a@gmail.com>
 Date: Tue, 14 Oct 2025 01:40:45 +0530
-Subject: [PATCH] musl: backport fix for CVE-2025-26519 to LTS branches
+Subject: [scarthgap] musl: backport fix for CVE-2025-26519 to LTS branches
 
 Fixes [YOCTO #15932]
 
-- 
2.34.1


