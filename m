Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9CDEB77056
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Oct 2015 02:55:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9E2tIFn019632
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Oct 2015 19:55:19 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 13 Oct 2015 19:55:18 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 13 Oct 2015 22:55:16 -0400
Message-ID: <cover.1444791107.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] bzip2: fix bunzip2 -qt returns 0 for corrupt archives
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
X-List-Received-Date: Wed, 14 Oct 2015 02:55:19 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

V2 changes:

* update Upstream-Status: "Backport [Debian] -> Pending"
* add Debian defect/changelog links to commit log

The following changes since commit d302c98822efe2cb78a63b620aed1b94b4ed4a68:

  bitbake: toaster: Fix missing tooltips from layers on project configuration page (2015-10-13 15:35:49 +0300)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/bzip2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/bzip2

Wenzong Fan (1):
  bzip2: fix bunzip2 -qt returns 0 for corrupt archives

 ...bunzip2-qt-returns-0-for-corrupt-archives.patch | 55 ++++++++++++++++++++++
 meta/recipes-extended/bzip2/bzip2_1.0.6.bb         |  1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-extended/bzip2/bzip2-1.0.6/fix-bunzip2-qt-returns-0-for-corrupt-archives.patch

-- 
1.9.1


