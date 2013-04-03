Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1UNHGX-0007rV-GX
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 08:33:49 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r336GbLQ023713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Apr 2013 23:16:37 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 2 Apr 2013 23:16:36 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Apr 2013 14:16:47 +0800
Message-ID: <cover.1364969701.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/2] Increase free space size on sato images
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
X-List-Received-Date: Wed, 03 Apr 2013 06:33:50 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit fd4e5c6c58183f1a017c6b5fe4d43c320e273567:

  meta-yocto/conf: Add conf-notes.txt (2013-04-02 23:13:21 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/sato-size
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/sato-size

Chen Qi (2):
  bitbake.conf: use weaker assignment for IMAGE_OVERHEAD_FACTOR
  core-image-sato.bb: increase free space size

 meta/conf/bitbake.conf                      |    2 +-
 meta/recipes-sato/images/core-image-sato.bb |    4 ++++
 2 files changed, 5 insertions(+), 1 deletion(-)

-- 
1.7.9.5



