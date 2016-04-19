Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 149A26014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 06:29:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J6TIke023288
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Apr 2016 23:29:18 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 18 Apr 2016 23:29:17 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 02:29:15 -0400
Message-ID: <cover.1461047220.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bash: fix run-builtins
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
X-List-Received-Date: Tue, 19 Apr 2016 06:29:20 -0000
Content-Type: text/plain

The following changes since commit ee25d0e3987d7732a2e46e1640693b4cf419a9fc:

  toasterconf.json: Update for krogoth release (2016-04-18 16:49:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-bash-ptest-run-builtins
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-bash-ptest-run-builtins

Dengke Du (1):
  bash: fixed run-builtins fail

 .../bash/bash/fix-run-builtins.patch               | 25 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |  1 +
 2 files changed, 26 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-builtins.patch

-- 
2.8.1


