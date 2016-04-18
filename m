Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6AD3560745
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 02:57:09 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3I2v9ph015253
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Apr 2016 19:57:09 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Apr 2016 19:57:08 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 17 Apr 2016 19:57:06 -0700
Message-ID: <cover.1460947932.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/2] fix buildtools-tarball and meta.bbclass
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
X-List-Received-Date: Mon, 18 Apr 2016 02:57:10 -0000
Content-Type: text/plain

The following changes since commit 37aac647d510557323083c77c3114476440a325d:

  fs-perms.txt: fix ROOT_HOME's permission (2016-04-15 06:58:49 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/meta
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/meta

Robert Yang (2):
  buildtools-tarball.bb: fix unexpected operator
  meta.bbclass: set INHIBIT_DEFAULT_DEPS

 meta/classes/meta.bbclass                    | 2 ++
 meta/recipes-core/meta/buildtools-tarball.bb | 2 +-
 2 files changed, 3 insertions(+), 1 deletion(-)

-- 
2.8.0


