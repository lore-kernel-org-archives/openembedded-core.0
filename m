Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1UPPI6-0007Um-Q0
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Apr 2013 05:32:15 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r393EraD016003
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Apr 2013 20:14:53 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Mon, 8 Apr 2013 20:14:53 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <mark.hatle@windriver.com>
Date: Tue, 9 Apr 2013 11:16:36 +0800
Message-ID: <cover.1365477246.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/2] V2: rename libpng_1.2.50 to libpng12
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
X-List-Received-Date: Tue, 09 Apr 2013 03:32:21 -0000
Content-Type: text/plain

V2: add comments to explain why drop some link files

The following changes since commit e57284abca76fe7e6c29484104ae4349459c63dc:

  kernel.bbclass: do_sizecheck: update path to build image and do not delete (2013-04-08 22:26:24 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/libpng12
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/libpng12

Kang Kai (2):
  libpng12: rename libpng_1.2.50 to libpng12
  libpng12: remove prefer version and add it to lsb packagegroup

 meta/conf/distro/include/default-versions.inc      |    3 ---
 .../packagegroups/packagegroup-core-lsb.bb         |    1 +
 .../{libpng_1.2.50.bb => libpng12_1.2.50.bb}       |   20 +++++++++++++++++---
 3 files changed, 18 insertions(+), 6 deletions(-)
 rename meta/recipes-lsb4/libpng/{libpng_1.2.50.bb => libpng12_1.2.50.bb} (55%)

-- 
1.7.5.4



