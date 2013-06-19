Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0349F601AF
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2013 06:37:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r5J6bBlp008812
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 23:37:16 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 23:37:12 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Jun 2013 14:37:08 +0800
Message-ID: <cover.1371623706.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2] create /usr/lib/locale dir and enable read-only-rootfs for live image
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2013 06:37:16 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit ea31d45def0e9fc4ed1c1ef92756d807ff59fe72:

  core-image-weston: add weston-examples to the image (2013-06-18 16:43:16 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/base-files-and-image-live
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/base-files-and-image-live

Roy.Li (2):
  image-live.bbclass: enable read-only-rootfs IMAGE_FEATURE
  base-files: create /usr/lib/locale dir

 meta/classes/image-live.bbclass                   |    2 ++
 meta/recipes-core/base-files/base-files_3.0.14.bb |    3 ++-
 2 files changed, 4 insertions(+), 1 deletion(-)

-- 
1.7.10.4


