Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UAEGE-0003Z9-Qm
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 07:43:37 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r1Q6RAAc001687
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 25 Feb 2013 22:27:10 -0800 (PST)
Received: from pek-wfan-d2.corp.ad.wrs.com (128.224.162.243) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.328.9; Mon, 25 Feb 2013 22:27:09 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 26 Feb 2013 14:26:57 +0800
Message-ID: <cover.1361859756.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com, scott.a.garman@intel.com
Subject: [PATCH 0/1][denzil] alsa-tools: remove warning message
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
X-List-Received-Date: Tue, 26 Feb 2013 06:43:43 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

Remove those warning message for alsa-tools 1.0.24.1 on denzil release:

WARNING:   /usr/local/share
WARNING:   /usr/local/bin
WARNING:   /usr/local/include
WARNING:   /usr/local/lib
WARNING:   /usr/local/sbin
WARNING:   /usr/local/share/sounds
WARNING:   /usr/local/share/aclocal
WARNING:   /usr/local/share/man
WARNING:   /usr/local/share/ld10k1
WARNING:   /usr/local/share/sounds/opl3
WARNING:   /usr/local/share/sounds/opl3/std.sb
WARNING:   /usr/local/share/sounds/opl3/drums.sb
WARNING:   /usr/local/share/sounds/opl3/std.o3
WARNING:   /usr/local/share/sounds/opl3/drums.o3
WARNING:   /usr/local/share/aclocal/ld10k1.m4 
WARNING:   /usr/local/share/man/man1
WARNING:   /usr/local/share/man/man1/cspctl.1 
WARNING:   /usr/local/share/ld10k1/effects
WARNING:   /usr/local/share/ld10k1/effects/vol_2.emu10k1
......

* Note: the latest alsa-tools on master is 1.0.26.1 and doesn't have
such issue any more.

The following changes since commit 6caa7d1d6c122d084ed01d1f5e1dae0bf259f854:

  bitbake: command: Fix getCmdLineAction bugs (2013-01-28 12:44:14 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/alsa-tools
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/alsa-tools

Wenzong Fan (1):
  alsa-tools: remove warning message

 meta/recipes-multimedia/alsa/alsa-tools_1.0.24.1.bb |   11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
1.7.10.4



