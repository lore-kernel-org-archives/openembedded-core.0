Received: from mga03.intel.com ([143.182.124.21])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ke.yu@intel.com>) id 1PyKZC-0001G2-Ai
	for openembedded-core@lists.openembedded.org;
	Sat, 12 Mar 2011 09:52:54 +0100
Received: from azsmga001.ch.intel.com ([10.2.17.19])
	by azsmga101.ch.intel.com with ESMTP; 12 Mar 2011 00:50:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.62,307,1297065600"; d="scan'208";a="401581185"
Received: from kyu3-dev32.bj.intel.com (HELO localhost) ([10.238.153.102])
	by azsmga001.ch.intel.com with ESMTP; 12 Mar 2011 00:50:05 -0800
From: Yu Ke <ke.yu@intel.com>
To: poky@yoctoproject.org,
	openembedded-core@lists.openembedded.org
Date: Sat, 12 Mar 2011 16:55:52 +0800
Message-Id: <cover.1299919648.git.ke.yu@intel.com>
X-Mailer: git-send-email 1.7.0.4
Subject: [PATCH 0/1] Fix bug 658: bottom icons are cut-off in qemu
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
X-List-Received-Date: Sat, 12 Mar 2011 08:52:54 -0000

the reason of the abnormal matchbox desktop icons is that: desktop is
not resize after window manager decorate it. there does has resize logic
in the root window PropertyNotify event handler, however, for some unknown
reason, the PropertyNotify event does not deliver to the root window.

this patch fix this issue from anotehr side. Since window manager also
send configure event to desktop window after decoration, it also works to do
resize in configure event handler. so this patch add configure event handelr
to fix this issue.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: kyu3/bug658-desktop
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kyu3/bug658-desktop

Thanks,
    Yu Ke <ke.yu@intel.com>
---


Yu Ke (1):
  matchbox-desktop: add configure event handler to fix bug 658

 .../matchbox-desktop/files/window-resize-fix.patch |   48 ++++++++++++++++++++
 .../matchbox-desktop/matchbox-desktop_git.bb       |    5 +-
 2 files changed, 51 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-sato/matchbox-desktop/files/window-resize-fix.patch



