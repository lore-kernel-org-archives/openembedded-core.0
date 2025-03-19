Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 546BEC36009
	for <webhook@archiver.kernel.org>; Wed, 19 Mar 2025 08:16:39 +0000 (UTC)
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
 by mx.groups.io with SMTP id smtpd.web10.2924.1742372190350786527
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Mar 2025 01:16:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=AiB2aejB;
 spf=pass (domain: gmail.com, ip: 209.85.214.175, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2264aefc45dso10491465ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 01:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742372189; x=1742976989; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=AiB2aejBsZ9LKW3gzsFjwefzdw9HgXeakv898+JSu5A9e4B0VqbG7wL5yGVO4ICbW2
         lTqyF6DqcyM9B6XJqCsboXvh707yKv2Y6CKYx6XBMFevVc80ZJfASWClG3bLPWwYZaAG
         uxictSNsHI/cE7bkPPoAnOOamI7fG4G34YtpGquG0pdW2Ddj2hBmDKzaDLK697QysUdW
         cUzKYb0GtqWPbSWc71cNhel+e7kpiHe0tTxttYsD6E9BD/ZT/0HPHUbiMGPWq+qv6/o3
         Sq0OfnAdF4JWeu60NsAbQ4fOvG8UtE3iwXMcgfdrUSvmIAbIbAw32DVln6JamE1A+FVI
         DfkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742372189; x=1742976989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sZwvUPhg0zmXaS74gLgBF+hjFnxoQ0KnZ7SOFmWX+cM=;
        b=KDtOXjc/Lu8Ja2CvGcozQ4nvCvc4h2LHbu9oX6IQYBmH8JwYL7BWTJHqYnj/dQhRP3
         1HIaqaVKfvrneoh0IfEKdVtb2vp0CwDGrBIpyI8BfaM5jpnUIzMe1rBomoucy4XTyzd2
         mlTRB7FRcXXZGUIxEB5jnSKn0y+5S0Zgi2pkZT6ZA5Z7wsdQV1WF/zMqyNtdPNSrip/i
         QnGAFWNEU5aedHrXAN3/r6ZfRzUw6KkxRJtiLcGwomva1CwzVoBBLzo2N52cg9nzJICj
         N55P8aAD5IOa9wt57PwNEQpBc3hJNEoFtSPR1Oa+ekyGmrpP+bwEvvzlgNBxTV0MNBCP
         o7GA==
X-Gm-Message-State: AOJu0YwE5sTTQyjzryn/2HEPPgM36gD3yyjKPKjELrL3z8cVDWgQr9JU
	BKJmWObrDTucYsI4350fWTUAIl5pNvFPIJRIhUdEIX+phQFyg3jRfrAGfSQI
X-Gm-Gg: ASbGncudMUXPqWH+46UNpsAgRyUV/FsliYghPCzIDI5HNwvJy+FgI1l5SimWYSHgkzd
	8UaSbbEtLvAtVLQhT+XdrozliF+kD8qP39HFvhRoFiwzVv3wVKqJowkI24MCNi3rrdvXxzmyVjN
	8IevgFscpxnhjil3Bmgl5B8rw4MLpHIMPUJCId69HfBMb0r3mvsVw5tgr3AHPAF77gFaToTf3Pg
	UqiT1T2EAKyGinhMiBxTq2mQ26z7ZJOHfDAzmVHMswO5eoAIN6GiYvsbr4gt17+YGO3E5qoajuN
	zwP6/zzYgTD5qPOfJdXnVW/Q1g3s5kWBNwkH
X-Google-Smtp-Source: AGHT+IHMi8Hz+37ucjuvJxZqhmiBj+mXX5uIEtvhLXJ/Md8i1tKEKc0SFmmQp8Hf3O2xWeFYT29UCg==
X-Received: by 2002:a05:6a21:6da0:b0:1f5:8de8:3b27 with SMTP id adf61e73a8af0-1fbeb6a0523mr3518129637.14.1742372189597;
        Wed, 19 Mar 2025 01:16:29 -0700 (PDT)
Received: from apollo.localdomain ([2601:646:8201:fd20::ac74])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af56e9c95c5sm8704323a12.4.2025.03.19.01.16.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 01:16:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [PATCH v3 15/27] unzip: Fix build with GCC-15
Date: Wed, 19 Mar 2025 01:15:47 -0700
Message-ID: <20250319081610.3536475-19-raj.khem@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250319081610.3536475-1-raj.khem@gmail.com>
References: <20250319081610.3536475-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Mar 2025 08:16:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/213285

Add a patch to remove redundant declarations

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-extended/unzip/unzip/gcc15.patch | 17 +++++++++++++++++
 meta/recipes-extended/unzip/unzip_6.0.bb      |  1 +
 2 files changed, 18 insertions(+)
 create mode 100644 meta/recipes-extended/unzip/unzip/gcc15.patch

diff --git a/meta/recipes-extended/unzip/unzip/gcc15.patch b/meta/recipes-extended/unzip/unzip/gcc15.patch
new file mode 100644
index 00000000000..42a2f81681e
--- /dev/null
+++ b/meta/recipes-extended/unzip/unzip/gcc15.patch
@@ -0,0 +1,17 @@
+Do not redefine gmtime(), localtime()
+
+They are already provided by system time.h header
+
+Upstream-Status: Inactive-Upstream [need a new release]
+
+Sign-off-by: Khem Raj <raj.khem@gmail.com>
+--- a/unix/unxcfg.h
++++ b/unix/unxcfg.h
+@@ -117,7 +117,6 @@ typedef struct stat z_stat;
+ #  endif
+ #else
+ #  include <time.h>
+-   struct tm *gmtime(), *localtime();
+ #endif
+ 
+ #if (defined(BSD4_4) || (defined(SYSV) && defined(MODERN)))
diff --git a/meta/recipes-extended/unzip/unzip_6.0.bb b/meta/recipes-extended/unzip/unzip_6.0.bb
index c13e7a008ea..0a88b4c092b 100644
--- a/meta/recipes-extended/unzip/unzip_6.0.bb
+++ b/meta/recipes-extended/unzip/unzip_6.0.bb
@@ -32,6 +32,7 @@ SRC_URI = "${SOURCEFORGE_MIRROR}/infozip/UnZip%206.x%20%28latest%29/UnZip%206.0/
         file://CVE-2022-0530.patch \
         file://0001-configure-Add-correct-system-headers-and-prototypes-.patch \
         file://0001-unix-configure-fix-detection-for-cross-compilation.patch \
+        file://gcc15.patch \
 "
 UPSTREAM_VERSION_UNKNOWN = "1"
 

