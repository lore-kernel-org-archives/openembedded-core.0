Return-Path: <tylerwhall@gmail.com>
Received: from mail-ie0-f175.google.com (mail-ie0-f175.google.com
	[209.85.223.175])
	by mail.openembedded.org (Postfix) with ESMTP id 3454A601A0
	for <openembedded-core@lists.openembedded.org>;
	Sun,  4 May 2014 22:37:55 +0000 (UTC)
Received: by mail-ie0-f175.google.com with SMTP id rl12so7311998iec.34
	for <openembedded-core@lists.openembedded.org>;
	Sun, 04 May 2014 15:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=/Wo+XqmY4sh2gvl/whIm49p62lop9c11JlByZHAblAQ=;
	b=cAFlv59rMWeHJYF+qUHsqJV0m5XL26c0aBg5100KcbadQK14padHJntGDLZLU7RmS+
	MMtXSgd/SZekx54F9TY7QBHHsAOKezU9HaqzNXREIouK39tvMsNslHRm9BY/jc1QJ2EK
	wEWN4tmGo5jx0D4JYS+1TS6H7WpgBSvr+O0cvPINA2gi1x1PrfyAR9wfrDMGEoCmCymU
	gO0imoJz7aLI8SKarCiYcIjJxVcuGUFz3XvhZE3dUE5SIAXHvVtHSjB7c3cIbuA28mE3
	Biq7tGXhjwy3heQlYSPjGnr/N4XfygJgwPDQ/lHCnOTodj3EahRl/BPD+2sSqO1h/EUk
	RSIw==
X-Received: by 10.50.138.132 with SMTP id qq4mr19591289igb.8.1399243076121;
	Sun, 04 May 2014 15:37:56 -0700 (PDT)
Received: from localhost.localdomain (CPE-76-177-97-210.natcky.res.rr.com.
	[76.177.97.210]) by mx.google.com with ESMTPSA id
	qh3sm20308000igb.17.2014.05.04.15.37.55 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 04 May 2014 15:37:55 -0700 (PDT)
From: Tyler Hall <tylerwhall@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  4 May 2014 18:37:50 -0400
Message-Id: <1399243070-25365-1-git-send-email-tylerwhall@gmail.com>
X-Mailer: git-send-email 1.9.2
Subject: [PATCH] python3: Substitute correct python version in shebang
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
X-List-Received-Date: Sun, 04 May 2014 22:37:58 -0000

If python2 and python3 are both available, scripts that are subject to
this substitution can possibly run with the wrong python version.
python3-config is one such script.

Signed-off-by: Tyler Hall <tylerwhall@gmail.com>
---
 meta/recipes-devtools/python/python3-native_3.3.3.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python3-native_3.3.3.bb b/meta/recipes-devtools/python/python3-native_3.3.3.bb
index 7238eaf..0fd7349 100644
--- a/meta/recipes-devtools/python/python3-native_3.3.3.bb
+++ b/meta/recipes-devtools/python/python3-native_3.3.3.bb
@@ -71,6 +71,6 @@ do_install() {
 
 	# Make sure we use /usr/bin/env python
 	for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
-		sed -i -e '1s|^#!.*|#!/usr/bin/env python|' $PYTHSCRIPT
+		sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
 	done
 }
-- 
1.9.2


