Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3A867745BC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 09:12:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7H9CoRo023947
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2018 02:12:50 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Fri, 17 Aug 2018 02:12:49 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 17 Aug 2018 17:17:13 +0800
Message-ID: <cover.1534497181.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] assimp.py: fix AttributeError in tearDownClass
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
X-List-Received-Date: Fri, 17 Aug 2018 09:12:49 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 704e725bba37911e56ecd0edda694edfe9fce40f:

  runtime selftest: limit kernel hw bp arches (2018-08-16 22:40:28 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/assimp
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/assimp

Chen Qi (1):
  assimp.py: fix AttributeError in tearDownClass

 meta/lib/oeqa/sdk/cases/assimp.py | 5 -----
 1 file changed, 5 deletions(-)

-- 
1.9.1


