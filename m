Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yi.Zhao@windriver.com>) id 1SAFFw-0000kp-86
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Mar 2012 07:42:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q2L6XrrV000461
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 23:33:53 -0700 (PDT)
Received: from localhost (128.224.162.177) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 20 Mar 2012 23:33:54 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 21 Mar 2012 14:33:48 +0800
Message-ID: <cover.1332311035.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 1.7.1
MIME-Version: 1.0
X-Originating-IP: [128.224.162.177]
Subject: [PATCH 0/1] scripts/qemuimage-testlib: fix typos
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
X-List-Received-Date: Wed, 21 Mar 2012 06:42:48 -0000
Content-Type: text/plain

Hi,

This patch fixed typos in scripts/qemuimage-testlib.
The local variable "timeout" should be "time_out" in Test_SSH() and Test_SCP() functions.

The following changes since commit 224ff370b4636cdd33c47c1e6341ef43a67e0227:

  xserver-kdrive: compile xserver without dtrace support (2012-03-20 15:21:39 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib yizhao/fixtypo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=yizhao/fixtypo

Yi Zhao (1):
  scripts/qemuimage-testlib: fix typos

 scripts/qemuimage-testlib |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)



