Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1StEKi-0005XZ-QM
	for openembedded-core@lists.openembedded.org;
	Mon, 23 Jul 2012 10:49:41 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q6N8cCvL014998
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jul 2012 01:38:12 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.1.255.0; Mon, 23 Jul 2012 01:38:12 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 23 Jul 2012 16:38:08 +0800
Message-ID: <cover.1343032359.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] quota 4.00: add DEPENDS gettext-native
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 23 Jul 2012 08:49:41 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

do_install needs command 'msgfmt', it would fail if the command
doesn't exist on the host, add DEPENDS gettext-native to fix this.

[YOCTO #2811]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
The following changes since commit da1de01aa74da0f38f07af523a9861824f7b0c95:

  Pyphon-native: Fix typo (2012-07-22 14:20:26 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/defect2811_quota_msgfmt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/defect2811_quota_msgfmt

Jackie Huang (1):
  quota 4.00: add DEPENDS gettext-native

 meta/recipes-extended/quota/quota_4.00.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

-- 
1.7.4



