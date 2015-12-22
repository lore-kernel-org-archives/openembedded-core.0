Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id A45826FF97
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 23:58:16 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id jw2so68586463igc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Dec 2015 15:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=TtvqYll1FNrB4ofRvb8wgR78GguyUGP6iHddGw6K6RM=;
	b=oHtwGkYpNls/sBxy5jDgnSXB1jI+efdQ2t5bFwhoiWln9ksTEnJC+1U/X1em7ZWg6y
	WX0sAs7BHNxGIXEv/BskE5r7xSKaNtCcp6SQFvjyzITyiUsx5krlGD/ZC/1JX2GP0/PI
	msoplNSF2PpZHypaer/dd7/XtMFW+lEQ3rQmKf3C8NEpALubvBIhgp+dxIbbyRrIleZI
	vKCTBxJys2D72Zpd7Gl+SGdMOyaEIYi7jfdN1ldvL55WbP2x9zWXXGkwCD/rdpmGTJCA
	DzJZlErqiqUG2iW3+irJOxFTiwt34P8MS2W7ELy435j5aRCzmEmmWzgfS2u/3qxWkPDk
	AgfQ==
X-Received: by 10.50.79.196 with SMTP id l4mr26837661igx.59.1450828696830;
	Tue, 22 Dec 2015 15:58:16 -0800 (PST)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by smtp.gmail.com with ESMTPSA id 4sm10079020igz.2.2015.12.22.15.58.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 22 Dec 2015 15:58:15 -0800 (PST)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 22 Dec 2015 15:58:00 -0800
Message-Id: <1450828680-662-4-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
References: <1450828680-662-1-git-send-email-armccurdy@gmail.com>
Subject: [PATCH 3/3] valgrind: include aarch64 in COMPATIBLE_HOST
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
X-List-Received-Date: Tue, 22 Dec 2015 23:58:17 -0000

Valgrind has supported aarch64 since v3.10.0.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/recipes-devtools/valgrind/valgrind_3.11.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
index bb3f6e1..293dd2b 100644
--- a/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
+++ b/meta/recipes-devtools/valgrind/valgrind_3.11.0.bb
@@ -26,7 +26,7 @@ SRC_URI = "http://www.valgrind.org/downloads/valgrind-${PV}.tar.bz2 \
 SRC_URI[md5sum] = "4ea62074da73ae82e0162d6550d3f129"
 SRC_URI[sha256sum] = "6c396271a8c1ddd5a6fb9abe714ea1e8a86fce85b30ab26b4266aeb4c2413b42"
 
-COMPATIBLE_HOST = '(i.86|x86_64|arm|mips|powerpc|powerpc64).*-linux'
+COMPATIBLE_HOST = '(i.86|x86_64|arm|aarch64|mips|powerpc|powerpc64).*-linux'
 
 inherit autotools ptest
 
-- 
1.9.1


