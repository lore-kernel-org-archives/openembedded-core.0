Return-Path: <jarsoper@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171AAC35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 20:59:20 +0000 (UTC)
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web10.5873.1742417957374571418
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 13:59:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=U+NjRO7/;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: jarsoper@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id 5b1f17b1804b1-43cf680d351so7513845e9.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742417956; x=1743022756; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HGiNjO+nxlqtncFIcgx0JHMRNtklOINBte0Sq5pB9YQ=;
        b=U+NjRO7/A4nH66o1e08PReht2u21UUPoF5if6vTD/cthv9Njtyaowi2yNGHZ8WAzD5
         WO3OClDPAVjP0EyOVgxbF0fQ9pJWvY9pgCThzQQ90gC5SU2wWlSe0iCVbHf3M5hQZGIz
         1Kguq36E4l+Ps69qYo1kc+tGElcqRMTq1JLsRAg4SClSjyLvTapKHsh5pJqe8QYkSHwr
         uVSifwfgllYlDe9hpohJ1uKAn5cZZ72mI/uW9lYXCf03ZFDQh/3uFn/J5mFsX36/Fmjg
         LMbXI6ftpUAREQ0PDsc3goc+0rNmnESFHW3UzzE9EBOFPevsLPKjpqhzIeLtLWtJfFTs
         5Zfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742417956; x=1743022756;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HGiNjO+nxlqtncFIcgx0JHMRNtklOINBte0Sq5pB9YQ=;
        b=tlgtAEI3bWaw8Me81VLgZvX/9qAPHXS4qQJCnma0hlT76xD/3CsPozJAHg3gsNGuL4
         u6cgznB4HqTyrLXYXQ7PBx2ZPh87GEThNe5lSAEX9az8OWvOsKVDTg3kJ0OBFe97TtjV
         QX+qxl4YozIvC0Kyd6sYhWf3UX3acqLUnq4pqGKb7boLNuu6vy73gUcXF6YHk1oAieeS
         1XmW7VetnzM9Zab33Tu9NZ9Clpyieo2nR4FNhHAeeyO/sUhNfc5sT6uLvgdDFBakjxBQ
         jN7QhmyK4qF8lPX7bS6tEoFlD2V3Kl40T6pHHSDAppjoOzB3WeSJAC9PBBoiX/qRsn2k
         mvMA==
X-Gm-Message-State: AOJu0YxYlA3UfvyLBUd0f64YShcF9dz16tOMsVk8wzForvtUrobOlYfp
	uigXrvS2vtzeFp/L64qsvgqZuaQISV8/TVLAV/ii4EEylTTdQjKPdpQzm+JHDmO51Q==
X-Gm-Gg: ASbGncsNJewHVRTwWCJDgt2WZWcL7oVBIQPQjc4mvW1MqH1YD05okmZy2R0ayDLVmlg
	SR0yGI8vr/kvXL7IfRBLpeKVAU6Q8oUsv71Y1k2FvMpc1YIEzY68FdPZS2C/LoD1HsWajQFwcXO
	tSRUoKPxNTtSWyCRNt4sqSifGxjGbkyQLxi5voOnLWi908ugnfMUz0EljJpUOejHseW6Dej3UBE
	+zhvhH9UhnRqFVSg2oWM/lp78uAIxnWGUDgrJQJ9kvFa0XkOV0wYHehyXpFkBoQgYsxCfxA2Aiz
	SswhJqpaw8IkOETi5uh/rGdjo3kjELKPJvl/TvOPm7OnBcPfpNpDww1uOWbBUXRQUrJqMMri0u3
	S1prIzt5VzGVoOpZNxk1a4wYEQos=
X-Google-Smtp-Source: AGHT+IH3D+iOsN93HLQU/HioNlwUbUErfITlk2J8y6NEtIs69wOWOat6CVIsXysCQCkIyGbikVv9sw==
X-Received: by 2002:a05:600c:3b1e:b0:43b:4829:8067 with SMTP id 5b1f17b1804b1-43d49168736mr6087665e9.6.1742417955218;
        Wed, 19 Mar 2025 13:59:15 -0700 (PDT)
Received: from fedora.. (2a02-8428-db71-3701-4910-aa42-71a4-9a4f.rev.sfr.net. [2a02:8428:db71:3701:4910:aa42:71a4:9a4f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43d43f4542dsm28658805e9.15.2025.03.19.13.59.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 13:59:14 -0700 (PDT)
From: jarsoper@gmail.com
To: openembedded-core@lists.openembedded.org
Cc: Jean-Pierre Geslin <jarsoper@gmail.com>
Subject: [PATCH v2] cargo: pass PACKAGECONFIG_CONFARGS to cargo build
Date: Wed, 19 Mar 2025 21:59:09 +0100
Message-ID: <20250319205909.1894073-1-jarsoper@gmail.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 20:59:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213354

From: Jean-Pierre Geslin <jarsoper@gmail.com>

In order to allow rust packages to define PACKAGECONFIG options, append
the contents of PACKAGECONFIG_CONFARGS to the build command.
This patch was already submitted by Bartosz Golaszewski on older
version but was never merged. It will be really usefull for Rust recipes.

Signed-off-by: Jean-Pierre Geslin <jarsoper@gmail.com>
---
 meta/classes-recipe/cargo.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes-recipe/cargo.bbclass b/meta/classes-recipe/cargo.bbclass
index 76a39668c7..461d100dd9 100644
--- a/meta/classes-recipe/cargo.bbclass
+++ b/meta/classes-recipe/cargo.bbclass
@@ -48,7 +48,7 @@ oe_cargo_build () {
 	bbnote "Using rust targets from ${RUST_TARGET_PATH}"
 	bbnote "cargo = $(which ${CARGO})"
 	bbnote "${CARGO} build ${CARGO_BUILD_FLAGS} $@"
-	"${CARGO}" build ${CARGO_BUILD_FLAGS} "$@"
+	"${CARGO}" build ${CARGO_BUILD_FLAGS} ${PACKAGECONFIG_CONFARGS} "$@"
 }
 
 do_compile[progress] = "outof:\s+(\d+)/(\d+)"

