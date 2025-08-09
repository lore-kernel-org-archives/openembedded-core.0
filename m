Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04EA5C87FCF
	for <webhook@archiver.kernel.org>; Sat,  9 Aug 2025 18:12:13 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.11574.1754763127883168365
 for <openembedded-core@lists.openembedded.org>;
 Sat, 09 Aug 2025 11:12:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=mLV0Hln1;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso2751812b3a.0
        for <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754763127; x=1755367927; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xgappI7kmhC92luV3POKPQm6l5KFsdlpqj94hZsE8mc=;
        b=mLV0Hln1N/kf8vpNpMdH/gav+ykbiDEIcTJf/Du8FlL+wjJ+DwPKD9uYx9NNvXPTN2
         wrIxurIWcRyAx78BWAw7KZ1lO2ZRczYWpJhrWg0mbp+rTKCesAnB8Uc6fY/D6wrpt98R
         6oS7OullT3aVk1PffPrzKJfxgMaU1czRn4FBon+0x0cCSUltsBjg1bW5YXfVMwOkejBH
         agpYg+SodzU9HMp90N6gIKqOHxwK8vlVvIdD5jBQHU7armh419yznKu8rM0F/Y0+waYv
         s7EC81T3T6GS5fkL7iq2I4BZmqPuCkD1v7SLBawtJOypxj4IgmkNm8ZHWTz2VS3R5Fi/
         a7Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754763127; x=1755367927;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xgappI7kmhC92luV3POKPQm6l5KFsdlpqj94hZsE8mc=;
        b=ugVLZbgCZJUrJ+BTAT1V5YWVGmDRNFg3COdaB8doD1Lf6rpIem4fB7E2naoXbaQjV4
         6haQMLzl8pPV/u901M5ZqkLEVkBHhO503Nc6i4rUBB2863/PhlkbfQF8Q8anwoTPFIYk
         qFh8TDoVz99OdZ8nf1XGgULKqicCbJGqwtbzwEMtR8yiKVSg4PFsTLxqvUOWkiZUL+xc
         qg6m0/Ucz0XhQ6IyZdVjXbQSkvO9IeHyKWhE9nigkCCYBi+DQFP2/OF3riy4GrunFMEK
         TfDiGDjFU+4GgyuxV0ZIJhRyvXBeJhX2OxxF2ywiy3LkIMyZVGlUHr6nXagYh9vn17/l
         SI9g==
X-Gm-Message-State: AOJu0YzizWtMgfbTmcUL52OSw0V600GaMYvmLuyPTGUrtdTdFlxHdrrc
	SZP3BdkAXfkqP+9mr83NwCR9z503NRhmzyAy/TwNwcEHrK3Me2Viy39oZkyzuPYHe9w=
X-Gm-Gg: ASbGnctgbzbN8E8juhHWSwUuXtQMwbTnp7kWC9cylMBnNQBDPqTUoXallL6/NkgwjuS
	3acwkxRNzwurO6QdPXnuixNgl1pPyszhWb+4q1yK8ckLCpy0RaiSnIfxN3sOAotdXkIhecCdFa1
	45TYefFQ9CfDfUuTIPC6cMuJuHiGZyESFAiZ/FMKQ2TcUc/4xopl+sA7okXliQbADqiy4+d7r5I
	wR/UBTP4cJlOlt+hQ9cgNmqidjV/Ydt47pli//MkeqLdwajJloyzS4jxsMk+oKouD/r3UAzxHrm
	/ywSMCmNG+l/HphNTXRoAKQ4fdz5hSj8K/mvkSCMnszytFp0AqFfhqBtSOogYcpNmEAdWQ6QX8K
	HwA7PGjzCup4T8w7kOR66tw==
X-Google-Smtp-Source: AGHT+IGF/nu3p0VGCkwrcIJ+dzyCyAIWfA/IC0ypGVWoPQ4A2XRboRVUMY9iIMNgw6uJm1McY2c/mw==
X-Received: by 2002:a05:6a20:3c8f:b0:240:195a:8324 with SMTP id adf61e73a8af0-24055015142mr11453320637.2.1754763126824;
        Sat, 09 Aug 2025 11:12:06 -0700 (PDT)
Received: from apollo.tail3ccdd3.ts.net ([2601:646:8201:fd20::d912])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-76c2efd89aesm8725523b3a.106.2025.08.09.11.12.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 09 Aug 2025 11:12:06 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] go-cross: Disable build with ccache
Date: Sat,  9 Aug 2025 11:12:03 -0700
Message-ID: <20250809181203.768245-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 09 Aug 2025 18:12:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/221686

go compiler does not work reliably with ccache
gcc: fatal error: no input files

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-devtools/go/go-cross.inc | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta/recipes-devtools/go/go-cross.inc b/meta/recipes-devtools/go/go-cross.inc
index a0fbdbe3b93..ebee2e53cde 100644
--- a/meta/recipes-devtools/go/go-cross.inc
+++ b/meta/recipes-devtools/go/go-cross.inc
@@ -5,6 +5,8 @@ DEPENDS = "go-native"
 
 PN = "go-cross-${TUNE_PKGARCH}"
 
+CCACHE_DISABLE = "1"
+
 export GOCACHE = "${B}/.cache"
 CC = "${@d.getVar('BUILD_CC').strip()}"
 

