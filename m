Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id A5D7A730AB
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 12:45:14 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id s27so220576wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2017 04:45:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=d7b853AXfwR1YGHr4KBK7MDVMXtrtDQFhmrRNOibz+A=;
	b=jPx5LTmqz5/1hY6Alj0E7ermGEi/7wt0JxPxfRZNWO+NDuG5xgH7gz4VTFyH7DC+6C
	/mhKpxlDJamooA8CsZxG3Y3l3LLsSiJIuD2KrLTLib+LrK4+X+8L8kMdVNro3Sy5NMKV
	fOYYpvSCGMgznXoJCBY0n0aNHdDTeY3eJ6V6aBUWxbJxpFvpoT0pkXX8L8kMpkCow2i/
	or7RR6ol0Y1KSKYnC2N+T/qBo7MyzAEms2yGDySZdztZ/e+VI0pArP/QqjUrLNBP4wgJ
	dkffWSMpKlCKY9JnJejX8W8BdUYOJW1lAsubLBAX4+DY0j5Hfai1PhXvoI5D3S+WvBbQ
	80sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=d7b853AXfwR1YGHr4KBK7MDVMXtrtDQFhmrRNOibz+A=;
	b=FN18Fjn1r3gV4rDD8ucP2/FYo0h9xPo/uSA0H2CnyqaKgbQasravY0Ktlz6KdhAgx5
	KMhy4raHLQwxiIuLRFKcb9SZ2C9MzgYIwuVZxigHlBZiBfN8JAtIXuDmMSd2iczy/8f+
	YaxS/K14iW2ZaneGq0MYN67fWmf+N30jh1QigDWxWj70NAbNzHN3ipHt9267QMJjxy/U
	sOz2H0qh9RDyThVRxW3zN/VILaCWTvF0NHQ+sxKFFRDnvLe723pEYffXQBNs4OcJnrRa
	273BiJ1iM+6NOES3mXVn1xFoNZLgeDDwO+MvMt62iwEwWAYWGtrpVb1HmfmnxkYPEIOs
	FVDw==
X-Gm-Message-State: AMke39m40fHxoLafj8W/QOe76ae2Wr4Y2L1T35PpmucRErj1Oq32s5ZXZPRZep4mZHfuxg==
X-Received: by 10.223.174.165 with SMTP id y34mr10200856wrc.40.1487767515019; 
	Wed, 22 Feb 2017 04:45:15 -0800 (PST)
Received: from peterliu-Precision-M4800.emea.group.atlascopco.com
	([117.136.38.175]) by smtp.gmail.com with ESMTPSA id
	j80sm1962517wmd.14.2017.02.22.04.45.12
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 22 Feb 2017 04:45:14 -0800 (PST)
From: liu.ming50@gmail.com
To: openembedded-core@lists.openembedded.org
Date: Wed, 22 Feb 2017 13:45:02 +0100
Message-Id: <1487767502-14823-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] python-pexpect: BBCLASSEXTEND to native
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
X-List-Received-Date: Wed, 22 Feb 2017 12:45:15 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

Some developers might need it.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-devtools/python/python-pexpect_4.2.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/python/python-pexpect_4.2.1.bb b/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
index 95a0790..1321797 100644
--- a/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
+++ b/meta/recipes-devtools/python/python-pexpect_4.2.1.bb
@@ -25,4 +25,4 @@ RDEPENDS_${PN} = "\
     python-ptyprocess \
 "
 
-BBCLASSEXTEND = "nativesdk"
+BBCLASSEXTEND = "native nativesdk"
-- 
1.9.1


