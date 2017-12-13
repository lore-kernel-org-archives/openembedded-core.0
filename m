Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D09278704
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 02:46:07 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id vBD2k85f010120
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Dec 2017 18:46:08 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.361.1; Tue, 12 Dec 2017 18:46:07 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 13 Dec 2017 10:45:51 +0800
Message-ID: <cover.1513133105.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/2] fix multilib + iso
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
X-List-Received-Date: Wed, 13 Dec 2017 02:46:08 -0000
Content-Type: text/plain

The following changes since commit a24c10b7bdab8aa960fdd3a58d2009f24344e579:

  populate_sdk_ext: Use prebuilt uninative tarball (2017-12-11 21:46:33 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ml_iso
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ml_iso

Robert Yang (2):
  image-live.bbclass: add MLPREFIX to core-image-minimal-initramfs
  image-live.bbclass: remove MLPREFIX from syslinux

 meta/classes/image-live.bbclass                          | 4 ++--
 meta/classes/syslinux.bbclass                            | 2 +-
 meta/recipes-core/images/core-image-minimal-initramfs.bb | 2 +-
 3 files changed, 4 insertions(+), 4 deletions(-)

-- 
2.7.4


