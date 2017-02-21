Return-Path: <mariano.lopez@linux.intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id E459772F4B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2017 18:19:15 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	21 Feb 2017 10:19:16 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,190,1484035200"; d="scan'208";a="67383858"
Received: from unknown (HELO mlopezva-MOBL2.zpn.intel.com) ([10.219.25.91])
	by orsmga005.jf.intel.com with ESMTP; 21 Feb 2017 10:19:16 -0800
From: mariano.lopez@linux.intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue, 21 Feb 2017 12:20:34 -0600
Message-Id: <cover.1487701080.git.mariano.lopez@linux.intel.com>
X-Mailer: git-send-email 2.10.2
Subject: [PATCHv3 0/1] insane.bbclass: Add missing dependencies
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
X-List-Received-Date: Tue, 21 Feb 2017 18:19:16 -0000

From: Mariano Lopez <mariano.lopez@linux.intel.com>

Changes in v2:

- Add binutils as dependency too

Changes in v3:

- Remove prepare_recipe_sysroot task dependency as recommended by Richard 

The following changes since commit e436a6398684d2872cb541f1cfb0f67b3618d15a:

  layer.conf: bump version for change in eSDK selftest behaviour (2017-02-19 09:39:03 -0800)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mariano/insane_fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mariano/insane_fix

Mariano Lopez (1):
  insane.bbclass: Add missing dependencies

 meta/classes/insane.bbclass | 3 +++
 1 file changed, 3 insertions(+)

-- 
2.10.2


