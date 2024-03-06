Return-Path: <richard.purdie@linuxfoundation.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E093AC54E4A
	for <webhook@archiver.kernel.org>; Wed,  6 Mar 2024 12:12:58 +0000 (UTC)
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
 by mx.groups.io with SMTP id smtpd.web10.10379.1709727168507576021
 for <openembedded-core@lists.openembedded.org>;
 Wed, 06 Mar 2024 04:12:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@linuxfoundation.org header.s=google header.b=aT27AYmr;
 spf=pass (domain: linuxfoundation.org, ip: 209.85.221.47, mailfrom: richard.purdie@linuxfoundation.org)
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-33d0a7f2424so1120713f8f.0
        for <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 04:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1709727167; x=1710331967; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6kWKO3IJsEQaIw22FHL228PbNH+ttSWF6b9qEQ+dtrc=;
        b=aT27AYmrWaIsXTsjQHBzkPRVKa+k+OUkqbwNG1rwQAHcaFTXvpclaGdoqluFB8B0ZV
         7xwa3xrBXSDlddfQtQIwjAeHT5siDrcYM8zLdyQDT5wfRjRJFJjO6nfZvDt9mWNWkchF
         amo4NUUQzfj355cdMoWPHPwbMFvALlgQT+F4k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709727167; x=1710331967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6kWKO3IJsEQaIw22FHL228PbNH+ttSWF6b9qEQ+dtrc=;
        b=Rn6TaW7sQRsTJJa/iuL4ga+Kdj9uhxzkmNyBmHEH5VeuLGswZSCK+TXmsq6KBr8YoD
         3YuNz1B0qRE3FcEOFmI+3+0D1XZF0HsPBo59+fZZ8BfGfZ1U6QibRSpRd96E+YFf+OMX
         FzXf4435mx1+sLwpLurt8+1sMacAyzHnNp6bM9tJEyniCCSUmFQd8UfDzI3gr/hqkTTv
         oxKJk9hgkV2WDQJi+fyZtKxD7kN3HLqR7uwBe9wqVWJoNAE9qWv/iFnQdtSXL8mxFwjT
         ReQuwiS3K0dLKpP0cB6y13jpal+LHewha6EsvXzFqBOvc0yLR0l7xVeKIQEIaOdN+/NK
         SphQ==
X-Gm-Message-State: AOJu0YwEJllSbhHl4BV04TzqthuDV1Vpq2IujZYGCEQxnbwHHkkjQVPf
	6caTC5MiXNGVghbQKyv2/An/rrnM66N7mRUYlpB8jTW0v1xg1CTtBdaT4MHdWdNaSd8Pcmkh8nM
	/
X-Google-Smtp-Source: AGHT+IGFy6Loh6WgnWz9Xo0vtCgHUYYJPZp62UsEtiHiQJ+fhx17RTdWWy2WhvYqJParW/64b5vgXg==
X-Received: by 2002:a05:6000:4c7:b0:33e:8fd:1173 with SMTP id h7-20020a05600004c700b0033e08fd1173mr11934994wri.60.1709727166715;
        Wed, 06 Mar 2024 04:12:46 -0800 (PST)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:1f9c:b564:4f14:a0ea])
        by smtp.gmail.com with ESMTPSA id h3-20020adfa4c3000000b0033dd2a7167fsm17634099wrb.29.2024.03.06.04.12.46
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Mar 2024 04:12:46 -0800 (PST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 2/4] go: Further tweak indentation in patch
Date: Wed,  6 Mar 2024 12:12:41 +0000
Message-Id: <20240306121243.2247637-2-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240306121243.2247637-1-richard.purdie@linuxfoundation.org>
References: <20240306121243.2247637-1-richard.purdie@linuxfoundation.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 06 Mar 2024 12:12:58 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/196666

The current patch formatting is a mix of two styles which is hard to read.
Tweak it further to make changes easier to identify since we're already
breaking formatting rules.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 ...d-dist-separate-host-and-target-builds.patch | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
index 02269be9699..364fce907ad 100644
--- a/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
+++ b/meta/recipes-devtools/go/go/0005-cmd-dist-separate-host-and-target-builds.patch
@@ -31,9 +31,10 @@ Adapted to Go 1.13 from patches originally submitted to
 the meta/recipes-devtools/go tree by
 Matt Madison <matt@madison.systems>.
 
-Rework the patch to avoid identation, it's more hard to read but
-easy to rebase.
+Rework the patch to avoid identation, it breaks formatting rules but
+makes the changes more obvious and maintainable.
 Jose Quaresma <jose.quaresma@foundries.io>
+Richard Purdie <richard.purdie@linuxfoundation.org>
 
 Upstream-Status: Inappropriate [OE specific]
 
@@ -131,7 +132,7 @@ index 06ee4de8a9..74b7c7098f 100644
 +	// For split host/target cross/cross-canadian builds, we don't
 +	// want to be setting these flags until after we have compiled
 +	// the toolchain that runs on the build host.
-+	if !crossBuild {
++if !crossBuild {
  	gogcflags = os.Getenv("GO_GCFLAGS") // we were using $BOOT_GO_GCFLAGS until now
  	setNoOpt()
  	goldflags = os.Getenv("GO_LDFLAGS") // we were using $BOOT_GO_LDFLAGS until now
@@ -143,11 +144,11 @@ index 06ee4de8a9..74b7c7098f 100644
  		xprintf("\n")
  	}
  	xprintf("Building Go toolchain2 using go_bootstrap and Go toolchain1.\n")
-+	if !crossBuild {
++if !crossBuild {
  	os.Setenv("CC", compilerEnvLookup("CC", defaultcc, goos, goarch))
 +} else {
 +		os.Setenv("CC", defaultcc[""])
-+	}
++}
  	// Now that cmd/go is in charge of the build process, enable GOEXPERIMENT.
  	os.Setenv("GOEXPERIMENT", goexperiment)
  	// No need to enable PGO for toolchain2.
@@ -155,7 +156,7 @@ index 06ee4de8a9..74b7c7098f 100644
  		os.Setenv("GOCACHE", oldgocache)
  	}
  
-+	if !crossBuild {
++if !crossBuild {
  	if goos == oldgoos && goarch == oldgoarch {
  		// Common case - not setting up for cross-compilation.
  		timelog("build", "toolchain")
@@ -198,7 +199,7 @@ index 06ee4de8a9..74b7c7098f 100644
 +			checkNotStale(toolenv(), goBootstrap, toBuild...)
 +			// Skip cmdGo staleness checks here, since we can't run the target's cmdGo binary
 +		}
-+	}
++}
  
  	// Check that there are no new files in $GOROOT/bin other than
  	// go and gofmt and $GOOS_$GOARCH (target bin when cross-compiling).
@@ -208,7 +209,7 @@ index 06ee4de8a9..74b7c7098f 100644
  
 +	// Except that for split host/target cross-builds, we need to
 +	// keep it.
-+	if !crossBuild {
++if !crossBuild {
  	// Remove go_bootstrap now that we're done.
  	xremove(pathf("%s/go_bootstrap"+exe, tooldir))
 +}
-- 
2.40.1


