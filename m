Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 61C866C17F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 05:46:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id wAE5kaDj014472
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Nov 2018 21:46:36 -0800 (PST)
Received: from msp-lpggp1.wrs.com (172.25.34.110) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.408.0;
	Tue, 13 Nov 2018 21:46:35 -0800
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 14 Nov 2018 00:46:31 -0500
Message-ID: <cover.1542174292.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.19.0.rc2
MIME-Version: 1.0
Subject: [PATCH 0/1] gettext: fix CVE-2018-18751
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
X-List-Received-Date: Wed, 14 Nov 2018 05:46:36 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit eddff2b361928e88e3628ebc22a1a0ebb119e01b:

  curl: actually apply latest CVE patches (2018-11-09 17:46:18 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/gettext
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/gettext

Kai Kang (1):
  gettext: fix CVE-2018-18751

 .../gettext-0.19.8.1/fix-CVE-2018-18751.patch | 141 ++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.8.1.bb |   8 +-
 2 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.8.1/fix-CVE-2018-18751.patch

-- 
2.19.0.rc2


