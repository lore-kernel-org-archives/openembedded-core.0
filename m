Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50360C83F17
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 05:43:10 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.web11.14355.1752817389858402863
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 22:43:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=f49cbPRF;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-74264d1832eso2401656b3a.0
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 22:43:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752817389; x=1753422189; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=piZrHXe6rZCrRY4c8qJDuh9F6CXtGTnIH3oV41hf28M=;
        b=f49cbPRFFXN1BdvuzSllW71XbJkSZ3Bad2VgtW1f4S2PGYEiwbJuqyRtj2Fl544Kei
         txsaMImBFLMRu5oA88817XXxfV74HjcqkWah8IvuysFSy1IeBDIr8LT6T2C0yaVkRigs
         YhxccrUMHqN8aJy1ms7iZp5toTdtDl1YR1VNeO0usZgyvg/6UAukJCursy2/ujv/mIpC
         EGPQr2Q3DL/v/iYG7NX3wtP1xza+iaoqHm6m04chHUuG/5ATzzKHe2KvDD+8UEtM+ezB
         akpDQ2R8R7PB5c3ymDz3pO8o/Rval+KFxIe5mFhbgQ3XQwP5zkIv3dgTUAjNmixDk1i1
         I2hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817389; x=1753422189;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=piZrHXe6rZCrRY4c8qJDuh9F6CXtGTnIH3oV41hf28M=;
        b=oPETukf98I8FfXCkdPJo9Y7MjvlAQ6ZKbPzXfvsfP7cULPhWt1vFWuYidpQDB0mIOG
         vPhVzjgC04x4hywiyW05Um9ePvZBwP1ZT0NMrwpk31Sf5OFm+s/AKudKJukGp4v7gDhk
         lB5rQ1YppfhQlcp5xVQ5wuLrb9NjZW/z+RFzDEQitkkyBCwYrb4pGN7m45fI7oideLXG
         ecYedw6ZjB35CyeXzhUIaPyAzcxJ7tu9yQQza9bIG36QjuWe4RY3QqyRtM6yA7gOeY25
         xqMec7Fxt9mxct+JLCn03AKD1kD4B0AFEis4UrdMyabTT8b+mrQsa57BjRxvEmdYP6IK
         ceUQ==
X-Gm-Message-State: AOJu0Ywmyl58NLbWo+N9UM6R7kvZBSJUUB/HyG7e6QNuWvM8XpbmJ1Si
	HoFBwpni3NBPXMceE+upX6G/NKtuSA8d8cghLhCS71rUZdZFmKj/retaBN2tyYEKsKA=
X-Gm-Gg: ASbGncv5Wbe2KLcBoQxAKDS3hQiBTgC3owxreNVBsBDO/4geqT5nSEPsErGhl9QCUm2
	9ttO2p+OA7Zo4N3p0aIxfs64gb5KmwFROgDN8koafIYKPbB24OWJHVCHc4QM/j309M1xGprPhsw
	XHNdUroRHxyDHAxS4YoiTkPTS+jePRraIUSoCQbQjI0bulU5wUwTXD57zVKoYf9Jg1tpdEyixTD
	LJS9pvCaLIyd2X3Tay7gMwXz6oNnRw0B/BLyuSmz847CsX+4RoBYam6f9wAHmuUhRAjehPQBrHQ
	uFD/9kGUaNKiJ9um0lxNBr+gs2Bi/Xvq8Mx1l4n1wg9l9nvIQAlOz0QbPy9U31GVjQrgydCntOo
	gJW5OtbEm4/4OPw==
X-Google-Smtp-Source: AGHT+IG1N03e+dQwgeAqkBgxa0zpZTTp8iIRZxi4XCg2EN/nTOOzPwhac/Jv0JN9/Xtx6zgrRspvUw==
X-Received: by 2002:a05:6a00:a8a:b0:740:b5f9:287b with SMTP id d2e1a72fcca58-75723165190mr12034334b3a.1.1752817388771;
        Thu, 17 Jul 2025 22:43:08 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2444sm496817b3a.25.2025.07.17.22.43.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 22:43:08 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/4] toolchain-scripts.bbclass: Make -mmusl apply only for gcc toolchains
Date: Thu, 17 Jul 2025 22:43:03 -0700
Message-ID: <20250718054306.1997726-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 05:43:10 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220572

This option is not respected by clang

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No changes

 meta/classes-recipe/toolchain-scripts.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/toolchain-scripts.bbclass b/meta/classes-recipe/toolchain-scripts.bbclass
index 3053cd0f1fa..5874a48af84 100644
--- a/meta/classes-recipe/toolchain-scripts.bbclass
+++ b/meta/classes-recipe/toolchain-scripts.bbclass
@@ -9,7 +9,7 @@ inherit toolchain-scripts-base siteinfo kernel-arch meson-routines
 # We want to be able to change the value of MULTIMACH_TARGET_SYS, because it
 # doesn't always match our expectations... but we default to the stock value
 REAL_MULTIMACH_TARGET_SYS ?= "${MULTIMACH_TARGET_SYS}"
-TARGET_CC_ARCH:append:libc-musl = " -mmusl"
+TARGET_CC_ARCH:append:toolchain-gcc:libc-musl = " -mmusl"
 
 # default debug prefix map isn't valid in the SDK
 DEBUG_PREFIX_MAP = ""

