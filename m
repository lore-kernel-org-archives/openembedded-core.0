Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30C5B6CA54
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 08:31:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s2Q8VTP8002943
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Mar 2014 01:31:29 -0700 (PDT)
Received: from pek-kkang-d2.wrs.com (128.224.163.135) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Wed, 26 Mar 2014 01:31:28 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Mar 2014 16:32:11 +0800
Message-ID: <cover.1395822606.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/2] gnupg: two CVE patches
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
X-List-Received-Date: Wed, 26 Mar 2014 08:31:32 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 43d717df16312a8f0333aff6b8b037b4b9d51bf3:

  toaster.bbclass: update buildstats event data (2014-03-25 14:19:57 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/r_port60_gnupg_140326-1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_port60_gnupg_140326-1

Ming Liu (1):
  gnupg: CVE-2013-4351

Yong Zhang (1):
  gnupg: CVE-2013-4576

 .../gnupg/gnupg-1.4.7/CVE-2013-4351.patch          |   44 ++++++
 .../gnupg/gnupg-1.4.7/CVE-2013-4576.patch          |  153 ++++++++++++++++++++
 meta/recipes-support/gnupg/gnupg_1.4.7.bb          |    5 +-
 3 files changed, 201 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4351.patch
 create mode 100644 meta/recipes-support/gnupg/gnupg-1.4.7/CVE-2013-4576.patch

-- 
1.7.9.5


