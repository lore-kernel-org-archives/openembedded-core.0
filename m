Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1ScJSQ-0001yb-9D
	for openembedded-core@lists.openembedded.org;
	Wed, 06 Jun 2012 18:51:42 +0200
Received: from localhost (c-50-137-42-92.hsd1.or.comcast.net [50.137.42.92])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id B88A530408
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jun 2012 12:41:09 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  6 Jun 2012 09:41:01 -0700
Message-Id: <cover.1339000756.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: B88A530408.A20C3
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] qemu WAN networking fix
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
X-List-Received-Date: Wed, 06 Jun 2012 16:51:42 -0000

Hello,

This fix allows core-image-sato images to access the WAN.

It should be applied to both oe-core master and the denzil branch.

Fixes Yocto bug #2329.

Scott

The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b3568:

  perl: Allow perl to cross build and native build in a directory named "t" (2012-06-05 23:02:20 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/qemu-networking-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/qemu-networking-fix

Scott Garman (1):
  runqemu-ifup: enable arp proxying

 scripts/runqemu-ifup |    1 +
 1 file changed, 1 insertion(+)

-- 
1.7.9.5



