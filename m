Received: from mga11.intel.com ([192.55.52.93])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1QMlSD-0007Cn-1p
	for openembedded-core@lists.openembedded.org;
	Wed, 18 May 2011 20:26:41 +0200
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 18 May 2011 11:23:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.65,232,1304319600"; 
   d="scan'208";a="3516050"
Received: from unknown (HELO localhost) ([10.255.12.160])
	by fmsmga002.fm.intel.com with ESMTP; 18 May 2011 11:23:45 -0700
Message-Id: <cover.1305742944.git.sgw@linux.intel.com>
Old-Date: Wed, 18 May 2011 11:22:24 -0700
Date: Wed, 18 May 2011 11:23:45 -0700
To: openembedded-core@lists.openembedded.org
CC: 
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 0/1] [RFC] utils.bbclass: fix problem with perl and wrapper
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 May 2011 18:26:41 -0000

From: Saul Wold <sgw@linux.intel.com>


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: sgw/patch
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgw/patch

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Saul Wold (1):
  utils.bbclass: modify create_wrapper to correctly follow symlinks

 meta/classes/utils.bbclass |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.3.4



