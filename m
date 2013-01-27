Received: from masterfoo.zenlinux.com ([207.192.74.254])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1Tzc3z-00023m-Di
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 00:55:03 +0100
Received: from localhost (c-76-105-137-48.hsd1.or.comcast.net [76.105.137.48])
	(using TLSv1 with cipher DHE-RSA-AES128-SHA (128/128 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id 6FA4A2FD91
	for <openembedded-core@lists.openembedded.org>;
	Sun, 27 Jan 2013 18:39:18 -0500 (EST)
From: Scott Garman <scott.a.garman@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Sun, 27 Jan 2013 15:39:08 -0800
Message-Id: <cover.1359329823.git.scott.a.garman@intel.com>
X-Mailer: git-send-email 1.7.9.5
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: 6FA4A2FD91.E70E8
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-SpamCheck: not spam
X-MasterFoo-MailScanner-From: scott.a.garman@intel.com
X-Spam-Status: No
Subject: [PATCH 0/4] denzil pull request
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 27 Jan 2013 23:55:03 -0000

Hello,

This is a pull request for denzil. It includes a bitbake fix from
MatthewM (poky-based tree only) and some Fedora 18 build fixes from
Koen.

Build status: 100% Green.

nightly-x86: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86/builds/885

nightly-x86-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-lsb/builds/214

nightly-x86-64: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64/builds/810

nightly-x86-64-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-x86-64-lsb/builds/209

nightly-arm: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm/builds/814

nightly-arm-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-arm-lsb/builds/207

nightly-mips: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips/builds/786

nightly-mips-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-mips-lsb/builds/213

nightly-ppc: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc/builds/765

nightly-ppc-lsb: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-ppc-lsb/builds/217

nightly-non-gpl3: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-non-gpl3/builds/443

nightly-multilib: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-multilib/builds/444

nightly-tiny: Green
http://autobuilder.yoctoproject.org:8010/builders/nightly-tiny/builds/420

build-appliance: Green
http://autobuilder.yoctoproject.org:8010/builders/build-appliance/builds/220

eclipse-plugin: Green
http://autobuilder.yoctoproject.org:8010/builders/eclipse-plugin/builds/763


The following changes since commit 0a9e8bf35afd5990c1b586bba5eb68f643458a4b:

  build-appliance-image: Bump SRCREV (2013-01-04 22:23:34 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib sgarman/denzil-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=sgarman/denzil-next

Martin Jansa (1):
  bison: move remove-gets.patch to BASE_SRC_URI, it's needed for
    bison-native too if host has (e)glibc-2.16

Nitin A Kamble (1):
  libtasn1: fix build with automake 1.12

Saul Wold (2):
  libtasn1: Update to 2.12
  libtasn1: Upgrade to 2.13

 meta/recipes-devtools/bison/bison_2.5.bb           |    4 +--
 .../libtasn1/libtasn1_fix_for_automake_1.12.patch  |   28 ++++++++++++++++++++
 .../gnutls/{libtasn1_2.11.bb => libtasn1_2.13.bb}  |    8 +++---
 3 files changed, 35 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-support/gnutls/libtasn1/libtasn1_fix_for_automake_1.12.patch
 rename meta/recipes-support/gnutls/{libtasn1_2.11.bb => libtasn1_2.13.bb} (65%)

-- 
1.7.9.5



