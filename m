Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 89AE87F296
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 07:31:59 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.2) with ESMTPS id x8R7W0KA003173
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Sep 2019 00:32:00 -0700 (PDT)
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Fri, 27 Sep 2019 00:32:00 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Sep 2019 15:32:03 +0800
Message-ID: <cover.1569569493.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] apr: Check for libtoolize rather than libtool
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
X-List-Received-Date: Fri, 27 Sep 2019 07:31:59 -0000
Content-Type: text/plain

The following changes since commit 95ad5626296380358c8a502a3e04879dab653d78:

  build-appliance-image: Update to master head revision (2019-09-19 20:32:47 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/apr
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/apr

Robert Yang (1):
  apr: Check for libtoolize rather than libtool

 ...d-buildcheck.sh-improve-libtool-detection.patch | 32 ----------------------
 .../recipes-support/apr/apr/libtoolize_check.patch | 28 +++++++++++++++++++
 meta/recipes-support/apr/apr_1.7.0.bb              |  4 +--
 3 files changed, 30 insertions(+), 34 deletions(-)
 delete mode 100644 meta/recipes-support/apr/apr/0001-build-buildcheck.sh-improve-libtool-detection.patch
 create mode 100644 meta/recipes-support/apr/apr/libtoolize_check.patch

-- 
2.7.4


