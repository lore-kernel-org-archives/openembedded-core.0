Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (unknown [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F8506608B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 07:33:38 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s4G7XdxN013863
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 May 2014 00:33:40 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.149) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Fri, 16 May 2014 00:33:38 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 16 May 2014 15:33:38 +0800
Message-ID: <cover.1400225425.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/2]screen: backport two patches to fix CVE bugs
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
X-List-Received-Date: Fri, 16 May 2014 07:33:42 -0000
Content-Type: text/plain

From: Roy Li <rongqing.li@windriver.com>

The following changes since commit 7db1f38607829ca34e21cd328613706a56f7ee98:

  subversion: fix for Security Advisory CVE-2013-4277 (2014-05-16 13:43:06 +0800)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/screen
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/screen

Yue Tao (2):
  Screen: fix for Security Advisory CVE-2009-1214
  screen: fix for Security Advisory CVE-2009-1215

 .../screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch  |   27 ++++++
 .../screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch  |   86 ++++++++++++++++++++
 meta/recipes-extended/screen/screen_4.0.3.bb       |    2 +
 3 files changed, 115 insertions(+)
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.2-CVE-2009-1215.patch
 create mode 100644 meta/recipes-extended/screen/screen-4.0.3/screen-4.0.3-CVE-2009-1214.patch

-- 
1.7.10.4


