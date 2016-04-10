Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id EC37D771C8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 14:16:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u3AEGnX3009034
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Apr 2016 07:16:49 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 10 Apr 2016 07:16:48 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 10 Apr 2016 07:16:47 -0700
Message-ID: <cover.1460297783.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/1] runqemu: let ramfs equal to cpio.gz
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
X-List-Received-Date: Sun, 10 Apr 2016 14:16:50 -0000
Content-Type: text/plain

The following changes since commit d2734fbfe209fcb8bd908b55e64d1ea8712d02c1:

  local.conf.sample: Make it possible to override EXTRA_IMAGE_FEATURES (2016-04-09 07:56:57 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/runqemu
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/runqemu

Robert Yang (1):
  runqemu: let ramfs equal to cpio.gz

 scripts/runqemu | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

-- 
2.8.0


