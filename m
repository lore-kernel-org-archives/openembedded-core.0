Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TtWBz-000511-Fc
	for openembedded-core@lists.openembedded.org;
	Fri, 11 Jan 2013 05:26:14 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r0B4ApND015102
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Jan 2013 20:10:52 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Thu, 10 Jan 2013 20:10:51 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Jan 2013 12:11:17 +0800
Message-ID: <cover.1357875161.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] initscripts: remove finish.sh
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
X-List-Received-Date: Fri, 11 Jan 2013 04:26:17 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 66f4c8a674d9f8db958b13866af4d63ab8cbcd44:

  guile: add explicit dependency to avoid parallel build issue (2013-01-09 15:05:26 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/rm-finish.sh
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/rm-finish.sh

Chen Qi (1):
  initscripts: remove finish.sh

 .../initscripts/initscripts-1.0/finish.sh          |   14 --------------
 meta/recipes-core/initscripts/initscripts_1.0.bb   |    7 ++-----
 2 files changed, 2 insertions(+), 19 deletions(-)
 delete mode 100755 meta/recipes-core/initscripts/initscripts-1.0/finish.sh

-- 
1.7.9.5



