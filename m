Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 825B377134
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Oct 2015 06:36:15 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9G6aGRm003506
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 15 Oct 2015 23:36:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Thu, 15 Oct 2015 23:36:15 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 Oct 2015 14:28:10 +0800
Message-ID: <cover.1444976827.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Upgrade sqlite to 3.9.0
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
X-List-Received-Date: Fri, 16 Oct 2015 06:36:16 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit e35c404537db0b46047fcb2ee7d3645e3e0935c5:

  bitbake: toaster: Don't descend into directories for cached_layers (2015-10-11 08:12:58 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib kangkai/sqlite3
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=kangkai/sqlite3

Kai Kang (1):
  sqlite: 3.8.10.2 -> 3.9.0

 .../files/0001-using-the-dynamic-library.patch     | 30 ----------------------
 .../{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb}      | 10 ++++----
 2 files changed, 5 insertions(+), 35 deletions(-)
 delete mode 100644 meta/recipes-support/sqlite/files/0001-using-the-dynamic-library.patch
 rename meta/recipes-support/sqlite/{sqlite3_3.8.10.2.bb => sqlite3_3.9.0.bb} (72%)

-- 
2.6.1


