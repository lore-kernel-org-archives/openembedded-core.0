Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f47.google.com (mail-pa0-f47.google.com
	[209.85.220.47])
	by mail.openembedded.org (Postfix) with ESMTP id 0080976B69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 22:19:03 +0000 (UTC)
Received: by pacdd16 with SMTP id dd16so106435203pac.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Aug 2015 15:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=Yta6xcH0XHjktPPS1dH4JasHTbEG+bhI8wyuMD2xYwk=;
	b=ZtZup/fZjn+Y7SRMzaO5QtAoKiSRXC/qAkMavk8+La3toa0vKgQQjp+8OnHx2nxWzM
	s2bQOgdh3hnu6ahyCDN5rMIQ/+TWprv3xAKJcmT49pXZjBZinMs82PpyUEqzoPsG7fbT
	ssvGKJWe1bCrUKsT0r3rSnMnTomj4m0c+h5t0il9oaXyRduRe6HzWfxttp0IdwtBir3L
	KBk3/ucQj/rkweDSn3yvqamb84NNF3unJjJbMv5gOAQZEzO91HsRF3th5jC8j37gPxLE
	BUfyWFkSBtDr5NtAR/KjURgrw3n0G05HjBPdZsHllfciav+CzOeygYHQMcWo1JXmGGMK
	aX+Q==
X-Received: by 10.66.142.233 with SMTP id rz9mr49571717pab.23.1440454743886;
	Mon, 24 Aug 2015 15:19:03 -0700 (PDT)
Received: from amyr.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	mc1sm18565465pdb.14.2015.08.24.15.19.01
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 24 Aug 2015 15:19:02 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 24 Aug 2015 15:18:39 -0700
Message-Id: <6761ce41fe842352a8074227387736e5d7e18285.1440454289.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
References: <88f419e3f0f9c1a3fa5619641be68b9832de9196.1440454289.git.chris_larson@mentor.com>
In-Reply-To: <cover.1440454289.git.chris_larson@mentor.com>
References: <cover.1440454289.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: [PATCH 7/7] bitbake.conf: set PATCHRESOLVE to noop by default
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
X-List-Received-Date: Mon, 24 Aug 2015 22:19:04 -0000

From: Christopher Larson <chris_larson@mentor.com>

Automatically spawning a devshell, rather than doing so on demand, is
questionable default behavior, and is potentially problematic in headless
builds. Further, there are problems with the patch resolver today. Default to
noop, and the user can always opt-in to use of the patch resolver by setting
PATCHRESOLVE to user.

Signed-off-by: Christopher Larson <chris_larson@mentor.com>
---
 meta/conf/bitbake.conf | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 0ef185d..be681cb 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -483,8 +483,8 @@ export LC_ALL = "C"
 ##################################################################
 # Patch handling.
 ##################################################################
-PATCHTOOL = 'quilt'
-PATCHRESOLVE = 'user'
+PATCHTOOL = "quilt"
+PATCHRESOLVE = "noop"
 
 ##################################################################
 # Build flags and options.
-- 
2.2.1


