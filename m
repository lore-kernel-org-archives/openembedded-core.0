Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f44.google.com (unknown [209.85.160.44])
	by mail.openembedded.org (Postfix) with ESMTP id 7A2A96FC75
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 06:58:29 +0000 (UTC)
Received: by mail-pb0-f44.google.com with SMTP id rq2so12524054pbb.17
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 May 2014 23:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:in-reply-to:references;
	bh=ZWadhhF23FrEL3Qwmu/5o/LP9y9mOZtvUWW6nEfa6/Y=;
	b=tmNMZakd+huzmRvBv63CkvvEXUmNhrEE/rXJEDdQpCxRH/+mgHuNcX2ATQHzV2ajw/
	+Fp7WZ6dn9w71wHy3wMagSfn4GV57BihfbddG71gCdWPcXKOGc6AQedssQthdVeywK4v
	9AbzvO90BmBCSnlMXzm8/msF37K7EQoRKJdHj1vlUNUxa26Pz7+zWVujpg4kSNOZSm9J
	7Zb69xLZWkC116xgV6Bb29OM50jhDMTPxlkBegAIVHnIN+/9snTaE9HW/lNec9wPh23t
	PRgsbAxPBduZDjuqEpP4kgDI/5oXl93WSE9ZI0ZLTBp0qcSsxB6gb5kxRzxR/6kykSwG
	GTyA==
X-Received: by 10.66.120.201 with SMTP id le9mr6219736pab.98.1401346710432;
	Wed, 28 May 2014 23:58:30 -0700 (PDT)
Received: from localhost.localdomain (c-98-207-177-218.hsd1.ca.comcast.net.
	[98.207.177.218]) by mx.google.com with ESMTPSA id
	sh5sm31748177pbc.21.2014.05.28.23.58.29 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 28 May 2014 23:58:29 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 29 May 2014 00:01:05 -0700
Message-Id: <a722c9dc3ca8f17eb9911473d43ba15016231862.1401346650.git.raj.khem@gmail.com>
X-Mailer: git-send-email 1.9.3
In-Reply-To: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
References: <195e0373341bceca90bf6d114a4569756d5a4905.1401346650.git.raj.khem@gmail.com>
In-Reply-To: <cover.1401346650.git.raj.khem@gmail.com>
References: <cover.1401346650.git.raj.khem@gmail.com>
Subject: [PATCH 5/7] cross-canadian.bbclass: Recognise musl
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
X-List-Received-Date: Thu, 29 May 2014 06:58:32 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta/classes/cross-canadian.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta/classes/cross-canadian.bbclass b/meta/classes/cross-canadian.bbclass
index cea6afb..25e246d 100644
--- a/meta/classes/cross-canadian.bbclass
+++ b/meta/classes/cross-canadian.bbclass
@@ -27,7 +27,9 @@ python () {
     tarch = d.getVar("TARGET_ARCH", True)
     if tarch == "powerpc":
         tos = d.getVar("TARGET_OS", True)
-        if (tos != "linux" and tos != "linux-gnuspe" and tos != "linux-uclibc" and tos != "linux-uclibcspe"):
+        if (tos != "linux" and tos != "linux-gnuspe"
+            and tos != "linux-uclibc" and tos != "linux-uclibcspe"
+            and tos != "linux-musl" and tos != "linux-muslspe"):
             bb.fatal("Building cross-candian powerpc for an unknown TARGET_SYS (%s), please update cross-canadian.bbclass" % d.getVar("TARGET_SYS", True))
         # This is a bit ugly. We need to zero LIBC/ABI extension which will change TARGET_OS
         # however we need the old value in some variables. We expand those here first.
-- 
1.9.3


