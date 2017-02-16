Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E75173195
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 08:19:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v1G8J0Zw004619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Feb 2017 00:19:00 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Feb 2017 00:18:59 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Feb 2017 00:18:58 -0800
Message-ID: <cover.1487233119.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] kernel.bbclass: do_deploy requires depmodwrapper
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
X-List-Received-Date: Thu, 16 Feb 2017 08:19:00 -0000
Content-Type: text/plain

The following changes since commit 9f225ef5620f2e47e762b2fd16fa5f8d6f1f60fd:

  wic: direct: move creation of PartitionedImage to __init__ (2017-02-15 20:06:35 -0800)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/deploy
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/deploy

Robert Yang (1):
  kernel.bbclass: do_deploy requires depmodwrapper

 meta/classes/kernel.bbclass | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.10.2


