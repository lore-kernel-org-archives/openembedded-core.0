Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0CF73605BB
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Dec 2015 05:06:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB2565L7013685
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Dec 2015 21:06:05 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Tue, 1 Dec 2015 21:06:04 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 2 Dec 2015 13:06:00 +0800
Message-ID: <cover.1449032673.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] fix python md5/sha checksum incorrect on qemu86-64 with corei7-64 as DEFAULTTUNE
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
X-List-Received-Date: Wed, 02 Dec 2015 05:06:07 -0000
Content-Type: text/plain

The following changes since commit 698c74c373110ed081a7586e21d4a27b8b44c89b:

  libsdl: remove redundant configure_tweak patch (2015-12-01 21:32:15 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-python
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-python

Hongxu Jia (1):
  python: gcc optimization level 2

 ...001-configure.ac-gcc-optimization-level-2.patch | 40 ++++++++++++++++++++++
 meta/recipes-devtools/python/python_2.7.9.bb       |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python/0001-configure.ac-gcc-optimization-level-2.patch

-- 
1.9.1


