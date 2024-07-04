Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50A25C31D97
	for <webhook@archiver.kernel.org>; Thu,  4 Jul 2024 12:27:56 +0000 (UTC)
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
 by mx.groups.io with SMTP id smtpd.web11.8901.1720096070451327567
 for <openembedded-core@lists.openembedded.org>;
 Thu, 04 Jul 2024 05:27:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=G7xRBkim;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.173, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f64ecb1766so3481685ad.1
        for <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 05:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1720096070; x=1720700870; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pajZPpOV0HchbD7CAVuoOKjnmZlBjNAcPHbBzTY32Pw=;
        b=G7xRBkim4CVTaO1pZOiu2Uq7zlOI6+i1o3+spq7BvJnWM6L3barWG84WbiZF/ZfT2B
         z+hVepISG/pKVPquyOFqA2uM+5dV+n7y/LyGLG8+MCGLtXMU8Hy7xTBYJKRlGYgDWBwc
         sKyR9b/6mEQ+qIReldaMbe+esZ6r5Pb20r+e2kl1A7UIJg3+2G5ACNzgSgAeZ0Zi9XMN
         ECkBXJaxjW2PRyV1zp5KOZ10UmySvmtAK3A9FxzFVblIil66LAVCpkNCOPR1ayx8ox9Q
         Z+r3ZggGTXHU911LhhDnY37f1ar7UT0ZCO3qpNOs0XUR4LWXqHC0TPbSgUZ3S5fOa5kh
         fzjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720096070; x=1720700870;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pajZPpOV0HchbD7CAVuoOKjnmZlBjNAcPHbBzTY32Pw=;
        b=OugdMVSmBW75cB7r0CECVMSrsP6gTdiSqBtjwwlB9YQEwvN+YD60xlixzW8DXkDBzO
         S5Me6l9veOmRgZkWT5vAb0JqapM7/9b90ZAscUTuOxx4zDX8cECKtNeW9ZPvStSqm2iL
         JrVzPbHOBw5zGginqs10+W7pUUHxAqjpiJIcSNaRipRFaq1DSv8ECjijT2FBGLIBj25P
         yOY/JE3b+D1ZRxO8bfV+qLUdIatxdEqmRrehqvzH/743GMMNWr8+044gQviw6U7f003L
         dj1xcz2aUHAkZz8gubxmTKD5VZdDjYeBj8ShhNPjpysRH3F0R27K9wwLs8xrxvtGYQAy
         8K/g==
X-Gm-Message-State: AOJu0Ywb0Z9HqUbvAtWrIZc14xNlODghNLtoT0+QK+sLIe6a4ohYcNWC
	CWI0q+xX25LYrl2djKa5hE1FBI53It6k64V2zd79egnFJLOvMNG5nzulINbykunxq+V2NZxCHA/
	S
X-Google-Smtp-Source: AGHT+IHaNH8dCKoF+hCBU+u6nnGxqrl73GZEvFZvr8Mg0ibMXpZzyTfYLPI2Rb6zVGDk3JBsXnREFA==
X-Received: by 2002:a17:902:7c88:b0:1fb:1bb5:4062 with SMTP id d9443c01a7336-1fb33e7f02amr9262365ad.33.1720096069740;
        Thu, 04 Jul 2024 05:27:49 -0700 (PDT)
Received: from hexa.. ([98.142.47.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb1c79682csm29416075ad.8.2024.07.04.05.27.49
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 05:27:49 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 16/21] devtool: ide-sdk: correct help typo
Date: Thu,  4 Jul 2024 05:27:08 -0700
Message-Id: <149f79c877f476eabafc667629f89af335fcae34.1720095886.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1720095886.git.steve@sakoman.com>
References: <cover.1720095886.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 04 Jul 2024 12:27:56 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/201557

From: Antonin Godard <antoningodard@pm.me>

Signed-off-by: Antonin Godard <antoningodard@pm.me>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 50e043387a2f0f9a5c2f7a5f914c465c830d329b)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 scripts/lib/devtool/ide_sdk.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/ide_sdk.py b/scripts/lib/devtool/ide_sdk.py
index 7807b322b3..65873b088d 100755
--- a/scripts/lib/devtool/ide_sdk.py
+++ b/scripts/lib/devtool/ide_sdk.py
@@ -1052,7 +1052,7 @@ def register_commands(subparsers, context):
     parser_ide_sdk.add_argument(
         '-I', '--key', help='Specify ssh private key for connection to the target')
     parser_ide_sdk.add_argument(
-        '--skip-bitbake', help='Generate IDE configuration but skip calling bibtake to update the SDK.', action='store_true')
+        '--skip-bitbake', help='Generate IDE configuration but skip calling bitbake to update the SDK', action='store_true')
     parser_ide_sdk.add_argument(
         '-k', '--bitbake-k', help='Pass -k parameter to bitbake', action='store_true')
     parser_ide_sdk.add_argument(
-- 
2.34.1


