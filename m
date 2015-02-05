Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 316F772E3E
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Feb 2015 16:05:06 +0000 (UTC)
Received: by pdbfl12 with SMTP id fl12so8543407pdb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Feb 2015 08:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=PZyK/QAE6aVwhu+bwA+hrdSYK6cfGMHLGRg6wNn2I6I=;
	b=prAlif8aQTy8gBzojuLymHJX5Z/c6nZtKl+2RVkMri+JHVcn+xWCzuD/pdcvqwGqex
	r0o2U8PyZ5cD84K68y1tJOnaB3Uf7ffZJKD/gRizNWc/SaZ/XSwmmVgOx8EcgajpiR0t
	3ZMJCRkub8uGK+LyMGoyiGxRCd2aYIjMNNUO/oerKDKKGaUKTH7SHiz/JnqEEw3mMln/
	SwGY0MBbIw8g7dtSdaKGanwmkOzLR0vfvw1MB2STsLkchO/2gSrmlXPYvh0zl9FiRxcw
	Zm7rKt1kSE/r0U2RrwuUR7U2XJZMuXmH+XZPeX0Gq+T3I/jX2zwAZq1X30M627lcRBh0
	rXpw==
X-Received: by 10.70.54.168 with SMTP id k8mr5962400pdp.87.1423152307961;
	Thu, 05 Feb 2015 08:05:07 -0800 (PST)
Received: from bigisland.hsd1.ca.comcast.net
	(c-76-20-92-207.hsd1.ca.comcast.net. [76.20.92.207])
	by mx.google.com with ESMTPSA id uq7sm5468848pbc.48.2015.02.05.08.05.06
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 05 Feb 2015 08:05:06 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Feb 2015 08:03:35 -0800
Message-Id: <15196f410d79e2a5c2ceb974213d78465f1a61ce.1423150739.git.akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
References: <73eeb20b36b0a6b5c13a5af50d76ed70c8fccc65.1423150738.git.akuster808@gmail.com>
In-Reply-To: <cover.1423150737.git.akuster808@gmail.com>
References: <cover.1423150737.git.akuster808@gmail.com>
Cc: Tom Zanussi <tom.zanussi@linux.intel.com>
Subject: [PATCH 27/61] perf: Disable perf-libunwind
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
X-List-Received-Date: Thu, 05 Feb 2015 16:05:08 -0000

From: Tom Zanussi <tom.zanussi@linux.intel.com>

It hasn't actually been being enabled anyway: 'Disabling post unwind,
no support found.'.  For now, turn it off because of [YOCTO #7129].

Fixes [YOCTO #7129].

(From OE-Core rev: d8c839afa96925b27909eb5a7b89ee83c87924bc)

Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/recipes-kernel/perf/perf-features.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-kernel/perf/perf-features.inc b/meta/recipes-kernel/perf/perf-features.inc
index 2dbbb47..b8859ab 100644
--- a/meta/recipes-kernel/perf/perf-features.inc
+++ b/meta/recipes-kernel/perf/perf-features.inc
@@ -1,4 +1,4 @@
-PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui perf-libunwind"
+PERF_FEATURES_ENABLE ?= "perf-scripting perf-tui"
 
 def perf_feature_enabled(feature, trueval, falseval, d):
     """
-- 
1.9.1


