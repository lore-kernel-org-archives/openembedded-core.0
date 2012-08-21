Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1T3tSL-00049Q-Nb
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 20:45:37 +0200
Received: by wibhn17 with SMTP id hn17so88699wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 11:33:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:x-mailer;
	bh=qBYlgx/fN+wCLgO6KAHxmuhMN/GcHb27fJ8ELd5Y06I=;
	b=APDHnbcgTG+hhRb7U2u5g3oY0IF3chbrzbQ5103XOP3btUKa6LHpvrRx/auc7F0Kft
	nr7660LAUx8NeCaGoVifWImEgT7z1QYKPpCM964/i7py5NsrENJqEVejTAaaBUfzWP/4
	h0xh9GNv/hlYEVlJ1Od6XXKsdlroC9Dt62XfBGDAtYjmXcy1LtmEJ8p/6OSiQUaABuit
	rbsAGsmRBvRecDorntKZeCPn/NxL+0+ES9JZ6RynYSMF8pjBrmJazs5aAlz1NfQtEERe
	J4Rw6mi8Al+/YlEaoy8MvZaPBqtuUdBqPsSFl32sXUiFs7SFUFHdLvgo4ORcvBumDBmw
	eRDQ==
Received: by 10.180.91.228 with SMTP id ch4mr40064724wib.7.1345574013981;
	Tue, 21 Aug 2012 11:33:33 -0700 (PDT)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id ep14sm35618123wid.0.2012.08.21.11.33.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 21 Aug 2012 11:33:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Aug 2012 20:33:35 +0200
Message-Id: <1345574015-9390-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.6
Subject: [PATCH] gcc: bump PR
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
X-List-Received-Date: Tue, 21 Aug 2012 18:45:37 -0000

* missing in 30617bde61a3b0a0944b49a0c9fb7159dacbb19f, eglibc-initial fails to compile in incremental build with OEBasic

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta/recipes-devtools/gcc/gcc-4.7.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta/recipes-devtools/gcc/gcc-4.7.inc b/meta/recipes-devtools/gcc/gcc-4.7.inc
index 3f13385..36ce1be 100644
--- a/meta/recipes-devtools/gcc/gcc-4.7.inc
+++ b/meta/recipes-devtools/gcc/gcc-4.7.inc
@@ -1,6 +1,6 @@
 require gcc-common.inc
 
-PR = "r9"
+PR = "r10"
 
 # Third digit in PV should be incremented after a minor release
 # happens from this branch on gcc e.g. currently its 4.7.1
-- 
1.7.8.6



