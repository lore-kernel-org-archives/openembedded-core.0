Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QcXFA-0002su-6Z
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 08:30:24 +0200
Received: from localhost.localdomain (c-98-246-160-194.hsd1.or.comcast.net
	[98.246.160.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 4D3922FEF4;
	Fri,  1 Jul 2011 01:11:57 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 22:11:49 -0700
Message-Id: <cover.1309497002.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 4D3922FEF4.48E7C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/2] useradd.bbclass: new class for managing user/group permissions [v3]
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
X-List-Received-Date: Fri, 01 Jul 2011 06:30:24 -0000

Hi,

This pull request should be complete based on Richard's second round
of feedback.

Thanks,

Scott

The following changes since commit 1c1372e7eccb01f7c1f682bc0aa989c37f2516f6:

  bitbake.conf: update PSEUDO_PASSWD variable (2011-07-01 00:13:25 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/useradd-v3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-v3

Scott Garman (2):
  useradd.bbclass: new class for managing user/group permissions
  useradd-example: example recipe for using inherit useradd

 .../recipes-skeleton/useradd/useradd-example.bb    |   76 ++++++++++
 meta/classes/useradd.bbclass                       |  156 ++++++++++++++++++++
 2 files changed, 232 insertions(+), 0 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file4
 create mode 100644 meta/classes/useradd.bbclass



