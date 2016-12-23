Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id DD77F71C84
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Dec 2016 02:58:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uBN2w2mY022476
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2016 18:58:02 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.184) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Thu, 22 Dec 2016 18:58:01 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 23 Dec 2016 10:59:20 +0800
Message-ID: <cover.1482461845.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V2 0/2] warn when ALTERNATIVE_PRIORITY are the same
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
X-List-Received-Date: Fri, 23 Dec 2016 02:58:02 -0000
Content-Type: text/plain

Changes since V1:
Fixed do_rootfs failure for deb package backend.

The following changes since commit 425afe2484707640ac71194885fdb263e95e9950:

  lib/oe/utils: Drop python2 compatibility code (2016-12-22 08:50:21 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/BUG8314
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/BUG8314

Chen Qi (2):
  package_manager: default to have scriptlet output captured in log
  opkg-utils: warn if update-alternatives finds priority conflict

 meta/lib/oe/package_manager.py                     | 11 ++++-----
 ...rnatives-warn-when-multiple-providers-hav.patch | 26 ++++++++++++++++++++++
 meta/recipes-devtools/opkg-utils/opkg-utils_git.bb |  3 ++-
 3 files changed, 34 insertions(+), 6 deletions(-)
 create mode 100644 meta/recipes-devtools/opkg-utils/opkg-utils/0001-update-alternatives-warn-when-multiple-providers-hav.patch

-- 
1.9.1


