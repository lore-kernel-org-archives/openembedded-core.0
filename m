Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8613B6011B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2018 03:24:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7U3OKOo013067
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2018 20:24:20 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Wed, 29 Aug 2018 20:24:19 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 30 Aug 2018 10:46:26 +0800
Message-ID: <cover.1535597145.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH 0/1] webkitgtk: fix CVEs
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
X-List-Received-Date: Thu, 30 Aug 2018 03:24:19 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit a8368651ffed1bd6c4715a37dfe9f40c48ca23c4:

  bitbake: fetcher: Fixed remote removal not throwing exception. (2018-08-28 10:32:08 +0100)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/cves
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/cves

Kai Kang (1):
  webkitgtk: fix CVEs

 .../webkitgtk/0001-Fix-CVE-2017-17821.patch   | 44 ++++++++++
 .../webkitgtk/0002-Fix-CVE-2018-12911.patch   | 82 +++++++++++++++++++
 meta/recipes-sato/webkit/webkitgtk_2.20.3.bb  |  2 +
 3 files changed, 128 insertions(+)
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0001-Fix-CVE-2017-17821.patch
 create mode 100644 meta/recipes-sato/webkit/webkitgtk/0002-Fix-CVE-2018-12911.patch

-- 
2.18.0


