Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1SsA11-0003Fp-Ru
	for openembedded-core@lists.openembedded.org;
	Fri, 20 Jul 2012 12:00:56 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6K9nUoQ024130
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jul 2012 02:49:30 -0700 (PDT)
Received: from usp-ub10.corp.ad.wrs.com (128.224.163.69) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Fri, 20 Jul 2012 02:49:30 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 20 Jul 2012 17:49:15 +0800
Message-ID: <cover.1342772908.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/2] package_rpm and createrepo fixes
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
X-List-Received-Date: Fri, 20 Jul 2012 10:00:56 -0000
Content-Type: text/plain

Hi Saul,

For the error:

dbconfig.c:493: db3New: Assertion `dbOpts != ((void *)0) && *dbOpts != '\0'' failed.

The dbOpts is the value of _dbi_config_ or _dbi_config which are defined
in tmp/sysroots/i686-linux/usr/lib/rpm/macros, I can't reproduce it in
a normal build (on Ubuntu 10.10, Fedora 17 64bit, Ubuntu 12.04 64bit),
the error would happen when manually remove i686-linux/usr/lib/rpm/macros,
(but it should be there since the librpmdb-5.4.so is ready in a normal
build).

These two patches are used for fixing other issues of createrepo.

// Robert

The following changes since commit 64f7feb5c37d06e1985c59106cf2f7cd286fd0b8:

  EFI: Make installer EFI aware (2012-07-19 17:49:48 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/createrepo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/createrepo

Robert Yang (2):
  package_rpm: DEPLOY_DIR_RPM must exist before make index
  createrepo 0.4.11: fix the RDEPENDS

 meta/classes/package_rpm.bbclass                   |    4 ++--
 .../createrepo/createrepo_0.4.11.bb                |    4 +++-
 2 files changed, 5 insertions(+), 3 deletions(-)



