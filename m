Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1Sqpja-0004jD-2R
	for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 20:09:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6GHw63U005516
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2012 10:58:06 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 16 Jul 2012 10:58:05 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2012 12:58:04 -0500
Message-ID: <cover.1342461305.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] tune-ppc476.inc: support ppc476
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
X-List-Received-Date: Mon, 16 Jul 2012 18:09:26 -0000
Content-Type: text/plain

One of the BSPs we support uses a 476-family chip, so we have a
tuning for it in our custom toolchain layer. Sending a tuning upstream
too because someone else might want it. Has been lightly tested with
the oe-core toolchain; it at least allows compiles.

The following changes since commit 20405bdab18b7a2b101f818e72863d289d5945e4:
  Bruce Ashfield (1):
        linux-yocto/3.0: perf scripting support

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/ppc476
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/ppc476

Peter Seebach (1):
  tune-ppc476.inc: Support ppc476

 meta/conf/machine/include/tune-ppc476.inc |   14 ++++++++++++++
 1 files changed, 14 insertions(+), 0 deletions(-)
 create mode 100644 meta/conf/machine/include/tune-ppc476.inc



