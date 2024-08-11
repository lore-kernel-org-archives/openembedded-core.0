Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF149C52D7B
	for <webhook@archiver.kernel.org>; Sun, 11 Aug 2024 15:55:27 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web10.26714.1723391719314348372
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Aug 2024 08:55:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=DGdoBzQ4;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7106e2d0ec1so2588140b3a.2
        for <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 08:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1723391718; x=1723996518; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=7d4/4HTikA/nl3uNci2BTQ9deV0mOugO3YGera0skE4=;
        b=DGdoBzQ41liiqe3IGTGVrRJejVsFOtgADdsF8rHliAjMACV3/1HCkwofQrkzUP9oIF
         MzyPJ7F5AvMsFLEcX10bNIl/EH/JS0IXNkG5PG7lgrAbE0X10iYrJGcgKSoSc3Tmxpj5
         Vef1kTBnz6IFJfWtT5fkdYBoYzdqFEBENMD049N0ExJGoQLiRWgV8E0/TvzKWBt2kjSb
         qRWPRvRul9jMbzRtUD4m4q9T1NYWaj0i9CdxYwsj7EqKdRxOXXXwvkxwYEyFB6qR0N+U
         RHxHxljaUvH/PYeznyj8E6KANz7mMrp2MyaJO+lVN1hZAudzrTghjDHmzzPMlPd5Hkfa
         np+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723391718; x=1723996518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7d4/4HTikA/nl3uNci2BTQ9deV0mOugO3YGera0skE4=;
        b=HjzGKZod0/zWSNvL/UShKGwI1N0ZXBr6zpBBs+6JJP6dAH1JJHBnFtULoMTwwPmsJZ
         bdPvKqyuMz/Skazr5ngwN8cMT4Kh3EjcsIUy/QK9bvjbN2WuyZJIVZwXYcQgRSuAoMpO
         6cAxRjiMZzgRG50OMyN86gF8uCHOWBGo4YFBRt52zbrkBY0PvTnrasUBUDh9jCA3C4Wn
         PAnSEWyHLPKCJDxWPTXavzSCzS2OnQesF6FjqkBdufN6xQT/gvZhPuJUNlEzVI3K+Fhb
         XCC/tmK2gGaKcqZytf638iKhKM6+c3Gore0fAM3gnV4s0UrkctVy6FNcYDtH/4rhRzrA
         KU4w==
X-Gm-Message-State: AOJu0Yx7fLumGjSK9TsTkjUpdNpBEgqfr0Q+yH5ewOt+wpkkmJ/QzkTJ
	4zJWbdtc5GQHO0lgBL23AufQuRBX6BphJsOsdSEKg7/2xkjkz5kChM8FcQ==
X-Google-Smtp-Source: AGHT+IHFSQG5H+JKGqBYGfXpB4pqjT57udTZOjjC99XusIdj5BLHF5XC0fMt0YMy1fcrihX/odoM3g==
X-Received: by 2002:a05:6a00:21c9:b0:706:6bf8:bd2 with SMTP id d2e1a72fcca58-710dc899ea3mr6531312b3a.21.1723391718434;
        Sun, 11 Aug 2024 08:55:18 -0700 (PDT)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9d80:4380::4c22])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-710e5873906sm2634383b3a.19.2024.08.11.08.55.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Aug 2024 08:55:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] gnupg: Document CVE-2022-3219 and mark wontfix
Date: Sun, 11 Aug 2024 08:55:15 -0700
Message-ID: <20240811155515.3184406-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.46.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 11 Aug 2024 15:55:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/203184

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gnupg/gnupg_2.4.5.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-support/gnupg/gnupg_2.4.5.bb b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
index 99996968b1a..97b5d8856c0 100644
--- a/meta/recipes-support/gnupg/gnupg_2.4.5.bb
+++ b/meta/recipes-support/gnupg/gnupg_2.4.5.bb
@@ -88,3 +88,4 @@ BBCLASSEXTEND = "native nativesdk"
 
 lcl_maybe_fortify:mipsarch = ""
 
+CVE_STATUS[CVE-2022-3219] = "upstream-wontfix: Upstream doesn't seem to be keen on merging the proposed commit - https://dev.gnupg.org/T5993"

