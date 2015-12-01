Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7434A605B3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Dec 2015 02:13:51 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tB12DpVW010291
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Nov 2015 18:13:51 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.246) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Mon, 30 Nov 2015 18:13:50 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 1 Dec 2015 10:13:54 +0800
Message-ID: <cover.1448935983.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] cpio: fix test case of symlink-bad-length
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
X-List-Received-Date: Tue, 01 Dec 2015 02:13:53 -0000
Content-Type: text/plain

The following changes since commit 80b3974081c4a8c604e23982a6db8fb32c616058:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:08:51 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/cpio-testcase
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/cpio-testcase

Chen Qi (1):
  cpio: fix test case of symlink-bad-length

 .../0001-fix-testcase-of-symlink-bad-length.patch  | 57 ++++++++++++++++++++++
 meta/recipes-extended/cpio/cpio_2.11.bb            |  1 +
 2 files changed, 58 insertions(+)
 create mode 100644 meta/recipes-extended/cpio/cpio-2.11/0001-fix-testcase-of-symlink-bad-length.patch

-- 
1.9.1


