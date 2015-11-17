Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AE9D77702B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 05:38:44 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id tAH5ciqd000148
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Nov 2015 21:38:44 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 16 Nov 2015 21:38:43 -0800
From: <wenzong.fan@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 17 Nov 2015 00:38:40 -0500
Message-ID: <cover.1447738630.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] subversion: fix CVE-2015-3184, CVE-2015-3187
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
X-List-Received-Date: Tue, 17 Nov 2015 05:38:44 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The following changes since commit d9aabf9639510fdb3e2ccc21ba5ae4aa9f6e4a57:

  gcc: Drop 4.8 (2015-11-16 14:59:18 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib wenzong/svn
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/svn

Wenzong Fan (2):
  subversion: fix CVE-2015-3184
  subversion: fix CVE-2015-3187

 .../subversion-CVE-2015-3184.patch                 | 2094 ++++++++++++++++++++
 .../subversion-CVE-2015-3187.patch                 |  346 ++++
 .../subversion/subversion_1.8.13.bb                |    2 +
 3 files changed, 2442 insertions(+)
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3184.patch
 create mode 100644 meta/recipes-devtools/subversion/subversion-1.8.13/subversion-CVE-2015-3187.patch

-- 
1.9.1


