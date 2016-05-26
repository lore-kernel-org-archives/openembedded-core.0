Return-Path: <liu.ming50@gmail.com>
Received: from mail-lb0-f196.google.com (mail-lb0-f196.google.com
	[209.85.217.196])
	by mail.openembedded.org (Postfix) with ESMTP id D6A08731F3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 19:44:35 +0000 (UTC)
Received: by mail-lb0-f196.google.com with SMTP id sh2so4923661lbb.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2016 12:44:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=hom/gVM5Q2JCp2Nacg6Ik5NkCYUHCYuUfaSgTHh4kzI=;
	b=P5gNHR6vXSMVL+P10PfSMCZHsBO65BCrnTqR0RfAkfRPB5lHlA81bAjQzboVk+kHI6
	xyHhGOrzP1JQwZ1oqSOZtOWVkKqr/k1CJr4MS5TXbE8lQKvYRh9ncmh4rLGVsa9Dg+dr
	oQvfWqxY68lNYRVr28BtegsrWb3MMCg6n7FgAlU0baDlall+8C/qKP0oPvf1kKCabYuT
	eO8ANszESp9z6gPoiA1x1xwn7nULqZtOtTnrIwJ+Fwl99NofCXBBLkjlxFbamcb3ax1r
	YKxMuh9tOlydP27gLQ2+FRN4OaS4eXbJTW/lYBc0OLwkBDI5nCtrxRzfhH5bjMt7o04v
	jHCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=hom/gVM5Q2JCp2Nacg6Ik5NkCYUHCYuUfaSgTHh4kzI=;
	b=eKyw+5dJ+Z1IYkNFmJwHjLbLsOLtOm9vVtOVeBhI/Ao7kTV408/W+chCepEKS1IodA
	/4Yb9pP2bJTByoQs/iu2ai3ppLJGGdxwX6kv84NKVCXOehKBvHwAQQCZigQq1iU343yi
	5GnEezZrbCLAZlW7qgfPAyK7opmvAW+PqYxdoZLRvnlu4pMX+i0RLcdnmuf0dLjGg0od
	BwS/gBulZzvxxijlGPVkc0lE7M4xV4u+86RIYzhaCSU1pA4PXgs+znjzLPb2vjH0r+nE
	NGuKDSvtFhJEkEhOw0DajiH4p7B1x9OV+xdG0D1Q5Aj4MdF55VsgrJxBlKD4BbfPNM9M
	D7/g==
X-Gm-Message-State: ALyK8tLJ+Q58ccMY67cvY+dUvp7L4Nx6VYocrodRRXPtGpsAvU1Wp6zYj1RNWQWwNzh8dA==
X-Received: by 10.112.62.165 with SMTP id z5mr3024151lbr.89.1464291875447;
	Thu, 26 May 2016 12:44:35 -0700 (PDT)
Received: from localhost.localdomain (c80-217-62-231.bredband.comhem.se.
	[80.217.62.231])
	by smtp.gmail.com with ESMTPSA id 4sm228252ljb.19.2016.05.26.12.44.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Thu, 26 May 2016 12:44:34 -0700 (PDT)
From: Ming Liu <liu.ming50@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 26 May 2016 21:44:30 +0200
Message-Id: <1464291870-5602-1-git-send-email-liu.ming50@gmail.com>
X-Mailer: git-send-email 1.9.1
Cc: yue.tao@windriver.com, Ming Liu <peter.x.liu@external.atlascopco.com>
Subject: [PATCH] initscripts: hide the error in case swapoff does not exist
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
X-List-Received-Date: Thu, 26 May 2016 19:44:38 -0000

From: Ming Liu <peter.x.liu@external.atlascopco.com>

To avoid reporting errors when swapoff does not exist.

Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
---
 meta/recipes-core/initscripts/initscripts-1.0/umountfs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-core/initscripts/initscripts-1.0/umountfs b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
index 61324c6..d067234 100755
--- a/meta/recipes-core/initscripts/initscripts-1.0/umountfs
+++ b/meta/recipes-core/initscripts/initscripts-1.0/umountfs
@@ -12,7 +12,7 @@
 PATH=/sbin:/bin:/usr/sbin:/usr/bin
 
 echo "Deactivating swap..."
-swapoff -a
+swapoff -a 2> /dev/null
 
 # We leave /proc mounted.
 echo "Unmounting local filesystems..."
-- 
1.9.1


