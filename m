Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3EED66AC48
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Jul 2013 02:16:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r622GKCx020875
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 1 Jul 2013 19:16:20 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Mon, 1 Jul 2013 19:16:20 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 2 Jul 2013 10:16:13 +0800
Message-ID: <cover.1372483117.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1]qt-mobility: fix build in the absence of xvideo
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
X-List-Received-Date: Tue, 02 Jul 2013 02:16:19 -0000
Content-Type: text/plain

The following changes since commit 80b263430453896189b704d0997943642eec6fef:

  classes/insane: remove la2 check which no longer exists from ERROR_QA (2013-06-28 16:33:08 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-qt4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-adt

Hongxu Jia (1):
  qt-mobility: fix build in the absence of xvideo

 .../qt-mobility-1.2.0/qt-mobility-no-xvideo.patch  | 26 ++++++++++++++++++++++
 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |  3 ++-
 2 files changed, 28 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-qt/qt4/qt-mobility-1.2.0/qt-mobility-no-xvideo.patch

-- 
1.8.1.2


