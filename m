Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f175.google.com (mail-ig0-f175.google.com
	[209.85.213.175])
	by mail.openembedded.org (Postfix) with ESMTP id EB9336AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 22:17:50 +0000 (UTC)
Received: by igbqq3 with SMTP id qq3so1417112igb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jun 2015 15:17:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=jmukQcwlZxDUsKZxpayqhqOT6o8whCqaHoAX3E0+F9M=;
	b=dQ8xLhia3Jlo0urawX19SxSJ7P9sejFp0VszopO6JD9fr032pu27a549uMKOUXet3I
	PhU+nR4apW+6wxlJlVi08+ERHOZC8tZYlnGXogmnSBQaNHFE1YHibz7UFvRz0WnTbPPO
	pZqQxbDHeT4e7F3UN2ClzsedqZtW1gCMi/drXS6ysNBXCJYFhmWidISPAFMpxYNSnq4e
	Gr+6YdcWakhJQizuRHRqV4IliNbiqzlmtTZI6eyxZAjs6cH1rixxKo2874TzVbXFKDiG
	ZQIrwb1ujhURvL/z/Is5VPSdi845u+uwE5T7TdCuSW0Lh3mYuqRo8rNnr3oJz7Xb+3Wh
	TVcw==
X-Received: by 10.43.76.195 with SMTP id zf3mr39464947icb.62.1435184271365;
	Wed, 24 Jun 2015 15:17:51 -0700 (PDT)
Received: from quark.alm.mentorg.com (nat-lmt.mentorg.com. [139.181.28.34])
	by mx.google.com with ESMTPSA id
	l128sm18213097iol.1.2015.06.24.15.17.49
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 24 Jun 2015 15:17:50 -0700 (PDT)
From: Christopher Larson <kergoth@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 24 Jun 2015 15:17:45 -0700
Message-Id: <ff01786ba6d44a8f8e92e43260d08ffaba0490a7.1435183929.git.kergoth@gmail.com>
X-Mailer: git-send-email 2.2.1
In-Reply-To: <cover.1435183929.git.kergoth@gmail.com>
References: <cover.1435183929.git.kergoth@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: [PATCH 1/3] oe.recipeutils: fix line.split error in bbappend_recipe
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
X-List-Received-Date: Wed, 24 Jun 2015 22:17:51 -0000

Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Signed-off-by: Christopher Larson <kergoth@gmail.com>
---
 meta/lib/oe/recipeutils.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/lib/oe/recipeutils.py b/meta/lib/oe/recipeutils.py
index 26bbf3e..d8094c8 100644
--- a/meta/lib/oe/recipeutils.py
+++ b/meta/lib/oe/recipeutils.py
@@ -436,7 +436,7 @@ def bbappend_recipe(rd, destlayerdir, srcfiles, install=None, wildcardver=False,
             for line in extralines:
                 if line[-1] == '\n':
                     line = line[:-1]
-                splitline = line.split(maxsplit=2)
+                splitline = line.split(None, 2)
                 if len(splitline) == 3:
                     bbappendlines.append(tuple(splitline))
                 else:
-- 
2.2.1


