Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TXkxT-0004h1-9F
	for openembedded-core@lists.openembedded.org;
	Mon, 12 Nov 2012 04:45:11 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qAC3VIUO025226
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 11 Nov 2012 19:31:18 -0800 (PST)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Sun, 11 Nov 2012 19:31:17 -0800
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 12 Nov 2012 11:31:14 +0800
Message-ID: <cover.1352690328.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Jackie.Huang@windriver.com, Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] eglibc: always compile with optimization.
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
X-List-Received-Date: Mon, 12 Nov 2012 03:45:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 5e4714a454f9f742bf8af70dad2aa66ccb87e3fd:

  lib/oe/classextend: Ensure we don't extend expressions more than once (2012-11-06 09:29:03 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_eglibc_1112_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_eglibc_1112_1

Jackie Huang (1):
  eglibc: always compile with optimization.

 meta/recipes-core/eglibc/eglibc_2.16.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)

-- 
1.7.4



