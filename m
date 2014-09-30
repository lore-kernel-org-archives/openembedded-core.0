Return-Path: <nitin.a.kamble@intel.com>
X-Greylist: delayed 585 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 30 Sep 2014 21:07:00 UTC
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9985565E1A
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 21:07:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga103.jf.intel.com with ESMTP; 30 Sep 2014 13:55:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,629,1406617200"; d="scan'208";a="611137780"
Received: from yocto-hm1.jf.intel.com ([10.23.232.34])
	by orsmga002.jf.intel.com with ESMTP; 30 Sep 2014 13:57:14 -0700
From: nitin.a.kamble@intel.com
To: richard.purdie@linuxfoundation.org, saul.wold@intel.com,
	ross.burton@intel.com, dvhart@linux.intel.com,
	bruce.ashfield@windriver.com, Openembedded-core@lists.openembedded.org
Date: Tue, 30 Sep 2014 13:57:27 -0700
Message-Id: <cover.1412108536.git.nitin.a.kamble@intel.com>
X-Mailer: git-send-email 1.8.1.4
Subject: [PATCH 0/1] A bugfix to enable external module building on target
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
X-List-Received-Date: Tue, 30 Sep 2014 21:07:05 -0000

From: Nitin A Kamble <nitin.a.kamble@intel.com>

The path /lib/modules/<kernel-version>/build was missing on the target.
It is required to build external modules on the target. The kernel-dev
package provides all the needed support files for building the external
kernel modules. This commit creates the required missing link on the
target, which enables the external modules building.

This has been tested with a simple external module on the qemux86-64 machine
with the core-image-sato-sdk image.

See this bug for more details:
  https://bugzilla.yoctoproject.org/show_bug.cgi?id=2968

Thanks,
Nitin


The following changes since commit c34775f8864f9bf9a2b32af1e3a803f7d84e11ba:

  deb_packaging: Added support for multilib (2014-09-30 14:33:31 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib nitin/misc
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=nitin/misc

Nitin A Kamble (1):
  kernel.bbclass: enable a link for external module building

 meta/classes/kernel.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
1.8.1.4


