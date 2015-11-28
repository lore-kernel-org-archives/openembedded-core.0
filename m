Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 703226011F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 Nov 2015 06:53:52 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAS6roQR023932
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 27 Nov 2015 22:53:50 -0800 (PST)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.248.2; Fri, 27 Nov 2015 22:53:49 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Sat, 28 Nov 2015 14:53:39 +0800
Message-ID: <cover.1448693519.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bash_4.3.30: fix testcase run-coproc/run-execscript/run-test/run-heredoc failed
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
X-List-Received-Date: Sat, 28 Nov 2015 06:53:55 -0000
Content-Type: text/plain

The following changes since commit 03f15e51998a3ef65a5b68cb7cbf724f4388c289:

  sstate: Ensure siginfo and sig files are also touched (2015-11-25 08:09:00 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-bash
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-bash

Hongxu Jia (1):
  bash_4.3.30: fix testcase
    run-coproc/run-execscript/run-test/run-heredoc failed

 meta/recipes-extended/bash/bash.inc                |   3 +
 ...roc-run-heredoc-run-execscript-run-test-f.patch | 169 +++++++++++++++++++++
 meta/recipes-extended/bash/bash/run-ptest          |   2 +-
 meta/recipes-extended/bash/bash_4.3.30.bb          |   1 +
 4 files changed, 174 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-coproc-run-heredoc-run-execscript-run-test-f.patch

-- 
1.9.1


