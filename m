Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UEy0S-0002Qw-G6
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Mar 2013 09:22:54 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r2B86Dmj001268
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2013 01:06:13 -0700 (PDT)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Mon, 11 Mar 2013 01:06:12 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2013 16:06:01 +0800
Message-ID: <1362989162-9619-1-git-send-email-wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] layer.conf: Add LAYERVERSION and LAYERDEPENDS
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
X-List-Received-Date: Mon, 11 Mar 2013 08:22:57 -0000
Content-Type: text/plain

Add LAYERVERSION and LAYERDEPENDS to following oe-core layers:

    meta-hob, meta-skeleton

The following changes since commit 365eb9b5d22208c967dcd91d8ab52faed20f04b5:

  bitbake: bitbake-layers: fix duplicated help info (2013-03-10 04:36:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/oe-layers
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/oe-layers

Wenzong Fan (1):
  layer.conf: Add LAYERVERSION and LAYERDEPENDS

 meta-hob/conf/layer.conf      |    6 ++++++
 meta-skeleton/conf/layer.conf |    5 +++++
 2 files changed, 11 insertions(+)

-- 
1.7.10.4



