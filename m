Return-Path: <kergoth@gmail.com>
Received: from mail-wg0-f53.google.com (mail-wg0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 3362C7320C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 20:50:03 +0000 (UTC)
Received: by wgjx7 with SMTP id x7so77798824wgj.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 13:50:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
	:references; bh=/ASbEyiyV6kBH5jrU8xJGRXWhTJQQa6a4MXIEUNoblA=;
	b=B4mt7CBe1N3TZwzlLJFOj3MYSluYsSnvoJMzU2N+co+04Ose9lee/wjHawjnryRTeQ
	jg/agOrBHr7HWGjklhRf6xKMAQFVPpYtYgWnLXqhGHm7DoEeJ+cNr3AUNZdW+YQrbAXh
	4HL5jBGn1IqlUY2P/ocr6fTLC5Qv3bpfXeoCsrMkU7zQJmBCwN9nJ+IB/XiNuD4STP1K
	h6LWciGsKma6+kppP8hIwnrZOAG4q9q9pzrhrpTXNdYRWwQEQIvy/6acjUc/5IBnufpu
	EaBsBwItNIoiAAGVClK+BpB0GEF0PlkWlG2XuiSTDIVgqtJTPRglg7PDt3KgJAXHnvgu
	uhVg==
X-Received: by 10.194.243.230 with SMTP id xb6mr32468274wjc.13.1435611004233; 
	Mon, 29 Jun 2015 13:50:04 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id a19sm13834151wiv.2.2015.06.29.13.50.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 29 Jun 2015 13:50:03 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 29 Jun 2015 13:50:07 -0700
Message-Id: <974591c62ec573ee96badb28786aacd3df35ca53.1435610769.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <56786ff2078de10d157e2b211ce3d57141e673a8.1435610769.git.kergoth@gmail.com>
References: <56786ff2078de10d157e2b211ce3d57141e673a8.1435610769.git.kergoth@gmail.com>
In-Reply-To: <cover.1435610769.git.kergoth@gmail.com>
References: <cover.1435610769.git.kergoth@gmail.com>
Subject: [PATCH 3/3] recipetool.append: add extralines arg to appendsrc
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
X-List-Received-Date: Mon, 29 Jun 2015 20:50:04 -0000

This makes the function more reusable for other sub-commands.

Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 scripts/lib/recipetool/append.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lib/recipetool/append.py b/scripts/lib/recipetool/append.py
index 9903871..24a7903 100644
--- a/scripts/lib/recipetool/append.py
+++ b/scripts/lib/recipetool/append.py
@@ -334,7 +334,7 @@ def appendfile(args):
         return 3
 
 
-def appendsrc(args, files, rd):
+def appendsrc(args, files, rd, extralines=None):
     import oe.recipeutils
 
     srcdir = rd.getVar('S', True)
@@ -349,7 +349,7 @@ def appendsrc(args, files, rd):
         simplified[simple_uri] = uri
 
     copyfiles = {}
-    extralines = []
+    extralines = extralines or []
     for newfile, srcfile in files.iteritems():
         src_destdir = os.path.dirname(srcfile)
         if not args.use_workdir:
-- 
2.2.1


