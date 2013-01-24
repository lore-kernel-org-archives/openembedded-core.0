Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TyIrQ-0001MC-Oo
	for openembedded-core@lists.openembedded.org;
	Thu, 24 Jan 2013 10:12:42 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0O8v7ZF029040
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 24 Jan 2013 00:57:07 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Thu, 24 Jan 2013 00:57:06 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <ross.burton@intel.com>
Date: Thu, 24 Jan 2013 16:58:14 +0800
Message-ID: <cover.1359016228.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] [danny] fix perl security issue
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
X-List-Received-Date: Thu, 24 Jan 2013 09:12:43 -0000
Content-Type: text/plain

The following changes since commit 47b0864fbd65746558d8186450c182d98bac78ca:

  tools: Updated sed file to process links in mega-manual (2013-01-07 14:43:31 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/fix-perl-4danny
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/fix-perl-4danny

Kang Kai (1):
  perl: fix security issue

 .../perl/perl-5.14.2/perl-fix-CVE-2012-5195.patch  |   41 ++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.14.2.bb          |    3 +-
 2 files changed, 43 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-5.14.2/perl-fix-CVE-2012-5195.patch

-- 
1.7.5.4



