Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 120B26BDA2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Dec 2018 03:01:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wBD31nd0014560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Dec 2018 19:01:49 -0800 (PST)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 12 Dec 2018 19:01:49 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2018 11:19:27 +0800
Message-ID: <cover.1544671104.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] lib/oe/utils: Set stderr for host_gcc_version()
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
X-List-Received-Date: Thu, 13 Dec 2018 03:01:49 -0000
Content-Type: text/plain

The following changes since commit 8bc0d2f2197430723f8b2d0785169e48c883eedb:

  mdadm: Drop redundant patches and fix build with clang (2018-12-09 11:08:07 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/stderr
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/stderr

Robert Yang (1):
  lib/oe/utils: Set stderr for host_gcc_version()

 meta/lib/oe/utils.py | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.7.4


