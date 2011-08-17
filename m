Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1QtbCu-0008HG-MA
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 10:10:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7H85vrM015431
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 Aug 2011 01:05:57 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 17 Aug 2011 01:05:56 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Aug 2011 16:06:01 +0800
Message-ID: <cover.1313567770.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Cc: wfan@windriver.com
Subject: [PATCH v2 0/1] perl-native: Update find_perl to find the perl wrapper
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
X-List-Received-Date: Wed, 17 Aug 2011 08:10:37 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

v2 updates: Add patch header to the 'MM_Unix.pm.patch'

The following changes since commit a21ff559e7c93e9da61104f4a33e42e6004189fd:
  Richard Purdie (1):
        Fixup remaining bb.msg.domain users

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/perl

Wenzong Fan (1):
  perl-native: Update find_perl to find the perl wrapper

 .../perl/perl-5.12.3/MM_Unix.pm.patch              |   22 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl-native_5.12.3.bb   |    5 ++-
 2 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.12.3/MM_Unix.pm.patch



