Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UVHdA-0004xd-4w
	for openembedded-core@lists.openembedded.org;
	Thu, 25 Apr 2013 10:34:29 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r3P8GV7L002099
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Apr 2013 01:16:32 -0700 (PDT)
Received: from pek-hjia-d1.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 25 Apr 2013 01:16:31 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 25 Apr 2013 16:16:22 +0800
Message-ID: <cover.1366802026.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1]fix do_compile failed in parallel builds with system's make 3.28
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
X-List-Received-Date: Thu, 25 Apr 2013 08:34:48 -0000
Content-Type: text/plain

The following changes since commit 90b98764555945a186562ca8d501a9585ce2b23f:

  build-appliance: Update revision to dylan release (2013-04-18 00:39:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-systemd
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-systemd

Hongxu Jia (1):
  systemd: fix do_compile failed in parallel builds with system's make
    3.28

 meta/recipes-core/systemd/systemd_199.bb |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
1.7.10.4



