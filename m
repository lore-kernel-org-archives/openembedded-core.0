Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EAE6AC25B48
	for <webhook@archiver.kernel.org>; Tue, 24 Oct 2023 12:09:18 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
 by mx.groups.io with SMTP id smtpd.web10.146077.1698149353803051533
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Oct 2023 05:09:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=K8udYV9N;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.48, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-31fa15f4cc6so3119667f8f.2
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 05:09:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1698149352; x=1698754152; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=jfGO2Ac4JsoFHMk+xb4sFA1LO6AVqLXTEJzgVm4caNU=;
        b=K8udYV9NFQqsaxq/tykjJFX0PmIbrVgpVWeK26WVaB5woL5MA26Nl5UrSQiwDtX/Sv
         kO2hwjx8qEAYL5NOJ+VGhG7+IUiqLz2MoEWJWHcKfTqEQVfZlRMgIAagU/Z0Ttr+TR+3
         u1KJHRJUn/VAG5HbjQ+lfbLF0c5+OBbOadL0U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698149352; x=1698754152;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfGO2Ac4JsoFHMk+xb4sFA1LO6AVqLXTEJzgVm4caNU=;
        b=lBBPJOP2Ehp/2FMNJdCEE5FkIw96HNKPC+PWl284yBN3m3FMCoujVz/q7wzkoJgjT4
         FWMaUNwlbIFQUXn46QqCgUcFdA/zTYIct6I5sVblcUOCmPTJk7EKeJfQFruyqmmPugdl
         0rwvay/0np6nntsZsAqW5s8JDW/fcewC+8VVo81IA0qXxbCZanIDA1m2p4LlH54ASVF8
         UKaDw3uedKKp1dQpWNbBZ6YPToHEgVEwEVXyRlgn9Z+4etktQU3zG6UtDJ2YmvBvD8xp
         fWmS1MeTDi++Zl2/Nkx+4cpZxXAWlpu/61XvxxHwB88DgBPYJyvTaehR8nd60lTsCu8s
         eI+A==
X-Gm-Message-State: AOJu0YxT4qhmdfE0CbqGwZJLo8YJlGUONPrO2bkQyvruTaWBUe0HHqYQ
	ghttF4tBpE1lPA2lbJUP59cXZZ4DNriyHR79/Yw=
X-Google-Smtp-Source: AGHT+IG3wU+2J4QyA0G9R3TSH7A1MJ4VJAhfGrbYk9VbtXDOrzuNyM3aGQcwu+mX15s3A2cGOqomcw==
X-Received: by 2002:adf:a44d:0:b0:32d:9d64:b429 with SMTP id e13-20020adfa44d000000b0032d9d64b429mr6994317wra.21.1698149351988;
        Tue, 24 Oct 2023 05:09:11 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:18d6:7c14:536c:fd67])
        by smtp.gmail.com with ESMTPSA id r17-20020a5d4e51000000b0032d09f7a713sm9812906wrt.18.2023.10.24.05.09.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 05:09:11 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Cc: seebs@seebs.net
Subject: [PATCH] SECURITY.md: Add file
Date: Tue, 24 Oct 2023 13:09:10 +0100
Message-Id: <20231024120910.1244491-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 24 Oct 2023 12:09:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/189643

Add a SECURITY.md file with hints for security researchers and other
parties who might report potential security vulnerabilities.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 SECURITY.md | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 SECURITY.md

diff --git a/SECURITY.md b/SECURITY.md
new file mode 100644
index 0000000..7ccecc1
--- /dev/null
+++ b/SECURITY.md
@@ -0,0 +1,13 @@
+How to Report a Potential Vulnerability?
+========================================
+
+If you would like to report a public issue (for example, one with a released
+CVE number), please report it using the
+[https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Security Security Bugzilla].
+If you have a patch ready, submit it following the same procedure as any other
+patch as described in README.md.
+
+If you are dealing with a not-yet released or urgent issue, please send a
+message to security AT yoctoproject DOT org, including as many details as
+possible: the layer or software module affected, the recipe and its version,
+and any example code, if available.
-- 
2.39.2


