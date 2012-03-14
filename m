Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1S7hiE-00005C-5G
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 07:29:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2E6KiEq005977
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 23:20:44 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 13 Mar 2012 23:20:44 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Mar 2012 14:24:59 +0800
Message-ID: <cover.1331705212.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/2] Update ccache and chkconfig to latest version
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
X-List-Received-Date: Wed, 14 Mar 2012 06:29:30 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update ccache and chkconfig, also update their distro tracking fields
accordingly.

The following changes since commit 8e9f6fc77ac4763f4ed1f6e7b720420c220ba6e2:
  Richard Purdie (1):
        dates: Fix unpackaged files warning

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/upd-ccache-chkconfig
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/upd-ccache-chkconfig

Wenzong Fan (2):
  ccache: update it from 3.1.6 to 3.1.7
  chkconfig: update it from 1.3.57 to 1.3.58

 .../conf/distro/include/distro_tracking_fields.inc |   12 ++++++------
 .../ccache/{ccache_3.1.6.bb => ccache_3.1.7.bb}    |    4 ++--
 .../{chkconfig_1.3.57.bb => chkconfig_1.3.58.bb}   |    4 ++--
 3 files changed, 10 insertions(+), 10 deletions(-)
 rename meta/recipes-devtools/ccache/{ccache_3.1.6.bb => ccache_3.1.7.bb} (47%)
 rename meta/recipes-extended/chkconfig/{chkconfig_1.3.57.bb => chkconfig_1.3.58.bb} (84%)



