Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1UIEHJ-0006iW-VP
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Mar 2013 09:22:12 +0100
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2K84tf2013109
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2013 01:04:55 -0700 (PDT)
Received: from pek-usp-9.wrs.com (128.224.162.26) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 20 Mar 2013 01:04:54 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Mar 2013 15:49:30 +0800
Message-ID: <cover.1363765543.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.7
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: remove several duplicated lines
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
X-List-Received-Date: Wed, 20 Mar 2013 08:24:34 -0000
Content-Type: text/plain

The following changes since commit 6b8d7767ff14345af29d7774b7e16e29c3f7fa8e:

  qemuimage-testlib: Fix IP address handling (2013-03-19 23:34:18 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib robert/duplicated
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/duplicated

Robert Yang (3):
  perl: remove the duplicated RDEPENDS
  perl-native: remove duplicated LIC_FILES_CHKSUM
  pm-utils: remove duplicated RDEPENDS

 meta/recipes-bsp/pm-utils/pm-utils_1.4.1.bb        |    1 -
 meta/recipes-devtools/perl/perl-native_5.14.3.bb   |    2 --
 .../recipes-devtools/perl/perl-rdepends_5.14.3.inc |    1 -
 3 files changed, 0 insertions(+), 4 deletions(-)

-- 
1.7.7



