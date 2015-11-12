Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 390E777154
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 08:51:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAC8pe2c002837
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Nov 2015 00:51:40 -0800 (PST)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 12 Nov 2015 00:51:39 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Nov 2015 00:51:37 -0800
Message-ID: <cover.1447318250.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] meta: fix gdbm and clutter-gst-3.0
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
X-List-Received-Date: Thu, 12 Nov 2015 08:51:41 -0000
Content-Type: text/plain

The following changes since commit e44ed8c18e395b9c055aefee113b90708e8a8a2f:

  build-appliance-image: Update to jethro head revision (2015-11-03 14:02:57 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/2fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/2fixes

Robert Yang (2):
  gdbm 1.8.3: install libgdbm_compat
  clutter-gst-3.0: add --enable/disable-gudev

 meta/recipes-graphics/clutter/clutter-gst-3.0.inc  |   15 ++++++-
 .../0001-configure.ac-add-enable-gudev.patch       |   45 ++++++++++++++++++++
 meta/recipes-support/gdbm/gdbm_1.8.3.bb            |    1 +
 3 files changed, 60 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-graphics/clutter/clutter-gst-3.0/0001-configure.ac-add-enable-gudev.patch

-- 
1.7.9.5


