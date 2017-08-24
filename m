Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9E67871B31
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Aug 2017 06:19:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v7O6Ju5v017767
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 23:19:56 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 23:19:55 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 23 Aug 2017 23:19:54 -0700
Message-ID: <cover.1503555549.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.10.2
MIME-Version: 1.0
Subject: [PATCH 0/1] core/target/ssh.py: use reader to handle partial data
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
X-List-Received-Date: Thu, 24 Aug 2017 06:19:55 -0000
Content-Type: text/plain

The following changes since commit dcb6cd19fb8c639cb844d116fb83827267f37421:

  buildhistory.bbclass: add ptest (2017-08-23 14:12:39 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ptest
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ptest

Robert Yang (1):
  core/target/ssh.py: use reader to handle partial data

 meta/lib/oeqa/core/target/ssh.py | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

-- 
2.10.2


