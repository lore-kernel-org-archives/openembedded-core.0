Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2789B7806D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Jun 2017 01:59:24 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	27 Jun 2017 18:59:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,273,1496127600"; d="scan'208";a="985963827"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by orsmga003.jf.intel.com with ESMTP; 27 Jun 2017 18:59:23 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Jun 2017 09:59:16 +0800
Message-Id: <1498615159-6719-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/3] Enhancement on devtool edit-recipe
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
X-List-Received-Date: Wed, 28 Jun 2017 01:59:25 -0000

Hi,

The patches in this series are to enhance devtool edit-recipe as a request
from Bugzilla #11434.

This first enhancement I did was to ensure devtool edit-recipe not to print
out ugly tracebacks that is not informative by catching the exception.

However, this has introduced new tracebacks where python complaints about
NameError: name 'logger' is not defined in run_editor definition. We could
pass in logger as a parameter from run_editor function call. This was fixed
in the second patch in this series.

Lastly, I have enable additional subcommand 'find-recipe' for devtool. This
will help users to find the path to the recipes in workspace and it can be
extended to find recipe outside of workspace using '-a/--any-recipe' option.

Regards,
Rebecca

Chang Rebecca Swee Fun (3):
  scriptutils: exit politely when no text editor available
  scriptutils: pass in logger as parameter
  devtool: find-recipe: enable new subcommand for devtool

 scripts/lib/devtool/utilcmds.py     | 18 ++++++++++++++----
 scripts/lib/recipetool/newappend.py |  2 +-
 scripts/lib/scriptutils.py          |  6 +++---
 3 files changed, 18 insertions(+), 8 deletions(-)

-- 
2.7.4


