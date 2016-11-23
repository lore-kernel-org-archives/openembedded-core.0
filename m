Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EECE2719ED
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 07:49:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAN7nR1J009312
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 23:49:27 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 22 Nov 2016 23:49:27 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Nov 2016 23:49:24 -0800
Message-ID: <cover.1479871728.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/2] fix can't login when debug-tweaks is not in IMAGE_FEATURES
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
X-List-Received-Date: Wed, 23 Nov 2016 07:49:29 -0000
Content-Type: text/plain

Fixed 2 bugs:
- Can't login as root when debug-tweaks/empty-root-password is not in
  IMAGE_FEATURES since no passwd.
- When set root passwd and debug-tweaks/empty-root-password is in
  IMAGE_FEATURES, passwd is *required* to login.

Filed https://bugzilla.yoctoproject.org/show_bug.cgi?id=10710, and
marked doc changes required as yes.

// Robert

The following changes since commit a675b2c89e477af088faee9b3be96eae19a85f0b:

  sanity.bbclass: fix logging of an error (2016-11-15 15:18:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/root
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/root

Robert Yang (2):
  rootfs-postcommands.bbclass: fix zap_empty_root_password
  base-passwd: set root's default password to 'root'

 meta/classes/rootfs-postcommands.bbclass                 |  8 ++++----
 .../base-passwd/base-passwd/passwd_master.patch          | 16 ++++++++++++++++
 meta/recipes-core/base-passwd/base-passwd_3.5.29.bb      |  1 +
 3 files changed, 21 insertions(+), 4 deletions(-)
 create mode 100644 meta/recipes-core/base-passwd/base-passwd/passwd_master.patch

-- 
2.10.2


