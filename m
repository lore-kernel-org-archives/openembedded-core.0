Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B853A6A8B3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 09:59:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7M9xeG9019933
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Aug 2013 02:59:40 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Thu, 22 Aug 2013 02:59:39 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Aug 2013 17:59:28 +0800
Message-ID: <cover.1377165347.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Subject: [PATCH 0/1] Fix alsa-lib compiles fails on mips
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
X-List-Received-Date: Thu, 22 Aug 2013 09:59:39 -0000
Content-Type: text/plain

The following changes since commit b2ff1add530b1fec2fb7f385227a03db47015c37:

  poky.conf: Don't force the addition of extra DISTRO_FEATURES (2013-08-20 22:58:04 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/alsa-lib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/alsa-lib

Kai Kang (1):
  alsa-lib: fix function definitions error for mips

 ...-iatomic.h-functions-definitions-for-mips.patch | 68 ++++++++++++++++++++++
 meta/recipes-multimedia/alsa/alsa-lib_1.0.27.2.bb  |  1 +
 2 files changed, 69 insertions(+)
 create mode 100644 meta/recipes-multimedia/alsa/alsa-lib/Update-iatomic.h-functions-definitions-for-mips.patch

-- 
1.8.1.2


