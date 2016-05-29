Return-Path: <allenwild93@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id CAC0A7328A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 18:49:52 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id y6so12524553ywe.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 29 May 2016 11:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=f+lR571owlTGOAfBSj2eL7Wc9J12E9tobTCxpBPzhxU=;
	b=klZ0NjDVr1ir2Ph2og3IrQI9Y3IpSHyRbENsvF/IAMtL5Puz+NcHAmyP+QzQDZRvBm
	cORKLbPHgxtHeZvm3TFtuNsJT/bEhBYZW2QaxfOtwFbMGkGVN0vGmGtIp6FjMuSyhD1u
	32jRONEG4TSZOjPGlq9+3l0PNP4X9AU3XBD2cf9oVjkTIelIlRZ44t2emDoVOCBWro/2
	JW+QvMwxSOgIVGV/vYTXUJADkblNHquCFNPAZWIbrlZjOOHNUhqcXJM9GnYQ13HRTK8o
	ANUHNzE0phKPYCaSeUkViZjy7VPliomhZc7x145jf9/cF9esx1j2/NomAkX8PlAcR3r+
	z5mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=f+lR571owlTGOAfBSj2eL7Wc9J12E9tobTCxpBPzhxU=;
	b=OyirLuW0F70ZSywJZ7WYXiQF6WWtVvmIC3Ke2Ej/jTWqrCRNQZWZdiTN1Xy02A8DD4
	FlVv0nhOdoISzPAlFG4yJP3Mz5/JbgR5J/v2qqX5l3MjQeit4OSqI5TThgv3iV2e3T6S
	xO7qRg6S8ajnLVgBCJrWfFMiyJdJcYzuFCy70NpVLz7HpB0/cmNOwWXlUBHu82zfB6Oh
	NeQVhu5Z/C41uvzYX7wGCofSygfmxpqE/NhoG/O9kEmUqV8pzA+yEMhTCTqMJK7ZIhmG
	Zu3SYnrBsKhzeoswwD2y9GHCbovSiNAnyrtKP0WtvXR6OXB8qtv3ZBdqiGdB86q2pzOd
	E2CQ==
X-Gm-Message-State: ALyK8tKEkHBLEE9N+6EStYXA7+W4wPXCFyggknC5vXaA3rdMQysrsMwiG9MEh4H+7ZaqUw==
X-Received: by 10.129.42.139 with SMTP id q133mr14150085ywq.28.1464547792869; 
	Sun, 29 May 2016 11:49:52 -0700 (PDT)
Received: from localhost.localdomain ([2601:cc:100:65d::17a4])
	by smtp.googlemail.com with ESMTPSA id
	t83sm11493186ywe.30.2016.05.29.11.49.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 29 May 2016 11:49:52 -0700 (PDT)
From: Allen Wild <allenwild93@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 29 May 2016 14:49:49 -0400
Message-Id: <20160529184949.9770-1-allenwild93@gmail.com>
X-Mailer: git-send-email 2.8.3
Subject: [python3][PATCH] scripts/lnr: update for python3
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
X-List-Received-Date: Sun, 29 May 2016 18:49:53 -0000

Change shebang line to python3 and add parentheses to print

Signed-off-by: Allen Wild <allenwild93@gmail.com>
---
 scripts/lnr | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/lnr b/scripts/lnr
index 9dacebe..5fed780 100755
--- a/scripts/lnr
+++ b/scripts/lnr
@@ -1,4 +1,4 @@
-#! /usr/bin/env python
+#! /usr/bin/env python3
 
 # Create a *relative* symlink, just like ln --relative does but without needing
 # coreutils 8.16.
@@ -6,7 +6,7 @@
 import sys, os
 
 if len(sys.argv) != 3:
-   print "$ lnr TARGET LINK_NAME"
+   print("$ lnr TARGET LINK_NAME")
    sys.exit(1)
 
 target = sys.argv[1]
-- 
2.8.3


