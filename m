Return-Path: <armccurdy@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 469EC65D00
	for <openembedded-core@lists.openembedded.org>;
	Mon,  4 May 2015 21:49:59 +0000 (UTC)
Received: by igbyr2 with SMTP id yr2so97135817igb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 May 2015 14:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=clsIraTmqZIxqgUimZJolLmqF/wwmYDOw+4UVwrRu/8=;
	b=RBIC14E1FRsD4EJYDBlAZ1TJ3XPks/lzXKo5DnKZmImcgd6ftVh8qU2IOCASvWoM6u
	5adhOL6BMqiS7FqAxZQLQgDXyPTU53Dp8Tv7ATv8PWJv/Hv8GQsW+kEYy91m3KYv80jQ
	Q3ineLrEWFJ8p5i2GY9BWGS7kR2iAnmJUvvoh1V+nNlh9Bv6FLmewqR7eZM3H8CxaRz6
	iCmMLO4ETWJ0VYl+0cfkz0g6p/oDODIK5hCgYKJtfmWiAGBm5jHFmUR1XDOujezXlgjt
	R63kD5uncvCYpte/OMZhS+I5cA9Dii8iWqgHmT7p5paq37t7gFIB2Ws5IOJn0oYxRk3l
	nHsg==
X-Received: by 10.50.98.73 with SMTP id eg9mr890881igb.10.1430776200408;
	Mon, 04 May 2015 14:50:00 -0700 (PDT)
Received: from e6520.cablelabs.com
	(50-204-102-64-static.hfc.comcastbusiness.net. [50.204.102.64])
	by mx.google.com with ESMTPSA id m5sm10461261ioi.4.2015.05.04.14.49.59
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 04 May 2015 14:49:59 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  4 May 2015 14:49:53 -0700
Message-Id: <1430776193-32107-1-git-send-email-armccurdy@gmail.com>
X-Mailer: git-send-email 1.9.1
Subject: [PATCH] mirrors.bbclass: drop support for svk sources
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
X-List-Received-Date: Mon, 04 May 2015 21:50:05 -0000

The svk fetcher was removed from bitbake 1.22, so svk support should
logically have been removed from oe-core Daisy onwards.

Signed-off-by: Andre McCurdy <armccurdy@gmail.com>
---
 meta/classes/mirrors.bbclass     | 2 --
 meta/classes/own-mirrors.bbclass | 1 -
 meta/classes/sanity.bbclass      | 2 +-
 3 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/meta/classes/mirrors.bbclass b/meta/classes/mirrors.bbclass
index 0d9b517..081c982 100644
--- a/meta/classes/mirrors.bbclass
+++ b/meta/classes/mirrors.bbclass
@@ -52,7 +52,6 @@ svn://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 git://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 hg://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
 bzr://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
-svk://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 p4://.*/.*      http://downloads.yoctoproject.org/mirror/sources/ \n \
 osc://.*/.*     http://downloads.yoctoproject.org/mirror/sources/ \n \
 https?$://.*/.* http://downloads.yoctoproject.org/mirror/sources/ \n \
@@ -62,7 +61,6 @@ svn://.*/.*     http://sources.openembedded.org/ \n \
 git://.*/.*     http://sources.openembedded.org/ \n \
 hg://.*/.*      http://sources.openembedded.org/ \n \
 bzr://.*/.*     http://sources.openembedded.org/ \n \
-svk://.*/.*     http://sources.openembedded.org/ \n \
 p4://.*/.*      http://sources.openembedded.org/ \n \
 osc://.*/.*     http://sources.openembedded.org/ \n \
 https?$://.*/.* http://sources.openembedded.org/ \n \
diff --git a/meta/classes/own-mirrors.bbclass b/meta/classes/own-mirrors.bbclass
index 77bf0c1..e235227 100644
--- a/meta/classes/own-mirrors.bbclass
+++ b/meta/classes/own-mirrors.bbclass
@@ -5,7 +5,6 @@ git://.*/.*     ${SOURCE_MIRROR_URL}
 gitsm://.*/.*   ${SOURCE_MIRROR_URL}
 hg://.*/.*      ${SOURCE_MIRROR_URL}
 bzr://.*/.*     ${SOURCE_MIRROR_URL}
-svk://.*/.*     ${SOURCE_MIRROR_URL}
 p4://.*/.*      ${SOURCE_MIRROR_URL}
 osc://.*/.*     ${SOURCE_MIRROR_URL}
 https?$://.*/.* ${SOURCE_MIRROR_URL}
diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index cca39c9..f8b9fac 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -772,7 +772,7 @@ def check_sanity_everybuild(status, d):
     import re
     mirror_vars = ['MIRRORS', 'PREMIRRORS', 'SSTATE_MIRRORS']
     protocols = ['http', 'ftp', 'file', 'https', \
-                 'git', 'gitsm', 'hg', 'osc', 'p4', 'svk', 'svn', \
+                 'git', 'gitsm', 'hg', 'osc', 'p4', 'svn', \
                  'bzr', 'cvs']
     for mirror_var in mirror_vars:
         mirrors = (d.getVar(mirror_var, True) or '').replace('\\n', '\n').split('\n')
-- 
1.9.1


