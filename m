Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1SHj5N-0002dK-Tf
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Apr 2012 23:58:50 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 10 Apr 2012 14:49:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.67,351,1309762800"; d="scan'208";a="130933007"
Received: from unknown (HELO swold-mobl.bigsur.com) ([10.255.12.159])
	by orsmga002.jf.intel.com with ESMTP; 10 Apr 2012 14:49:10 -0700
From: Saul Wold <sgw@linux.intel.com>
To: openembedded-core@lists.openembedded.org,
	dvhart@linux.intel.com
Date: Tue, 10 Apr 2012 14:49:07 -0700
Message-Id: <cover.1334094326.git.sgw@linux.intel.com>
X-Mailer: git-send-email 1.7.7.6
Subject: [PATCH 0/2] A couple of fixes for Build Appliance
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
X-List-Received-Date: Tue, 10 Apr 2012 21:58:51 -0000

Richard,

These fix a couple of problems with the build appliance and
the way boot-directdisk was setting up syslinux.  Darren and
I discussed them.

Thanks
	Sau!

The following changes since commit bde1744018afd4616e114b20ffdc21b9abddcedc:

  hello-mod: Move hello-mod from meta to meta-skeleton (2012-04-10 13:16:00 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib sgw/fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgw/fix

Saul Wold (2):
  boot-directdisk: remove the default setting of SYSLINUXCFG and
    SYSLINUXMENU
  task-self-hosted: Add vte and eglibc-gconv-ibm850

 meta/classes/boot-directdisk.bbclass        |    3 ---
 meta/recipes-core/tasks/task-self-hosted.bb |    4 +++-
 2 files changed, 3 insertions(+), 4 deletions(-)

-- 
1.7.7.6



