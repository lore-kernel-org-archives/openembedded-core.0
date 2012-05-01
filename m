Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Peter.Seebach@windriver.com>) id 1SPGIz-0001gD-Gg
	for openembedded-core@lists.openembedded.org;
	Tue, 01 May 2012 18:52:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q41GgHgo016703
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 1 May 2012 09:42:17 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.64) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 1 May 2012 09:42:17 -0700
From: Peter Seebach <peter.seebach@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 May 2012 11:42:14 -0500
Message-ID: <cover.1335890271.git.peter.seebach@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/2] sanity.bblass: Initial toolchain sanity checks
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
X-List-Received-Date: Tue, 01 May 2012 16:52:01 -0000
Content-Type: text/plain

Changes galore based on Richard Purdie's comments.  Specific notes:

* I've removed the check against the multilib 'lib'.  Since at least
  two people have reacted with surprise to being told it didn't work,
  I'm assuming that's a bug I should consider separately, not a feature
  I should sanity-check.
* I've added/improved documentation changes.
* I've kept the TUNEABI stuff on the grounds that I think having a stable
  mechanism for this will be better than having every OSV reinvent it in
  a subtly incompatible or confusing way.

The rationale on the TUNEABI thing is that so far as I can tell, at least
MV, MG, and WR have plans in which a thing like this would be used, and if
I have understood peoples' comments, this would provide the functionality
they need.  If we all do it the same way, life is better for all the
prospective users, and anyone else who comes along doing prebuilts will
also presumably benefit.  I also implemented it such that you have to go
looking for it to get affected by it; the intent is to have no impact
on people who don't need it.

The following changes since commit 35b5fb2dd2131d4c7dc6635c14c6e08ea6926457:
  Saul Wold (1):
        eglibc-package: remove /var

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib seebs/toolchains
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=seebs/toolchains

Peter Seebach (2):
  conf/machine: Clean up configuration values.
  sanity.bbclass: Implement initial toolchain sanity checks

 meta/classes/sanity.bbclass                      |   76 ++++++++++++++++++++++
 meta/conf/documentation.conf                     |   13 ++++
 meta/conf/machine/include/README                 |    4 +
 meta/conf/machine/include/arm/arch-armv5-dsp.inc |    1 +
 meta/conf/machine/include/arm/arch-armv7a.inc    |    2 +-
 meta/conf/machine/include/ia32/arch-ia32.inc     |    2 +-
 meta/conf/machine/include/mips/arch-mips.inc     |    6 +-
 meta/conf/machine/include/tune-c3.inc            |    2 +-
 8 files changed, 100 insertions(+), 6 deletions(-)



