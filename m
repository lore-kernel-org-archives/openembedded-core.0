Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id A03FE6A59B
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 08:37:58 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5E8c0T2026827
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Jun 2013 01:38:00 -0700 (PDT)
Received: from lirq-OptiPlex-780.corp.ad.wrs.com (128.224.162.159) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Fri, 14 Jun 2013 01:37:59 -0700
From: <rongqing.li@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Jun 2013 16:37:57 +0800
Message-ID: <cover.1371198970.git.rongqing.li@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1] cogl: make cogl be able to build on ARM arch
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
X-List-Received-Date: Fri, 14 Jun 2013 08:37:58 -0000
Content-Type: text/plain

From: "Roy.Li" <rongqing.li@windriver.com>

The following changes since commit 1aeecaeee9bb1eee779973fce7f15cc7fad269a0:

  classes/qmake_base: allow parallel make (2013-06-13 17:37:58 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib roy/cogl
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=roy/cogl

Roy.Li (1):
  cogl: make cogl be able to build on ARM arch

 meta/recipes-graphics/cogl/cogl-1.0.inc            |    4 +++
 .../cogl/files/cogl-fixed-thumb.patch              |   30 ++++++++++++++++++++
 .../cogl/files/cogl_fixed_mul-constraint.patch     |   22 ++++++++++++++
 3 files changed, 56 insertions(+)
 create mode 100644 meta/recipes-graphics/cogl/files/cogl-fixed-thumb.patch
 create mode 100644 meta/recipes-graphics/cogl/files/cogl_fixed_mul-constraint.patch

-- 
1.7.10.4


