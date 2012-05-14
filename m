Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SU4Ee-0005Jq-Jh
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 00:59:24 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4EMnOWJ014810
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 15:49:24 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 14 May 2012 15:49:24 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 May 2012 17:49:22 -0500
Message-ID: <cover.1337035611.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] runqemu: fix the tests for core-image-*
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
X-List-Received-Date: Mon, 14 May 2012 22:59:25 -0000
Content-Type: text/plain

This replaces the =~ tests with a dash-friendly shell idiom which is,
IMHO, comparably readable (I actually like it better) and also works
on more versions of bash.

A side note:  Do we really need a more complicated test instead of
just "*core-image-*"?

The following changes since commit 36d1717e2ad4ca1620ee9f01b524b5ff2f499b26:
  Paul Eggleton (1):
        classes/rootfs_*: fix splitting package dependency strings

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/cleanup
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/cleanup

Peter Seebach (1):
  runqemu: replace bashism with working shell idiom

 scripts/runqemu |   13 +++++++------
 1 files changed, 7 insertions(+), 6 deletions(-)



