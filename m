Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1RcPva-0006Rd-Cn
	for openembedded-core@lists.openembedded.org;
	Mon, 19 Dec 2011 00:13:58 +0100
Received: from localhost (c-76-115-40-64.hsd1.or.comcast.net [76.115.40.64])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 0C7BC2FE8A
	for <openembedded-core@lists.openembedded.org>;
	Sun, 18 Dec 2011 18:06:52 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 18 Dec 2011 15:06:56 -0800
Message-Id: <cover.1324249522.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.5.4
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 0C7BC2FE8A.EAD0D
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/1] Add missing SUMMARY fields to various recipes
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
X-List-Received-Date: Sun, 18 Dec 2011 23:13:59 -0000

Hello,

In response to Shane's request for recipe maintainers to update recipes
missing SUMMARY fields, this should take care of my list.

Scott

The following changes since commit 3e05acab1c119a3b2a4703ea8729cc768935d36e:

  license.bbclass: remove bashism (2011-12-16 16:50:39 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib sgarman/update-summary-final
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/update-summary-final

Scott Garman (1):
  Add missing SUMMARY fields to various recipes

 .../nfs-utils/libnfsidmap_0.24.bb                  |    3 ++-
 .../recipes-devtools/dosfstools/dosfstools_2.11.bb |    2 +-
 .../qemu/qemu-helper-nativesdk_1.0.bb              |    3 ++-
 meta/recipes-extended/grep/grep_2.9.bb             |    1 +
 meta/recipes-support/icu/icu-3.6.inc               |    1 +
 meta/recipes-support/libevent/libevent_1.4.14b.bb  |    3 ++-
 6 files changed, 9 insertions(+), 4 deletions(-)

-- 
1.7.5.4



