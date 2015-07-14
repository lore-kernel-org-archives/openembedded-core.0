Return-Path: <kergoth@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id A39D865D00
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 15:57:25 +0000 (UTC)
Received: by pactm7 with SMTP id tm7so7778122pac.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jul 2015 08:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=f1UkmrwVhQwvJM/sBtFQOudHP+9ZYECd0NV11Sfr3OU=;
	b=pnx+vVAb7gA8kfAiK7pL60yywYgRGSgBNk46VxvlMH1tOxhA1OecOsF+wEA7MeiSFm
	sKMfjfDkrZn9X4F7AJq9ZQDPJmdDZmVvNvsUqbZzY0e2YcoiI/147L/TrlI6Ri0Vd19Z
	/3DwiwBovcrkrh/YVNkkCMzvdU+q6qsVlk1mOeyfn79XaHoyhaacGHn99GhRwJwtTEXX
	LmJrMlhOfnhA41lWCHllfjmDk/rHoug8uh0yz37EztcZwHeFZSQNTMWCkgKhaYcbedQX
	E7GMUE8I/KrG3qFnRJv9Ix5vfKb0zmAuIi+i/DXt782lSQ9ejkBlVHJ6S+fe33eu/D+X
	Pr9Q==
X-Received: by 10.70.1.102 with SMTP id 6mr81338877pdl.32.1436889445561;
	Tue, 14 Jul 2015 08:57:25 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by smtp.gmail.com with ESMTPSA id k5sm1781519pdb.53.2015.07.14.08.57.23
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 14 Jul 2015 08:57:24 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 14 Jul 2015 08:57:40 -0700
Message-Id: <f9bb3406106a64349051793a773012502c305b6d.1436889188.git.chris_larson@mentor.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
References: <e15b0bbe895d669fd6908504f11d62a89aeda5c4.1436889188.git.chris_larson@mentor.com>
In-Reply-To: <cover.1436889188.git.chris_larson@mentor.com>
References: <cover.1436889188.git.chris_larson@mentor.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 2/6] recipetool.append: add extralines arg to appendsrc
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
X-List-Received-Date: Tue, 14 Jul 2015 15:57:25 -0000

This makes the function more reusable for other sub-commands.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
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


