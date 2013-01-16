Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TvPvV-0008Mp-63
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 11:09:02 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0G9rZhB012617
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 16 Jan 2013 01:53:35 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Wed, 16 Jan 2013 01:53:33 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Wed, 16 Jan 2013 17:54:41 +0800
Message-ID: <cover.1358322551.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] fix perl installed but not shipped issue
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
X-List-Received-Date: Wed, 16 Jan 2013 10:09:05 -0000
Content-Type: text/plain

The following changes since commit 9eb88ceb39b7d0b8ddc6487e61ce8edadef10ec4:

  connman: fixed init script so connman can runs over nfs (2013-01-15 08:12:05 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-perl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-perl

Kang Kai (1):
  perl: fix installed but not shipped issue

 meta/recipes-devtools/perl/perl-tests.inc |    1 +
 meta/recipes-devtools/perl/perl_5.14.2.bb |    2 +-
 2 files changed, 2 insertions(+), 1 deletions(-)

-- 
1.7.5.4



