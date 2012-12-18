Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1TkuRK-0003mB-UI
	for openembedded-core@lists.openembedded.org;
	Tue, 18 Dec 2012 11:30:24 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBIAFerJ011371
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 18 Dec 2012 02:15:40 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 18 Dec 2012 02:15:39 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Tue, 18 Dec 2012 18:16:27 +0800
Message-ID: <cover.1355825643.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Add sub-package perl-tests
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
X-List-Received-Date: Tue, 18 Dec 2012 10:30:36 -0000
Content-Type: text/plain

Add sub-package perl-tests to run perl test cases on target.

The following changes since commit 2a9c574fd8b0800199b6569b6abf02634801013d:

  gst-openmax: fix build with newer GLib (2012-12-17 17:53:52 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/perl-tests
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/perl-tests

Kang Kai (1):
  perl: add sub-package perl-tests

 meta/recipes-devtools/perl/perl-5.14.2/config.sh |   18 +++++++++++-
 meta/recipes-devtools/perl/perl-tests.inc        |   34 ++++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.14.2.bb        |    3 +-
 3 files changed, 53 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/perl/perl-tests.inc

-- 
1.7.5.4



