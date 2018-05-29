Return-Path: <armccurdy@gmail.com>
Received: from mail-pg0-f49.google.com (mail-pg0-f49.google.com [74.125.83.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8633274D47
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 21:29:58 +0000 (UTC)
Received: by mail-pg0-f49.google.com with SMTP id 15-v6so6818063pge.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 May 2018 14:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0l34wZeg+OHtTGzqo8rOiI3nQrxgbDIHGhPjk2Sabss=;
	b=E17trPf9YzKbGY+A6fVbKfIN6NGACdO4c1hFNZr/R+SlgWU7Zcx6LF7Fjr/Omwikao
	WsdVWCMxwB2EViT70Z88bsNVnhpG0Ry8Li7VT+z4cSRlDj/+yqfEeX5ndHNhfWRbCigp
	xjeaQAtw4tIvYHBf7HUKXyJxhp7aNZRgVgYeyB+KKWOOWLettbT89dqeFf+dBF2R68Am
	u7axgUlhjqKJl0TGqwV+MU7tcy8FouKWK7sN4xPBFzIt/MFeaQxBFbiI1vkDohNXcNiP
	xITud0aEot4Zi/w4he71FaHmeM+pYgtFx22xM91pOXk/1Ep9hPx6WWLEOl6TxhMxguGv
	4Ayg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0l34wZeg+OHtTGzqo8rOiI3nQrxgbDIHGhPjk2Sabss=;
	b=bvgFMFsXn6NFnruXR9Il5SP/rouR3BPSz4m4h1VXVViZPh8BB82wr5g+Z+KJghrsLO
	G+dg9XCk1dibtCs7JMUg5mZi9Zg5SFqHpXEeHUusfyuquLPFDnVfvC1m6mEx+EybzkzS
	YFqtx4vSYGM1pHQ7pWfU91e9aPl1/aWRjJJbySgH4ZNVDjSBRhmP+2FgwZH1nZ9lNP4b
	+FGYNyTG5WDn10cLDZeIx6JyoSAiPSAoLhS6AxUcJ7OsPccBErXreXMXPHRf8M7wN7Ju
	GnygoRfZPG+AzXdnU3OPdf4PwVPUScPT4znbAteuxrjBVESpGFNAYV9dMlDOTYRSgLIL
	uemQ==
X-Gm-Message-State: ALKqPwfjxFui1DEPkarnVjLWq+y2NW3Pc0PQmfdXUM8S+qZuf3I2ADDr
	XLAAgvTAUaoSotSHu7RRBGTm0g==
X-Google-Smtp-Source: ADUXVKIku4M8kBbt+hvqZdABErn8I0kaGsgBBO+FaL0K64NXHXCraTK+yu8JAP5sko0Gb9Ra2PHLKw==
X-Received: by 2002:a63:6f05:: with SMTP id k5-v6mr93851pgc.62.1527629399218; 
	Tue, 29 May 2018 14:29:59 -0700 (PDT)
Received: from e6520.cablelabs.com ([4.16.80.121])
	by smtp.gmail.com with ESMTPSA id
	i7-v6sm24362pfa.34.2018.05.29.14.29.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 29 May 2018 14:29:58 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 29 May 2018 14:29:46 -0700
Message-Id: <1527629388-3808-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
References: <1527629388-3808-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH v2 3/5] bitbake.conf: drop obsolete commented out value for TARGET_LDFLAGS
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 29 May 2018 21:29:58 -0000

The commented out value for TARGET_LDFLAGS dates back to the switch
to sysroot enabled toolchains in 2007 and is now obsolete.

  http://git.openembedded.org/openembedded-core/commit/?id=ba2e1f4d933c37b372d6749d64614f2510ee9d7b

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/conf/bitbake.conf | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 6ecf78b..15f6da7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -587,9 +587,6 @@ TARGET_LINK_HASH_STYLE ?= "${@['-Wl,--hash-style=gnu',''][d.getVar('LINKER_HASH_
 
 export LDFLAGS = "${TARGET_LDFLAGS}"
 export TARGET_LDFLAGS = "-Wl,-O1 ${TARGET_LINK_HASH_STYLE}"
-#export TARGET_LDFLAGS = "-L${STAGING_DIR_TARGET}${libdir} \
-#                         -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir} \
-#                         -Wl,-O1"
 
 # Pass parallel make options to the compile task
 EXTRA_OEMAKE_prepend_task-compile = "${PARALLEL_MAKE} "
-- 
1.9.1


