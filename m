Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 6255D78A68
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Jul 2018 14:49:00 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w6JEmv4g026868
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 19 Jul 2018 07:48:59 -0700
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Thu, 19 Jul 2018 07:48:57 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Thu, 19 Jul 2018 22:59:03 +0800
Message-ID: <cover.1532012164.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2 0/3] fix .pyc/.pyo buildpaths issue
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
X-List-Received-Date: Thu, 19 Jul 2018 14:49:00 -0000
Content-Type: text/plain

Changed in V2: Rebase to latest oe-core

The following changes since commit ff0b682b807959521c85716296de7a1d26d7d18f:

  systemd-boot: upgrade to 239 (2018-07-18 10:13:30 +0100)

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


