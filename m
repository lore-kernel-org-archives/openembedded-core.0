Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 53DCC6FF69
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 15:48:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u9VFmxgk000866
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 31 Oct 2016 08:48:59 -0700
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 31 Oct 2016 08:48:58 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 31 Oct 2016 08:48:57 -0700
Message-ID: <cover.1477928374.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] oe/copy_buildsystem.py: dereference symlink
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
X-List-Received-Date: Mon, 31 Oct 2016 15:49:00 -0000
Content-Type: text/plain

The following changes since commit 42b4fa2f923244bc047874752d2e0381ff6f0a25:

  boost: fix the SRC_URI to point to an actual release, and not a master snapshot (2016-10-31 14:23:04 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/cp
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/cp

Robert Yang (1):
  oe/copy_buildsystem.py: dereference symlink

 meta/lib/oe/copy_buildsystem.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

-- 
2.9.0


