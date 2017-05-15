Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 0813E71C14
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 May 2017 11:21:26 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 May 2017 04:21:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,344,1491289200"; d="scan'208";a="86878321"
Received: from bkearns-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.10.90])
	by orsmga002.jf.intel.com with ESMTP; 15 May 2017 04:21:18 -0700
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 May 2017 14:21:16 +0300
Message-Id: <20170515112116.13866-1-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.12.0
Subject: [PATCH] scripts/create-pull-request: fix handling of '-t' option
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
X-List-Received-Date: Mon, 15 May 2017 11:21:27 -0000

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 46d65386a3..5bdea44482 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -209,7 +209,7 @@ if [ -n "$RELDIR" ]; then
 fi
 
 # Generate the patches and cover letter
-if [ -z "$IN_REPLY_TO" ]; then
+if [ -n "$IN_REPLY_TO" ]; then
     git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --in-reply-to="$IN_REPLY_TO" --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
 else
     git format-patch $extraopts -M40 --subject-prefix="$PREFIX" -n -o $ODIR --thread=shallow --cover-letter $RELATIVE_TO..$COMMIT_ID > /dev/null
-- 
2.12.0


