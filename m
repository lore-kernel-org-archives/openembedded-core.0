Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id D343D7704E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 11:22:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t9NBM53t001628
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Oct 2015 04:22:05 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Fri, 23 Oct 2015 04:22:04 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Oct 2015 04:22:03 -0700
Message-ID: <cover.1445599274.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] e2fsprogs: backport a patch to fix filetype for hardlink
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
X-List-Received-Date: Fri, 23 Oct 2015 11:22:06 -0000
Content-Type: text/plain

The following changes since commit 73f8a0bf3b99d480bf97e266da0fb048714b4caf:

  build-appliance-image: Update to jethro head revision (2015-10-21 23:13:03 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/e2fsprogs
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/e2fsprogs

Robert Yang (1):
  e2fsprogs: backport a patch to fix filetype for hardlink

 ...ate-hardlinks-with-the-correct-directory-.patch |   81 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    1 +
 2 files changed, 82 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/copy-in-create-hardlinks-with-the-correct-directory-.patch

-- 
1.7.9.5


