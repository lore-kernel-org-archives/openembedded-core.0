Return-Path: <kergoth@gmail.com>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 90D397C7BF
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 Mar 2019 21:36:37 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id l5so7181680wrw.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Mar 2019 13:36:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=pfDC7eJc/Bm5XlEiO8SgfrSYHjzjayPRW6sMcJ2md9Q=;
	b=pS8YL9h81zEFb1rGJ7Nx0zZIofeDTk9mWi63yDUDmPwWLkGv78g1Ag/bQ2/ni0eEi5
	SGKKfsuf5rFz+9kxzTk2rMSd/p3urtJgJHEQfOTpQTTjTMtRkF9UKdcr8g7CakMSG2n2
	CLuN3AM4WHIEJmm702rxPeyGbSXU10dgFf6S/HO0XeOjkFE32sQSjyCDQ+zBkLmJhyOH
	NLVpoBK0nCJxa5ciN/SZlor/svDQavMHU+L12JvTv4gFUiAua+On9k9c23ZIQ+4vzA7Z
	R6j0RLuui7kDKEOMoJPJueIG4c8Hmcd2ruLD7Gs5mwVYfJctxDRQ30fXYqiKmH+pxGoC
	uXXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=pfDC7eJc/Bm5XlEiO8SgfrSYHjzjayPRW6sMcJ2md9Q=;
	b=WuCMDns8xGA4iOQJnX+mhhrRqnFKKsOxbcm1QdI89+xW9bNg4vtRnzvH0Pe8Nxt9rK
	IbvbrDGzxdD4gB+mVy7mrFFclwD9/avyzAVzhiJiOVCyOc6VZBaI5/YykkraflsDbYQX
	6d3gBTmngRLq9exC62adPa4j5l6D9vyL9Ppaq8NSNlK9UCxbKBgzWpgFQ9FHhOCmKidd
	5y7hbKq1b4UVJ/dgnh7Y7ct7pTltDTzoDmAXgmHhXbEb9VRs72tvASYlpQgOENoMr6bw
	cEqmo/LOSuZsIRUnZCaf1BXHTKYAf+cVL+sBiBJz5f8BWqJkiWH86AQggL8i74noXr6G
	xBdw==
X-Gm-Message-State: APjAAAX+M7N7kU+QpIzP81yxxpkfb4rI0drTlNsSknBcabFhIXRT27YU
	X9pUsmMk/Rm0B+odXtg0lrwso4upCGE=
X-Google-Smtp-Source: APXvYqwitJrX1SqXv40n+wWD7YkjJMgHQcd+zB+vAOnDRnTEpGY5wzohP83qqQddT2KZO+fdmjokAg==
X-Received: by 2002:adf:e949:: with SMTP id m9mr10989591wrn.1.1551735397965;
	Mon, 04 Mar 2019 13:36:37 -0800 (PST)
Received: from ubu18-mel-builder.alm.mentorg.com (nat-lmt.mentorg.com.
	[139.181.28.34])
	by smtp.gmail.com with ESMTPSA id x6sm11819411wmg.0.2019.03.04.13.36.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 04 Mar 2019 13:36:36 -0800 (PST)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 Mar 2019 21:36:26 +0000
Message-Id: <c4f37568236d2e3d8c40d57399d0b275ad5b7c8b.1551735224.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1551735224.git.chris_larson@mentor.com>
References: <cover.1551735224.git.chris_larson@mentor.com>
MIME-Version: 1.0
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 4/4] oe.scriptutils: also send WARNING to stderr
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
X-List-Received-Date: Mon, 04 Mar 2019 21:36:37 -0000
Content-Transfer-Encoding: 8bit

From: Christopher Larson <chris_larson@mentor.com>

stderr isn't just for errors, but anything out of band. It's highly unlikely
that warning messages are anything but out of band, which makes scripting our
tools more troublesome, since the script calling it has to filter out the
warnings from stdout to get the real output.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/lib/scriptutils.py | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/scriptutils.py b/scripts/lib/scriptutils.py
index c361d0741d..d1a50207c5 100644
--- a/scripts/lib/scriptutils.py
+++ b/scripts/lib/scriptutils.py
@@ -43,9 +43,11 @@ def logger_setup_filters(logger):
     import bb.msg
 
     console = logging.StreamHandler(sys.stdout)
+    bb.msg.addDefaultlogFilter(console)
     errconsole = logging.StreamHandler(sys.stderr)
-    bb.msg.addDefaultlogFilter(console, bb.msg.BBLogFilterStdOut)
-    bb.msg.addDefaultlogFilter(errconsole, bb.msg.BBLogFilterStdErr)
+    bb.msg.addDefaultlogFilter(errconsole)
+    console.addFilter(lambda r: r.levelno < logging.WARNING)
+    errconsole.addFilter(lambda r: r.levelno >= logging.WARNING)
     format_str = "%(levelname)s: %(message)s"
     console.setFormatter(bb.msg.BBLogFormatter(format_str))
     errconsole.setFormatter(bb.msg.BBLogFormatter(format_str))
-- 
2.20.1


