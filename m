Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA18D6E681
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 08:55:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u3J8ttxk026276
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Apr 2016 01:55:55 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 19 Apr 2016 01:55:54 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 19 Apr 2016 04:55:52 -0400
Message-ID: <cover.1461055627.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCHv2 0/1] bash: fixed ptest run-builtins failed
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
X-List-Received-Date: Tue, 19 Apr 2016 08:55:59 -0000
Content-Type: text/plain

The following changes since commit ee25d0e3987d7732a2e46e1640693b4cf419a9fc:

  toasterconf.json: Update for krogoth release (2016-04-18 16:49:28 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fixed-bash-ptest-run-builtins-failed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fixed-bash-ptest-run-builtins-failed

Dengke Du (1):
  bash: fixed ptest run-builtins failed

 .../bash/bash/fix-run-builtins.patch               | 33 ++++++++++++++++++++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-builtins.patch

-- 
2.8.1


