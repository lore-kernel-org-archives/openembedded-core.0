Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SUMSE-0002hu-Fd
	for openembedded-core@lists.openembedded.org;
	Tue, 15 May 2012 20:26:39 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q4FIGa1V021278
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2012 11:16:36 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 15 May 2012 11:16:36 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 15 May 2012 13:16:33 -0500
Message-ID: <cover.1337105658.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/2] tcmode-external-csl: Allow overriding some key values
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
X-List-Received-Date: Tue, 15 May 2012 18:26:41 -0000
Content-Type: text/plain

This tiny little set of ?= changes lets me use a different CS binary
toolchain than the one being supported by the external-csl feature by
default, allowing us to share more code.

Also I improved an error message.  (Side note:  Sorry if it's spammy
to have a separate patch for it, but I couldn't convince myself that these
two changes were doing the same thing.)

The following changes since commit 01dea384924293d0f99723073277bf6b1f4c7976:
  Christopher Larson (1):
        tcmode-external-csl: handle TUNE_PKGARCH=core2

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/toolchain
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchain

Peter Seebach (2):
  tcmode-external-csl.inc: Allow for overrides
  tcmode-external-csl.inc: specify the path you couldn't find

 meta/conf/distro/include/tcmode-external-csl.inc |   20 ++++++++++----------
 1 files changed, 10 insertions(+), 10 deletions(-)



