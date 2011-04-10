Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q91hZ-0005pu-OT
	for openembedded-core@lists.openembedded.org;
	Sun, 10 Apr 2011 22:57:45 +0200
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga102.jf.intel.com with ESMTP; 10 Apr 2011 13:55:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,335,1299484800"; d="scan'208";a="731489157"
Received: from unknown (HELO localhost) ([10.255.12.197])
	by orsmga001.jf.intel.com with ESMTP; 10 Apr 2011 13:55:32 -0700
Message-Id: <cover.1302468695.git.sgw@linux.intel.com>
Old-Date: Sun, 10 Apr 2011 13:51:35 -0700
Date: Sun, 10 Apr 2011 13:55:31 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Subject: [PATCH 0/1] gst-plugins-good: add libsoup as a dependency
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
X-List-Received-Date: Sun, 10 Apr 2011 20:57:46 -0000

From: Saul Wold <sgw@linux.intel.com>

When souphttpsrc was added to gst-meta-base, the dependency was
not set up correctly in gst-plugins-good. This patch fixes that
problem.

Sau!


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: distro/oe-core
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Saul Wold (1):
  gst-plugins-good: add dependency on libsoup-2.4

 .../gstreamer/gst-plugins-good_0.10.26.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)



