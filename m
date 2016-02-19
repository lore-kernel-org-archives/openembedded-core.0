Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 25C6777156
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 09:39:36 +0000 (UTC)
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
	by orsmga103.jf.intel.com with ESMTP; 19 Feb 2016 01:39:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.22,469,1449561600"; d="scan'208";a="50773666"
Received: from eyeoh10-mobl.gar.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.255.132.216])
	by fmsmga004.fm.intel.com with ESMTP; 19 Feb 2016 01:39:35 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 19 Feb 2016 22:38:49 +1300
Message-Id: <988345efbaa22b1f8f3facef4a15f19b040e4e96.1455874585.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.5.0
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
In-Reply-To: <cover.1455874585.git.paul.eggleton@linux.intel.com>
References: <cover.1455874585.git.paul.eggleton@linux.intel.com>
Subject: [PATCH 01/14] devtool: minor fix for error message
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
X-List-Received-Date: Fri, 19 Feb 2016 09:39:36 -0000

There is no -N/--name option for devtool, that's a recipetool option -
with devtool you just specify the name as a positional argument.

Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
---
 scripts/lib/devtool/standard.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/lib/devtool/standard.py b/scripts/lib/devtool/standard.py
index d12cc2e..590dfef 100644
--- a/scripts/lib/devtool/standard.py
+++ b/scripts/lib/devtool/standard.py
@@ -150,7 +150,7 @@ def add(args, config, basepath, workspace):
             stdout, _ = exec_build_env_command(config.init_path, basepath, 'recipetool --color=%s create -o %s "%s" %s' % (color, tempdir, source, extracmdopts))
         except bb.process.ExecutionError as e:
             if e.exitcode == 15:
-                raise DevtoolError('Unable to auto-determine name from source tree, please specify it with -N/--name')
+                raise DevtoolError('Unable to auto-determine recipe name from source tree, please specify it on the command line')
             else:
                 raise DevtoolError('Command \'%s\' failed:\n%s' % (e.command, e.stdout))
 
-- 
2.5.0


