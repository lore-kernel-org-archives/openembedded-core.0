Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1RQYmb-0000Zw-FH
	for openembedded-core@lists.openembedded.org;
	Wed, 16 Nov 2011 07:15:41 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAG69FE2021850
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Nov 2011 22:09:16 -0800 (PST)
Received: from localhost.localdomain (128.224.162.225) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.1.255.0; Tue, 15 Nov 2011 22:09:15 -0800
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 16 Nov 2011 14:09:02 +0800
Message-ID: <cover.1321421127.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.225]
Subject: [PATCH 0/1] mesa: fix cross compile failure
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
X-List-Received-Date: Wed, 16 Nov 2011 06:15:41 -0000
Content-Type: text/plain

Hi All, 

the bin/mklib file in mesa source code uses commands "ar ranlib" on build machine,
this causes build failed on some platform.

Thanks Khem, Martin and Koen's review for previous version of this serious patch.

The following changes since commit d8193f19fe94224089b0e5fc2026a843f7bd0709:

  opkg: Ensure we use the uname/gname fields when extracting tarballs (2011-11-14 11:15:45 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/distro
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/distro

Kang Kai (1):
  mesa: fix cross compile failure

 meta/recipes-graphics/mesa/mesa-7.11.inc           |    1 +
 meta/recipes-graphics/mesa/mesa-common.inc         |    2 +-
 .../mesa/mesa/crossfix-mklib.patch                 |   71 ++++++++++++++++++++
 3 files changed, 73 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-graphics/mesa/mesa/crossfix-mklib.patch

-- 
1.7.5.4



