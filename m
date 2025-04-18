Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6518C369AB
	for <webhook@archiver.kernel.org>; Fri, 18 Apr 2025 17:59:22 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.2027.1744999154378530204
 for <openembedded-core@lists.openembedded.org>;
 Fri, 18 Apr 2025 10:59:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SsMgwfb0;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2279915e06eso24502145ad.1
        for <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744999153; x=1745603953; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vCDYG9XiMtzlyAgGl9pd78OEwKvpIvULM1kMcfBfmKU=;
        b=SsMgwfb0xA3gz634BbIn9zEjaXncZzLvFMSATFqe/VCPRNQdoDI/JonHDLJQ+lenAO
         4LjDpBQaJHsIjSWivZ3jLO7wVHYWVsOEWMVjxnmqZFxDWubIm9iJR9ePG4i+05bJjPLV
         bAMbfKtVE8K11GXgYGPFFAIRKIAgiIxA8EOr3v96zAeWWEsEQcyucUbfKkF6GAKSblPk
         WE5/ugiruvJy7SKPtfT37A5BB5x6TVbGoz1DNWLnz7QhEGeBMKqtx7VmK2HnCwNTf3hJ
         Wfrazb3dTwxQpK8Y29pGYSM+9LbYEZT0a45tM4RgtT0kofd34FOY82dZQxBgWLGe4Sqe
         Gxdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744999153; x=1745603953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vCDYG9XiMtzlyAgGl9pd78OEwKvpIvULM1kMcfBfmKU=;
        b=lU7a5xkKaWNqqaJxCXkeSiYAqjvpJEv9ADi44FYotuad+axTTq7u6XuC4TANl9FRTJ
         oL4ccb0YCeL2MqVQ2zr+DdWqX6bmou6OjB41v+Gs1R9kEm8a88vAtenoaB9sQhI15ELG
         N7TNKxHbjV0x5gs2KTr0k98lFO6uC5mha1xzfC07D3iky6f5MNcPh/Usf5XyY2oHvhh5
         WEIvilzouZXI+SjuaoZ3aDYC7KPYdV2JlNuZ9gGke6pRwv9qs6KUM37Pvt0pZ9uS62Jr
         QPNRmztglmV+Wvh53c2FIjwA01fZSEXGcBh6HUfcMkT8UiuTY4/0p/aM0SAstwzlBTyq
         aBCw==
X-Gm-Message-State: AOJu0YwqA9bnoqEiuYzo9MJ3bURiGiW8WuoPuszHICppvKRA+AyH4Yjt
	XZDTCG3/LDJg0jSBxCDo6Fly/u+xY+VGUOVhoNy0K4oP953F2wZILrCO8guA
X-Gm-Gg: ASbGnctWjpdK17Guhz5uSnWpOIz3ziqu92STER38pM93uvJI8fSMDdiLxVwDlfTi0Qm
	PoyKNMgCBlr8VlLyGZqNjegmEeW9L+AuXe/+mbsck0PPZ4rbMFV1dAumIR6ngcv1hI8bqRRLZTO
	SYdRh8towqjuWxhf4o0D3dl3FQ5TSJbwMzZ3jFkcZCso8fmHMSrU4rB31cLTTrlZWlcpIoewOGc
	5XWcZCgPuSa0ztisXkTgdjXv2R69nHjcYsdcRn9c5gVccJNoru8Bm9f3h4bO1wF0DOCzPrlXSbh
	hcTV8PI+Pm1dD7z443MnRjgJtrFTh9xgqGjate2qB4I=
X-Google-Smtp-Source: AGHT+IE50ECbUWaIOffxIZZKfVuiPNKyqJv8ZiQ6ridYluu+2jUk/XpZhcL3oe8JorcDs0ckw9HZIw==
X-Received: by 2002:a17:902:f684:b0:224:194c:694c with SMTP id d9443c01a7336-22c535c03a1mr56225795ad.28.1744999153381;
        Fri, 18 Apr 2025 10:59:13 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::c043])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bde206sm19816105ad.14.2025.04.18.10.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 10:59:12 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 1/2] glibc: Forward -ffile-prefix-map option to assembler flags
Date: Fri, 18 Apr 2025 10:59:10 -0700
Message-ID: <20250418175911.4033750-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Apr 2025 17:59:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/215136

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: Rebased

 ...le-prefix-map-from-CFLAGS-to-ASFLAGS.patch | 24 +++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.41.bb         |  1 +
 2 files changed, 25 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch

diff --git a/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
new file mode 100644
index 00000000000..862c7b9086e
--- /dev/null
+++ b/meta/recipes-core/glibc/glibc/0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch
@@ -0,0 +1,24 @@
+From 603e50d6b8ccadb32d59b0497f76629665c1794b Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Wed, 16 Apr 2025 19:51:01 -0700
+Subject: [PATCH] Propagate -ffile-prefix-map from CFLAGS to ASFLAGS.
+
+Upstream-Status: Submitted [https://sourceware.org/pipermail/libc-alpha/2025-April/165969.html]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ Makeconfig | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/Makeconfig b/Makeconfig
+index e35c5cfe4e..7a19c731c6 100644
+--- a/Makeconfig
++++ b/Makeconfig
+@@ -1176,7 +1176,7 @@ endif
+ 
+ # The assembler can generate debug information too.
+ ifndef ASFLAGS
+-ASFLAGS := $(filter -g% -fdebug-prefix-map=%,$(CFLAGS))
++ASFLAGS := $(filter -g% -fdebug-prefix-map=% -ffile-prefix-map=%,$(CFLAGS))
+ endif
+ override ASFLAGS += -Werror=undef $(ASFLAGS-config) $(asflags-cpu)
+ 
diff --git a/meta/recipes-core/glibc/glibc_2.41.bb b/meta/recipes-core/glibc/glibc_2.41.bb
index d707e1a6775..82dcf08fcd0 100644
--- a/meta/recipes-core/glibc/glibc_2.41.bb
+++ b/meta/recipes-core/glibc/glibc_2.41.bb
@@ -54,6 +54,7 @@ SRC_URI =  "${GLIBC_GIT_URI};branch=${SRCBRANCH};name=glibc \
            file://0022-Avoid-hardcoded-build-time-paths-in-the-output-binar.patch \
            file://0023-tests-Skip-2-qemu-tests-that-can-hang-in-oe-selftest.patch \
            file://0001-stdlib-Add-single-threaded-fast-path-to-rand.patch \
+           file://0001-Propagate-ffile-prefix-map-from-CFLAGS-to-ASFLAGS.patch \
 "
 S = "${WORKDIR}/git"
 B = "${WORKDIR}/build-${TARGET_SYS}"

