Return-Path: <raymond.tan@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id BCFDF6E5CB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Sep 2016 09:03:10 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga102.fm.intel.com with ESMTP; 30 Sep 2016 02:03:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,271,1473145200"; d="scan'208";a="15345093"
Received: from flexuser-devmachine.png.intel.com ([172.30.196.15])
	by orsmga004.jf.intel.com with ESMTP; 30 Sep 2016 02:03:11 -0700
From: Raymond Tan <raymond.tan@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Sep 2016 16:48:13 +0800
Message-Id: <20160930084814.25131-1-raymond.tan@intel.com>
X-Mailer: git-send-email 2.9.3
Subject: [PATCH 0/1] grub-efi.bbclass: Add a space between root and append parameter
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
X-List-Received-Date: Fri, 30 Sep 2016 09:03:12 -0000

Patch to add the missing space between root and append kernel boot parameter

Raymond Tan (1):
  grub-efi.bbclass: Add a space between root and append parameter

 meta/classes/grub-efi.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.9.3


