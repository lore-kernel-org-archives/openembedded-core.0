Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QRers-00041u-6Z
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 08:25:24 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 31 May 2011 23:22:07 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,302,1304319600"; d="scan'208";a="10203831"
Received: from unknown (HELO swold-MOBL.bigsur.com) ([10.255.13.41])
	by fmsmga002.fm.intel.com with ESMTP; 31 May 2011 23:22:07 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 31 May 2011 23:21:54 -0700
Message-Id: <06842f8eb4cc40235130f4ceafe893cfb835b603.1306909184.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.3.4
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
In-Reply-To: <cover.1306909184.git.sgw@linux.intel.com>
References: <cover.1306909184.git.sgw@linux.intel.com>
Subject: [CONSOLIDATED PULL 27/32] create-pull-request: allow '+' in git PROTO_RE, ie for 'git+ssh://'
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
X-List-Received-Date: Wed, 01 Jun 2011 06:25:25 -0000

From: Martin Jansa <Martin.Jansa@gmail.com>

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 scripts/create-pull-request |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 19b640f..d52098e 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -102,7 +102,7 @@ while getopts "b:chi:m:o:p:r:s:u:" OPT; do
 		case "$REMOTE_URL" in
 		*@*)
 			USER_RE="[A-Za-z0-9_.@][A-Za-z0-9_.@-]*\$\?"
-			PROTO_RE="[a-z][a-z]*://"
+			PROTO_RE="[a-z][a-z+]*://"
 			GIT_RE="\(^\($PROTO_RE\)\?$USER_RE@\)\([^:/]*\)[:/]\(.*\)"
 			REMOTE_URL=${REMOTE_URL%.git}
 			REMOTE_REPO=$(echo $REMOTE_URL | sed "s#$GIT_RE#\4#")
-- 
1.7.3.4



