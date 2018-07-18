Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4A33174553
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2018 00:47:02 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w6I0l1dJ028953
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 17 Jul 2018 17:47:01 -0700 (PDT)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Tue, 17 Jul 2018 17:46:54 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Wed, 18 Jul 2018 08:56:59 +0800
Message-ID: <cover.1531875240.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/3] fix .pyc/.pyo buildpaths issue
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
X-List-Received-Date: Wed, 18 Jul 2018 00:47:02 -0000
Content-Type: text/plain

The following changes since commit 26e04b23ba1b6942aa7c7df478d41dfe7b73e6e0:

  oeqa/selftest/wic: Split tests into two class groups (2018-07-15 16:36:09 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/pyc-buildpath
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/pyc-buildpath

Hongxu Jia (3):
  distutils/setuptools, distutils3/setuptools3: improve reproducibility
  python-setuptools.inc: clean up useless local
    var-DISTUTILS_INSTALL_ARGS
  python3-pip: clean up obsolete

 meta/classes/distutils.bbclass                     |  8 +++++---
 meta/classes/distutils3.bbclass                    |  8 +++++---
 meta/classes/setuptools.bbclass                    |  5 -----
 meta/classes/setuptools3.bbclass                   |  4 ----
 meta/recipes-devtools/python/python-setuptools.inc |  3 ---
 meta/recipes-devtools/python/python3-pip_10.0.1.bb | 18 ------------------
 6 files changed, 10 insertions(+), 36 deletions(-)

-- 
2.7.4


