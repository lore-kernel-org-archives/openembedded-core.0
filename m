Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0852E65C87
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 07:37:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id sA37bwhw015040
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 2 Nov 2014 23:37:58 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Sun, 2 Nov 2014 23:37:57 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>,
	<qi.chen@windriver.com>
Date: Mon, 3 Nov 2014 15:37:54 +0800
Message-ID: <cover.1415000039.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: add network config while networkd supported
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
X-List-Received-Date: Mon, 03 Nov 2014 07:38:02 -0000
Content-Type: text/plain

The following changes since commit f19b4e995ea47f9243f152b39337330307453c9f:

  bitbake: bitbake: clarify startup message (2014-10-30 13:39:52 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-systemd-network
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-systemd-network

Hongxu Jia (1):
  systemd: add network config while networkd supported

 meta/recipes-core/systemd/systemd/oe-core.network | 8 ++++++++
 meta/recipes-core/systemd/systemd_216.bb          | 6 ++++++
 2 files changed, 14 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/oe-core.network

-- 
1.9.1


