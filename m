Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11870.1793806546882519766
 for <openembedded-core@lists.openembedded.org>;
 Wed, 04 Nov 2026 07:35:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=cxabRe2d;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: jpewhacker@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-4c5d8c7f326so311790b6e.1
        for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 07:35:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793806546; x=1794411346; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BTYMigd0+ZyC4B85UyNY8s3jidM5wVxaP5djY52xhfM=;
        b=cxabRe2dIDWW7Da23Ygi9A/REHjtYB/ZThDLz3yGwPK4YqNKhGR6K4dtT7XeKB5vrd
         SyXePapJs0PJp6cruVp26wBDPOFKUDnGeUoe9Mqirl94WHhAH3LZRrdqMmMxQHXEAgHH
         ldlANVeeGwj52eWi0F1D/5j+/sJ8I8h/GgA+9RbbYluHZT9igM6DbMKxS1bvdcj4+lzj
         pF71G9rkt6/4rwUuNyhzB5agA1Lw87TlmOCP8LrXf46ejVrhDrDXFhl3/nuacDbe77Vl
         Q+lHQrJRE8RR+iPeCBGsINZfzOa4vuXT8W2iD1G/LaaOdd7iRbNwfpVMN9N7TMErNftj
         FQlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793806546; x=1794411346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BTYMigd0+ZyC4B85UyNY8s3jidM5wVxaP5djY52xhfM=;
        b=EGuOffJ9apkA9Mj/3j9ubGy+orGWc4EalIJFjDyY4VzMiKZhqJsSys5PhbCtB21n71
         7yLcjTNkp1a1RDHxJjwF8fKbLwuFSDagk6rQ+W2x08RG0axC9ktgV2X+f0MKBlFZKYrN
         zVWnF3is5exOjQGm7MIQtDAlFUKamZak7nj/4cLjc3gq8USZH2ajsMUDbR0AmowwTumN
         ClqcYXxjtwA3lSYhVySmKWEOLeOs8HJ/oDHLn5UlxLVdu0YwBq9pDR+Gt2OUW4SSWowD
         9ynoK6Pr8/aLeKCls6rhHIjOBXekzx7WCWqfJwMgDNmXaNApVunrLp1cHBOoIyWrXqGe
         qZNg==
X-Gm-Message-State: APuU4Z/eVGi5E8HYrL4bNwLy+5AyPi/OyXEZ4A/duqvmdaJN93lk3Bxp
	a/YOTsw+gOF5NMsrEhAODrKyTBpe0juIydDzKKw3T1MCO6rto7Cq1zj+Hweb4Q==
X-Gm-Gg: AYBFou1ySkW4+UWpPh8xssae1Zu1i1+SgOzXy1QyBa01yMSF7D/DV/3gZHKrk+yVP7f
	GqVFcj+OtyzOIdLPujXE3MCNatiKBiwSC7FYzL6+qzEofK59Kn5ECvGiKYYKahSpLzpHsVs1ecF
	3wLVtfDTXZS/uXA2ddPm2YOqOuolaq762v+ID9+WE7VRv82N3TFaaEgqvGxrSi582eQHGCO6vBl
	gWXFHRygfG8/eCnSMMVGjbprboSKilAOTQ5mhff7rPHz/RVuSHrSRGgomE59RXgXZugGguQdpU9
	jYtZaj2WfatWitwNHdVAaYfBcjYB+j1IzAMA/eT5u1xiq2nkxUFfanVwuoHH8G8UpwjNvXxEnGi
	ZJdGB0DqXKH/GpOTfie1PlZuuRoT/oeERG4O9UCv0MDq3ISSAClTYMf64h0YMhNlE1U4csQOozV
	tPirU/0B/QohigcnKIktCwlEnvFygRaSoxTxJS89fRwLaihz7cM73D/AEQfsvtTpoJ5+KMFDPcm
	vSfz5Ld6EevWjBSauF/HF+5JbSGx5hEmI9nosV4d8AHvj2xJ2Jd+d4qrFwXZcSmrTVQOMI3+P//
	pkO5AcC6tV/78vQIKVzHd+BUmRGoDFW1wUS+JqDAS8aToJZm
X-Received: by 2002:a05:6808:6503:b0:53b:1d13:dffd with SMTP id 5614622812f47-5640d917ea3mr11707243b6e.7.1793806545917;
        Wed, 04 Nov 2026 07:35:45 -0800 (PST)
Return-Path: <jpewhacker@gmail.com>
Received: from localhost.localdomain ([2601:283:4b01:ba50::1d6f])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-567a9f9f8basm1894928b6e.12.2026.11.04.07.35.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 07:35:44 -0800 (PST)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Joshua Watt <JPEWhacker@gmail.com>
Subject: [OE-core][PATCH v8 8/9] ovmf: Allow empty SPDX deploy artifacts
Date: Wed,  4 Nov 2026 08:34:01 -0700
Message-ID: <20261104153535.3184146-9-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261104153535.3184146-1-JPEWhacker@gmail.com>
References: <20261028220609.1348489-1-JPEWhacker@gmail.com>
 <20261104153535.3184146-1-JPEWhacker@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 04 Nov 2026 15:35:55 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249402
Content-Type: text/plain; charset="utf-8"

In native builds, ovfm do_deploy doesn't produce any artifacts. Set the
SPDX_DEPLOY_ALLOW_EMPTY flag to prevent SPDX from erroring when this
occurs.

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/recipes-core/ovmf/ovmf_git.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/ovmf/ovmf_git.bb b/meta/recipes-core/ovmf/ovmf_git.bb
index bf69108f0a..7cc844dfa6 100644
--- a/meta/recipes-core/ovmf/ovmf_git.bb
+++ b/meta/recipes-core/ovmf/ovmf_git.bb
@@ -249,5 +249,6 @@ do_deploy:class-target() {
     fi
 }
 addtask do_deploy after do_compile before do_build
+SPDX_DEPLOY_ALLOW_EMPTY:task-deploy = "1"
 
 BBCLASSEXTEND = "native"
-- 
2.56.0

