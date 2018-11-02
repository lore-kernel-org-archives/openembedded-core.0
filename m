Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8F20079F30
	for <openembedded-core@lists.openembedded.org>;
	Fri,  2 Nov 2018 08:51:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id wA28oEWS031058
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 2 Nov 2018 01:50:59 -0700
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 2 Nov 2018 01:50:40 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 2 Nov 2018 16:02:12 +0800
Message-ID: <cover.1541145029.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix CVEs for openssl
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
X-List-Received-Date: Fri, 02 Nov 2018 08:51:08 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

Fix CVEs for openssl:

1.0.2p:
* CVE-2018-0734

1.1.1:
* CVE-2018-0734
* CVE-2018-0735

The following changes since commit 411184bfaa6269bf2926bb2a576c0922958cbbb3:

  xserver-xorg: fix CVE-2018-14665 (2018-11-01 13:27:26 +0000)

are available in the Git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/cve
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/cve

Kai Kang (2):
  openssl: fix CVE-2018-0734 for both 1.0.2p and 1.1.1
  openssl: fix CVE-2018-0735 for 1.1.1

 .../openssl/0002-fix-CVE-2018-0734.patch      | 108 ++++++++++++++++++
 .../openssl/0003-fix-CVE-2018-0735.patch      |  50 ++++++++
 .../openssl10/0001-fix-CVE-2018-0734.patch    |  33 ++++++
 .../openssl/openssl10_1.0.2p.bb               |   1 +
 .../openssl/openssl_1.1.1.bb                  |   2 +
 5 files changed, 194 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0002-fix-CVE-2018-0734.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl/0003-fix-CVE-2018-0735.patch
 create mode 100644 meta/recipes-connectivity/openssl/openssl10/0001-fix-CVE-2018-0734.patch

-- 
2.18.0


