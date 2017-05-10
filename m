Return-Path: <joshua.g.lock@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id 2969371A2D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 May 2017 12:47:41 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	10 May 2017 05:47:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,319,1491289200"; d="scan'208";a="1128606855"
Received: from jlock-mobl1.ger.corp.intel.com ([10.252.14.126])
	by orsmga001.jf.intel.com with ESMTP; 10 May 2017 05:47:41 -0700
From: Joshua Lock <joshua.g.lock@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 10 May 2017 13:47:37 +0100
Message-Id: <20170510124737.32035-1-joshua.g.lock@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [morty] sanity.bbclass: fix logging of an error
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
X-List-Received-Date: Wed, 10 May 2017 12:47:42 -0000

From: Markus Lehtonen <markus.lehtonen@linux.intel.com>

Fixes a crash in exception handler. All bb logging functions need an
string instances as arguments.

(From OE-Core master rev: 62b521722ae72bc87d599719b400dab771154fa7)

Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
Signed-off-by: Ross Burton <ross.burton@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
Signed-off-by: Joshua Lock <joshua.g.lock@intel.com>
---
 meta/classes/sanity.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/sanity.bbclass b/meta/classes/sanity.bbclass
index 7682ffb..9db3f1d 100644
--- a/meta/classes/sanity.bbclass
+++ b/meta/classes/sanity.bbclass
@@ -565,7 +565,7 @@ def sanity_check_conffiles(d):
             try:
                 bb.build.exec_func(func, d, pythonexception=True)
             except NotImplementedError as e:
-                bb.fatal(e)
+                bb.fatal(str(e))
             d.setVar("BB_INVALIDCONF", True)
 
 def sanity_handle_abichanges(status, d):
-- 
2.9.3


