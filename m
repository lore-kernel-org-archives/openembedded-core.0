Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RGljU-0007oD-Gx
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Oct 2011 08:04:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p9K5w8gc002539
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2011 22:58:08 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Wed, 19 Oct 2011 22:58:08 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 20 Oct 2011 14:04:13 +0800
Message-ID: <cover.1319090166.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/3 v2] Update packages
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
X-List-Received-Date: Thu, 20 Oct 2011 06:04:00 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

v2 add the patch to distro_tracking_fields.inc file.

The following changes since commit b4757833c3548b5ee3a1cce58e2f059b3f63cb09:
  Martin Jansa (1):
        fontconfig: fix fix-pkgconfig.patch

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/update_pkgs
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/update_pkgs

Wenzong Fan (3):
  ccache: update to 3.1.6
  chkconfig: Update to 1.3.55
  distro_tracking_fields: update packages tracking fields

 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++++++++
 .../ccache/{ccache_3.1.5.bb => ccache_3.1.6.bb}    |    4 ++--
 .../{chkconfig_1.3.52.bb => chkconfig_1.3.55.bb}   |    6 +++---
 3 files changed, 17 insertions(+), 5 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.1.5.bb => ccache_3.1.6.bb} (47%)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.52.bb => chkconfig_1.3.55.bb} (83%)



