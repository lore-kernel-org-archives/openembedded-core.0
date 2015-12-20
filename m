Return-Path: <liu.ming50@gmail.com>
Received: from mail-lf0-f51.google.com (mail-lf0-f51.google.com
	[209.85.215.51])
	by mail.openembedded.org (Postfix) with ESMTP id E409E6FFFE
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 16:40:57 +0000 (UTC)
Received: by mail-lf0-f51.google.com with SMTP id p203so99659797lfa.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 20 Dec 2015 08:40:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=n5GqUzNa4A90rg/te2DkRjq/rbhQXpYLVhjfwZpvpcE=;
	b=WRupHbLoof0abj+4L6KpLAFSULqDbv0FHIbwDo3fKhBLx1fZSGoB1QYxJSzmSZv3iF
	84rLgWUqnDaxtAQrNb9hcQ66jcNKGhxQ23fdvbxNjiWKfNeEMBB+3/7CpkahfqrE8k9A
	hbS6mx/2BK4zFkwV3bpFLOMRQWIdD7oGg8tgFfnHUH7P0L5KZSK9u04KmbgCLVPac+Hi
	f+dZ4KCWRvxQAeF0s6n8RMEl5qymsYIbBv19Pjz/632B9s8mRyYBqR/cmJWZtjT/w39b
	J5IbV9D7Qhwy/WvZYOEi8xmi+Cbo0SDpNUCs95V82Jo4ihGrM3U55bDlxsKYWrIVaGi1
	iGuA==
X-Received: by 10.25.167.209 with SMTP id q200mr5225771lfe.15.1450629657626;
	Sun, 20 Dec 2015 08:40:57 -0800 (PST)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231])
	by smtp.gmail.com with ESMTPSA id q8sm4221395lbr.1.2015.12.20.08.40.56
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 20 Dec 2015 08:40:57 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 20 Dec 2015 17:40:43 +0100
Message-Id: <1450629643-19659-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH v1] ncurses: fixes wrong paths in BINCONFIG
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
X-List-Received-Date: Sun, 20 Dec 2015 16:40:58 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

* Removes ncurses-config from BINCONFIG, that file does not exist at all.
* Adds in ncurses5-config and ncursesw5-config to BINCONFIG.

This fixed following warnings during SDK install:
  warning: Removing ncurses-dev-5.9-r15.1@lib32_x86 due to file /usr/bin/ncurses5-config conflicting with ncurses-dev-5.9-r15.1@core2_64
  warning: Removing ncurses-dev-5.9-r15.1@lib32_x86 due to file /usr/bin/ncursesw5-config conflicting with ncurses-dev-5.9-r15.1@core2_64

[YOCTO #8801]

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8bfe133..27815b8 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -8,7 +8,7 @@ DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
 INC_PR = "r15"
 
-BINCONFIG = "${bindir}/ncurses-config"
+BINCONFIG = "${bindir}/ncurses5-config ${bindir}/ncursesw5-config"
 
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
-- 
1.9.1


