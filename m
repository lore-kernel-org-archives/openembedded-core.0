Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4A63371AAE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:16:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id uAT9GtG5010282
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 01:16:56 -0800
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 29 Nov 2016 01:16:55 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 29 Nov 2016 01:16:54 -0800
Message-ID: <cover.1480410972.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] kernel-devsrc: remove symlink source
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
X-List-Received-Date: Tue, 29 Nov 2016 09:16:56 -0000
Content-Type: text/plain

The following changes since commit af280990bff4a484fd8a18e3442b56a0a39b7611:

  Revert "classes/populate_sdk_ext: require uninative" (2016-11-28 14:49:37 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/kernel
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/kernel

Robert Yang (1):
  kernel-devsrc: remove symlink source

 meta/recipes-kernel/linux/kernel-devsrc.bb | 7 +++++++
 1 file changed, 7 insertions(+)

-- 
2.9.0


