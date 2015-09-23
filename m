Return-Path: <kergoth@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0B55C76417
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 18:21:51 +0000 (UTC)
Received: by wiclk2 with SMTP id lk2so252212538wic.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Sep 2015 11:21:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=TN1C95YGtCheYk0qrRZEQxfP4guknop3fNZ9aP8S3oI=;
	b=c06uHYoawz+DIIAf/yIvhP6IxfenanvWV0dt2hRW3C27eY2rTdKAD//rECZc0PN5UO
	H481lXlzBH2aGbu0cUpeFiVkn5svNI65470O7rN4Tk7BkXRbVAVxaoAJRx/js1UFgF8Q
	Cu62826+3yiA6z6L+0gkVqWViN+uovSxhxMnnn+NjUsCRJXLDRmdr47WjdNI8BVvl0qj
	d7EMHJ679kI3lElMncbxnjzV1IhpaZCZ9By9P2Aot87fELODd05mFBMecsrBJK9YOdMN
	PBykgI4nDmpKPnA0EWHzt0WBcQC7FYdDKEROiLrAx+ucxT/sa4ykmKH8erjsEnAIj4nT
	1l/g==
X-Received: by 10.180.219.106 with SMTP id pn10mr5779404wic.56.1443032511339; 
	Wed, 23 Sep 2015 11:21:51 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id h8sm9775279wib.21.2015.09.23.11.21.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 23 Sep 2015 11:21:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 23 Sep 2015 11:24:19 -0700
Message-Id: <55ad00956e14d68f262d6d32108b2b03642caf1e.1443032533.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <232185c2493208aa41983f92c73024cb1ccdebb6.1443032533.git.chris_larson@mentor.com>
References: <232185c2493208aa41983f92c73024cb1ccdebb6.1443032533.git.chris_larson@mentor.com>
In-Reply-To: <cover.1443032533.git.chris_larson@mentor.com>
References: <cover.1443032533.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 3/3] recipetool, devtool: set up the logging filters
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
X-List-Received-Date: Wed, 23 Sep 2015 18:21:52 -0000

From: Christopher Larson <chris_larson@mentor.com>

We want errors going to stderr, the way they do in bitbake itself.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 scripts/devtool    | 1 +
 scripts/recipetool | 1 +
 2 files changed, 2 insertions(+)

diff --git a/scripts/devtool b/scripts/devtool
index 87df951..5146538 100755
--- a/scripts/devtool
+++ b/scripts/devtool
@@ -241,6 +241,7 @@ def main():
         logger.debug('Using standard bitbake path %s' % bitbakepath)
         scriptpath.add_oe_lib_path()
 
+    scriptutils.logger_setup_filters(logger)
     scriptutils.logger_setup_color(logger, global_args.color)
 
     if global_args.bbpath is None:
diff --git a/scripts/recipetool b/scripts/recipetool
index 87fb35e..a1fc6e6 100755
--- a/scripts/recipetool
+++ b/scripts/recipetool
@@ -72,6 +72,7 @@ def main():
         sys.exit(1)
     logger.debug('Found bitbake path: %s' % bitbakepath)
 
+    scriptutils.logger_setup_filters(logger)
     scriptutils.logger_setup_color(logger, global_args.color)
 
     tinfoil = tinfoil_init(False)
-- 
2.2.1


