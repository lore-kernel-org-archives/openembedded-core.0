Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E1EA56014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2016 02:40:38 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 23 May 2016 19:40:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.26,358,1459839600"; d="scan'208";a="987306392"
Received: from jchang2-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.174.130])
	by fmsmga002.fm.intel.com with ESMTP; 23 May 2016 19:40:37 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 24 May 2016 14:40:07 +1200
Message-Id: <ef03a06a3240b481c62064a58736c373fd1df5ad.1464057554.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.5
In-Reply-To: <cover.1464057554.git.paul.eggleton@linux.intel.com>
References: <cover.1464057554.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1464057554.git.paul.eggleton@linux.intel.com>
References: <cover.1464057554.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 2/2] conf/bitbake.conf: whitelist GIT_SSL_CAINFO
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
X-List-Received-Date: Tue, 24 May 2016 02:40:39 -0000

Just as with the proxy variables, we don't need to reparse everything if
the value of this variable changes.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 meta/conf/bitbake.conf | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index acef30b..d85e806 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -815,7 +815,8 @@ BB_HASHCONFIG_WHITELIST ?= "${BB_HASHBASE_WHITELIST} DATE TIME SSH_AGENT_PID \
     SSH_AUTH_SOCK PSEUDO_BUILD BB_ENV_EXTRAWHITE DISABLE_SANITY_CHECKS \
     PARALLEL_MAKE BB_NUMBER_THREADS BB_ORIGENV BB_INVALIDCONF BBINCLUDED \
     GIT_PROXY_COMMAND ALL_PROXY all_proxy NO_PROXY no_proxy FTP_PROXY ftp_proxy \
-    HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD"
+    HTTP_PROXY http_proxy HTTPS_PROXY https_proxy SOCKS5_USER SOCKS5_PASSWD \
+    GIT_SSL_CAINFO"
 BB_SIGNATURE_EXCLUDE_FLAGS ?= "doc deps depends \
     lockfiles type vardepsexclude vardeps vardepvalue vardepvalueexclude \
     file-checksums python func task export unexport noexec nostamp dirs cleandirs \
-- 
2.5.5


