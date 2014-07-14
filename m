Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id C315970210
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 08:11:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6E8Bvn2008175
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Jul 2014 01:11:57 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Mon, 14 Jul 2014 01:11:56 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 14 Jul 2014 16:10:04 +0800
Message-ID: <cover.1405322662.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] libtool: fix different files in sysroot of sdk
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
X-List-Received-Date: Mon, 14 Jul 2014 08:12:02 -0000
Content-Type: text/plain

The following changes since commit 6879c3c903ec7d08cf0240281c83d85b4a42b6db:

  maintainers.inc: add info for libical (2014-07-08 11:20:14 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/libtool
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/libtool

Chong Lu (1):
  libtool: fix different files in sysroot of sdk

 .../libtool/libtool-cross_2.4.2.bb                 |   1 +
 .../libtool/libtool-native_2.4.2.bb                |   1 +
 .../libtool/libtool/fixinstall.patch               | 139 +++++++++++++--------
 meta/recipes-devtools/libtool/libtool/prefix.patch |  23 ----
 .../libtool/libtool/rename-libtool.patch           |  40 ++++++
 meta/recipes-devtools/libtool/libtool_2.4.2.bb     |   3 +
 .../libtool/nativesdk-libtool_2.4.2.bb             |   1 +
 7 files changed, 131 insertions(+), 77 deletions(-)
 create mode 100644 meta/recipes-devtools/libtool/libtool/rename-libtool.patch

-- 
1.9.1


