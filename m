Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8AF766FFFE
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2016 07:38:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u7G7cdPa017750
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Aug 2016 00:38:39 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Tue, 16 Aug 2016 00:38:38 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 16 Aug 2016 03:38:35 -0400
Message-ID: <cover.1471332921.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V3 0/1] bash: fix run-intl ptest failed
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
X-List-Received-Date: Tue, 16 Aug 2016 07:38:43 -0000
Content-Type: text/plain

The following changes since commit 5b61fa04a335a4fdefd435dc25d4bac41ee21e39:

  bitbake: toaster-tests: fix URL given for Chromedriver download (2016-07-29 09:53:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-bash-ptest-run-intl-failed
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-bash-ptest-run-intl-failed

Dengke Du (1):
  bash: fix run-intl ptest failed

 meta/recipes-extended/bash/bash/fix-run-intl.patch | 110 +++++++++++++++++++++
 meta/recipes-extended/bash/bash/run-ptest          |  20 ++++
 meta/recipes-extended/bash/bash_4.3.30.bb          |   3 +-
 3 files changed, 132 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/bash/bash/fix-run-intl.patch

-- 
2.8.1


