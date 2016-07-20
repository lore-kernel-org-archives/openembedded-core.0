Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34B386080F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jul 2016 05:54:35 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u6K5sWHP017779
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2016 22:54:35 -0700
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Jul 2016 22:54:31 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Jul 2016 22:54:29 -0700
Message-ID: <cover.1468994042.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] btrfs-tools: fix installed-vs-shipped
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
X-List-Received-Date: Wed, 20 Jul 2016 05:54:36 -0000
Content-Type: text/plain

The following changes since commit 8b369cdd73ab17cdf834a591b97b25840caeb740:

  toaster.bbclass: only scan files-in-image.txt if it exists (2016-07-19 09:03:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/bt
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/bt

Robert Yang (1):
  btrfs-tools: fix installed-vs-shipped

 meta/recipes-devtools/btrfs-tools/btrfs-tools_4.6.1.bb | 2 ++
 1 file changed, 2 insertions(+)

-- 
2.9.0


