Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1UAoer-0007z5-V0
	for openembedded-core@lists.openembedded.org;
	Wed, 27 Feb 2013 22:35:27 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1RLJ48F018402
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Feb 2013 13:19:05 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.328.9;
	Wed, 27 Feb 2013 13:19:02 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 27 Feb 2013 15:19:00 -0600
Message-ID: <cover.1361999203.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] pseudo 1.5.1
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
X-List-Received-Date: Wed, 27 Feb 2013 21:35:28 -0000
Content-Type: text/plain

It turns out that I forgot the part where it would be useful to be
able to temporarily suppress the suppression of fsync()-type calls.
Also the documentation had bitrotted (no references to FASTOP or to
the fsync stuff, or to some other changes), so I fixed a few obvious
gaps.

This should have no immediate functional change on anything in oe-core,
but it allows for specifying
	PSEUDO_ALLOW_FSYNC=1 <command>
and getting fsync behavior from that command.

There's also a performance improvement in the case where NDEBUG is
defined, which is "never" in our context.

This is a lowish-priority change for oe-core, and in any event I don't
believe the tarballs are up on the Yocto servers yet, but we need it
internally and paperwork's easier if I submit it and then backport it.
(I do recommmend it, though, because this makes it a LOT easier to
check whether the fsync behavior is affecting something.)

The following changes since commit 8e69f0ea42505e8f703893e18d73658b83d3b046:
  Constantin Musca (1):
        augeas: change SRC_URI

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/pseudo151
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/pseudo151

Peter Seebach (1):
  Update pseudo to 1.5.1

 .../pseudo/{pseudo_1.5.bb => pseudo_1.5.1.bb}      |    4 ++--
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)
 rename meta/recipes-devtools/pseudo/{pseudo_1.5.bb => pseudo_1.5.1.bb} (52%)



