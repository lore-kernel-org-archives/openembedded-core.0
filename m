Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SPOmQ-0004Nl-AM
	for openembedded-core@lists.openembedded.org;
	Wed, 02 May 2012 03:54:58 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q421jDLa016606
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 18:45:13 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 1 May 2012 18:45:13 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 May 2012 20:45:09 -0500
Message-ID: <cover.1335922726.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: v4 or so [PATCH 0/3] sanity.bbclass and friends: toolchain sanity
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
X-List-Received-Date: Wed, 02 May 2012 01:54:58 -0000
Content-Type: text/plain

And yes, I'm aware that "toolchain sanity checks" is sort of a
self-defeating concept.

Okay, cleanups:
* Now checking MULTILIB_VARIANTS, not MULTILIBS.  Simpler and less indented.
* Added a third commit to do the BBCLASSEXTEND checks since those seem like
  a good idea, and it's less work to do it than to create a todo item.
* Did you know that, despite a lot of this being Python, you can't use
  triple-quote strings in documentation.conf?  I didn't, and apparently
  that "fix" went in untested.  (Also the addition of duplicate but indented
  copies of two later lines, which didn't parse.  Looks like I got a bit
  careless with my cut and paste there.)

The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:
  Saul Wold (1):
        eglibc-package: remove /var

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/toolchains
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchains

Peter Seebach (3):
  conf/machine: Clean up configuration values.
  sanity.bbclass: Implement initial toolchain sanity checks
  sanity.bbclass: Check for bogus values in BBCLASSEXTEND

 meta/classes/sanity.bbclass                      |   86 ++++++++++++++++++++++
 meta/conf/documentation.conf                     |    9 ++
 meta/conf/machine/include/README                 |    4 +
 meta/conf/machine/include/arm/arch-armv5-dsp.inc |    1 +
 meta/conf/machine/include/arm/arch-armv7a.inc    |    2 +-
 meta/conf/machine/include/ia32/arch-ia32.inc     |    2 +-
 meta/conf/machine/include/mips/arch-mips.inc     |    6 +-
 meta/conf/machine/include/tune-c3.inc            |    2 +-
 8 files changed, 106 insertions(+), 6 deletions(-)



