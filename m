Return-Path: <Kai.Kang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 8C8FE606A8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 08:55:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u6E8tG80009182
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2016 01:55:16 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.248.2; Thu, 14 Jul 2016 01:55:15 -0700
From: <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 14 Jul 2016 16:53:07 +0800
Message-ID: <cover.1468486311.git.kai.kang@windriver.com>
X-Mailer: git-send-email 2.6.1
MIME-Version: 1.0
Subject: [PATCH 0/1] Backport patch to fix CVE-2016-2381 for perl
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
X-List-Received-Date: Thu, 14 Jul 2016 08:55:17 -0000
Content-Type: text/plain

From: Kai Kang <kai.kang@windriver.com>

The following changes since commit 627d01997fcf6a0581d88047735769ffb2592b82:

  useradd-staticids: use map() instead of imap() (2016-07-12 23:12:00 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib kangkai/cve-2016-2381
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/cve-2016-2381

Kai Kang (1):
  perl: fix CVE-2016-2381

 .../perl/perl/perl-fix-CVE-2016-2381.patch         | 113 +++++++++++++++++++++
 meta/recipes-devtools/perl/perl_5.22.1.bb          |   1 +
 2 files changed, 114 insertions(+)
 create mode 100644 meta/recipes-devtools/perl/perl/perl-fix-CVE-2016-2381.patch

-- 
2.6.1


