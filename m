Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SG3CQ-00064Y-V5
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 09:03:11 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 34F813047E
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Apr 2012 02:53:50 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  5 Apr 2012 23:53:47 -0700
Message-Id: <cover.1333695164.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 34F813047E.B13F4
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] shadow-native: disable logging to syslog
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
X-List-Received-Date: Fri, 06 Apr 2012 07:03:11 -0000

Hello,

This pull request includes a patch to shadow to disable logging to
syslog, to prevent sysroot user and group additions from writing
entries to the host's syslog.

I have build-tested this with core-image-sato (which builds a few
useradd-based recipes, such as avahi and dbus) for all 5 of our
qemu architectures, while watching my syslog to verify that no
useradd or groupadd entries were written. 

Scott

The following changes since commit 1a82989345fb98becb487d270fd93a5e6dffeb47:

  runqemu-internal: Add console=tty for qemuppc and NFS (2012-04-06 01:12:15 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/shadow-syslog-fix-oe
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/shadow-syslog-fix-oe

Scott Garman (1):
  shadow-native: disable logging to syslog

 .../shadow/files/disable-syslog.patch              |   34 ++++++++++++++++++++
 .../shadow/shadow-native_4.1.4.3.bb                |    5 ++-
 2 files changed, 37 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/shadow/files/disable-syslog.patch

-- 
1.7.5.4



