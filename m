Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 200C377065
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Sep 2016 05:31:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u825Uw6m013003
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 1 Sep 2016 22:30:58 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 1 Sep 2016 22:30:57 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 1 Sep 2016 22:30:56 -0700
Message-ID: <cover.1472794137.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [master-next] [PATCH 0/1] libnl: remove RREPLACES and RCONFLICTS for libnl-genl
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
X-List-Received-Date: Fri, 02 Sep 2016 05:31:15 -0000
Content-Type: text/plain

Hi RP,

This is based on master-next branch, and can fix:
https://autobuilder.yoctoproject.org/main/builders/nightly-multilib/builds/932/steps/BuildImages_2/logs/stdio

// Robert

The following changes since commit 3481121c21ea07ff83d3b05439f5442cd921e244:

  runqemu: Enable virtio RNG for all platforms (2016-09-02 00:14:34 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/libnl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/libnl

Robert Yang (1):
  libnl: remove RREPLACES and RCONFLICTS for libnl-genl

 meta/recipes-support/libnl/libnl_3.2.28.bb | 2 --
 1 file changed, 2 deletions(-)

-- 
2.9.0


