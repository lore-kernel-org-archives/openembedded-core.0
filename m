Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1U83D2-0000sU-UX
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:31:31 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r1K6F6iV028071
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 22:15:06 -0800 (PST)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.318.4; Tue, 19 Feb 2013 22:15:05 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 14:16:33 +0800
Message-ID: <cover.1361265275.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/3] Redirect output of post-install scripts when "debug-tweak" enabled
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
X-List-Received-Date: Wed, 20 Feb 2013 06:31:34 -0000
Content-Type: text/plain

The following changes since commit c7b23ab68aafc04d9830ef318015912e5d4f0672:

  maintainers.inc: update ownership of recipes (2013-02-17 22:33:30 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/redirect-postinst
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/redirect-postinst

Kang Kai (3):
  rpm: redirect output of post install script
  dpkg: redirect output of postinstall script
  opkg: save output of postinst scripts

 .../dpkg/dpkg/redirect-output.patch                |   37 +++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.16.9.bb          |    8 +++-
 .../opkg/opkg/redirect-output.patch                |   29 +++++++++++++++
 meta/recipes-devtools/opkg/opkg_svn.bb             |    6 +++-
 .../recipes-devtools/rpm/rpm/redirect-output.patch |   38 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.9.bb             |    6 +++-
 6 files changed, 120 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/redirect-output.patch
 create mode 100644 meta/recipes-devtools/opkg/opkg/redirect-output.patch
 create mode 100644 meta/recipes-devtools/rpm/rpm/redirect-output.patch

-- 
1.7.5.4



