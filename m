Return-Path: <amanda.r.brindle@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4AEF577F76
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Mar 2018 19:12:12 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	22 Mar 2018 12:12:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.48,345,1517904000"; d="scan'208";a="27222348"
Received: from aurora.jf.intel.com ([10.7.198.68])
	by orsmga007.jf.intel.com with ESMTP; 22 Mar 2018 12:12:14 -0700
From: Amanda Brindle <amanda.r.brindle@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 22 Mar 2018 12:12:00 -0700
Message-Id: <cover.1521745841.git.amanda.r.brindle@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: Amanda Brindle <amanda.r.brindle@intel.com>, stephano.cetola@intel.com
Subject: [PATCH v2 0/1] waf.bbclass: Throw error if waf doesn't exist
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
X-List-Received-Date: Thu, 22 Mar 2018 19:12:13 -0000

In v2, change bb.warn to bb.fatal

The following changes since commit f49ee61422c867516db252054e993df29f775136:

  systemd-boot: upgrade to 237 (2018-03-20 09:59:33 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib abrindle/waf_error
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=abrindle/waf_error

Amanda Brindle (1):
  waf.bbclass: Throw error if waf doesn't exist

 meta/classes/waf.bbclass | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.7.4


