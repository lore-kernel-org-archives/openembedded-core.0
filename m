Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RN8XW-0006PU-4A
	for openembedded-core@lists.openembedded.org;
	Sun, 06 Nov 2011 20:37:58 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 15BD73044C
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2011 14:31:40 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Nov 2011 11:31:41 -0800
Message-Id: <cover.1320607825.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 15BD73044C.D3CBB
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] useradd.bbclass: fix how RDEPENDS is setup
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
X-List-Received-Date: Sun, 06 Nov 2011 19:37:58 -0000

Fix bug where only packages named PN included base-passwd in
RDEPENDS. Also remove shadow requirement, since some targets
do not use shadow and file ownership can be changed with only
passwd/group entries.
    
This fixes [YOCTO #1727]

The following changes since commit e3c003282afb93ec52882496400b042620ab00ef:

  rt-tests: update to 0.83 (2011-11-04 15:43:19 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/useradd-rdepends-final
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-rdepends-final

Scott Garman (1):
  useradd.bbclass: fix how RDEPENDS is setup

 meta/classes/useradd.bbclass |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

-- 
1.7.5.4



