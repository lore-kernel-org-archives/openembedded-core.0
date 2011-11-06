Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RNCDj-0005uD-IH
	for openembedded-core@lists.openembedded.org;
	Mon, 07 Nov 2011 00:33:47 +0100
Received: from localhost (c-98-246-160-155.hsd1.or.comcast.net
	[98.246.160.155])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 5F07530450
	for <openembedded-core@lists.openembedded.org>;
	Sun,  6 Nov 2011 18:27:31 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun,  6 Nov 2011 15:27:31 -0800
Message-Id: <cover.1320621944.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 5F07530450.75748
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] useradd.bbclass: fix how RDEPENDS is setup [v2]
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
X-List-Received-Date: Sun, 06 Nov 2011 23:33:47 -0000

Fix bug where only packages named PN included base-passwd in
RDEPENDS.
   
This fixes [YOCTO #1727]

Thanks to Phil Blundell for revewing my previous pull request, this
is v2 based on his feedback.

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



