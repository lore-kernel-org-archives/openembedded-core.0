Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.601.1795034982247255720
 for <openembedded-core@lists.openembedded.org>;
 Wed, 18 Nov 2026 12:49:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@baylibre.com header.s=google header.b=cQA9BD1p;
 spf=pass (domain: baylibre.com, ip: 209.85.160.172, mailfrom: tgamblin@baylibre.com)
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53644b28706so20672701cf.3
        for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 12:49:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795034981; x=1795639781; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=llNptmDc4hWntECWnVTSJZK16dFIG1YtE8mlD/TV02Q=;
        b=cQA9BD1pCLsGd6bN+3/DNVkvOcNzrqwkYQFNe4QjDenGSkuQUAdddw63qVNjmnjPIO
         t8Pei1rO8Au6I4pFdSE0O1V+UKRJkvDlq0XEbxzRgXGhqFsBc6cWcAThI0J4yCKS0Qbg
         AhwL12R4qNPVUSUCnrt9io/3ZJv0EnB0pp5A/VNlPsbjmNPro/JjEe3ef0vecM/TKHnM
         gY1bBJfS27dJ/JIw6FxLsLjR3/KABB1Tlv8sqehcAlKhK9BKxKc5L/W8cVgcBkRRRe12
         2iJ0K7zZOU6SURqGeMgpxB2KosLn0z5A1CitOYyVkIlzZlBxF4HOJ92tVhAjPJp0exEE
         tdXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795034981; x=1795639781;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=llNptmDc4hWntECWnVTSJZK16dFIG1YtE8mlD/TV02Q=;
        b=cSVhGEzemlRFd/vsB+vGoAXdJc1+hHh/T1SFiQGjRNIwGv/dIbMtdZPGRAQkj8y8I7
         nXyNUoLz6YjcdrgxSg0zFpMsjdSGWdT/L7JEYLdnT3HmRTLKdcg+7RSbyL/Cd2ynVsjT
         j5C7VrDunkQevnj2GCBQenzCT5MSLIV4zYWAYCgj8ps6KbjAtrZMtTHofb20JaCPv2xn
         d4WFGEWSX8z8IesPVJ02qnEfXGmHuorxv89PbKpMX0koLizqMt01DQbBJkx76TJly1n1
         USztPb6OJQywq1gfKZWMPK3jufLZWpKQjfTibV+ZxMayZrp+Me5exkS2wdAcfCGrK6wa
         wYcg==
X-Gm-Message-State: APuU4Z9Lm9F1oqNbRZxXxIko6x/2llbZIAvYURLW0jTVazZmB1eIA5v+
	KuzK/FhSxKKvROMmvNCzXGG9IEvxUBZtMqg15AYwy/JDsesVv7o7fzpfrxxYyD0k6gB8Ju6vhjC
	odxyn
X-Gm-Gg: AYBFou3f2IivwnqhK3Hd7ZJGNeurj7wz2jcwpgi4J+D5n7op/mHZD049UjT0YxltoB4
	wddlEiSG8SWiLkWTLrqou8i0OLDbkIt0jnutKpuVnEDGD1h83/hWijPPk4Iz1Kxwo0lGdPWIQDX
	CjFT02bC/PDi0xbax2jkVyMKar7j2zY1XOs4gLDUaWQ30j1G4Njq/Anu9+LTNaADYbq84lPNFvc
	EdYVWLW295lZxfd+OwS94/j2Z7RYoyl6fYzZUX+AVKgd61WAnIvr90EhLybjDXE8u04cKAy3mdD
	/V0U+6NgET/24SIYvMEdYVmPGzfSmlVzgfSNgzXzECJOPsMYFPnzrlHz/9xhSpcwh7g/ydLg9SA
	Y9RVAG5+iLzsiWtfi4bUdbUSHQwF6B4dbe1OjMuqNDwUmr/u6wdOB2IG1Mo2zz3u7lS4YWw0mIi
	+8VZQYzOw74TCtHdIQuvwOOHvtDMUgyvlI5Cq81CwCyYVsKQtlXPKdkPk125UbVOmpBt8/eYaAD
	xuT0MaQjQYJLN28PzOHqgfyiBWmTOIbYuQO+qVo/xRViKnJiOh9rhaY1SOgX1MW0spd0uIquXIl
	WXv7IqtJNWy6Tqbc8aF1LF11D7rQ6xAyZrh54iNRFqJsZqmqGI8zL0y1avDwKyk7wMHY8fWbFDs
	XUWOWYw==
X-Received: by 2002:a05:622a:418a:b0:536:72b4:b84a with SMTP id d75a77b69052e-55d5a5d835bmr63457561cf.42.1795034981179;
        Wed, 18 Nov 2026 12:49:41 -0800 (PST)
Return-Path: <tgamblin@baylibre.com>
Received: from megalith.cgocable.net ([2001:1970:3847:e000:e8bd:ca0f:c232:9f10])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66bca072sm8637541cf.17.2026.11.18.12.49.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 12:49:40 -0800 (PST)
From: Trevor Gamblin <tgamblin@baylibre.com>
To: openembedded-core@lists.openembedded.org
Cc: raj.khem@gmail.com,
	mark.hatle@kernel.crashing.org,
	paul@pbarker.dev
Subject: [OE-core][PATCH 11/12] rust-target-config.bbclass: pass on all RISC-V extensions to LLVM
Date: Wed, 18 Nov 2026 15:48:52 -0500
Message-ID: <20261118204853.2155173-12-tgamblin@baylibre.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261118204853.2155173-1-tgamblin@baylibre.com>
References: <20261118204853.2155173-1-tgamblin@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 18 Nov 2026 20:49:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250594
Content-Type: text/plain; charset="utf-8"

llvm_features_from_tune() doesn't pass on all RISC-V extensions listed
in TUNE_FEATURES, but rather has a fixed subset listed, and ignores
others. This means that with new profiles and custom tunes, Rust code
still gets compiled for riscv64gc plus a handful of extras.

LLVM's RISC-V extension names match those we use for TUNE_FEATURES, so
we can instead pass on each extension in the same order.

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
---
 .../classes-recipe/rust-target-config.bbclass | 34 +++++--------------
 1 file changed, 8 insertions(+), 26 deletions(-)

diff --git a/meta/classes-recipe/rust-target-config.bbclass b/meta/classes-recipe/rust-target-config.bbclass
index 2faecd55f9..89fbd19374 100644
--- a/meta/classes-recipe/rust-target-config.bbclass
+++ b/meta/classes-recipe/rust-target-config.bbclass
@@ -83,32 +83,14 @@ def llvm_features_from_tune(d):
     if 'cortexa57' in feat:
         f.append("+v8a")
     if 'rv' in feat:
-        if 'm' in feat:
-            f.append("+m")
-        if 'a' in feat:
-            f.append("+a")
-        if 'f' in feat:
-            f.append("+f")
-        if 'd' in feat:
-            f.append("+d")
-        if 'c' in feat:
-            f.append("+c")
-        if 'v' in feat:
-            f.append("+v")
-        if 'zicbom' in feat:
-            f.append("+zicbom")
-        if 'zicsr' in feat:
-            f.append("+zicsr")
-        if 'zifencei' in feat:
-            f.append("+zifencei")
-        if 'zba' in feat:
-            f.append("+zba")
-        if 'zbb' in feat:
-            f.append("+zbb")
-        if 'zbc' in feat:
-            f.append("+zbc")
-        if 'zbs' in feat:
-            f.append("+zbs")
+        # LLVM uses the same names as TUNE_FEATURES for RISC-V extensions, so
+        # pass on every single-letter (except the base i) and z, s or x
+        # extension, in TUNE_FEATURES order to keep the result stable. Other
+        # tune flags (e.g. "rv", "64" or core names) aren't extensions.
+        for e in dict.fromkeys(d.getVar('TUNE_FEATURES').split()):
+            if (len(e) == 1 and e.isalpha() and e != 'i') or \
+                    (len(e) > 1 and e[0] in 'zsx' and e.isalnum()):
+                f.append("+" + e)
     return f
 llvm_features_from_tune[vardepvalue] = "${@llvm_features_from_tune(d)}"
 
-- 
2.56.0

