Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1StyIP-0004at-Ce
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 11:54:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6P9go5k021861
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 25 Jul 2012 02:42:50 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.164) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Wed, 25 Jul 2012 02:42:49 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <saul.wold@intel.com>
Date: Wed, 25 Jul 2012 17:42:41 +0800
Message-ID: <cover.1343209283.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.164]
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/3] Update packages
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
X-List-Received-Date: Wed, 25 Jul 2012 09:54:21 -0000
Content-Type: text/plain

Hi Saul,

These patches update liburi-perl, qmmp and ltp.

Regards,
Kai

The following changes since commit 0ffb02eec2beaea27ff0ec9d3d31b0a09e675a4c:

  documentation: Updated the h6 style to use a larger font (2012-07-24 10:35:34 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/update-pkgs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/update-pkgs

Kang Kai (3):
  ltp: update to version 20120614
  qmmp: update 0.6.1
  liburi-perl: update to 1.60

 .../{liburi-perl_1.59.bb => liburi-perl_1.60.bb}   |    7 +++----
 .../ltp/ltp/fix_building_fom_archive.patch         |   13 -------------
 .../ltp/{ltp_20120401.bb => ltp_20120614.bb}       |   12 +++++-------
 .../qt-apps/{qmmp_0.5.2.bb => qmmp_0.6.1.bb}       |    8 ++++----
 4 files changed, 12 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/perl/{liburi-perl_1.59.bb => liburi-perl_1.60.bb} (81%)
 delete mode 100644 meta/recipes-extended/ltp/ltp/fix_building_fom_archive.patch
 rename meta/recipes-extended/ltp/{ltp_20120401.bb => ltp_20120614.bb} (91%)
 rename meta/recipes-qt/qt-apps/{qmmp_0.5.2.bb => qmmp_0.6.1.bb} (90%)

-- 
1.7.5.4



