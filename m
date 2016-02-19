Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 851C97719E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:48 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773792"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:54 +1300
Message-Id: <5b6c52bfbd7ca9d867a7ab8f97f79af8a081ac7a.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 06/14] scripts/lib/argparse_oe: tweak title above options
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:48 -0000

Naming these as "optional arguments" is perhaps slightly confusing since
some of the positional arguments might also be optional; in addition
it's rare (though possible) for options to be mandatory - up until
recently we had a recipetool option (-o) that was mandatory. It's not
perfect, but change it to "options" so it's at least a bit more
appropriate.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/argparse_oe.py | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/scripts/lib/argparse_oe.py b/scripts/lib/argparse_oe.py
index 744cfe3..bf3ebad 100644
--- a/scripts/lib/argparse_oe.py
+++ b/scripts/lib/argparse_oe.py
@@ -51,6 +51,10 @@ class ArgumentSubParser(ArgumentParser):
         if 'order' in kwargs:
             self._order = kwargs.pop('order')
         super(ArgumentSubParser, self).__init__(*args, **kwargs)
+        for agroup in self._action_groups:
+            if agroup.title == 'optional arguments':
+                agroup.title = 'options'
+                break
 
     def parse_known_args(self, args=None, namespace=None):
         # This works around argparse not handling optional positional arguments being
-- 
2.5.0


