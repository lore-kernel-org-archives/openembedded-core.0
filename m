Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1TGw8z-0000Ot-7E
	for openembedded-core@lists.openembedded.org;
	Wed, 26 Sep 2012 20:15:33 +0200
Received: from localhost (unknown [64.122.245.103])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 2E4EC304D3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Sep 2012 14:02:35 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 26 Sep 2012 11:02:25 -0700
Message-Id: <cover.1348682342.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 2E4EC304D3.8BB21
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/2] runqemu path fix
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 26 Sep 2012 18:15:33 -0000

Hello,

This is a bugfix for YOCTO #3101.

Since bitbake doesn't like empty PATH elements, prevent the
runqemu-internal script from creating this situation when
CROSSPATH is not set, and reveal bitbake errors to users to
make it easier to troubleshoot future errors along these lines.

Scott

The following changes since commit a8edf79fce381d0433f18bd38df6cd74008e5179:

  bitbake: fetch2/git: Don't use deprecated API (2012-09-25 15:55:57 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgarman/runqemu-path-fix
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-path-fix

Scott Garman (2):
  oe-find-native-sysroot: show bitbake errors to user
  runqemu-internal: don't append an empty element to PATH

 scripts/oe-find-native-sysroot |   29 +++++++++++++++++++----------
 scripts/runqemu-internal       |    6 +++++-
 2 files changed, 24 insertions(+), 11 deletions(-)

-- 
1.7.9.5



