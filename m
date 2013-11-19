Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C9B76D331
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 08:08:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rAJ88Uae015666
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Nov 2013 00:08:30 -0800 (PST)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Tue, 19 Nov 2013 00:08:29 -0800
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Nov 2013 16:08:16 +0800
Message-ID: <cover.1384848334.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/1] LSB_Test.sh: update rpm platform file
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
X-List-Received-Date: Tue, 19 Nov 2013 08:08:30 -0000
Content-Type: text/plain

LSB_Test.sh: update rpm platform file to enable install i486 packages on x86-64 bsps
when multlib is enabled.

The following changes since commit e15893adf9268b2920b24c52d5c2bb777c6f778e:

  bitbake: serv.py: Give pr-server up to 5 seconds to commit data (2013-11-18 17:19:11 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/lsb_test
  http://git.yoctoproject.org/cgit.cgi//log/?h=kangkai/lsb_test

Kai Kang (1):
  LSB_Test.sh: update rpm platform file when enable multilib

 meta/recipes-extended/lsb/lsbtest/LSB_Test.sh | 8 ++++++++
 1 file changed, 8 insertions(+)

-- 
1.8.1.2


