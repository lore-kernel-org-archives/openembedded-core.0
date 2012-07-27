Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Susfv-0008Qw-83
	for openembedded-core@lists.openembedded.org;
	Sat, 28 Jul 2012 00:06:23 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6RLsoeD020465
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Jul 2012 14:54:50 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 27 Jul 2012 14:54:49 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Jul 2012 16:54:47 -0500
Message-ID: <cover.1343425855.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] Update pseudo to 1.4 (target improvements)
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
X-List-Received-Date: Fri, 27 Jul 2012 22:06:23 -0000
Content-Type: text/plain

Someone managed to do something which caused pseudo to try to build
on ARM, where -m32 doesn't work, and I looked at the sort of half-baked
--arch fix in tree, concluded I hated it, and redid it. So as of 1.4,
pseudo now has support for a --cflags configure option, so the build system
can pass in its own cflags instead of relying on pseudo being able to
guess the correct way to change bit widths around.

It still relies on the guesswork for the native build, but at least so
far that's always x86. And at least we now have the correct tool so that,
if we ever do develop a clean way to create the cflags for a different
width, we'll be able to pass them in without major alterations.

I also changed the upstream to point to the yoctoproject.org git server,
which I've been using as the primary upstream for a couple of months
now. Verified that at least pseudo-native can build from both the _git
and 1.4 recipes.

The following changes since commit 651b223c5fc93c7504e304e954b9ae4640ed47c6:
  Paul Eggleton (1):
        usbutils: avoid dependency on bash

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo

Peter Seebach (1):
  pseudo.inc/pseudo_1.4.bb: update pseudo to 1.4

 meta/recipes-devtools/pseudo/pseudo.inc      |   12 +++++++++---
 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb |    8 --------
 meta/recipes-devtools/pseudo/pseudo_1.4.bb   |    8 ++++++++
 meta/recipes-devtools/pseudo/pseudo_git.bb   |    8 ++++----
 4 files changed, 21 insertions(+), 15 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo_1.3.1.bb
 create mode 100644 meta/recipes-devtools/pseudo/pseudo_1.4.bb



