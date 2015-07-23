Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id E00347623E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 19:57:18 +0000 (UTC)
Received: by pabkd10 with SMTP id kd10so1240481pab.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jul 2015 12:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=m+89wBQ+F3WvsSXOkwvQ+Cv6tPYTMbUALIXNabcyBbk=;
	b=RVLoB2ElYg94azzJU6tqbX2yEB0p7fWMFPTJxFqfes1808lhQ+AFC8y0xzYpTfhs8T
	vRaNp/jCRXXueZode8x4fE1yGdz5WP3Ik9N1vgmeWLmR6sLnXotmR+QFM84R0UbsVKQc
	7wWjSsHStvjOdwGqzyvswyj6gHeNW3jShmrjzBN1hOpwjB8NJSCo4438EpUIVEXtigRt
	q3YKX8mc6fqq5kNOIM+nYsSywFbx7lyYUkIETQmqXKEynYA0nUQX8HxnNxkpyX/7v7Hg
	ApitjDb5BCxYlgVSlyEUInSKCczYA13AQyQ8BE6psDySIOdyH82rt2Zhmv3KdzLTeTA7
	jgRA==
X-Received: by 10.70.89.199 with SMTP id bq7mr21562038pdb.168.1437681439358;
	Thu, 23 Jul 2015 12:57:19 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id j9sm5019734pdl.65.2015.07.23.12.57.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 23 Jul 2015 12:57:18 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Jul 2015 12:58:07 -0700
Message-Id: <4502373d2968d0d6a45879518dcb35773fae23ca.1437663603.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
References: <38fd16a3ab690b57f0b920bb961881ccdef04fb2.1437663603.git.chris_larson@mentor.com>
In-Reply-To: <cover.1437663603.git.chris_larson@mentor.com>
References: <cover.1437663603.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCHv3 2/7] recipetool.append: add extralines arg to appendsrc
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
X-List-Received-Date: Thu, 23 Jul 2015 19:57:20 -0000

This makes the function more reusable for other sub-commands.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 scripts/lib/recipetool/append.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 3f2f9a4..ed7d0d4 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -337,7 +337,7 @@ def appendfile(args):
         return 3
 
 
-def appendsrc(args, files, rd):
+def appendsrc(args, files, rd, extralines=None):
     import oe.recipeutils
 
     srcdir = rd.getVar('S', True)
@@ -352,7 +352,7 @@ def appendsrc(args, files, rd):
         simplified[str(simple_uri)] = uri
 
     copyfiles = {}
-    extralines = []
+    extralines = extralines or []
     for newfile, srcfile in files.iteritems():
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
-- 
2.2.1


