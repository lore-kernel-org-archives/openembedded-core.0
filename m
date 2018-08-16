Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9AEEA79263
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 10:33:39 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7GAXeEh024913
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2018 03:33:40 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.399.0; Thu, 16 Aug 2018 03:33:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 16 Aug 2018 18:37:57 +0800
Message-ID: <cover.1534415298.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] glibc: re-package for libnss-db
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
X-List-Received-Date: Thu, 16 Aug 2018 10:33:39 -0000
Content-Type: text/plain

Changes in V2:
* Create makedbs.sh according to the Makefile. Use it so that we can get rid of
  the make dependency.

The following changes since commit d4011ce0a37083b19de1769d7f18aa42d7b98137:

  bitbake: bb/utils.py: add break_hardlinks helper (2018-08-16 09:50:42 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/libnss-db
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/libnss-db

Chen Qi (1):
  glibc: re-package for libnss-db

 meta/recipes-core/glibc/glibc-package.inc |   6 +-
 meta/recipes-core/glibc/glibc/makedbs.sh  | 177 ++++++++++++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.28.bb     |   1 +
 3 files changed, 182 insertions(+), 2 deletions(-)
 create mode 100755 meta/recipes-core/glibc/glibc/makedbs.sh

-- 
1.9.1


