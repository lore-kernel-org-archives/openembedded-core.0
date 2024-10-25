Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98592D149E8
	for <webhook@archiver.kernel.org>; Fri, 25 Oct 2024 18:30:02 +0000 (UTC)
Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
 by mx.groups.io with SMTP id smtpd.web11.2620.1729880993607336372
 for <openembedded-core@lists.openembedded.org>;
 Fri, 25 Oct 2024 11:29:53 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20230601.gappssmtp.com header.s=20230601 header.b=FJ9EfCL4;
 spf=softfail (domain: sakoman.com, ip: 209.85.160.52, mailfrom: steve@sakoman.com)
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-2891055c448so1289018fac.0
        for <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 11:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20230601.gappssmtp.com; s=20230601; t=1729880993; x=1730485793; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5MaRrFtCVnkk4zfJzbI++wQG+23rQhQGppEwk46N7M=;
        b=FJ9EfCL4i+XcKi/AB6+HkcwZgh9oC+lvWWHbJkttEH9/9/d5k9PrK4IRySs5hXtWMY
         lIsgeurnL5bqW3jMWEt+8ySZ5qP2Qpbwju7wNR8e7rkQfX8cD29GTOmHJrNs+osd59ym
         xUbO5YtR3sufLnqQTzRXGay/zqfHyniJcx6wAAgO6AkTpLvKJFSLFLN4Z4zKVoP7isKB
         LPlCHonFh/r9ZGV7wD2CQpDk39ONhQGt8/tUXer5NRUXhoZhMQLHDVid17MjtByI8lmB
         iWpizg7DPT6jMqnN0iXGhl+itage1+p/SRwfVNQk0JfLlphjuHWb5BZT2MIbEdBk7n1v
         4HwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729880993; x=1730485793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=i5MaRrFtCVnkk4zfJzbI++wQG+23rQhQGppEwk46N7M=;
        b=Pfnev9KEc6a8gs7gBLCW6AQWdkE/gLlfZt0hWVOrrDZb1dzMy+etmkyq1bdHz/5W5D
         3nOuoPWl97fon5t7z1+QM5Oj88ompwP8PsZK/7GKgcVPJgAjk4ocDcsF4v1plvPPspS8
         G2PPTw6uh9WEdvZYotg7PUfplhYxAh4vMM/A5QYdqzBcD0ifwiotIu45wdB8/i99Nc4K
         JBLMrhr8P+bRbXkC9+cTTxohhE1d+w6L+51So8fj2iFhErMJkChkpkagH052tIbf1Bj2
         3PkYQhCLQCjNWoH/mU+oyDxYnzo+wnCnNIWiv0fzG4Y5dCNw8P9jZ7+6ZWo3dgEHLouI
         0yAQ==
X-Gm-Message-State: AOJu0YzAc0TyAyq9QrChURGF2E2rZMCEIlAyWp+j3jGpPulvCL50j6Y4
	N18X4Y9bhJQAG84YRkoVV9LVUBtGJLrP+cXYHr3zZKO1C35ytgl9NooTQuSTBKwoCkFHRmWnhf5
	x
X-Google-Smtp-Source: AGHT+IGZxy9hvBD3vBntPoekOzflhohWQ6aulIqh/19jgPulrRE4fuiRtX4xjawSxvIJjR8UUuqdCw==
X-Received: by 2002:a05:6870:4191:b0:277:fdce:6759 with SMTP id 586e51a60fabf-29051d49f6emr401192fac.31.1729880992680;
        Fri, 25 Oct 2024 11:29:52 -0700 (PDT)
Received: from hexa.. ([2602:feb4:3b:2100:7a51:eecd:55a5:9cd2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7edc8a4780esm1394972a12.86.2024.10.25.11.29.52
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 11:29:52 -0700 (PDT)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][scarthgap 09/11] icu: update patch Upstream-Status
Date: Fri, 25 Oct 2024 11:29:28 -0700
Message-Id: <d49f8eaf777152237b626750c17dbbcadd4c1939.1729880682.git.steve@sakoman.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1729880682.git.steve@sakoman.com>
References: <cover.1729880682.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 25 Oct 2024 18:30:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/206368

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


