Received: from eumx.net ([91.82.101.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>) id 1TC9CF-0004tv-9R
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Sep 2012 15:11:07 +0200
Received: from localhost ([127.0.0.1]:59034 helo=eumx.net)
	by eumx.net with esmtp (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TC905-0002qh-ND; Thu, 13 Sep 2012 12:58:33 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=eumx.net; h=from:to:cc
	:subject:date:message-id:in-reply-to:references; s=default; bh=W
	Jl9NDEobhw7LivK2JOetUwDfNk=; b=LDWM3z0ikLIzMEPqclfAlX0rGMNDCGFvh
	sLvWmp0/cM5bVeTX3dBrZLeIUQ3bbMrbdvNrxjKIdZ6ShzMt5ab8FC2x6N79iwW4
	ITxn89kEFjuZuNSF8MgFnrSoEGJ1cRW6ZONpngZMeQg8lXzPOOY9q7F+csiFcN2S
	7pAjp/Xj/g=
Received: from [195.171.99.130] (port=19139 helo=yoctoBuilder.dbnet.local)
	by eumx.net with esmtpa (Exim 4.72)
	(envelope-from <ml@communistcode.co.uk>)
	id 1TC905-0002qc-Jx; Thu, 13 Sep 2012 12:58:33 +0000
From: Jack Mitchell <ml@communistcode.co.uk>
To: openembedded-core@lists.openembedded.org
Date: Thu, 13 Sep 2012 13:58:30 +0100
Message-Id: <1347541110-24989-1-git-send-email-ml@communistcode.co.uk>
X-Mailer: git-send-email 1.7.12
In-Reply-To: <504FAFAD.3050600@communistcode.co.uk>
References: <504FAFAD.3050600@communistcode.co.uk>
Cc: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
Subject: [PATCH] git: define NO_PYTHON=1 to stop git requiring python as a dependancy
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
X-List-Received-Date: Thu, 13 Sep 2012 13:11:07 -0000

From: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>

Git requires python by default as an included script to link git
to perforce is written in Python. Define NO_PYTHON to stop the
script being included and thus remove the dependancy on Python.

Signed-off-by: Jack Mitchell <jack.mitchell@dbbroadcast.co.uk>
---
 meta/recipes-devtools/git/git.inc | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-devtools/git/git.inc b/meta/recipes-devtools/git/git.inc
index 6748b70..4a0c4aa 100644
--- a/meta/recipes-devtools/git/git.inc
+++ b/meta/recipes-devtools/git/git.inc
@@ -10,7 +10,11 @@ S = "${WORKDIR}/git-${PV}"
 
 LIC_FILES_CHKSUM = "file://COPYING;md5=7c0d7ef03a7eb04ce795b0f60e68e7e1"
 
-EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl --without-tcltk"
+EXTRA_OECONF = "--with-perl=${STAGING_BINDIR_NATIVE}/perl-native/perl \
+		--without-tcltk \
+"
+
+EXTRA_OEMAKE = "NO_PYTHON=1"
 
 inherit autotools perlnative
 
-- 
1.7.12



