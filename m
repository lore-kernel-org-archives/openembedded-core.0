Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TvNbt-0004cC-CC
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Jan 2013 08:40:38 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0G7PBnH011054
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jan 2013 23:25:12 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Tue, 15 Jan 2013 23:25:10 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Jan 2013 15:25:09 +0800
Message-ID: <cover.1358320866.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] sysvinit & initscripts: use update-rc.d
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
X-List-Received-Date: Wed, 16 Jan 2013 07:40:42 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 9eb88ceb39b7d0b8ddc6487e61ce8edadef10ec4:

  connman: fixed init script so connman can runs over nfs (2013-01-15 08:12:05 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/init-updatercd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/init-updatercd

Chen Qi (1):
  sysvinit & initscripts: use update-rc.d

 meta/recipes-core/initscripts/initscripts_1.0.bb |   59 +++++++++-------------
 meta/recipes-core/sysvinit/sysvinit_2.88dsf.bb   |   17 ++++---
 2 files changed, 34 insertions(+), 42 deletions(-)

-- 
1.7.9.5



