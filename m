Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SNv6P-000364-0H
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Apr 2012 02:01:29 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3RNpm4E001476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Apr 2012 16:51:48 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 27 Apr 2012 16:51:48 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Apr 2012 18:51:45 -0500
Message-ID: <cover.1335569869.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/2] sanity.bbclass: Toolchain sanity checks
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
X-List-Received-Date: Sat, 28 Apr 2012 00:01:29 -0000
Content-Type: text/plain

This is a somewhat cleaned up and fixed version of the toolchain sanity
checks I've been working on.  (Also my first attempt to submit to OE, so
I have probably made humorous mistakes.)

Big outstanding issue:  Is it a bug that specifying the name "lib" for
a multilib causes parse errors in at least one package?  If this is a
package bug, I should find out how to fix the package(s) (libxcb blew
up for me) instead of making that check for multilibs.

Other issue:  The TUNEABI stuff is preliminary, and I'm not totally sure
whether it will work in practice.  But it won't break anything unless
you go out of your way to enable it.

Mark Hatle's already been over this once, but second opinions are always
welcome.

The following changes since commit 5a1f172d35be610688842a8a9a84f24edb9aeb51:
  Martin Jansa (1):
        bitbake.conf: use TUNE_PKGARCH instead of TARGET_ARCH in SDK_NAME

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/toolchains
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchains

Peter Seebach (2):
  tune-sh4.inc: Fix spelling of big-endian feature set
  sanity.bbclass: Implement initial toolchain sanity checks

 meta/classes/sanity.bbclass                      |   69 ++++++++++++++++++++++
 meta/conf/documentation.conf                     |    6 ++
 meta/conf/machine/include/README                 |    4 +
 meta/conf/machine/include/arm/arch-armv5-dsp.inc |    1 +
 meta/conf/machine/include/arm/arch-armv7a.inc    |    2 +-
 meta/conf/machine/include/ia32/arch-ia32.inc     |    2 +-
 meta/conf/machine/include/mips/arch-mips.inc     |    6 +-
 meta/conf/machine/include/tune-c3.inc            |    2 +-
 meta/conf/machine/include/tune-sh3.inc           |    2 +-
 meta/conf/machine/include/tune-sh4.inc           |    4 +-
 meta/conf/machine/include/tune-xscale.inc        |    2 +-
 11 files changed, 90 insertions(+), 10 deletions(-)



