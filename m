Return-Path: <liu.ming50@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id D4A4A6FFD7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Dec 2015 01:14:54 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n186so189447365wmn.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 17:14:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=s0zdZmAdT+lxra0tIXX5DZwsnHCHV2wKMsYjsZ0hkww=;
	b=csHtO8SSkcnNho1LeJSfqsDEq+TtlYQzlAgAzlqTbB22fncrUl/6Ws9NgVNWCN+aAA
	G2YorP23P074tVtVZtOQIJlNlr1IVZwbmu53FR6PxnTZ5Xof/TVx2pkmoiuRVnRuWabv
	AnFpaibGR48D0SSxCwsYuEctE29Qwt+Uo6C8TpD01qh2cOJUFRlTJ83lbBUttOn93hmM
	pfwZuewzJ/nq0+Y9gwRZpuVLqnrXpYsJY40PvaSRcwkwgOT101JMWYBzpA4WHIAUPzEf
	+FXlUXYZCfqit3kEF9lpQ+g0R7+EOBW7NxAa3oK3MXL0AgslpaMlD9F7ph2xZS4Iu+EQ
	tmuw==
X-Received: by 10.194.108.103 with SMTP id hj7mr52866954wjb.143.1450228495128; 
	Tue, 15 Dec 2015 17:14:55 -0800 (PST)
Received: from localhost.localdomain
	(ip-176-199-25-170.hsi06.unitymediagroup.de. [176.199.25.170])
	by smtp.gmail.com with ESMTPSA id z17sm3693316wjq.1.2015.12.15.17.14.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 15 Dec 2015 17:14:54 -0800 (PST)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 16 Dec 2015 02:14:45 +0100
Message-Id: <1450228485-23253-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] ncurses: changes ncurses-config to ncurses5-config
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
X-List-Received-Date: Wed, 16 Dec 2015 01:14:57 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

ncurses-config is a wrong name, there is not such file at all, changes it
to ncurses5-config.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/ncurses/ncurses.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/ncurses/ncurses.inc b/meta/recipes-core/ncurses/ncurses.inc
index 8bfe133..58e6281 100644
--- a/meta/recipes-core/ncurses/ncurses.inc
+++ b/meta/recipes-core/ncurses/ncurses.inc
@@ -8,7 +8,7 @@ DEPENDS = "ncurses-native"
 DEPENDS_class-native = ""
 INC_PR = "r15"
 
-BINCONFIG = "${bindir}/ncurses-config"
+BINCONFIG = "${bindir}/ncurses5-config"
 
 inherit autotools binconfig-disabled multilib_header pkgconfig
 
-- 
1.9.1


