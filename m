Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QYou2-0007QV-VF
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Jun 2011 02:33:15 +0200
Received: from localhost.localdomain (c-98-246-160-194.hsd1.or.comcast.net
	[98.246.160.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 5830D2FD51;
	Mon, 20 Jun 2011 20:29:39 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 20 Jun 2011 17:29:30 -0700
Message-Id: <cover.1308615886.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 5830D2FD51.A4863
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/2] login.defs move
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
X-List-Received-Date: Tue, 21 Jun 2011 00:33:15 -0000

Hello,

This pull request moves the login.defs file previously included
with base-passwd into a more appropriate recipe, shadow-sysroot
(I'm not married to that recipe name if someone can suggest
something better).

login.defs is part of shadow-utils and the copy included with
base-passwd was contaminating target package installations.
Moving it into its own recipe keeps it logically separate and
easier to manage the requirements of useradd.bbclass.

The following changes since commit 2163461ec94528ecf046a04edc5db3d2dd3a6b8b:

  systemtap: remove non-core COMPATIBLE_MACHINES (2011-06-16 22:14:06 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/login-defs-move
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/login-defs-move

Scott Garman (2):
  shadow-sysroot: new recipe for useradd.bbclass support
  base-passwd: remove login.defs references

 .../recipes-core/base-passwd/base-passwd_3.5.22.bb |   11 +----
 .../shadow/files/login.defs_shadow-sysroot}        |   34 ++++++++--------
 .../shadow/shadow-sysroot_4.1.4.3.bb               |   41 ++++++++++++++++++++
 3 files changed, 60 insertions(+), 26 deletions(-)
 rename meta/{recipes-core/base-passwd/base-passwd-3.5.22/login.defs => recipes-extended/shadow/files/login.defs_shadow-sysroot} (96%)
 create mode 100644 meta/recipes-extended/shadow/shadow-sysroot_4.1.4.3.bb



