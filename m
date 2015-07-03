Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7374475D10
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Jul 2015 07:24:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t637OSYl028059
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 3 Jul 2015 00:24:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.3.224.2; Fri, 3 Jul 2015 00:24:27 -0700
From: Kai Kang <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 3 Jul 2015 15:23:48 +0800
Message-ID: <cover.1435908151.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [128.224.153.152]
Subject: [PATCH 0/1] Update alternatives of man pages
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
X-List-Received-Date: Fri, 03 Jul 2015 07:24:30 -0000
Content-Type: text/plain

It is ok to be installed by rpm, but failed with smart.

The following changes since commit 8ad9a434c9fd0300cf5c38c368b181b78421e95a:

  bitbake: tests/data: Add new data tests (2015-07-01 15:40:21 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/alternatives
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/alternatives

Kai Kang (1):
  Update alternatives of man pages

 meta/recipes-core/coreutils/coreutils_8.23.bb       | 7 ++++++-
 meta/recipes-core/util-linux/util-linux.inc         | 8 +++++++-
 meta/recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb | 6 ++++++
 meta/recipes-devtools/ossp-uuid/ossp-uuid_1.6.2.bb  | 6 +++++-
 meta/recipes-extended/mktemp/mktemp_1.7.bb          | 4 ++++
 meta/recipes-extended/procps/procps_3.3.10.bb       | 4 ++++
 meta/recipes-extended/shadow/shadow.inc             | 3 ++-
 meta/recipes-extended/stat/stat_3.3.bb              | 3 +++
 8 files changed, 37 insertions(+), 4 deletions(-)

-- 
1.9.1


