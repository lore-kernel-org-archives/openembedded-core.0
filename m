Received: from mail-bk0-f44.google.com ([209.85.214.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rep.dot.nop@gmail.com>) id 1U2l7g-0003zy-Tf
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Feb 2013 17:11:55 +0100
Received: by mail-bk0-f44.google.com with SMTP id j4so156121bkw.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Feb 2013 07:56:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references:in-reply-to:references;
	bh=wbpQoVFqtwyWrt04+v9l8MMjDjBN7D7BGE7m7FiEjDQ=;
	b=MAP+ly3ptdpx7iaolZPufkBEh8u4hOm393tJ3AETw0EZ/vlcbZ4dk5FtdyXOsPcv0z
	zvZ7EYYw5BBajww8I++M9MrYXtSe/QhoodkLRoX/CPPZ40AYLLn8acCVWmj6bYApQlnV
	klzT3jP/MmU6Xmv74x1L5PkZlNDEedfZLAKMhJund5ZvDbiAdYTYzUyxuTDhv8u1x7WH
	EANjfa/2yEBnaWsm2qFI3ERAII4TIAm1tFSM1JutsO3EL3h+/rnK93bqA96JO2nuo8Ug
	Wuba28Op0wvOoBDl3hHqB6OcCqfnA8zBeDJpLsCXLtqApIqJWlEzElEAnGDrimzv1gDG
	Ngyw==
X-Received: by 10.204.147.81 with SMTP id k17mr6784662bkv.70.1360079763266;
	Tue, 05 Feb 2013 07:56:03 -0800 (PST)
Received: from s42.loc (91-119-139-175.dynamic.xdsl-line.inode.at.
	[91.119.139.175])
	by mx.google.com with ESMTPS id c10sm6745378bkw.1.2013.02.05.07.55.58
	(version=TLSv1.2 cipher=RC4-SHA bits=128/128);
	Tue, 05 Feb 2013 07:55:59 -0800 (PST)
Received: from cow by s42.loc with local (Exim 4.80)
	(envelope-from <rep.dot.nop@gmail.com>)
	id 1U2ksH-0004Xr-GQ; Tue, 05 Feb 2013 16:55:57 +0100
From: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  5 Feb 2013 16:55:48 +0100
Message-Id: <7251b1a1fc4daf0469b8f25047acda2f5304bd30.1360079373.git.rep.dot.nop@gmail.com>
X-Mailer: git-send-email 1.7.10.4
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
In-Reply-To: <cover.1360079373.git.rep.dot.nop@gmail.com>
References: <cover.1360079373.git.rep.dot.nop@gmail.com>
Subject: [PATCH 8/8] create-pull-request: Error message on missing -u
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Feb 2013 16:12:00 -0000

The script was erroring out without a hint on what failed.

Signed-off-by: Bernhard Reutner-Fischer <rep.dot.nop@gmail.com>
---
 scripts/create-pull-request |    5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 9692bf1..503248b 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -1,6 +1,6 @@
 #!/bin/bash
 #
-# Copyright (c) 2010-2011,  Intel Corporation.
+# Copyright (c) 2010-2013,  Intel Corporation.
 # All Rights Reserved
 # 
 # This program is free software;  you can redistribute it and/or modify
@@ -124,8 +124,9 @@ if [ -z "$BRANCH" ]; then
 	BRANCH=$(git branch | grep -e "^\* " | cut -d' ' -f2)
 	echo "NOTE: Assuming remote branch '$BRANCH', use -b to override."
 fi
-	
+
 if [ -z "$REMOTE_URL" ]; then
+	echo "ERROR: Missing parameter -u, no git remote!"
 	usage
 	exit 1
 fi
-- 
1.7.10.4



