Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 423126E8A6
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 05:13:56 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s255Duum019463
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 4 Mar 2014 21:13:57 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Tue, 4 Mar 2014 21:13:56 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 5 Mar 2014 13:14:31 +0800
Message-ID: <cover.1393996274.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] e2fsprogs: fix cross compilation problem
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
X-List-Received-Date: Wed, 05 Mar 2014 05:13:57 -0000
Content-Type: text/plain

The following changes since commit 82c773e88aaefd9321481ad297554d5b4a3ae0b2:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:52:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/e2fsprogs-qemumips64
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/e2fsprogs-qemumips64

Chen Qi (1):
  e2fsprogs: fix cross compilation problem

 ...1-e2fsprogs-fix-cross-compilation-problem.patch |   55 ++++++++++++++++++++
 .../recipes-devtools/e2fsprogs/e2fsprogs_1.42.9.bb |    1 +
 2 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-devtools/e2fsprogs/e2fsprogs/0001-e2fsprogs-fix-cross-compilation-problem.patch

-- 
1.7.9.5


