Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TpaRo-0006bw-IR
	for openembedded-core@lists.openembedded.org;
	Mon, 31 Dec 2012 09:10:18 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qBV7tBwU026121
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 30 Dec 2012 23:55:12 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 30 Dec 2012 23:55:11 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Dec 2012 15:55:19 +0800
Message-ID: <cover.1356923937.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] init-live.sh: avoid duplicate mount points
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
X-List-Received-Date: Mon, 31 Dec 2012 08:10:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>


The following changes since commit 4a36a32567ecfbc7ce7b967803e6e23314953ef5:

  libpng: fix packaging (2012-12-26 11:34:09 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/live-image
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/live-image

Chen Qi (1):
  init-live.sh: avoid duplicate mount points for the same filesystem

 meta/recipes-core/initrdscripts/files/init-live.sh |    9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

-- 
1.7.9.5



