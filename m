Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QtEZw-0000RW-JO
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 10:00:52 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7G7uA95021874
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 00:56:10 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 16 Aug 2011 00:56:09 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Aug 2011 15:56:13 +0800
Message-ID: <cover.1313479193.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] perl-native: Update 'find_perl()' to find the perl wrapper
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
X-List-Received-Date: Tue, 16 Aug 2011 08:00:53 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Fix Bugs: [YOCTO #1157] [YOCTO #829]

This happens to the packages which use MakeMaker.pm to generate their
Makefiles, the path to 'PERL/FULLPERL' should be perl wrapper instead
of 'perl.real'.

The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:
  Richard Purdie (1):
        Fixup remaining bb.msg.domain users

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/perl

Wenzong Fan (1):
  perl-native: Update 'find_perl()' to find the perl wrapper

 .../perl/perl-5.12.3/MM_Unix.pm.patch              |   12 ++++++++++++
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    5 +++--
 2 files changed, 15 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch



