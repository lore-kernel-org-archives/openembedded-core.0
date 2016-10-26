Return-Path: <Yi.Zhao@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A43E871AAD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 08:26:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u9Q8QsCl021925
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Oct 2016 01:26:54 -0700 (PDT)
Received: from localhost (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.294.0;
	Wed, 26 Oct 2016 01:26:54 -0700
From: Yi Zhao <yi.zhao@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 26 Oct 2016 16:26:43 +0800
Message-ID: <cover.1477470209.git.yi.zhao@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.198]
Subject: [PATCH 0/5] tiff: fix CVEs
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
X-List-Received-Date: Wed, 26 Oct 2016 08:26:56 -0000
Content-Type: text/plain


The following changes since commit 30d1af89ce2a2fb30f32a898ec12c9a51db57013:

  image_types: Use softer setting of WKS_FILE (2016-10-25 17:58:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib yzhao/tiff-cves
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=yzhao/tiff-cves

Yi Zhao (5):
  tiff: Security fix CVE-2016-3945
  tiff: Security fix CVE-2016-3990
  tiff: Security fix CVE-2016-3991
  tiff: Security fix CVE-2016-3623
  tiff: Security fix CVE-2016-3622

 .../libtiff/files/CVE-2016-3622.patch              | 129 ++++++++++++++++++
 .../libtiff/files/CVE-2016-3623.patch              |  52 ++++++++
 .../libtiff/files/CVE-2016-3945.patch              | 118 +++++++++++++++++
 .../libtiff/files/CVE-2016-3990.patch              |  66 +++++++++
 .../libtiff/files/CVE-2016-3991.patch              | 147 +++++++++++++++++++++
 meta/recipes-multimedia/libtiff/tiff_4.0.6.bb      |   5 +
 6 files changed, 517 insertions(+)
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3622.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3623.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3945.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3990.patch
 create mode 100644 meta/recipes-multimedia/libtiff/files/CVE-2016-3991.patch

-- 
2.7.4


