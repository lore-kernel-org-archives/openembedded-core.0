Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1TQlM8-0000Ms-JB
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Oct 2012 22:45:44 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9NKWGo0029133
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Oct 2012 13:32:16 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Tue, 23 Oct 2012 13:32:15 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 23 Oct 2012 15:32:13 -0500
Message-ID: <cover.1351024134.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] Make n32 survive insane.bbclass and multilib_header
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
X-List-Received-Date: Tue, 23 Oct 2012 20:45:45 -0000
Content-Type: text/plain

The multilib_header fixup has code in the generated header to handle
n32, but doesn't detect n32 headers. Meanwhile, insane.bclass rejects
n32 binaries for being 32-bit binaries in a mips64 build. Solution: Use
an ABI suffix, and check for it in appropriate places.

Signed-off-by: Peter Seebach <peter.seebach@windriver.com>

The following changes since commit 754ddbf1c57e6b9d0650498538840effebe4f7a2:
  Ross Burton (1):
        libical: remove

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/mips64
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/mips64

Peter Seebach (1):
  insane.bbclass and friends: Fix sanity checks and multlib headers for
    n32

 meta/classes/insane.bbclass                  |    4 +++
 meta/classes/multilib_header.bbclass         |   32 +++++++++++++++++--------
 meta/conf/machine/include/mips/arch-mips.inc |    1 +
 3 files changed, 27 insertions(+), 10 deletions(-)



