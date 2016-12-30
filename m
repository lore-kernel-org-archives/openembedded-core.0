Return-Path: <juro.bystricky@intel.com>
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	by mail.openembedded.org (Postfix) with ESMTP id 4855E605C3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Dec 2016 21:38:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga105.jf.intel.com with ESMTP; 30 Dec 2016 13:38:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,432,1477983600"; d="scan'208";a="917553106"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.149])
	by orsmga003.jf.intel.com with ESMTP; 30 Dec 2016 13:38:28 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 30 Dec 2016 13:35:31 -0800
Message-Id: <1483133732-17872-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com, jurobystricky@hotmail.com
Subject: [PATCH 0/1] Toaster support for Build Appliance
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
X-List-Received-Date: Fri, 30 Dec 2016 21:38:28 -0000

This patch contains several changes in order to allow to run Toaster in
the Build Appliance.
In particular, the Build Appliance now contains all (previously missing)
modules as specified in "bitbake/toaster-requirements.txt".
It was also not possible to install the modules manually, as the installation
program (pip3) was missing as well.

The Toaster web server can be now readily started by the command:

    $ source toaster start webport=<IPADDR:PORT>

The attached README_VirtualBox_Toaster.txt explains the steps needed
to determine IPPARRD:PORT values based on the network adapter settings
(NAT or Bridged) for VirtualBox and the web server URL for host
web browser.

One caveat: For simplicity the Build Appliance recipe assumes pip3 is installed
on the build host.


Juro Bystricky (1):
  build-appliance-image: support for Toaster

 .../README_VirtualBox_Toaster.txt                  | 78 ++++++++++++++++++++++
 .../images/build-appliance-image_15.0.0.bb         | 18 ++++-
 2 files changed, 93 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/images/build-appliance-image/README_VirtualBox_Toaster.txt

-- 
2.7.4


