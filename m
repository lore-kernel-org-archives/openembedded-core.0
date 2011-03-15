Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1PzRMR-0005k9-Pl
	for openembedded-core@lists.openembedded.org;
	Tue, 15 Mar 2011 11:20:19 +0100
Received: by mail-bw0-f47.google.com with SMTP id 10so366014bwz.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Mar 2011 03:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=BmKrkjMGVUhvE9Fv5/zUOVqUzV9mZT83VqiWOvQD+0c=;
	b=bywbrBsePRnQPtncXKUz9i4b0T3PkzxXGKUfnGXbt1WS1Xq0vGpU//4oDZa13jZwLA
	iULsSjnTrF26cFo1SS9o58mI2umo80/tb70RIdqgujNe02g3Mdye9M0cLEYkt/QQzjX7
	OUm5Jrh7pT9cgw3XiYtF73US9lM/vupLyPP1w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=GYgryLnqU+9dZIRQ8N/j1SGS8cg6Ct8KGu0fCCJnlgdIx9J4CyKobHwm6IGlpOxilK
	Vww3GDz5aPPribqbCVyfbTA7KU7drDhm1jfpApAKAdei/idkMJW+7sU+Em5l/Cd7yg6X
	KT1vX9M1IEEu8zAh40Jq7fOuX6MrD1xdOY3l0=
Received: by 10.204.167.65 with SMTP id p1mr439267bky.207.1300184319390;
	Tue, 15 Mar 2011 03:18:39 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id v21sm5847532bkt.23.2011.03.15.03.18.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 03:18:38 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 15 Mar 2011 11:18:32 +0100
Message-Id: <0f1bc780b10b22c02114d3184a6535e5bf46a854.1300184240.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <cover.1300184240.git.Martin.Jansa@gmail.com>
References: <cover.1300184240.git.Martin.Jansa@gmail.com>
Subject: [PATCH 1/1] create-pull-request: switch URL from git.pokylinux.org/poky-contrib to git.openembedded.org/openembedded-core-contrib
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 15 Mar 2011 10:20:19 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/create-pull-request |    7 ++++---
 1 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 5ad7666..784b48c 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -2,7 +2,8 @@
 ODIR=pull-$$
 RELATIVE_TO="master"
 COMMIT_ID="HEAD"
-PULL_URL="git://git.pokylinux.org/poky-contrib.git"
+PULL_URL="git://git.openembedded.org/openembedded-core-contrib"
+WEB_URL_PREFIX="http://git.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h="
 PREFIX="PATCH"
 
 usage() {
@@ -14,7 +15,7 @@ Usage: $CMD [-h] [-o output_dir] [-m msg_body_file] [-s subject] [-r relative_to
   -m msg_body_file    The file containing a blurb to be inserted into the summary email
   -r relative_to      Starting commit (default: master)
   -i commit_id        Ending commit (default: HEAD)
-  -b contrib_branch   Branch-name in the git.pokylinux.org/poky-contrib tree
+  -b contrib_branch   Branch-name in the $PULL_URL
   -s subject          The subject to be inserted into the summary email
   -p prefix           Use [prefix N/M] instead of [PATCH N/M] as the subject prefix
 
@@ -69,7 +70,7 @@ fi
 
 # Perform a sanity test on the web URL. Issue a warning if it is not
 # accessible, but do not abort as users may want to run offline.
-WEB_URL="http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=$CONTRIB_BRANCH"
+WEB_URL="$WEB_URL_PREFIX$CONTRIB_BRANCH"
 wget -q $WEB_URL -O /dev/null
 if [ $? -ne 0 ]; then
     echo "WARNING: Branch '$CONTRIB_BRANCH' was not found on the contrib git tree."
-- 
1.7.4.1



