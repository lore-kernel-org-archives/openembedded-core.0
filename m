Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id 6FB937D8FC
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 13:12:20 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id v14so2545083wmf.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2019 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=CHOtDGsLb0O++G+iQjuNtdWFfhUFfW4JdGDa7f05Xm0=;
	b=G6baDRKjwmKBqyGhaHp4FinIOYyU0epGGzeYguW3zjyd23HW6KDpimrrZIMZ4rO+yb
	mTfAJ6ivHD0QBxZGwLb7b1wlQ5AyTo4dGoZS4aue7FQLio/HLRmBF6kOP/4SZ2kJS7jg
	x5sq0+s0BpwDe81mg9f/t7tY9IXdiYjvUgW7ymjsnCnVlZ6FnmDqO9+CIhdOQcgmH0Hs
	JhL+/1MYHJrhGN8Po5rixduv748LEW7yOC/rRKg4ZDKnR0xESQ7ee45LUtwzWtNnwj1T
	jK6vY20DiNrBYjLrbzfq+bYdEXQZMuGAtn2LH8S82DNxGTYHND1yyJzP/vr40PKiOvV+
	UOKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=CHOtDGsLb0O++G+iQjuNtdWFfhUFfW4JdGDa7f05Xm0=;
	b=ZDYL7tIdwbkp6EguMowp9ZwHCXZxOzueLhUco9qGuQtst+4C8BiBI1TTewrdKnyXSr
	tF/3Vn2gauqMmbtNz59ufWvZh5AFYiz2cGeFjMMdDnlwTMeuMFJTKK9F20GLxav+LkC2
	LuMbBmRJNyaBLvUtgCnN+qIc2n63wti+vLq7kwTFG8hFKItBnKAM/J2VR9L+9nczmBmn
	+UnJPDhNTMIvodzD5G1Qi4z/8rn1famfMuSuyPMHVhEYhJ0EjYNTut/cZ/a9mpQ+TH20
	GPft6/YUWfb3DGz5DbjkjrEIBqvf58EvsSFT7jTIEOF4QwlLZJW0Az46GMExq6t4UdwP
	ZP2w==
X-Gm-Message-State: APjAAAV5hRtr5iIfPlXI2gBNA/hKsosQ2yYjaDl2yRYab69NI7SR7FZw
	J7KXGQlwclrECSo4+Uq1dV+hsHHyWxI=
X-Google-Smtp-Source: APXvYqw1rtAz2pex5JQwCH7wNL1jsk/85PpLz1UEuzTD6/11yBrXk1Nm7skDLDlU7WGkvAygKivXqA==
X-Received: by 2002:a1c:e1c5:: with SMTP id y188mr2862560wmg.39.1554901940786; 
	Wed, 10 Apr 2019 06:12:20 -0700 (PDT)
Received: from localhost.localdomain ([37.205.61.202])
	by smtp.gmail.com with ESMTPSA id x14sm3032399wmj.3.2019.04.10.06.12.19
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 10 Apr 2019 06:12:20 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 Apr 2019 18:41:33 +0530
Message-Id: <639598aa855df523e3dd1f8df1b0eacfa7fb13d6.1554901639.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1554901639.git.akuster808@gmail.com>
References: <cover.1554901639.git.akuster808@gmail.com>
Subject: [PATCH 14/33] resulttool: Allow store to work on single files
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
X-List-Received-Date: Wed, 10 Apr 2019 13:12:20 -0000

From: Richard Purdie <richard.purdie@linuxfoundation.org>

Store operations using a single file as a source weren't working as the os.walk
command didn't like being given a single file. Fix the store operation to
work for single files.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 scripts/lib/resulttool/store.py | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/scripts/lib/resulttool/store.py b/scripts/lib/resulttool/store.py
index 5e33716..3a81933 100644
--- a/scripts/lib/resulttool/store.py
+++ b/scripts/lib/resulttool/store.py
@@ -29,15 +29,18 @@ def store(args, logger):
     try:
         results = {}
         logger.info('Reading files from %s' % args.source)
-        for root, dirs,  files in os.walk(args.source):
-            for name in files:
-                f = os.path.join(root, name)
-                if name == "testresults.json":
-                    resultutils.append_resultsdata(results, f)
-                elif args.all:
-                    dst = f.replace(args.source, tempdir + "/")
-                    os.makedirs(os.path.dirname(dst), exist_ok=True)
-                    shutil.copyfile(f, dst)
+        if os.path.isfile(args.source):
+            resultutils.append_resultsdata(results, args.source)
+        else:
+            for root, dirs,  files in os.walk(args.source):
+                for name in files:
+                    f = os.path.join(root, name)
+                    if name == "testresults.json":
+                        resultutils.append_resultsdata(results, f)
+                    elif args.all:
+                        dst = f.replace(args.source, tempdir + "/")
+                        os.makedirs(os.path.dirname(dst), exist_ok=True)
+                        shutil.copyfile(f, dst)
 
         revisions = {}
 
-- 
2.7.4


