Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 85E7F770F9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Feb 2016 07:06:58 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id y89so105001434qge.2
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Feb 2016 23:07:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=9IWQiAOXOHlzDHktmabgSP3b/JRgf+B75E97qTlKc8w=;
	b=qinKzZXHf1bHsVJhXwz8aWX4hzc1R2OVwdiJAe6oie3Vb9UIO80oVxTgzSqM5A+zf5
	kFVcgpoL0O2BDjUpPDWE9xo9QaMUvnNEzbitOwW/oa/iQIxNzSXE3RLhjeewfy1ZKXtU
	WqFjtEhx0sRtPPV9/BKXCVvdWI/UAXD6Co5XkVk4q2ZPUrJv1aO6OwitZFf1H17Zod77
	ykTvuaVSv1UUesyiHMmYYkuPkvLxA7Bhnt2A6AzUmiZKTY24QvbihKkXpqk4TzAWtYDz
	gvlF4qHZCBu9R2Zh1W0F2hunDm8EqC9TY/j73zo07ho+nkvSzLIDQQ9fWSUPf9bhW65N
	WqaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=9IWQiAOXOHlzDHktmabgSP3b/JRgf+B75E97qTlKc8w=;
	b=N15HBRow5OB1DR8tkkhdXcJix7K7VOerJazrcCHRwqaIM/mc3GSs93dItWlna859Kv
	weGsQx4e9YeMrpbKl+/bCpFVvW0LmPaGX3ugd87CGF6xrC3bm21OMUegdRVios/6vc4b
	RxicZGdWeSIcao223H9ZqLoAuA1sXl6xu01ZbZBjMfZdS93To2dPWF/Lq+tovBFIWIJd
	XQWWp061AjGnIwEhYiqSpEW+qGtj0waMdkYHw45hJfP2BLhBEx+jYWYlau8DnV3V9vEq
	8re0PSRFM/mrDiXwwL574RwZNwq9nY5almWpSLZlYynAJU6sCnFBu3FwRD/01nHssPjk
	ssHQ==
X-Gm-Message-State: AG10YOSR3TWjHNKKgQAohFdHZ3OLuBL/9unicAu96WgasdjSTMQwOQ5cosXzE3c7QN922A==
X-Received: by 10.140.93.87 with SMTP id c81mr33049974qge.46.1456124819613;
	Sun, 21 Feb 2016 23:06:59 -0800 (PST)
Received: from nyx.sys.comcast.net (a-96-118-179-135.sys.comcast.net.
	[96.118.179.135]) by smtp.gmail.com with ESMTPSA id
	j67sm6096567qgj.35.2016.02.21.23.06.58
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 21 Feb 2016 23:06:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 22 Feb 2016 07:06:54 +0000
Message-Id: <1456124814-14011-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.8.3.1
Subject: [PATCH] musl: Upgrade to 1.1.14
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
X-List-Received-Date: Mon, 22 Feb 2016 07:06:59 -0000

There has been regressions seen in 1.1.13 hence
a quick 1.1.14 release is made

here is the list of all changes between 1.1.13 and 1.1.14

http://git.musl-libc.org/cgit/musl/log/?qt=range&q=v1.1.13..v1.1.14

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/recipes-core/musl/musl_git.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta/recipes-core/musl/musl_git.bb b/meta/recipes-core/musl/musl_git.bb
index 4151308..250f837 100644
--- a/meta/recipes-core/musl/musl_git.bb
+++ b/meta/recipes-core/musl/musl_git.bb
@@ -3,9 +3,9 @@
 
 require musl.inc
 
-SRCREV = "cf115059ba0ecd611008c89c78c37b62f8e6d6af"
+SRCREV = "074e6b3fe3f2ad89b991f3d8ab0932035b312a62"
 
-PV = "1.1.13+git${SRCPV}"
+PV = "1.1.14+git${SRCPV}"
 
 # mirror is at git://github.com/kraj/musl.git
 
-- 
1.8.3.1


