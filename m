Return-Path: <rebecca.swee.fun.chang@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 6508B71ADE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 May 2017 05:15:57 +0000 (UTC)
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga105.jf.intel.com with ESMTP; 28 May 2017 22:15:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.38,412,1491289200"; d="scan'208";a="1153993566"
Received: from rebeccas.png.intel.com ([172.30.199.118])
	by fmsmga001.fm.intel.com with ESMTP; 28 May 2017 22:15:57 -0700
From: Chang Rebecca Swee Fun <rebecca.swee.fun.chang@intel.com>
To: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Date: Mon, 29 May 2017 13:16:17 +0800
Message-Id: <1496034979-99713-1-git-send-email-rebecca.swee.fun.chang@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH 0/2] devshell: make sure toolchains are populated in sysroot
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
X-List-Received-Date: Mon, 29 May 2017 05:16:00 -0000

Hi all,

In the previous implementation, none of the build tools will be in
the sysroot if we clean the recipe and run devshell on it.
This is a fix on devshell.bbclass to ensure all necessary toolchains
are available in sysroot whenever we enter into devshell.
The second patch is to clean up some trailing whitespaces in
devshell.bbclass.

Thanks,
Rebecca


Chang Rebecca Swee Fun (2):
  devshell.bbclass: ensure toolchains available for do_devshell
  devshell.bbclass: clean up trailing whitespaces

 meta/classes/devshell.bbclass | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

-- 
2.7.4


