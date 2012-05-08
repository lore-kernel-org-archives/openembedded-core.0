Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1SRlmC-0004Z9-RN
	for openembedded-core@lists.openembedded.org;
	Tue, 08 May 2012 16:52:32 +0200
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 26D0130405
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 May 2012 10:42:36 -0400 (EDT)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Tue,  8 May 2012 07:42:44 -0700
Message-Id: <cover.1336488076.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 26D0130405.4AF5D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] openssl INC_PR fix
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
X-List-Received-Date: Tue, 08 May 2012 14:52:33 -0000

Hello,

Andreas pointed out that I broke openssl in out of tree scenarios
by resetting INC_PR during my last recipe upgrade, so this restores
it to its previous, working value.

Scott

The following changes since commit 616552506708d6dbb35a716be5bdff345edf2be0:

  xcb-util-image: Add missing dependency on xcb-util (2012-05-08 14:44:38 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/openssl-fix
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/openssl-fix

Scott Garman (1):
  openssl: fix incorrect INC_PR

 meta/recipes-connectivity/openssl/openssl.inc |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.5.4



