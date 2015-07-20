Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0AB9475979
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 22:15:15 +0000 (UTC)
Received: by padck2 with SMTP id ck2so107161792pad.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Jul 2015 15:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=QfG771eJiefRaW5mclERBM3+vKo+1JYlFe9dIH/K9vg=;
	b=Xbp5p3jlylJ+vGpxyl2feMi+Qa7IOyFLfM5pyqDXaCHauqzQPm8e7/qsRhW8LIS53K
	lhxyiJv85x8JHybKRJjf2lS9EJeHpBWn85D+G/Ig1nCFNJNVtF2/Je12bfGi1eeKHEiY
	r7KchWFjtLSVnbSPTgZwbuy5mGJZOO92lzytKQLvcH1fxfRkT7wpE0IjdMOb4iXmkjXw
	2AXLPBQ1NbDcII2MQjy/OB37yCn4bDyYKLcXijiDkVRv6KDssEzhfMHdlVd/uXqr7B9U
	WwXPQ0uwpGbzwN32wWkyxaOTYkcwwCeY3wkP6xIvhXcYK2ejlgNGZwpf/5ygIi7cK38V
	LJOA==
X-Received: by 10.66.151.133 with SMTP id uq5mr64865329pab.7.1437430516264;
	Mon, 20 Jul 2015 15:15:16 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id
	f1sm23612727pdp.39.2015.07.20.15.15.14
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Jul 2015 15:15:15 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jul 2015 15:15:52 -0700
Message-Id: <525501ed394ec4262c7c0e44fa193cd43316e6ed.1437430369.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
References: <c5e5bbd5f85ed4ae437815656889d328da25e75b.1437430369.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437430369.git.chris_larson@mentor.com>
References: <cover.1437430369.git.chris_larson@mentor.com>
Subject: [PATCHv2 2/6] recipetool.append: add extralines arg to appendsrc
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
X-List-Received-Date: Mon, 20 Jul 2015 22:15:17 -0000

This makes the function more reusable for other sub-commands.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/recipetool/append.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index a2133f7..fb6b090 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -337,7 +337,7 @@ def appendfile(args):
         return 3
 
 
-def appendsrc(args, files, rd):
+def appendsrc(args, files, rd, extralines=None):
     import oe.recipeutils
 
     srcdir = rd.getVar('S', True)
@@ -352,7 +352,7 @@ def appendsrc(args, files, rd):
         simplified[simple_uri] = uri
 
     copyfiles = {}
-    extralines = []
+    extralines = extralines or []
     for newfile, srcfile in files.iteritems():
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
-- 
2.2.1


