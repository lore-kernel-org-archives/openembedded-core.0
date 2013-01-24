Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TyWov-0002nq-CL
	for Openembedded-core@lists.openembedded.org;
	Fri, 25 Jan 2013 01:07:01 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0ONpQKc014415
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2013 15:51:26 -0800 (PST)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Thu, 24 Jan 2013 15:51:26 -0800
From: Peter Seebach <peter.seebach@windriver.com>
To: "Openembedded-core@lists.openembedded.org"
	<Openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2013 17:51:24 -0600
Message-ID: <cover.1359071327.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] installed but unpackaged... foul lies and calumnies
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
X-List-Received-Date: Fri, 25 Jan 2013 00:07:01 -0000
Content-Type: text/plain

If a FILES_* variable has an unqualified path in it, this can result in
a file  being sucessfully packaged, and yet, still showing up as
installed-but-unpackaged. Note: I had weird build problems with my oe-core
tree, but I tested this in a nearby poky tree and it worked there, anyway.

The following changes since commit 2e2a91025ca9c113365c810ce08b48201fe792b8:
  Khem Raj (1):
        systemd: Fix build on ppc

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/unpackaged
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/unpackaged

Peter Seebach (1):
  package.bbclass: Consistency between packaging and unpackaged check

 meta/classes/package.bbclass |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)



