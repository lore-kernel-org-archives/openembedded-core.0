Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9751F77DB8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jul 2017 01:33:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v6C1XIuB015785
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 18:33:18 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.294.0; Tue, 11 Jul 2017 18:33:17 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 12 Jul 2017 09:25:04 +0800
Message-ID: <cover.1499822461.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.10.1
MIME-Version: 1.0
Subject: [PATCH 0/1] bind: 9.10..3-P3 -> 9.10.5-P3
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
X-List-Received-Date: Wed, 12 Jul 2017 01:33:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 81498aac9560fbeaeb58eaada32ce80e0ea51628:

  yocto-project-qs: Updated Next Steps list (2017-07-12 00:28:16 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/bind
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/bind

Kai Kang (1):
  bind: 9.10..3-P3 -> 9.10.5-P3

 ...0001-build-use-pkg-config-to-find-libxml2.patch |   10 +-
 .../bind/bind/CVE-2016-1285.patch                  |  154 ---
 .../bind/bind/CVE-2016-1286_1.patch                |   79 --
 .../bind/bind/CVE-2016-1286_2.patch                |  317 ------
 .../bind/bind/CVE-2016-2088.patch                  |  247 -----
 .../bind/bind/CVE-2016-2775.patch                  |   90 --
 .../bind/bind/CVE-2016-2776.patch                  |  123 ---
 .../bind/bind/CVE-2016-6170.patch                  | 1090 --------------------
 .../bind/bind/CVE-2016-8864.patch                  |  219 ----
 .../bind/bind/bind-confgen-build-unix.o-once.patch |   10 +-
 .../bind/bind/mips1-not-support-opcode.diff        |  104 --
 .../use-python3-and-fix-install-lib-path.patch     |   36 +
 .../bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb}  |   25 +-
 13 files changed, 61 insertions(+), 2443 deletions(-)
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1285.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_1.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-1286_2.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2088.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2775.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-2776.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-6170.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/CVE-2016-8864.patch
 delete mode 100644 meta/recipes-connectivity/bind/bind/mips1-not-support-opcode.diff
 create mode 100644 meta/recipes-connectivity/bind/bind/use-python3-and-fix-install-lib-path.patch
 rename meta/recipes-connectivity/bind/{bind_9.10.3-P3.bb => bind_9.10.5-P3.bb} (85%)

-- 
2.10.1


