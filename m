Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 49FE27BFC0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 02:43:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wBI2gkP8007137
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2018 18:42:56 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Mon, 17 Dec 2018 18:42:35 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Dec 2018 11:00:20 +0800
Message-ID: <cover.1545101991.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] package.bbclass: Don not hide cpio's error
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
X-List-Received-Date: Tue, 18 Dec 2018 02:43:06 -0000
Content-Type: text/plain

The following changes since commit 20aea61385e1a53ac245353899277ba20104ed2f:

  gcc: Drop 7.3 since 8.2 is working fine for us (2018-12-15 17:10:44 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/package
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/package

Robert Yang (1):
  package.bbclass: Don not hide cpio's error

 meta/classes/package.bbclass | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

-- 
2.7.4


