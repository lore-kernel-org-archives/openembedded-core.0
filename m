Return-Path: <brian.avery@intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id AC8957705F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 03:42:04 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 07 Aug 2016 20:42:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,487,1464678000"; d="scan'208";a="1031481276"
Received: from bavery-ws-desk.jf.intel.com ([10.7.201.28])
	by orsmga002.jf.intel.com with ESMTP; 07 Aug 2016 20:42:04 -0700
From: bavery <brian.avery@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  7 Aug 2016 20:43:20 -0700
Message-Id: <cover.1470627445.git.brian.avery@intel.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fixes for Eclipse Qemu debug
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
X-List-Received-Date: Mon, 08 Aug 2016 03:42:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch set fixes YOCTO #9362.  The busybox resize utility was running on
ssh connections from Eclipse and causing Eclipse to fail to start gdbserver.
Furthermore, the opensftp server wasn't starting up correctly without the
openssh-server.

Thanks go to Max Krummenacher <max.oss.09@gmail.com> for suggesting a good solution
to the serial/ssh connection issue in basefiles:etc/profile!

-Brian



The following changes since commit dfc016fbf13e62f7767edaf7abadf1d1b72680b2:

  maintainers.inc: remove augeas (2016-08-04 20:56:11 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib bavery/eclipse-resize-fixup
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=bavery/eclipse-resize-fixup

bavery (2):
  packagegroup-core-eclipse-debug: add openssh server to support
    openssh-sftp-server
  base-files: restrict resize to run on serial consoles only  in profile

                              │·

 recipes-core/base-files/base-files/profile                    | 7 ++++---
 recipes-core/packagegroups/packagegroup-core-eclipse-debug.bb | 1 +
 2 files changed, 5 insertions(+), 3 deletions(-)

--
1.9.1

