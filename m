Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8D0736AE32
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Jan 2014 05:56:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0Q5uBWe010335
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Jan 2014 21:56:11 -0800 (PST)
Received: from pek-hostel-vm06.wrs.com (128.224.153.176) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Sat, 25 Jan 2014 21:56:11 -0800
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 26 Jan 2014 13:56:08 +0800
Message-ID: <cover.1390715716.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] parted: enable ptest support
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
X-List-Received-Date: Sun, 26 Jan 2014 05:56:10 -0000
Content-Type: text/plain

The following changes since commit 1a9226f140f578f11696abf1a3c989fae1d4c14a:

  libtool-cross/native: Force usage of bash due to sstate inconsistencies (2014-01-23 12:18:05 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/parted
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/parted

Chong Lu (1):
  parted: enable ptest support

 meta/recipes-extended/parted/parted-3.1/Makefile  | 285 ++++++++++++++++++++++
 meta/recipes-extended/parted/parted-3.1/run-ptest |   3 +
 meta/recipes-extended/parted/parted_3.1.bb        |  25 +-
 3 files changed, 311 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-extended/parted/parted-3.1/Makefile
 create mode 100644 meta/recipes-extended/parted/parted-3.1/run-ptest

-- 
1.8.1.2


