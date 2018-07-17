Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9163478891
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jul 2018 03:35:25 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6H3ZFlQ020619
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 20:35:15 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.399.0;
	Mon, 16 Jul 2018 20:35:14 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <ross.burton@intel.com>
Date: Mon, 16 Jul 2018 23:34:29 -0400
Message-ID: <cover.1531798346.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Cc: paul.eggleton@linux.intel.com
Subject: [PATCH 0/2] distutils/setuptools:fix recipes may try to fetch code during do_compile
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
X-List-Received-Date: Tue, 17 Jul 2018 03:35:25 -0000
Content-Type: text/plain

The following changes since commit 05c32d2de1ee4681cc78cb107a158e9ab22c9619:

  oeqa/selftest/wic: Split tests into two class groups (2018-07-16 13:21:35 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/setuptools-fetch
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/setuptools-fetch

Hongxu Jia (2):
  distutils/setuptools-native: do not try to fetch code during
    do_compile
  distutils3/setuptools3-native: do not try to fetch code during
    do_compile

 meta/classes/distutils.bbclass                     |  2 ++
 meta/classes/distutils3.bbclass                    |  2 ++
 ...ionally-do-not-fetch-code-by-easy_install.patch | 35 ++++++++++++++++++++++
 .../python/python-setuptools_40.0.0.bb             |  2 ++
 ...ionally-do-not-fetch-code-by-easy_install.patch | 35 ++++++++++++++++++++++
 .../python/python3-setuptools_40.0.0.bb            |  2 ++
 6 files changed, 78 insertions(+)
 create mode 100644 meta/recipes-devtools/python/python-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch
 create mode 100644 meta/recipes-devtools/python/python3-setuptools/0001-conditionally-do-not-fetch-code-by-easy_install.patch

-- 
2.8.1


