Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84838C35FFA
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:28 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.2937.1742372178734823225
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZuA3rfca;
 spf=pass (domain: gmail.com, ip: 209.85.214.173, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-224191d92e4so126427095ad.3
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372178; x=1742976978; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4Jo6wVv5sH6f+xu5+yscyvr9mQs6TlekCIsEgIMf5Lc=;
        b=ZuA3rfca0V8N+5sz4T56955SbaGMfC+G/Ewqx2nZySmFgcnS550fx/ej0UyoLetZLr
         NB3RhRqqLIAOC+hZkVsF7INEQ4twbG9Xz8rvVaeNNxayXf+Mldoc/duLbB/V52sTryZO
         Qr7/+AgQ+lzWfTYq0ebK1mn6zXBXzn1rmhm93nwkYAqgNU1TWMKHPtroaMwNlsoNJTM3
         YEX1t9k0D1U4iREoAIbK7qWjQkoI7gt9iC0N0huHRfZfsuNWgBrz2QOYVLy/w91q1Skn
         Z/+iLJ2lmxwIV3OmSzsQ+9aOqI1mwugwM6bFMnfKnTgY+4txENdm7fvbhZ2Wg9DDXuaB
         d+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372178; x=1742976978;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4Jo6wVv5sH6f+xu5+yscyvr9mQs6TlekCIsEgIMf5Lc=;
        b=FEercdmr/lJSop3t+e6hfnFMyvgd007yzj+CVp68+Ng6Cl4/7cf0U8hX12mLW07a83
         9xzLNoqtNsiMDGdJI4F7t+9b5/5O5iDeNjx+e5V+O0TBRezZxhGyigmM+GzhPrpWAgIy
         tjPF2v9Q7daXe108coqySIcBHldDOx46Wro0tQNsNUfv7p0vXvKCRdxBEBmIQCt8YqHp
         TGgKZ2sf5eH86U1mADDLmG3XnZTQ9uTpy+fgaFxj5dpJw7o7/Z1LhB0oCVDN4KoHV2lE
         c3XU+UeGXroRuJk/K/f+4mqixlADBdb6yG04x7PkVBzhROkQTgMyEjmmi1IHmkkuOA25
         5XkQ==
X-Gm-Message-State: AOJu0Yz75UFUFwi0LyB6kQ3w6DSEQ5xlXuKb5IC2NYPjfulYgFpDeeDb
	BtWZK8YRE1S5o9N1HQ1t0VoVzlGgD99AF1UB0MIgj4Pd0BmrHWd4Vjk9AIvC
X-Gm-Gg: ASbGncvbJIw7QOnvAtWo2darZYASA8VMqjXIr4a/fzdoRNU3GzY43SLEGc7jfj+xjN3
	goM6vyA0egLSntkPdP+1o7avyWdxKlUo9LND79WYFuy/+mR2hldAK4bxgfGLK4COzELjKHK1ocp
	PhiQ61XgcG0qfho2Tb1rpb+L7zjiT6nlO1qMU1Ht9yeVrHmIGa75S/49OGkt8mNLuEOyDZEm28Q
	1NhxJFeo1cBxlVF19BwpFGEV0sdFhYqOf2mpao1F6L23LLS20iKYifOslZrdlVL/NS/aGOTCsV1
	sVQdib3Ep7ZO7z2sSzEGC5T2fwUt6lMrRTX8
X-Google-Smtp-Source: AGHT+IEfjJRX+XAoRBxuTL5gf6hUTFV65K06PEvOlqIrKQGKBujYoM7SJNaPj0ky7lcb0dS1tg2oSA==
X-Received: by 2002:a17:902:ebc3:b0:225:ac99:ae0d with SMTP id d9443c01a7336-2264992dd80mr38965675ad.10.1742372177895;
        Wed, 19 Mar 2025 01:16:17 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:17 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 05/27] gdbm: Use C11 standard
Date: Wed, 19 Mar 2025 01:15:33 -0700
Message-ID: <20250319081610.3536475-5-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:28 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213271

GCC15 is switching defaults to C23 and gdbm is not yet ready to
compile using C23 std.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-support/gdbm/gdbm_1.24.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta/recipes-support/gdbm/gdbm_1.24.bb b/meta/recipes-support/gdbm/gdbm_1.24.bb
index 88f9fa47cf5..8e3cec42957 100644
--- a/meta/recipes-support/gdbm/gdbm_1.24.bb
+++ b/meta/recipes-support/gdbm/gdbm_1.24.bb
@@ -23,6 +23,9 @@ EXTRA_OECONF = "--enable-libgdbm-compat --without-readline"
 # Stop presence of dbm/nbdm on the host contaminating builds
 CACHED_CONFIGUREVARS += "ac_cv_lib_ndbm_main=no ac_cv_lib_dbm_main=no"
 
+# Not yet ready for C23
+CFLAGS += "-std=gnu11"
+
 BBCLASSEXTEND = "native nativesdk"
 
 do_install:append () {

