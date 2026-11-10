Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12910.1794282769114204870
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 19:52:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=SsJYTGVA;
 spf=pass (domain: gmail.com, ip: 209.85.215.177, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc1bc88a20eso1053524a12.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 19:52:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794282768; x=1794887568; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mjWYnKHfeoH03hox/XEjHYwTcnsvKqlZv9lNhLEoa3o=;
        b=SsJYTGVAE3AsaB75GzGFeQuj/5EO/acLV9JAIppEy31nl6sC7S0hH0dnt4tEps3q1e
         EKQtFTNxAQid05Q/gOM0fZThmedtASwM0gTG1+dvjq4UB/Oe/gNLF/o9v0uLljHqGvch
         e+rgkmJs90/w6jva4r/4V5i+65abB9e0cilhAZ3kqQTRupCHQGJVtmbulEUaJs/nZZNw
         pRxzmPwxDX3NHGF9v3E15gZJlvf4d2tXIgC/I4d3qixZ2EHK/njzh6DVfduH+6YzLqob
         pds4dRRbaxwrqB0SYgK7E3bZy22qS+xE8Yuf/MRAErTdYLVCbYjxEMNe89cCsLXufCB0
         yiLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794282768; x=1794887568;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mjWYnKHfeoH03hox/XEjHYwTcnsvKqlZv9lNhLEoa3o=;
        b=w8pnHpOBa813+UJxQ8fv1b7EaN7p62+fKTUXY8Qm2dQuP13OmxoW2cdZIGR2PqS8hM
         8u7xGrl+6CC8GfnRDad0Vg38tVLMq/vZRrt61J1bRaKjGkWzbRmFwZCRfFZI3/+2AXHq
         5sNL0zUEtUtIrpwQX9Z/AnK5L1jIvKXq0VDeNRQx3ihh3NMsL6UbwJ3Ijlnj/pfsH2CZ
         SfqsaqKxN4ace4adwqx6wpJzKTcmdVCe+FV79VWHZu4fhtSYjmZ2oCzcU/BcvAzCsHZs
         hKr7wR8hFV8p9KpYg7s+SiLM/GReVPgNaTk2U+XRubxRqTicIc5IUJ3RQ9YI53cieB8p
         TZyQ==
X-Gm-Message-State: APuU4Z8IJKvCD6Sn6pIKqZIE4j+SEmjGibm9gWdJnnlRb76/ZSCuPwQI
	Rf5kd/g70i4uhCPhyPZTepK+JnWEahSf9SWUTIu5Fdsm61KDVS/cZVHomLhM81y8
X-Gm-Gg: AYBFou2zyEZ4SQYMzMVz6FHKReBWCMUZo3TZRMhw90eTu/PFMbaEu6KG6PYWK+2eQJc
	4rjXutIj0SP8aceCB9QpjbSRPZ0L6lDy/QTlQdEFoIePH2tVEkfu09/XYtmy/+FXAtlMEfQPCca
	CDLe3rDIxHqGvqRQQIIxO159mfoWhwNrmSWiOlZVEqlbpHF4Pl0vHzQCyqW2uwRFnL7WyL6Qcfn
	iNCC5Zrilr5WnMJIJf7BEVrR18T+1/312yynX8dLRyBZEnUIl9+N2TsEDh3ZsQw1WkqYMRi1sBH
	p+jCzvd3wUyXtkU3BjKaAjKvg4XF8aS1B63ZYAD50bhCIxDEPq3TM41MB/zKDyXja0NLvVeRmS/
	ZkJLFLmISIxe0jiIX/kNrRJfjwkMFI0WeezaFOsAISlE3M8Q26njbhLNVxeFXxbREAlXbbkVpjB
	tcxHiPcsv28hQ95ckAJd06VKYXHQj7P+Di42Krrs/En1uCQNyZ+UhvOOnlN6BIRa/LehcGOpnZs
	xNB1/CAK0RzqEehffjOI5DoQJ7HVhTomlf7LLvxYwATm8yAAG7SGGlj92YNn5bkA0Fs0A2xkA6+
	BSlefEbs2R0gBFIOOuSBY5xOwaQRrwDPSwqVOk1Tz0uBGdACE1nvWBvD8reSCA==
X-Received: by 2002:a17:90b:4ac6:b0:3ab:27f0:c90b with SMTP id 98e67ed59e1d1-3b166cdad42mr1869165a91.53.1794282768409;
        Mon, 09 Nov 2026 19:52:48 -0800 (PST)
Return-Path: <ankur.tyagi85@gmail.com>
Received: from NVAPF55DW0D-IPD.. ([147.161.217.9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b16708f963sm2077346a91.1.2026.11.09.19.52.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 19:52:48 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [OE-core][PATCH 6/7] stress-ng: upgrade 0.22.01 -> 0.22.02
Date: Tue, 10 Nov 2026 16:52:28 +1300
Message-ID: <20261110035229.2940188-6-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
References: <20261110035229.2940188-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 03:52:50 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249893
Content-Type: text/plain; charset="utf-8"

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Changelog:
https://github.com/ColinIanKing/stress-ng/releases/tag/V0.22.02

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../stress-ng/{stress-ng_0.22.01.bb => stress-ng_0.22.02.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-extended/stress-ng/{stress-ng_0.22.01.bb => stress-ng_0.22.02.bb} (94%)

diff --git a/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb b/meta/recipes-extended/stress-ng/stress-ng_0.22.02.bb
similarity index 94%
rename from meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
rename to meta/recipes-extended/stress-ng/stress-ng_0.22.02.bb
index adf9331cd7e..bed03325bc8 100644
--- a/meta/recipes-extended/stress-ng/stress-ng_0.22.01.bb
+++ b/meta/recipes-extended/stress-ng/stress-ng_0.22.02.bb
@@ -6,7 +6,7 @@ LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
 SRC_URI = "git://github.com/ColinIanKing/stress-ng.git;protocol=https;branch=master;tag=V${PV}"
-SRCREV = "72a9d0cae0f420a887991d4024d3101c4af7a4fc"
+SRCREV = "e1a93515da37db1e1b0d07f6ed932c83b7cefd3d"
 
 DEPENDS = "coreutils-native libbsd"
 
