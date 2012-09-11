Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TBNxN-0000i2-2C
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Sep 2012 12:44:37 +0200
Received: from localhost ([127.0.0.1]:60721 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TBNlG-0000CF-3X; Tue, 11 Sep 2012 10:32:06 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=E
	WEjgvQXNOdalJqd2bkJ4WCv+4U=; b=yJHeCkyu12Y+JVaU4nafcbwej7v1zPGht
	3JyQICXG5u+UT2cAmMsrD3+OCeOjqA8FOJJR5BJd9POz4OepRWnYrIAe2/u6hV3f
	2GqH4uWsd+kKR+pfIZ70xMtJGBPIyP5NSo46HCm4qa9r4gRdFxSRIRY1R/8Aq8dL
	1rVuhkzxmM=
Received: from [195.171.99.130] (port=23225 helo=archHP.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TBNlF-0000Bv-VC; Tue, 11 Sep 2012 10:32:06 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Sep 2012 11:33:37 +0100
Message-Id: <1347359617-4821-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <504F05A8.3000207@communistcode.co.uk>
References: <504F05A8.3000207@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] git: add missing Python dependency
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
X-List-Received-Date: Tue, 11 Sep 2012 10:44:37 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Add python to DEPENDS as it fails to install on target with RPM
failing at do_rootfs due to un-met dependencies.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/recipes-devtools/git/git.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 6748b70..9181da6 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -1,7 +1,7 @@
 DESCRIPTION = "The git revision control system used by the Linux kernel developers"
 SECTION = "console/utils"
 LICENSE = "GPLv2"
-DEPENDS = "openssl curl zlib expat"
+DEPENDS = "openssl curl zlib expat python"
 
 PROVIDES_append_virtclass-native = " git-replacement-native"
 
-- 
1.7.12



