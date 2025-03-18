Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0475EC35FFA
	for <webhook@archiver.kernel.org>; Tue, 18 Mar 2025 04:39:01 +0000 (UTC)
Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
 by mx.groups.io with SMTP id smtpd.web10.4273.1742272737691566590
 for <openembedded-core@lists.openembedded.org>;
 Mon, 17 Mar 2025 21:38:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ReSRLH1J;
 spf=pass (domain: gmail.com, ip: 209.85.214.174, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-225fbdfc17dso38564665ad.3
        for <openembedded-core@lists.openembedded.org>; Mon, 17 Mar 2025 21:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742272737; x=1742877537; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zBRRqPDTmJZKWa94L6KKft2V9agPlHabHhPXheGBHxU=;
        b=ReSRLH1JcKBT6+Di08XjsztMwE9aieVtACMDalaDbUG0BMPjLm2tMDeVRkFLPqJE7C
         6hEgFTCqrd9WVs2U3JX2iDQExA1vdkeZ2AUuQExuJ+9fBUM3CmNH33v2vzoNaPNn7pK1
         xO5yNr7YY9mHAVbgUm4gaMlosZ934eOIVrJZFLh+AJGflEOAK9aPw2y+6azcCH+ZO8LH
         i+2Wgq0rb9tq5deUcSZxUvlqQWUY+UQjd8LMnjx4RWq3XYvMn/VkLzB41fzD4Z/ElK9S
         j4Tncon2N+5BrFmWV1bKPldMs2U5oO/zFnmyrlei6kuLhGcDT/eZAcSzYcX25Rui0Cv4
         cOlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742272737; x=1742877537;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zBRRqPDTmJZKWa94L6KKft2V9agPlHabHhPXheGBHxU=;
        b=dU6rqZ6v7gzsRY6uuFt+sxSRuZQlyfBLRsT21Ast4wS6Bhf49Wi7xd7hfiYADQP4L3
         9WucWLm0ReYhdPRvF0TsRxXJDOgr3TEtL0zDJtZz2cvlTJlqE3L3V+tJMqSNr7tzRW8L
         InIE0OU0CkjiNshMnL8lB7fk9qcVMUFvP9vSrb6RxjW/zDN5bVFy5bfcyLsbWpjze2FI
         To/g4Lbp8tg9f1rJotkF/NWJ5chc4q0gQ5vOCpUw5+F4hnsSGL6fkUzhofBoyvN8YuYP
         sZtkZBMmtNNleT3kcVvdOcRZ1MF2I4RNtOd5O3eeSV8OuWehotbf3e9FWhGOlf46pYZp
         dkPg==
X-Gm-Message-State: AOJu0YyrYlIPfsljCYqnObbIxDZdAIlNQWqawFb68Ps4F2kGuHR1GNQH
	4NqeS/CZ8Nvd7rTIk2NuFoP/Z690mIm6aUEOWEjhMSDNyxxU1flS9Ltq93L2
X-Gm-Gg: ASbGnctlgfLW2aPdopcUR28IU0MBoQUU5n0d7ukWxuwZ5dCEjfFfCXqwHAqXWc1dfJv
	9XiXeYVQLxHuCPXUmyUF2kwR0Qag891ep6mis3qy//7S0wEmXf7e5TEyhBFJzV9zyDZsRROqNTE
	MOEebBfdnE7xSS3asotBNAr8nvg5bGerPHrLKUN1SkJhlAIzImAxZr+o/bNiIe3+vlkN/W4zNV7
	0+ii5tJuRCfbxVSzMfDgEGB+rVjEUHX1l7UIgaq+zWpWtdXLSrWW+XVLxZB1RogrSuvBCP8IERN
	ACmgDH3RFmjAUxm/nDN8yZXdk7WfxYfolZSjQS3FGlhfFRs=
X-Google-Smtp-Source: AGHT+IFJJ+KHBKFkw82CLo5G/pOgniNOULEb1NIzBfgUwA4lVWpP1zp8hg0lkhXZKKbuNME6tqX3TQ==
X-Received: by 2002:a17:902:d50e:b0:223:2630:6b82 with SMTP id d9443c01a7336-225e0a36298mr194031395ad.10.1742272736817;
        Mon, 17 Mar 2025 21:38:56 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::6874])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-225c6bbc8c6sm84112375ad.160.2025.03.17.21.38.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Mar 2025 21:38:56 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH 08/24] readline: Fixed build with GCC-15
Date: Mon, 17 Mar 2025 21:38:28 -0700
Message-ID: <20250318043846.2422141-8-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250318043846.2422141-1-raj.khem@gmail.com>
References: <20250318043846.2422141-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 18 Mar 2025 04:39:01 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213142

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ages-that-are-not-compatible-with-C2.patch | 29 +++++++++++++++++++
 meta/recipes-core/readline/readline_8.2.13.bb |  4 ++-
 2 files changed, 32 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch

diff --git a/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch b/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
new file mode 100644
index 00000000000..69fea508908
--- /dev/null
+++ b/meta/recipes-core/readline/readline/0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch
@@ -0,0 +1,29 @@
+From 9459ee899a291c55f08341df63e9a1b9b7af200a Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Sun, 16 Mar 2025 12:48:46 -0700
+Subject: [PATCH] Add fix for packages that are not compatible with C23
+
+Fixes builds with GCC-15
+Sourced from Fedora: https://src.fedoraproject.org/rpms/readline/c/c47eb813afb942128253213ad5b8221770557e48?branch=rawhide
+
+Help getting packages like bluez5 building
+
+Upstream-Status: Pending
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ rlstdc.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/rlstdc.h b/rlstdc.h
+index 2aaa30b..a7a0ef3 100644
+--- a/rlstdc.h
++++ b/rlstdc.h
+@@ -44,7 +44,7 @@
+ 
+ /* Moved from config.h.in because readline.h:rl_message depends on these
+    defines. */
+-#if defined (__STDC__) && defined (HAVE_STDARG_H)
++#if defined (__STDC__)
+ #  define PREFER_STDARG
+ #  define USE_VARARGS
+ #else
diff --git a/meta/recipes-core/readline/readline_8.2.13.bb b/meta/recipes-core/readline/readline_8.2.13.bb
index 78b988365a6..19b5cb6f583 100644
--- a/meta/recipes-core/readline/readline_8.2.13.bb
+++ b/meta/recipes-core/readline/readline_8.2.13.bb
@@ -1,5 +1,7 @@
 require readline.inc
 
-SRC_URI += "  file://norpath.patch"
+SRC_URI += "file://norpath.patch \
+            file://0001-Add-fix-for-packages-that-are-not-compatible-with-C2.patch \
+            "
 
 SRC_URI[archive.sha256sum] = "0e5be4d2937e8bd9b7cd60d46721ce79f88a33415dd68c2d738fb5924638f656"

