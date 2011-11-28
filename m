Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1RUwEg-0000ni-B1
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Nov 2011 09:06:46 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAS807RB023047
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Nov 2011 00:00:07 -0800 (PST)
Received: from localhost.localdomain (128.224.162.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 28 Nov 2011 00:00:06 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 28 Nov 2011 15:57:14 +0800
Message-ID: <cover.1322466046.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.0.4
MIME-Version: 1.0
Subject: [PATCH 0/1] distro_tracking: update tracking fields for gettext and eds-tools
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
X-List-Received-Date: Mon, 28 Nov 2011 08:06:46 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Update distro tracking fields for gettext and eds-tools.

The eds-tools fails to build for now, so left its status as 'red'. A
defect #1786 has been filed for tracking this.

The following changes since commit 4cd96710785eb05abeff1f281878655118d4a7dd:
  Richard Purdie (1):
        bitbake: Update users of getVar/setVar to use the data store functions directly

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/distro_tracking_fields_update
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/distro_tracking_fields_update

Wenzong Fan (1):
  distro_tracking: update tracking fields for gettext and eds-tools

 .../conf/distro/include/distro_tracking_fields.inc |   11 ++++++-----
 1 files changed, 6 insertions(+), 5 deletions(-)



