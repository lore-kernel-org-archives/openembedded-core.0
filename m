Return-Path: <brian.avery@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 97FA47706A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Aug 2016 22:28:27 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga101.jf.intel.com with ESMTP; 11 Aug 2016 15:28:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,507,1464678000"; d="scan'208";a="864000234"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2016 15:28:27 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 11 Aug 2016 15:29:43 -0700
Message-Id: <cover.1470954349.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] [krogoth] Fix for Eclipse Qemu debug
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
X-List-Received-Date: Thu, 11 Aug 2016 22:28:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes YOCTO #9362.  The busybox resize utility was running on
ssh connections from Eclipse and causing Eclipse to fail to start gdbserver.

Thanks go to Max Krummenacher <max.oss.09@gmail.com> for suggesting a good solution
to the serial/ssh connection issue in basefiles:etc/profile!

This patch has already been applied to master commitish:
5aca5bc9a13d9d4a477cfd2d04edbcc8a8a0e412

-Brian

The following changes since commit f5da2a5913319ad6ac2141438ba1aa17576326ab:

  build-appliance-image: Update to krogoth head revision (2016-08-01 15:48:24 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/krogoth/eclipse-resize-fixup
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/krogoth/eclipse-resize-fixup

bavery (1):
  base-files: restrict resize to run on serial consoles only in profile
    │·

 recipes-core/base-files/base-files/profile | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

--
1.9.1

