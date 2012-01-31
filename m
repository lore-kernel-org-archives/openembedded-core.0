Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Rs3sA-00017H-4q
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 03:55:06 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 9F41430475
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jan 2012 21:47:00 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 30 Jan 2012 18:47:01 -0800
Message-Id: <cover.1327977970.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 9F41430475.AA95A
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] e2fsprogs streamlining
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
X-List-Received-Date: Tue, 31 Jan 2012 02:55:06 -0000

Hello,

Koen Kooi suggested that the quotefix patch was not needed,
and the build of the recipe should now be multithread-safe.
My testing has confirmed this.

The following changes since commit d7b13cd42ab8d5f44f97e119b73ec2e363677d26:

  useradd.bbclass: Fix missing quote (2012-01-27 23:57:33 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/e2fsprogs-final
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/e2fsprogs-final

Scott Garman (1):
  e2fsprogs: remove unneeded patch and re-enable PARALLEL_MAKE

 .../e2fsprogs/e2fsprogs-1.42/quotefix.patch        |   44 --------------------
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.bb  |    5 +--
 2 files changed, 1 insertions(+), 48 deletions(-)
 delete mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs-1.42/quotefix.patch

-- 
1.7.5.4



