Return-Path: <Yi.Zhao@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7731B700F3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Aug 2016 07:11:28 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u7A7BSpI016821
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Aug 2016 00:11:28 -0700 (PDT)
Received: from localhost (128.224.162.178) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.248.2;
	Wed, 10 Aug 2016 00:11:27 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 10 Aug 2016 15:11:15 +0800
Message-ID: <cover.1470812191.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.178]
Cc: akuster@mvista.com
Subject: [PATCH 0/5] libtiff: CVE fixes
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
X-List-Received-Date: Wed, 10 Aug 2016 07:11:30 -0000
Content-Type: text/plain

Fix CVE-2015-8781 CVE-2015-8784 CVE-2016-3186 CVE-2016-5321 CVE-2016-5323

The patches for CVE-2015-8781 and CVE-2015-8784 are cherry-picked from jethro branch since I found these 2 patches are also needed by tiff 4.0.6
Here is the comparing changes since 4.0.6 released, you could see these 2 patches are in the list:
https://github.com/vadz/libtiff/compare/Release-v4-0-6...master

The following changes since commit dfc016fbf13e62f7767edaf7abadf1d1b72680b2:

  maintainers.inc: remove augeas (2016-08-04 20:56:11 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib yzhao/tiff-cve
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=yzhao/tiff-cve

Armin Kuster (2):
  tiff: Security fix CVE-2015-8781
  tiff: Security fix CVE-2015-8784

Yi Zhao (3):
  tiff: Security fix CVE-2016-3186
  tiff: Security fix CVE-2016-5321
  tiff: Security fix CVE-2016-5323

 .../libtiff/files/CVE-2015-8781.patch              | 195 +++++++++++++++++++++
 .../libtiff/files/CVE-2015-8784.patch              |  73 ++++++++
 .../libtiff/files/CVE-2016-3186.patch              |  24 +++
 .../libtiff/files/CVE-2016-5321.patch              |  49 ++++++
 .../libtiff/files/CVE-2016-5323.patch              | 107 +++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   5 +
 6 files changed, 453 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8781.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2015-8784.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3186.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5321.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-5323.patch

-- 
2.7.4


