Return-Path: <peteasa@gmail.com>
Received: from mail-wg0-f48.google.com (mail-wg0-f48.google.com [74.125.82.48])
	by mail.openembedded.org (Postfix) with ESMTP id 6B7A372D74
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 17:28:39 +0000 (UTC)
Received: by wgin8 with SMTP id n8so59733025wgi.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 12 Apr 2015 10:28:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=2ZiSt5uc7ghz3l3tz9F+Z/wdRP793+WebVE+jnlR2dY=;
	b=kz6yXIh9/NQogR2iMffUcpQLnXPOvCJuYNjHRDjq0b7YZbBp+uhJwkPbwUjCOh/ml/
	WPNbq35uVAfKHUGP8SzObKiSbxTHP7E15P5I4suxBtXd+5C4/UPTiPaiXsUtzLP5NWKE
	F4y+7EAttR2PNTwR8RPKK6r4t8PTQ84KZ25tgnO89nKR+NQVQEJJK+U9CI0VjzFt9zbI
	WZR90zwIvH96UHLkhzigeZiV7zRulcqtTyyBNdM9+A98Cbm3b0XpEOh/d14YEPmEXmCd
	WN3Jwa0gccnHM5LUEhh1eUNQjZejaCPlo6SB0yiQBZt28daZb0irtaOuiCtYjNlzHXZ9
	R0mg==
X-Received: by 10.180.14.135 with SMTP id p7mr14475560wic.8.1428859720517;
	Sun, 12 Apr 2015 10:28:40 -0700 (PDT)
Received: from HomeMegaUbuntu.pascom
	(cpc18-heme10-2-0-cust113.9-1.cable.virginm.net. [81.96.152.114])
	by mx.google.com with ESMTPSA id e2sm7801846wij.5.2015.04.12.10.28.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 12 Apr 2015 10:28:39 -0700 (PDT)
From: Peter Saunderson <peteasa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 12 Apr 2015 18:27:38 +0100
Message-Id: <1428859658-6004-1-git-send-email-peteasa@gmail.com>
X-Mailer: git-send-email 2.1.0
Cc: Peter Saunderson <peteasa@gmail.com>
Subject: [PATCH v3] insane.bbclass: Added Epiphany machine definitions
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
X-List-Received-Date: Sun, 12 Apr 2015 17:28:40 -0000

Adding machine definitions for the epiphany (http://www.adapteva.com/) chip using https://github.com/adapteva/epiphany-binutils-gdb.
For binutils implementation that defines TARGET_ARCH MACHINE "epiphany": 4643 See https://github.com/adapteva/epiphany-binutils-gdb/blob/epiphany-binutils-2.24/bfd/elf32-epiphany.c
For example layer that uses these defines see https://github.com/peteasa/meta-epiphany.git

Signed-off-by: Peter Saunderson <peteasa@gmail.com>
---
 meta/classes/insane.bbclass | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/classes/insane.bbclass b/meta/classes/insane.bbclass
index 3592575..56ee37d 100644
--- a/meta/classes/insane.bbclass
+++ b/meta/classes/insane.bbclass
@@ -59,6 +59,7 @@ def package_qa_get_machine_dict():
             "elf" : {
                         "i586" :      (3,      0,    0,          True,          32),
                         "x86_64":     (62,     0,    0,          True,          64),
+                        "epiphany":   (4643,   0,    0,          True,          32),
                       },
             "linux" : { 
                         "aarch64" :   (183,    0,    0,          True,          64),
-- 
2.1.0


