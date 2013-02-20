Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1U82u9-0000B2-85
	for openembedded-core@lists.openembedded.org;
	Wed, 20 Feb 2013 07:11:45 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1K5tXrO020693
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Feb 2013 21:55:33 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 19 Feb 2013 21:55:32 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Feb 2013 13:55:29 +0800
Message-ID: <cover.1361338900.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V2 0/5] Read-only rootfs followup patches
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
X-List-Received-Date: Wed, 20 Feb 2013 06:11:48 -0000
X-List-Received-Date: Wed, 20 Feb 2013 06:11:48 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

This patchset enables populate-volatile.sh script run at rootfs time.

For the purpose of easier review, changes for populate-volatile.sh script
have been divided into two parts.

This patchset has been tested with core-image-minimal, with and without
'read-only-rootfs' image feature.

V2 fixes some errors in V1 and remove the trailing whitespaces in populate-volatile.sh.

The following changes since commit c7b23ab68aafc04d9830ef318015912e5d4f0672:

  maintainers.inc: update ownership of recipes (2013-02-17 22:33:30 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/readonly-rootfs-followups
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/readonly-rootfs-followups

Chen Qi (5):
  image.bbclass: add a hook funtion to support readonly rootfs
  core-image.bbclass: support read-only rootfs
  populate-volatile.sh: add ROOT_DIR variable to support running at
    rootfs time
  populate-volatile.sh: improve the handling of link config items
  populate-volatile.sh: remove trailing whitespaces

 meta/classes/core-image.bbclass                    |    4 +
 meta/classes/image.bbclass                         |   18 ++++
 .../initscripts-1.0/populate-volatile.sh           |   89 ++++++++++++++------
 3 files changed, 83 insertions(+), 28 deletions(-)

-- 
1.7.9.5



