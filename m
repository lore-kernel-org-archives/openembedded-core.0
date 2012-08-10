Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SzyL3-0004gG-1B
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Aug 2012 01:09:53 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q7AMw15W014487
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Aug 2012 15:58:01 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Fri, 10 Aug 2012 15:58:01 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 10 Aug 2012 17:57:58 -0500
Message-ID: <cover.1344639098.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/2] Make PNBLACKLIST work with multilibs, code cleanup
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
X-List-Received-Date: Fri, 10 Aug 2012 23:09:53 -0000
Content-Type: text/plain

First, make PNBLACKLIST work with multilib builds.

Second, just some quick cleanup of the multilib logic that handles
PREFERRED_PROVIDER, PREFERRED_VERSION, and now also PNBLACKLIST.

The following changes since commit 5290e82ecef08b5e573d7442627276d7b42c6b93:
  Saul Wold (1):
        foomatic: fix perl path for target

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/blacklist
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/blacklist

Peter Seebach (2):
  base.bbclass: Expand PNBLACKLIST across multilibs too
  base.bbclass: Restructure multilib variable cloning

 meta/classes/base.bbclass |   60 +++++++++++++++++++++++++-------------------
 1 files changed, 34 insertions(+), 26 deletions(-)



