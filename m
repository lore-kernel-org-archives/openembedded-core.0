Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1QcPxP-0003WV-TR
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 00:43:36 +0200
Received: from localhost.localdomain (c-98-246-160-194.hsd1.or.comcast.net
	[98.246.160.194])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 936B52FEDB;
	Thu, 30 Jun 2011 18:39:46 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 30 Jun 2011 15:39:37 -0700
Message-Id: <cover.1309473383.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 936B52FEDB.1FA94
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Cc: Scott Garman <scott.a.garman@intel.com>
Subject: [PATCH 0/3] useradd.bbclass: new class for managing user/group permissions [v2]
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
X-List-Received-Date: Thu, 30 Jun 2011 22:43:36 -0000

Hello,

This pull request incorporates feedback from Richard and MarkH in
response to my previous pull req. I also did more build and runtime
testing of the code to ensure these modifications haven't changed
the output.

Thanks,

Scott

The following changes since commit 8781c843cf3e0913a8fdd2ff91935f051be01dd9:

  classes/package.bbclass: Add fixup_perms (2011-06-30 22:54:04 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/useradd-v2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/useradd-v2

Scott Garman (3):
  bitbake.conf: update PSEUDO_PASSWD variable
  useradd.bbclass: new class for managing user/group permissions
  useradd-example: example recipe for using inherit useradd

 .../recipes-skeleton/useradd/useradd-example.bb    |   76 +++++++++
 meta/classes/useradd.bbclass                       |  161 ++++++++++++++++++++
 meta/conf/bitbake.conf                             |    2 +-
 3 files changed, 238 insertions(+), 1 deletions(-)
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example.bb
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file1
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file2
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file3
 create mode 100644 meta-skeleton/recipes-skeleton/useradd/useradd-example/file4
 create mode 100644 meta/classes/useradd.bbclass



