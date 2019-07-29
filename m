Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
	by mail.openembedded.org (Postfix) with ESMTP id 0A55E7F2B1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jul 2019 21:54:58 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	29 Jul 2019 14:54:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,324,1559545200"; d="scan'208";a="174023923"
Received: from jsithir-mobl.gar.corp.intel.com (HELO localhost.localdomain)
	([10.255.189.107])
	by orsmga003.jf.intel.com with ESMTP; 29 Jul 2019 14:54:57 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 30 Jul 2019 09:54:43 +1200
Message-Id: <c6cb46b945585fc9550164b5ae39cd5b65ff047d.1564437221.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1564437221.git.paul.eggleton@linux.intel.com>
References: <cover.1564437221.git.paul.eggleton@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 2/2] scripts/create-pull-request: fix putting subject containing / into cover letter
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
X-List-Received-Date: Mon, 29 Jul 2019 21:54:58 -0000
Content-Transfer-Encoding: 8bit

If a single-commit series had a shortlog containing a "/" character then
that prevented putting the shortlog into the subject of the cover letter
message. Use a different separating character with the sed command (one
much less likely to appear) in order to fix it.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/create-pull-request | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/create-pull-request b/scripts/create-pull-request
index 762828fd9ad..8eefcf63a56 100755
--- a/scripts/create-pull-request
+++ b/scripts/create-pull-request
@@ -257,7 +257,7 @@ fi
 
 # Replace the SUBJECT token with it.
 if [ -n "$SUBJECT" ]; then
-	sed -i -e "s/\*\*\* SUBJECT HERE \*\*\*/$SUBJECT/" "$CL"
+	sed -i -e "s\`\*\*\* SUBJECT HERE \*\*\*\`$SUBJECT\`" "$CL"
 fi
 
 
-- 
2.20.1


