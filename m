Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 9FF7E6DFD0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 23:01:51 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rB5N1oIK014125
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 15:01:50 -0800 (PST)
Received: from msp-mhatle-lx2.wrs.com (172.25.34.61) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.347.0; Thu, 5 Dec 2013 15:01:51 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 17:01:15 -0600
Message-ID: <cover.1386284385.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.8.1.2.545.g2f19ada
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/6][dora] Fix various CVE
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
X-List-Received-Date: Thu, 05 Dec 2013 23:01:52 -0000
Content-Type: text/plain

Each of the patches in this set fix various CVE items.  They apply to dora,
it has not yet been checked if they apply to master as well.

The following changes since commit c303f5ecf7cda1c3b8bb776a6800946c0487cd93:

  Revert "utils.bbclass: Fix override ordering for FILESPATH" (2013-12-03 12:55:47 +0000)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib mhatle/dora-CVE
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=mhatle/dora-CVE

Baogen Shang (2):
  libtiff: CVE-2013-4232
  libtiff: CVE-2013-4243

Li Wang (1):
  xinetd: CVE-2013-4342

Ming Liu (1):
  libtiff: fix CVE-2013-1960

Yue Tao (2):
  acpid: CVE-2011-1159
  icu: CVE-2013-2924

 meta/recipes-bsp/acpid/acpid.inc                   |   3 +-
 .../acpid/acpid/set_socket_noblock.patch           |  10 ++
 .../xinetd/xinetd/xinetd-CVE-2013-4342.patch       |  32 +++++
 meta/recipes-extended/xinetd/xinetd_2.3.15.bb      |   1 +
 .../libtiff/files/libtiff-CVE-2013-1960.patch      | 151 +++++++++++++++++++++
 .../libtiff/files/libtiff-CVE-2013-4232.patch      |  15 ++
 .../libtiff/files/libtiff-CVE-2013-4243.patch      |  40 ++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.3.bb      |   5 +-
 ...fer_length_check_to_UTF_16_or_32_detector.patch |  33 +++++
 meta/recipes-support/icu/icu_51.2.bb               |   1 +
 10 files changed, 289 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-bsp/acpid/acpid/set_socket_noblock.patch
 create mode 100644 meta/recipes-extended/xinetd/xinetd/xinetd-CVE-2013-4342.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-1960.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4232.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/libtiff-CVE-2013-4243.patch
 create mode 100644 meta/recipes-support/icu/icu-51.2/add_buffer_length_check_to_UTF_16_or_32_detector.patch

-- 
1.8.1.2.545.g2f19ada


