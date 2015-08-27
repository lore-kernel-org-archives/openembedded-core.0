Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3141B76DFB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 09:33:27 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t7R9XScc010386
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 27 Aug 2015 02:33:28 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.235.1; Thu, 27 Aug 2015 02:33:27 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 27 Aug 2015 17:28:58 +0800
Message-ID: <cover.1440667679.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Fix screen parallel build failure
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
X-List-Received-Date: Thu, 27 Aug 2015 09:33:28 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 393bd7496d71eb101f21234c1233a2d18fd2c73e:

  oeqa/oetest.py: add better package search for hasPackage() (2015-08-26 08:28:06 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/screen
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/screen

Kai Kang (1):
  screen: fix parallel build failure

 .../screen/0001-fix-for-multijob-build.patch       | 58 ++++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.3.1.bb       |  4 +-
 2 files changed, 61 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/screen/screen/0001-fix-for-multijob-build.patch

-- 
1.9.1


