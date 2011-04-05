Received: from mga02.intel.com ([134.134.136.20])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sgw@linux.intel.com>) id 1Q7E8U-0000ts-2P
	for openembedded-core@lists.openembedded.org;
	Tue, 05 Apr 2011 23:50:06 +0200
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Apr 2011 14:47:59 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.63,307,1299484800"; d="scan'208";a="624085391"
Received: from unknown (HELO localhost) ([10.255.12.228])
	by orsmga002.jf.intel.com with ESMTP; 05 Apr 2011 14:47:58 -0700
Message-Id: <cover.1302039585.git.sgw@linux.intel.com>
Old-Date: Tue, 5 Apr 2011 14:39:45 -0700
Date: Tue, 05 Apr 2011 14:47:58 -0700
To: openembedded-core@lists.openembedded.org
From: Saul Wold <sgw@linux.intel.com>
Cc: Scott Rifenbark <scott.m.rifenbark@intel.com>,
	Xiaofeng Yan <xiaofeng.yan@windriver.com>,
	Dongxiao Xu <dongxiao.xu@intel.com>, Kang Kai <kai.kang@windriver.com>
Subject: [PATCH 0/6] Consolidated Pull Request
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
X-List-Received-Date: Tue, 05 Apr 2011 21:50:06 -0000

From: Saul Wold <sgw@linux.intel.com>

Richard,

Here are a half dozen pull requests for oe-core and poky.

Thanks
	Sau!


Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: distro/oe-core
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=distro/oe-core

Thanks,
    Saul Wold <sgw@linux.intel.com>
---


Dongxiao Xu (1):
  gst-meta-base: Support http/https remote streams

Kang Kai (1):
  xdg-utils: add xdg-utils to pass the lsb test

Mei Lei (1):
  distrodata.bbclass: Merge the get_pkg_info.log into checkpkg.csv

Saul Wold (1):
  desktop-file-utils: Add SRC_URI checksums

Scott Rifenbark (1):
  documentation/adt-manual/adt-eclipse.xml:  Updated repo URL for
    Eclipse Plug-in

Xiaofeng Yan (1):
  LSB_Setup.sh: Add function to install all test packages

 documentation/adt-manual/adt-eclipse.xml           |    2 +-
 meta/classes/distrodata.bbclass                    |   29 +++---------
 .../desktop-file-utils-native_0.15.bb              |    3 +
 meta/recipes-extended/lsb/lsbsetup/LSB_Setup.sh    |   50 ++++++++++++--------
 meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb |   26 ++++++++++
 .../gstreamer/gst-meta-base_0.10.bb                |    5 +-
 6 files changed, 70 insertions(+), 45 deletions(-)
 create mode 100644 meta/recipes-extended/xdg-utils/xdg-utils_1.0.2.bb



