Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SOxQy-0005p0-CV
	for openembedded-core@lists.openembedded.org;
	Mon, 30 Apr 2012 22:43:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q3UKXG0B012587
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Apr 2012 13:33:16 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 30 Apr 2012 13:33:16 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 30 Apr 2012 15:33:13 -0500
Message-ID: <cover.1335815704.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [v3] [PATCH 0/2] toolchain sanity checks, revised
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
X-List-Received-Date: Mon, 30 Apr 2012 20:43:00 -0000
Content-Type: text/plain

While preparing to argue persuasively that the conflict check was as
simple as it could reasonably be, I discovered that this was in fact
totally wrong.  It's now (I hope) a lot clearer, and probably even
more efficient.

The following changes since commit b8dc9182ed8959ce5a6aa285c3c7f78df2432ac3:
  Richard Purdie (1):
        qt-4.8.1: Fix compile failures on qemux86

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/toolchains
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchains

Peter Seebach (2):
  tune-sh4.inc: Fix spelling of big-endian feature set
  sanity.bbclass: Implement initial toolchain sanity checks

 meta/classes/sanity.bbclass                      |   67 ++++++++++++++++++++++
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
 11 files changed, 88 insertions(+), 10 deletions(-)



