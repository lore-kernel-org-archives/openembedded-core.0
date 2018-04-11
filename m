Return-Path: <jpewhacker@gmail.com>
Received: from mail-io0-f173.google.com (mail-io0-f173.google.com
	[209.85.223.173])
	by mail.openembedded.org (Postfix) with ESMTP id 12DA97493D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Apr 2018 02:22:15 +0000 (UTC)
Received: by mail-io0-f173.google.com with SMTP id y128so701078iod.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 19:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jBYYI0cjfxFfPiOKS/KLabJtW2Iy0HWC9MZhQgaLt7M=;
	b=Xl+hiGue8M0Hrck/C+blQJ3ISdj2242jHuPmsVkmrvnJ3PVJWRoqrk6j64ViqU0eHr
	UvhptvdV+i2oFI1XoJheEHJQnRbxRTZgMYVdECGmPGwf4Hc8xvdonOSqWWCjI1tSqtij
	BSZWf22lDYcy/mWC5lBNtjp7dpZpYkhzeGDQT49DYR7I3YDE/xaJxKb3jFd3vbnUHDw6
	BNFs26cyPaInUIKs01kUtWSfwxiHPQDFd2c9d291UchGZOTNZp5RXsBL7gPYixbQtIIL
	I5CVR1UGjuE6FPpBWAIClkH86NX1vXKykFMpuaFwMyE2iJwKC1Ks4rOEL13NQ/E5TPEK
	GIQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=jBYYI0cjfxFfPiOKS/KLabJtW2Iy0HWC9MZhQgaLt7M=;
	b=FPtXA4TwsUrNJSTFnJC3gwTl5R6eRsJTYsZZ+1g3JDZAgbQfz+cQ5jXryy05i6xjL1
	0HJULeDWviNsVpLOghbZVYl9CHraZ3R19gFOyylevsjdwoswFJF0KLne2gHu32F0YYKo
	BRRHOSKyg9wBGbVUr9kFFRYc7rf4C8FPvtl12cYLlxFoObK2nfnwriFE1zjZIjLy+fsl
	wWxfv4FsBuTDAG1CD2fgUZlDbE3t7oKe74gh3nKy7pRdRcZac9Jt8F4oDR6QfUmZwz1E
	4BeAZjNR0QbY/KQzX/Aa7jg057X6I6My2C9xkCN0nSTdFeb8/khSkUOkKZmuVgMm8/Bx
	AqRw==
X-Gm-Message-State: ALQs6tBfGunLkJaDDHRLR8n0+fDkkUe9NoX7wHyPTjwbm+5ehLsK6jAd
	IJDdCaoEL//aywfhA1oPGvch4Yi6
X-Google-Smtp-Source: AIpwx4+XOs6jQ9R0LxFykJJn5E3kWVpjMAi+1k74ACxkxS22/7BNHzqLh2NqcbMe8+0bV9YIcZsF1g==
X-Received: by 10.107.136.34 with SMTP id k34mr2953211iod.176.1523413336614;
	Tue, 10 Apr 2018 19:22:16 -0700 (PDT)
Received: from ola-842mrw1.ad.garmin.com ([204.77.163.55])
	by smtp.gmail.com with ESMTPSA id w71sm34498iow.87.2018.04.10.19.22.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 10 Apr 2018 19:22:16 -0700 (PDT)
From: Joshua Watt <jpewhacker@gmail.com>
X-Google-Original-From: Joshua Watt <JPEWhacker@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 10 Apr 2018 21:22:00 -0500
Message-Id: <20180411022200.22277-8-JPEWhacker@gmail.com>
X-Mailer: git-send-email 2.14.3
In-Reply-To: <20180411022200.22277-1-JPEWhacker@gmail.com>
References: <20180411022200.22277-1-JPEWhacker@gmail.com>
Subject: [sumo][PATCH 7/7] icecc.bbclass: Bump version number
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
X-List-Received-Date: Wed, 11 Apr 2018 02:22:16 -0000

Bump the version number for force remotes to use a newly generated
environment, since the old one potentially had a few bugs

Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
---
 meta/classes/icecc.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/icecc.bbclass b/meta/classes/icecc.bbclass
index 1b58d1f5e52..73eba7a6a96 100644
--- a/meta/classes/icecc.bbclass
+++ b/meta/classes/icecc.bbclass
@@ -45,7 +45,7 @@ ICECC_ENV_EXEC ?= "${STAGING_BINDIR_NATIVE}/icecc-create-env"
 # A useful thing to do for testing Icecream changes locally is to add a
 # subversion in local.conf:
 #  ICECC_ENV_VERSION_append = "-my-ver-1"
-ICECC_ENV_VERSION = "1"
+ICECC_ENV_VERSION = "2"
 
 # Default to disabling the caret workaround, If set to "1" in local.conf, icecc
 # will locally recompile any files that have warnings, which can adversely
-- 
2.14.3


