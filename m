Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 34D2B60034
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Apr 2015 07:53:02 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.9) with ESMTP id t317r3QO016899
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 1 Apr 2015 00:53:03 -0700 (PDT)
Received: from ala-blade48.wrs.com (147.11.105.68) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 1 Apr 2015 00:53:02 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Apr 2015 00:52:59 -0700
Message-ID: <cover.1427874748.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/3] meta: 3 fixes
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
X-List-Received-Date: Wed, 01 Apr 2015 07:53:03 -0000
Content-Type: text/plain

The following changes since commit e6aab245623b6ba1ca5f06632d1028c863cef737:

  image_types: Add missing ext4 support (2015-03-31 22:38:50 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/3fixes
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/3fixes

Robert Yang (3):
  piglit: add PACKAGECONFIG for freeglut
  db: fix parallel issue
  glibc: fix a tpo

 .../glibc/glibc/elf-Makefile-fix-a-typo.patch      |   36 ++++++++++++++++++++
 meta/recipes-core/glibc/glibc_2.21.bb              |    1 +
 meta/recipes-graphics/piglit/piglit_git.bb         |    3 ++
 ...akefile-let-libso_target-depend-on-bt_rec.patch |   30 ++++++++++++++++
 meta/recipes-support/db/db_6.0.30.bb               |    1 +
 5 files changed, 71 insertions(+)
 create mode 100644 meta/recipes-core/glibc/glibc/elf-Makefile-fix-a-typo.patch
 create mode 100644 meta/recipes-support/db/db/Makefile-let-libso_target-depend-on-bt_rec.patch

-- 
1.7.9.5


