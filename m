Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C090C3ABDA
	for <webhook@archiver.kernel.org>; Wed, 14 May 2025 21:42:34 +0000 (UTC)
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
 by mx.groups.io with SMTP id smtpd.web10.113701.1747258951162533457
 for <openembedded-core@lists.openembedded.org>;
 Wed, 14 May 2025 14:42:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=iyLdVwSP;
 spf=pass (domain: gmail.com, ip: 209.85.216.48, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-30a8cbddce3so329734a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 14:42:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747258950; x=1747863750; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hKba0unlqJx4OiXQSDHvlikFWgwl0Flmooovqyfr3rw=;
        b=iyLdVwSPGyIGvCbAGnAJv2tdmtIispFxdwsoThNCupHBcV91DH98lKuNHcASD/3oTY
         3KJ6iV1URsH6YTCZ7V4HUROcrXDzkOgXjC9a28PFxf5CnW1TV6cK3TLT5ENjAkB2jAM0
         GdUatw0ovjjviBq42rM6FDZBD+OjJk6w2zHCSuQxbjjLzNazxASzt3o2ONh4oCqfm0CD
         rIx7WBValaN1h0wXx0Znfem1bSr0BshUVvrAEvpDZj+6XvOr6yLU96ovoqQQf/QvmTZr
         bjU9A7tBAPMgLu/ZcDrxqM8crkBLyNH9CimAHitg9RTG/TKbh0bNcwLHKUPGx8EaaqPN
         F46g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747258950; x=1747863750;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hKba0unlqJx4OiXQSDHvlikFWgwl0Flmooovqyfr3rw=;
        b=F6adU1wzpSs8XgFO9ouQq5Ht4ROKoaXHaFSzhaOEwYdiT+NiqQF7YbajorNDFJCMQm
         3DkgA3jHeG90cWOGqNDtAcGCcQCPVwn1uakOJxP5XadrmmpnYnwIVgv8v1mcYbcdYIQU
         vJzv65cMt6ZuVZSX0m8M3h5CTXP0K5Gpllq2FIvLnRkLJ7DQCkZbzZuMf1BPubyOPexi
         hq2hzG2jIa3VFq44rE55J5TNsvjV+a+HSHNru1u5FJPkeWh8oc8e/X9XU8rl6fZwwZTw
         YjvALQQaT+5ga8dCLvUR2rQ1wYw0SYwPdJKKhypcQwsRmmPmR/KV3l3A1pT4To1J+Jr+
         6CLQ==
X-Gm-Message-State: AOJu0Yyxvr3xnTMSCwvPFwMQRZisbZh7XPL5JYefD1Z8Wx9SzosaXw4W
	yZmNahJZiimsiYlxgdA0lQomjN3O4nu2yL4+b7ozHhZKztht3SOgDGimFYjb
X-Gm-Gg: ASbGncsfxSJoMQw0lJjz5XFRQjf6U3UFvcOUj+XXUOG69Bh8dggHhheQLLcw1SbE4R2
	gJXPRI9gEM/UZmkP131LxhMDyDG3hzrPwYyX8khSgJEMJx26Sm5fA1zpQ0PuMPcNJMG7T4T1Uvf
	DMKAYqBGTvZXlcJlWzcZGSVqGPtzJ/rrIFmjWaRZhdS+x3rzflJIirxuR0vZs1cUqxCP12nUb4k
	QWD73pJ/OSuFVUuTiGz/PYCeXVLRsR6pQjhk/5vuALGettIEx+i154V0mf261cQE3kJs/E0d42A
	mIIfpJx07v9mPw7naUT0kNkEe+WDSVfAVZdw6VI6I8U=
X-Google-Smtp-Source: AGHT+IGiASOtcnPqKJECAclD9VXHNAMIS3+9mjriKbwI7xiAtTb6iYH0n+5YoQqAaAOayFuQ+1Zbgw==
X-Received: by 2002:a17:90a:d650:b0:2ee:cded:9ac7 with SMTP id 98e67ed59e1d1-30e2e5cc03emr7483551a91.20.1747258950187;
        Wed, 14 May 2025 14:42:30 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::5209])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30e33482654sm2222970a91.36.2025.05.14.14.42.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 14:42:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH] babeltrace2: Update patch to upstreamed version of patch
Date: Wed, 14 May 2025 14:42:27 -0700
Message-ID: <20250514214227.647247-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 14 May 2025 21:42:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/216552

Update to the version of patch that landed upstream

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...ob_get_length-return-size_t-instead-.patch | 23 ++++++++++---------
 1 file changed, 12 insertions(+), 11 deletions(-)

diff --git a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
index d923437a2ab..4dffa7bfa5b 100644
--- a/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
+++ b/meta/recipes-kernel/lttng/babeltrace2/0001-Make-bt_field_blob_get_length-return-size_t-instead-.patch
@@ -1,8 +1,8 @@
-From 1b514ab2e878216426acc493eeab96088576faf9 Mon Sep 17 00:00:00 2001
+From a73cef80a0d4129f74ab2e160a15693235aad4d1 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Thu, 20 Mar 2025 18:10:08 -0700
-Subject: [PATCH] Make bt_field_blob_get_length return size_t instead of
- uint64_t
+Subject: [PATCH] Cast result of bt_field_blob_get_length to size_t in
+ constructor of bt2s::span
 
 Fixes errors e.g.
 | ../../git/src/cpp-common/bt2/field.hpp:1139:82: error: non-constant-expression cannot be narrowed from type 'std::uint64_t' (aka 'unsigned long long') to 'size_type' (aka 'unsigned int') in initializer list [-Wc++11-narrowing]
@@ -16,22 +16,23 @@ Fixes errors e.g.
 |       |                                                                                  ^~~~~~~~~~~~~~
 |       |                                                                                  static_cast<size_type>( )
 
-Upstream-Status: Submitted [https://github.com/efficios/babeltrace/pull/120]
+Upstream-Status: Backport [https://github.com/efficios/babeltrace/commit/1e6b34e411c61135ad256047a985a9bad927eae0]
+
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/cpp-common/bt2/field.hpp | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/src/cpp-common/bt2/field.hpp b/src/cpp-common/bt2/field.hpp
-index 8b291f7a1..cbfff84f0 100644
+index 8b291f7a..3a7d30a4 100644
 --- a/src/cpp-common/bt2/field.hpp
 +++ b/src/cpp-common/bt2/field.hpp
-@@ -1139,7 +1139,7 @@ public:
-         return {internal::CommonBlobFieldSpec<LibObjT>::data(this->libObjPtr()), this->length()};
-     }
+@@ -1136,7 +1136,7 @@ public:
  
--    std::uint64_t length() const noexcept
-+    std::size_t length() const noexcept
+     bt2s::span<typename internal::CommonBlobFieldSpec<LibObjT>::Data> data() const noexcept
      {
-         return bt_field_blob_get_length(this->libObjPtr());
+-        return {internal::CommonBlobFieldSpec<LibObjT>::data(this->libObjPtr()), this->length()};
++        return {internal::CommonBlobFieldSpec<LibObjT>::data(this->libObjPtr()), static_cast<std::size_t>(this->length())};
      }
+ 
+     std::uint64_t length() const noexcept

