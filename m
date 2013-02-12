Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1U5OGW-0006b7-K0
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Feb 2013 23:23:55 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1CM7rrK005954
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Feb 2013 14:07:53 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Tue, 12 Feb 2013 14:07:51 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Feb 2013 16:07:50 -0600
Message-ID: <cover.1360706344.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] libc-common.bbclass: DEBIAN_NAMES expansion
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
X-List-Received-Date: Tue, 12 Feb 2013 22:24:01 -0000
Content-Type: text/plain

DEBIAN_NAMES ought to work for multilibs, and it ought to handle all
the libc packages, not just the base, -dev, and -dbg packages.

I do have one concern about this: The last three lines of the function,
setting up PROVIDE for libc-dbg... I do not know whether we still need
or want those.  The comment about compatibility with "old" libc makes
me think this may be obsolete.

Testing: Built for multilibs, confirmed that various things seem to
work.  The specific motivation was that the -doc packages weren't
getting installed by the doc-pkgs feature.

The following changes since commit c58e6cf352774e147038e6543ac95ab0060f2327:
  Anders Roxell (1):
        distro_check: Remove creation of empty Meego filelist.

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/debiannames
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/debiannames

Peter Seebach (1):
  libc-common.bbclass: rename ALL the packages

 meta/classes/libc-common.bbclass |   19 +++++++++++++------
 1 files changed, 13 insertions(+), 6 deletions(-)



