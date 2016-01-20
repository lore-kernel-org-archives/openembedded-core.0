Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 210266067D
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 08:34:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0K8YMIa015184
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Jan 2016 00:34:26 -0800
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Wed, 20 Jan 2016 00:34:24 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 20 Jan 2016 00:34:22 -0800
Message-ID: <cover.1453278829.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] insane.bbclass: print all the QA messages and fix package_qa_walk()
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
X-List-Received-Date: Wed, 20 Jan 2016 08:34:26 -0000
Content-Type: text/plain

The following changes since commit 4fd33ca846ba9f61e72a176a6462443c9fb5ddc2:

  rpm: remove bashisms: [ x == x ] -> [ x = x ] (2016-01-19 17:39:50 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/qa
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/qa

Robert Yang (2):
  insane.bbclass: print all the QA messages
  insane.bbclass: fix package_qa_walk()

 meta/classes/insane.bbclass |   64 +++++++++++++++++++++++--------------------
 1 file changed, 35 insertions(+), 29 deletions(-)

-- 
1.7.9.5


