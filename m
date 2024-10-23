Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AEBD6CF537E
	for <webhook@archiver.kernel.org>; Wed, 23 Oct 2024 12:35:21 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web10.7698.1729686920328393101
 for <openembedded-core@lists.openembedded.org>;
 Wed, 23 Oct 2024 05:35:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=gYrTtJkz;
 spf=softfail (domain: sakoman.com, ip: 209.85.214.176, mailfrom: steve@sakoman.com)
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-207115e3056so57209435ad.2
        for <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 05:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729686919; x=1730291719; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5MaRrFtCVnkk4zfJzbI++wQG+23rQhQGppEwk46N7M=;
        b=gYrTtJkzHX/V+xIYZZB5BB574IcOo6w7P/CVr8607T5NZ0r/ZpW1Hz30rxnoccAfb9
         0x2YcctgCJxOgqKAUQgKYv0P3F6VEKNv1ATLo3MROZcDWRAcN80dw2LN9Iw34cqhiAN+
         Lx/jfJebLVkzqTHSEDOxYx4uvNkcn32eEgU+albDd5A5Vse1JAINYdheDc7AFphPJtoG
         uafiFMz3/GsNpQcK8Ts49Oyl8aI0s7KbMCpxNsT4m8zaetpDb6cZi+YDtTWQ9+C/JNBu
         lStjTzRhFP0N8pElSA/6n98HDf9LzwU4/8jl2UVZTPQIpElATdk6BPcIVP2yqxev2kK2
         mUnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729686919; x=1730291719;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5MaRrFtCVnkk4zfJzbI++wQG+23rQhQGppEwk46N7M=;
        b=n/OoX0+UZzswB19aChHcOeyKeTX6XxQtlfRbLdUbrYVmKEoeiIXPTrMeCL2rpVe/78
         iFg7IDFlEKUu1ieyJzJlLR9zDRwCvfTEQifpXFZbHEa6JklUOgaOjs6NMolLDXduBv5Q
         JniYznKz0sNx0/oz6t2ZL4CI6A39DWe1wtuerzJ6sYmikm9GFEFR+avDtumA0TSxjXZr
         rnuvzZFfIU6kTpAt82QKe5XQvpoZ+MXGOgTR/n84ew5fhOKzWYK/Qy1tCCkyB1DpdD6Q
         4VE1mQ2/XccnA6GObPJpeG1VH5BfVTFf28VDLkYLQcbhldhhuNiWn9Sa/3Z5sJEICUmX
         +29w==
X-Gm-Message-State: AOJu0Yyc6uU/5DcZcTLpb0tkxOHsZ73O2mMlTOH9mdo/7UHDe2m0ijKa
	w+RDQJDoatmpCG5yy32hiPVKVkhZahTzRnYP25TBcDpYrlxhMuxiiTg3uc1xKpfcNxsN3bEMk1S
	H
X-Google-Smtp-Source: AGHT+IGT6UV8R0B0swvB4sBZdzSGbC4koYaGtECm0P8AIrxC6OYKKFvu91YDvyOD8/1Tt/opfAGDlg==
X-Received: by 2002:a17:902:ea06:b0:20b:cae5:dec4 with SMTP id d9443c01a7336-20fa9e4b216mr28794535ad.24.1729686919583;
        Wed, 23 Oct 2024 05:35:19 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:4a40:d08b:8aa5:305c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7f0de3dasm57294245ad.226.2024.10.23.05.35.18
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 05:35:19 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][styhead 22/27] icu: update patch Upstream-Status
Date: Wed, 23 Oct 2024 05:34:30 -0700
Message-Id: <0accc87026a135246ba33ee92ebe215cdd0a5959.1729686660.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729686660.git.steve@sakoman.com>
References: <cover.1729686660.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 23 Oct 2024 12:35:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206233

From: Ross Burton <ross.burton@arm.com>

Signed-off-by: Ross Burton <ross.burton@arm.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 717eb63df55f11d3eb4353ae1364a5781adfce76)
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 meta/recipes-support/icu/icu/fix-install-manx.patch | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/meta/recipes-support/icu/icu/fix-install-manx.patch b/meta/recipes-support/icu/icu/fix-install-manx.patch
index 16cabc8264..7b1ca81451 100644
--- a/meta/recipes-support/icu/icu/fix-install-manx.patch
+++ b/meta/recipes-support/icu/icu/fix-install-manx.patch
@@ -11,9 +11,7 @@ and one process tries to chown a file that the other process has just deleted.
 Also install-manx should be a phony target, and for clarity use $^ instead of $?
 in the install command.
 
-Upstream ticket: https://unicode-org.atlassian.net/jira/software/c/projects/ICU/issues/ICU-21172
-
-Upstream-Status: Submitted [https://github.com/unicode-org/icu/pull/2966]
+Upstream-Status: Backport [0f022dca90cfe6bbf6a74f605dcaf1b489d58a9b]
 Signed-off-by: Ross Burton <ross.burton@intel.com>
 ---
  Makefile.in | 8 ++++----
-- 
2.34.1


