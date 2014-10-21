Return-Path: <paul.betafive@gmail.com>
Received: from mail-la0-f45.google.com (mail-la0-f45.google.com
	[209.85.215.45])
	by mail.openembedded.org (Postfix) with ESMTP id EC7A365C88
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 16:46:44 +0000 (UTC)
Received: by mail-la0-f45.google.com with SMTP id q1so1404181lam.32
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 09:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:cc:subject:date:message-id;
	bh=R9/4kRcXEG8H5gb246lksdbKTsuxuFp+Y6lURDYitoc=;
	b=gGxIHdgH0w8zVXNjl4GJGARhwsiMGNKL3rGTX/tVkQvVtZnV8GRmO9eZLOmli5cK1v
	NLgseVGrlH2N195L7bTLpA5OEFV8n+qQOGBbekF2HpkcFH5sSy+FoC+3GLl/ftApKtCs
	lZB3x7JdNJiomxPt5zKFPLyKTYL7ryRStd64XMZbocVIt6i3R2F9DKBC32ewnmbAWhGc
	1Z0HapSnYEyasDpy6f9zpjHkmd+VYB+cCD+PCFqh/sqji/9sNH03i/VYCXWeC/N9+Mh7
	f7uT83CGGCJk/ABebUbu5wPm1s9/6Zh0JcSRA7Uniq1bIb33MuCt4BtIgaTV2ZDphs4S
	7R8A==
X-Received: by 10.112.45.228 with SMTP id q4mr36401837lbm.35.1413910004271;
	Tue, 21 Oct 2014 09:46:44 -0700 (PDT)
Received: from loki.localdomain (ygg.betafive.co.uk. [5.9.90.21])
	by mx.google.com with ESMTPSA id m1sm4749737lbt.22.2014.10.21.09.46.42
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 21 Oct 2014 09:46:43 -0700 (PDT)
Sender: Paul Barker <paul.betafive@gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Oct 2014 16:46:36 +0000
Message-Id: <1413909996-31673-1-git-send-email-paul@paulbarker.me.uk>
X-Mailer: git-send-email 2.1.2
Subject: [PATCH] mc: Update patch status
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
X-List-Received-Date: Tue, 21 Oct 2014 16:46:48 -0000

mc-CTRL.patch has now been accepted upstream.

Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
---
 meta/recipes-extended/mc/mc/mc-CTRL.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-extended/mc/mc/mc-CTRL.patch b/meta/recipes-extended/mc/mc/mc-CTRL.patch
index d532bde..e23d9dd 100644
--- a/meta/recipes-extended/mc/mc/mc-CTRL.patch
+++ b/meta/recipes-extended/mc/mc/mc-CTRL.patch
@@ -15,7 +15,7 @@ Therefore this should be good to include in OpenEmbedded.
 
 Signed-off-by: Paul Barker <paul@paulbarker.me.uk>
 
-Upstream-status: Pending
+Upstream-status: Accepted (should be included in v4.8.14)
 
 diff -u mc-4.8.1.7.org/lib/tty/tty-ncurses.c mc-4.8.1.7/lib/tty/tty-ncurses.c
 --- mc-4.8.1.7.org/lib/tty/tty-ncurses.c
-- 
2.1.2


