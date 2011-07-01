Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237] helo=rex)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard@tim.rpsys.net>) id 1QcfX4-0007pp-ND
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 17:21:26 +0200
Received: by rex (Postfix, from userid 1000)
	id BA9202FE0B; Fri,  1 Jul 2011 16:17:17 +0100 (BST)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: openembedded-core@lists.openembedded.org
Date: Fri,  1 Jul 2011 16:17:10 +0100
Message-Id: <cover.1309533254.git.richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 1.7.4.1
Subject: [PATCH 0/6] QA Warnings Cleanup
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
X-List-Received-Date: Fri, 01 Jul 2011 15:21:26 -0000

The following changes since commit 40ecaf6a59ba61e72d29d7e677197ef37c998408:

  uclibc: Add default uClibc.machine files (2011-07-01 00:40:10 +0100)

are available in the git repository at:
  git://git.openembedded.org/openembedded-core-contrib rpurdie/master
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rpurdie/master

and clean up a variety of different QA warning issues

Richard  Purdie (6):
  cairo: Clean up packaging and fix warnings
  kernel.bbclass: Ensure kernel/* internal sysroot working directory
    don't get packaged
  libpcre: Fix QA warnings
  python: Ensure libpython.so ends up in the .dev package
  beecrypt: Fix up packaging QA warnings
  insane.bbclass: Start to rework this so specific checks can be easily
    made warnings/errors

 meta/classes/insane.bbclass                     |  216 +++++++++--------------
 meta/classes/kernel.bbclass                     |    6 +
 meta/recipes-devtools/python/python_2.6.6.bb    |    4 +-
 meta/recipes-graphics/cairo/cairo_1.10.2.bb     |   44 ++---
 meta/recipes-support/beecrypt/beecrypt_4.2.1.bb |    4 +
 meta/recipes-support/libpcre/libpcre_8.12.bb    |    8 +-
 6 files changed, 112 insertions(+), 170 deletions(-)

-- 
1.7.4.1



