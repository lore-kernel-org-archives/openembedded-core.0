Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Re94i-0006vP-UX
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 18:38:33 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0E1B02FEF5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2011 12:31:21 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 23 Dec 2011 09:31:15 -0800
Message-Id: <cover.1324661415.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0E1B02FEF5.35530
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/2] Upgrade chrpath and libevent
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
X-List-Received-Date: Fri, 23 Dec 2011 17:38:33 -0000

Hello,

This pull request upgrades the chrpath and libevent recipes. It has
been build-tested on all 5 of our qemu architectures.

Scott

The following changes since commit c38693f78c968ab5f4bb557c20d1c8c55393ed6b:

  opkg: Fix installation order in feeds with mutiple providers of packages (2011-12-22 22:38:09 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/recipe-upgrades-final
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/recipe-upgrades-final

Scott Garman (2):
  chrpath: upgrade to 0.14
  libevent: upgrade to 2.0.16

 meta/recipes-devtools/chrpath/chrpath_0.13.bb     |   23 ---------------------
 meta/recipes-devtools/chrpath/chrpath_0.14.bb     |   23 +++++++++++++++++++++
 meta/recipes-support/libevent/libevent_1.4.14b.bb |   19 -----------------
 meta/recipes-support/libevent/libevent_2.0.16.bb  |   22 ++++++++++++++++++++
 4 files changed, 45 insertions(+), 42 deletions(-)
 delete mode 100644 meta/recipes-devtools/chrpath/chrpath_0.13.bb
 create mode 100644 meta/recipes-devtools/chrpath/chrpath_0.14.bb
 delete mode 100644 meta/recipes-support/libevent/libevent_1.4.14b.bb
 create mode 100644 meta/recipes-support/libevent/libevent_2.0.16.bb

-- 
1.7.5.4



