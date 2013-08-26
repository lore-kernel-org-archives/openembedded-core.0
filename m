Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4E6706A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 06:43:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7Q6hcPB006436
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 23:43:38 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sun, 25 Aug 2013 23:43:37 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 26 Aug 2013 14:43:53 +0800
Message-ID: <cover.1377499381.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] initscripts: read-only rootfs fixes
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
X-List-Received-Date: Mon, 26 Aug 2013 06:43:39 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit b467b99a5d25efe5eadfb07dbecba608575256ac:

  linux-yocto: switch genericx86 to use common-pc (2013-08-24 09:37:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/initscripts-readonly
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/initscripts-readonly

Chen Qi (2):
  checkroot.sh: check for conflicting configurations
  read-only-rootfs-hook.sh: check before bind mounting /var/lib

 .../initscripts/initscripts-1.0/checkroot.sh       |   10 ++++++
 .../initscripts-1.0/read-only-rootfs-hook.sh       |   33 +++++++++++++++++---
 2 files changed, 39 insertions(+), 4 deletions(-)

-- 
1.7.9.5


