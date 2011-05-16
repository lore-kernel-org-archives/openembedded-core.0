Received: from mga14.intel.com ([143.182.124.37])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <dvhart@linux.intel.com>) id 1QM6Hs-0005gt-A0
	for openembedded-core@lists.openembedded.org;
	Tue, 17 May 2011 00:29:16 +0200
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga102.ch.intel.com with ESMTP; 16 May 2011 15:26:21 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,221,1304319600"; d="scan'208";a="437124296"
Received: from unknown (HELO localhost) ([10.255.12.172])
	by azsmga001.ch.intel.com with ESMTP; 16 May 2011 15:26:21 -0700
From: Darren Hart <dvhart@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 16 May 2011 15:26:13 -0700
Message-Id: <083b315105cbabbd2f8df119eac05b4401127b39.1305584418.git.dvhart@linux.intel.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
References: <eb4a98eeef982194542a33be0dd615a5c2bf3ed8.1305584418.git.dvhart@linux.intel.com>
In-Reply-To: <cover.1305584418.git.dvhart@linux.intel.com>
References: <cover.1305584418.git.dvhart@linux.intel.com>
Subject: [RFC PATCH v2 13/15] create-pull-request: add untested oe repository support
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
X-List-Received-Date: Mon, 16 May 2011 22:29:16 -0000

Signed-off-by: Darren Hart <dvhart@linux.intel.com>
---
 scripts/create-pull-request |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index a9cf6f9..634a289 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -82,6 +82,10 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
 			REMOTE_URL=${REMOTE_URL/"ssh://git@"/"git://"}
 			;;
+		*ssh://git@git.openembedded.org*)
+			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#.*/\(.*\)#\1#")
+			REMOTE_URL=${REMOTE_URL/"ssh://git@"/"git://"}
+			;;
 		git@github.com:*)
 			REMOTE_REPO=$(echo $REMOTE_URL | sed 's#.*:\(.*\)\(\.git\)$#\1#')
 			REMOTE_URL=${REMOTE_URL/"git@github.com:"/"git://github.com/"}
@@ -111,6 +115,9 @@ case "$REMOTE_URL" in
 	*git.pokylinux.org*)
 		WEB_URL="http://git.pokylinux.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
 		;;
+	*git.openembedded.org*)
+		WEB_URL="http://cgit.openembedded.org/cgit.cgi/$REMOTE_REPO/log/?h=$BRANCH"
+		;;
 	*github.com*)
 		WEB_URL="https://github.com/$REMOTE_REPO/tree/$BRANCH"
 		;;
-- 
1.7.1



