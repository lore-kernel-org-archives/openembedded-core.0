Return-Path: <scott.a.garman@intel.com>
Received: from masterfoo.zenlinux.com (masterfoo.zenlinux.com [207.192.74.254])
	by mail.openembedded.org (Postfix) with ESMTP id 67FE56ED34
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 19:05:18 +0000 (UTC)
Received: from localhost (c-24-20-145-95.hsd1.or.comcast.net [24.20.145.95])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 43E042FDD7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 15 Feb 2014 14:04:56 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sat, 15 Feb 2014 11:04:46 -0800
Message-Id: <cover.1392490959.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.8.3.2
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 43E042FDD7.A9557
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] runqemu fix to skip tap devices
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
X-List-Received-Date: Sat, 15 Feb 2014 19:05:18 -0000

Hello,

This pull request adds the ability for runqemu to skip tap devices. It
was developed to resolve bug #5815.

Scott

The following changes since commit d3ba249aa1bf68aaeed226e934a4f4d5b7a19286:

  package_manager.py: move multilib prefix list computation function to RpmIndexer (2014-02-14 22:57:57 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib sgarman/runqemu-skiptap-oe
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=sgarman/runqemu-skiptap-oe

Scott Garman (1):
  runqemu: add ability to skip using an existing tap device

 scripts/runqemu-internal | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
1.8.3.2


