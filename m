Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TxY7d-0004Qz-09
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 08:18:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0M72Wcx005176
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 23:02:32 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Mon, 21 Jan 2013 23:02:32 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2013 15:02:41 +0800
Message-ID: <cover.1358838027.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V2 0/1] sysvinit & initscripts: use update-rc.d
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
X-List-Received-Date: Tue, 22 Jan 2013 07:18:22 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

V2 rebases this patch against the latest master branch (after systemd integration).

The following changes since commit 37e025f6f9c410005e0f1dee0767e38eaec01cbd:

  bitbake: hob: Hob should display warnings generated during parsing (2013-01-21 19:05:31 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/init-updatercd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/init-updatercd

Chen Qi (1):
  sysvinit & initscripts: use update-rc.d

 meta/recipes-core/initscripts/initscripts_1.0.bb |   57 +++++++++-------------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb   |   15 +++---
 2 files changed, 32 insertions(+), 40 deletions(-)

-- 
1.7.9.5



