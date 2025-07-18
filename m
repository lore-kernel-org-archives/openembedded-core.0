Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BC04C83F1A
	for <webhook@archiver.kernel.org>; Fri, 18 Jul 2025 05:43:20 +0000 (UTC)
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
 by mx.groups.io with SMTP id smtpd.web11.14356.1752817391065403980
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Jul 2025 22:43:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=RKB0+WIh;
 spf=pass (domain: gmail.com, ip: 209.85.210.170, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-74801bc6dc5so1898070b3a.1
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Jul 2025 22:43:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752817390; x=1753422190; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4PR2HvlNpPQMjUs8nkHBU1fYXkqRfykiFw90lndQZJk=;
        b=RKB0+WIhk3O7WnKnLMZaW87hxQEZWSKH4qO+fhr65maq9Qo2oLrPqZunEav4UFsbvG
         E0oYUhagB+6t+7z1fVQFenhEwZCm/DKHc9z9/YFAUclyijVWtf5nu/1vcWstGKKaLfo2
         YWhsxnIcPWuoxZLkj31uQ0cJaK008os9b+CvgBs8BBD1DhZN8q+q8xwLOBVTYqvxjfDU
         FskmXm4InvfPg+9tb+R5a3syCLTtCsiPv4anFJPO0wDEhwP9agm0ZORf1Qb1d0wyLibB
         G05VX7PuGPU6z9xz/8Qd5ggL0EGzK5aL1i6GfszqvdQTBfFwQ9LFai+O93Fdxi24Z4tC
         6htw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752817390; x=1753422190;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4PR2HvlNpPQMjUs8nkHBU1fYXkqRfykiFw90lndQZJk=;
        b=Bne15FY+8GRMGd1MWg2v1WmJ1fmc15ygF0qIVi7muXaqB4aon4/m+S8w2+ZRHGDlXj
         rnCZ7Eoor4CTXdMGmuhjYBLJ9mGN96ryplVu3H8prFHnm4ilaW0pw1x1f7ejxUqBJKiL
         3ofXq/m0mUybtVI7/NwwIN5dM5e2IJ4SEX0XCbB+qFQbtr0fsfifTZRaDjphQH4p6J8+
         L8qYJVOvPmubDUm8YpZtvLGO8h5YPLnFmVvkfQ6QNe4CFaDcPDUxuP/xwMBBOBqMJPP3
         VoVXO7CZlDHs3qMzIWF/wna5pIxUckco3ogF4rQBxGq9PqEj/BHdZedU05GU5kk5wgER
         Dj7g==
X-Gm-Message-State: AOJu0YwJVjUh+2H/qepSwMA065YKVZglLJ0wbAHdpmCFh6iB0dKXFf4s
	dsb1P4Yvc34k8ATAhDchP11ryDQ5VhHpPIO06u+yuWL+ZDpAn0V7ol77AV19witRjXU=
X-Gm-Gg: ASbGncuBOGOx5l1FBk8LH1Q2UwLsVMztP3VdQIra+fZTxLfGwaFfl+uHEYXB6568dQY
	i8nrBkAVPhxKUIwRByO9iHOWmn1MLkZElrEauJKHi85abVBlR2uV6mTGYe8mXYfbBPaGBcgTWZd
	lybltxo5OSFFxW2tv1SO9K7GsoIM/yWBlPOlg9ORGXzWJAA/JHJbJtqubc0HQajbe/5i/FL37GS
	wtr6XmFfq/DcbPV+kUULA/xqRZ1y7pF5Qx28oyL8slKmpNdhC38Ll5Gz22ZBhXodpr9CNTFRngB
	Ulr1tcaML87tqjpUK5VbgWtHXLFIy6jpmHORi4v8u3BP2DUCs51u5OzmuilUgU18F9wJjCRX+JT
	PYoEnjdkwuCAY2w==
X-Google-Smtp-Source: AGHT+IFyepYagBbOZF59R3RzCS5X1giUVyym0XJ+tuB6BtYVU7HN5xHFb5OLwz/g5RWEnDjTyfFW/w==
X-Received: by 2002:a05:6a00:9453:b0:742:aed4:3e1 with SMTP id d2e1a72fcca58-7596789a299mr3940536b3a.2.1752817389974;
        Thu, 17 Jul 2025 22:43:09 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::519c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-759c84e2444sm496817b3a.25.2025.07.17.22.43.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Jul 2025 22:43:09 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v2 2/4] cmake.bbclass: Define CMAKE_CLANG_TIDY with toolchain-clang
Date: Thu, 17 Jul 2025 22:43:04 -0700
Message-ID: <20250718054306.1997726-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250718054306.1997726-1-raj.khem@gmail.com>
References: <20250718054306.1997726-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Jul 2025 05:43:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/220573

clang-tidy is used by many packages these days and probed during
build.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
v2: No change

 meta/classes-recipe/cmake.bbclass | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/meta/classes-recipe/cmake.bbclass b/meta/classes-recipe/cmake.bbclass
index 449fe2bb443..2c6d28b7a95 100644
--- a/meta/classes-recipe/cmake.bbclass
+++ b/meta/classes-recipe/cmake.bbclass
@@ -216,6 +216,12 @@ list(APPEND CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${STAGING_INCDIR_NATIVE})
 EOF
 }
 
+cmake_do_generate_toolchain_file:append:toolchain-clang() {
+	cat >> ${WORKDIR}/toolchain.cmake <<EOF
+set( CMAKE_CLANG_TIDY ${HOST_PREFIX}clang-tidy )
+EOF
+}
+
 addtask generate_toolchain_file after do_patch before do_configure
 
 CONFIGURE_FILES = "CMakeLists.txt *.cmake"

