Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 752936FEE0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Aug 2017 10:03:46 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	07 Aug 2017 03:03:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.41,337,1498546800"; d="scan'208";a="137214641"
Received: from peggleto-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.252.43.222])
	by fmsmga006.fm.intel.com with ESMTP; 07 Aug 2017 03:03:47 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon,  7 Aug 2017 12:03:43 +0200
Message-Id: <9476ad81324bf304b26d2e9bbe469bd7e3751192.1502100124.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <cover.1502100124.git.paul.eggleton@linux.intel.com>
References: <cover.1502100124.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 1/2] bitbake.conf: whitelist BB_SERVER_TIMEOUT from config hash
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
X-List-Received-Date: Mon, 07 Aug 2017 10:03:46 -0000

We don't need to reparse recipes just because BB_SERVER_TIMEOUT changed,
so exclude it from the config hash.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 9a3aa8b..3110b9c 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -850,7 +850,7 @@ BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
     GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ftp_proxy \
     HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD \
-    BB_SETSCENE_ENFORCE BB_CMDLINE"
+    BB_SETSCENE_ENFORCE BB_CMDLINE BB_SERVER_TIMEOUT"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
-- 
2.9.4


