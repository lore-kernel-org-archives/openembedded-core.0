Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <tom.zanussi@intel.com>) id 1TRn2m-0002pv-79
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Oct 2012 18:46:00 +0200
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by fmsmga101.fm.intel.com with ESMTP; 26 Oct 2012 09:31:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,654,1344236400"; d="scan'208";a="238834709"
Received: from unknown (HELO localhost) ([10.255.14.211])
	by fmsmga001.fm.intel.com with ESMTP; 26 Oct 2012 09:21:15 -0700
From: tom.zanussi@intel.com
To: openembedded-core@lists.openembedded.org
Date: Fri, 26 Oct 2012 11:21:14 -0500
Message-Id: <cover.1351268333.git.tom.zanussi@intel.com>
X-Mailer: git-send-email 1.7.11.4
Subject: [PATCH 0/1] remove lttng-syscalls patch from lttng-modules
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 16:46:00 -0000

From: Tom Zanussi <tom.zanussi@intel.com>

This removes a no-longer-used patch from lttng-modules.

The following changes since commit 511f7f9d0422fe1a896361b53179c9f642c1fc0b:

  zeroconf: remove (2012-10-26 14:12:55 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib.git tzanussi/lttng-modules-remove-syscalls-patch
  http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=tzanussi/lttng-modules-remove-syscalls-patch

Tom Zanussi (1):
  lttng-modules: remove unused lttng-syscalls patch

 ...ls-protect-is_compat_task-from-redefiniti.patch | 41 ----------------------
 1 file changed, 41 deletions(-)
 delete mode 100644 meta/recipes-kernel/lttng-2.0/lttng-modules/lttng-sycalls-protect-is_compat_task-from-redefiniti.patch

-- 
1.7.11.4



