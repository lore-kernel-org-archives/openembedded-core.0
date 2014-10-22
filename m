Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BE3CC60097
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 07:37:31 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9M7bVUC024130
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 00:37:31 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Wed, 22 Oct 2014 00:37:30 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 22 Oct 2014 03:37:27 -0400
Message-ID: <cover.1413963279.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
MIME-Version: 1.0
Subject: [PATCH 0/2] subversion: two CVE patches
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
X-List-Received-Date: Wed, 22 Oct 2014 07:37:34 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

--
The following changes since commit 97756472d3a69eaca95d105494ffea78c6b077e0:

  build-appliance-image: Update to dizzy head revision (2014-10-18 16:16:27 +0200)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib jhuang0/fp-subversion_141022-0
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/fp-subversion_141022-0

Yue Tao (2):
  subversion: Security Advisory - subversion - CVE-2014-3522
  subversion: Security Advisory - subversion - CVE-2014-3528

 .../subversion-CVE-2014-3522.patch                 |  444 ++++++++++++++++++++
 .../subversion/subversion-CVE-2014-3522.patch      |  439 +++++++++++++++++++
 .../subversion/subversion-CVE-2014-3528.patch      |   29 ++
 .../subversion/subversion_1.6.15.bb                |    5 +-
 .../subversion/subversion_1.8.9.bb                 |    2 +
 5 files changed, 918 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.9/subversion-CVE-2014-3522.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3522.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion/subversion-CVE-2014-3528.patch

-- 
1.7.9.5


