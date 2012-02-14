Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RxDeg-0008AE-ET
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 09:22:30 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q1E8EIv2017072
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Feb 2012 00:14:19 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Tue, 14 Feb 2012 00:14:18 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 14 Feb 2012 15:56:00 +0800
Message-ID: <cover.1329185046.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] eds-tools: Update it to fix the build error
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
X-List-Received-Date: Tue, 14 Feb 2012 08:22:30 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Get the latest updates to eds-tools for fixing the build error:
* libedataserver/e-data-server-module.h: No such file or directory

Also update its recipe file to reflect it has been converted to git
repo and splict the generated binaries to correct packages.

[yocto#1786]

The following changes since commit 41a83ccfe50ec69425a4828fb5836d38d3f99e67:
  Lianhao Lu (1):
        guile: fix cross configure failure

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/1786
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/1786

Wenzong Fan (1):
  eds-tools: Update it to fix the build error

 .../conf/distro/include/distro_tracking_fields.inc |    4 ++--
 meta/recipes-sato/eds/eds-tools_git.bb             |    8 +++++---
 2 files changed, 7 insertions(+), 5 deletions(-)



