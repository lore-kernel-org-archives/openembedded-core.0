Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TPAqz-0002uI-Ev
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Oct 2012 13:35:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q9JBLaPa013153
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 19 Oct 2012 04:21:36 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.309.2; Fri, 19 Oct 2012 04:21:36 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <richard.purdie@intel.com>
Date: Fri, 19 Oct 2012 19:22:03 +0800
Message-ID: <cover.1350645464.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] Fix (nativesdk-)perl dependency issues
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
X-List-Received-Date: Fri, 19 Oct 2012 11:35:01 -0000
Content-Type: text/plain

The following changes since commit e6e2b9bd66100c078c029ca7e34829cf1dfb5490:

  documentation: poky-ref-manual - edits to MACHINE type variables. (2012-10-18 12:15:04 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/fix-perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/fix-perl

Kang Kai (1):
  nativesdk-autoconf: add dependencies

Robert Yang (1):
  perl: fix dependecies

 meta/recipes-devtools/autoconf/autoconf.inc     |    4 +++-
 meta/recipes-devtools/autoconf/autoconf_2.69.bb |    2 +-
 meta/recipes-devtools/perl/perl_5.14.2.bb       |   12 +++++++++---
 3 files changed, 13 insertions(+), 5 deletions(-)

-- 
1.7.5.4



