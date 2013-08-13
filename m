Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2CC6A6B25A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Aug 2013 09:58:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r7D9w8Od027002
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Aug 2013 02:58:09 -0700 (PDT)
Received: from pek-kkang-d1.wrs.com (128.224.162.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Tue, 13 Aug 2013 02:58:07 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <sgw@linux.intel.com>
Date: Tue, 13 Aug 2013 17:57:48 +0800
Message-ID: <cover.1376387750.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
X-Originating-IP: [128.224.162.231]
Cc: Zhangle.Yang@windriver.com, openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] Fix dpkg-native compile fail on Fedora 19
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
X-List-Received-Date: Tue, 13 Aug 2013 09:58:10 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

The following changes since commit 16d522bcd1f1b7741577fa31fab7e2129da0cae9:

  maintainers.inc: reassign maintainers, remove obsolete recipes (2013-08-12 13:13:05 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/dpkg-native
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/dpkg-native

Kai Kang (1):
  dpkg: fix include header caused compile error

 .../dpkg/dpkg/fix-abs-redefine.patch               | 40 ++++++++++++++++++++++
 meta/recipes-devtools/dpkg/dpkg_1.17.1.bb          |  1 +
 2 files changed, 41 insertions(+)
 create mode 100644 meta/recipes-devtools/dpkg/dpkg/fix-abs-redefine.patch

-- 
1.8.1.2


