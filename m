Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 8C25C7BFBA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 24 Jan 2019 06:45:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x0O6jCOk000935
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Jan 2019 22:45:43 -0800
Received: from pek-lpg-core1.wrs.com (128.224.156.132) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.408.0; Wed, 23 Jan 2019 22:45:15 -0800
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 24 Jan 2019 15:03:41 +0800
Message-ID: <cover.1548313400.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/1] fontconfig: Fix define for HAVE_POSIX_FADVISE
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
X-List-Received-Date: Thu, 24 Jan 2019 06:45:52 -0000
Content-Type: text/plain

The following changes since commit a4edfa4cf451bf412525887b5b24b9db6486ae97:

  remove unused distutils-tools.bbclass (2019-01-23 07:57:02 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/ft
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=rbt/ft

Robert Yang (1):
  fontconfig: Fix define for HAVE_POSIX_FADVISE

 ...cache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch | 33 ++++++++++++++++++++++
 .../fontconfig/fontconfig_2.12.6.bb                |  1 +
 2 files changed, 34 insertions(+)
 create mode 100644 meta/recipes-graphics/fontconfig/fontconfig/0001-src-fccache.c-Fix-define-for-HAVE_POSIX_FADVISE.patch

-- 
2.7.4


