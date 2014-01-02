Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8366B86C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  2 Jan 2014 06:34:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s026YlCI018838
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Jan 2014 22:34:47 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.164) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Wed, 1 Jan 2014 22:34:46 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 2 Jan 2014 14:34:57 +0800
Message-ID: <cover.1388644435.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] coreutils: upgrade to 8.22
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
X-List-Received-Date: Thu, 02 Jan 2014 06:34:47 -0000
Content-Type: text/plain

The following changes since commit 005af45191ded6185c618c708181b31281e43092:

  bitbake: fetch2: avoid printing "no checksum" error message twice (2013-12-22 14:29:13 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/coreutils-8.22
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/coreutils-8.22

Chen Qi (1):
  coreutils: upgrade to 8.22

 .../coreutils-8.21/coreutils-build-with-acl.patch  |   28 ------------------
 .../dummy_help2man.patch                           |    0
 .../coreutils-8.22/fix-for-dummy-man-usage.patch   |   31 ++++++++++++++++++++
 .../remove-usr-local-lib-from-m4.patch             |    0
 .../{coreutils_8.21.bb => coreutils_8.22.bb}       |    6 ++--
 5 files changed, 34 insertions(+), 31 deletions(-)
 delete mode 100644 meta/recipes-core/coreutils/coreutils-8.21/coreutils-build-with-acl.patch
 rename meta/recipes-core/coreutils/{coreutils-8.21 => coreutils-8.22}/dummy_help2man.patch (100%)
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.22/fix-for-dummy-man-usage.patch
 rename meta/recipes-core/coreutils/{coreutils-8.21 => coreutils-8.22}/remove-usr-local-lib-from-m4.patch (100%)
 rename meta/recipes-core/coreutils/{coreutils_8.21.bb => coreutils_8.22.bb} (95%)

-- 
1.7.9.5


