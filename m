Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id E89E371DDA
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2017 20:18:03 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga105.jf.intel.com with ESMTP; 10 Feb 2017 12:18:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,142,1484035200"; d="scan'208";a="57375533"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.4.164])
	by orsmga004.jf.intel.com with ESMTP; 10 Feb 2017 12:18:03 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 10 Feb 2017 14:19:19 -0600
Message-Id: <cover.1486757577.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCHv2 0/1] insane.bbclass: Add missing dependencies
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
X-List-Received-Date: Fri, 10 Feb 2017 20:18:04 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Changes in v2:

- Add binutils as dependency too

The following changes since commit a624cf7f95c8cf4ff764cc997fd1db4601b97dcc:

  oeqa/selftest/pkgdata: use m4 instead of bash (2017-02-07 14:50:10 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/insane_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/insane_fix

Mariano Lopez (1):
  insane.bbclass: Add missing dependencies

 meta/classes/insane.bbclass | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

-- 
2.10.2


