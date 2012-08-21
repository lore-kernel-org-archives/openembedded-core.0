Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1T3jIu-0007Bx-53
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Aug 2012 09:55:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7L7h8NX021708
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Aug 2012 00:43:08 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.309.2; Tue, 21 Aug 2012 00:43:07 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 21 Aug 2012 15:42:59 +0800
Message-ID: <cover.1345534679.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] coreutils: fix to build with acl support
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 21 Aug 2012 07:55:12 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

Fix the issue that coreutils was built without acl support:

configure: WARNING: libacl development library was not found or not usable.
configure: WARNING: GNU coreutils will be built without ACL support.

which will cause ls and cp commands don't have the ACL related behaviors:
ls -l: no plus sign(+) after the permission string for files that have ACL
cp -p: can not preserves the ACLs.

[YOCTO #2959]

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
The following changes since commit 04568d1f18250d531aad5d286157d2d559083520:

  qemu: Fix broken accidental path move (2012-08-20 17:25:21 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/bug2959_acl_0821
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/bug2959_acl_0821

Jackie Huang (1):
  coreutils: fix to build with acl support

 .../coreutils-6.9/coreutils-build-with-acl.patch   |   28 ++++++++++++++++++++
 .../coreutils-8.14/coreutils-build-with-acl.patch  |   28 ++++++++++++++++++++
 meta/recipes-core/coreutils/coreutils_6.9.bb       |    1 +
 meta/recipes-core/coreutils/coreutils_8.14.bb      |    1 +
 4 files changed, 58 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/coreutils/coreutils-6.9/coreutils-build-with-acl.patch
 create mode 100644 meta/recipes-core/coreutils/coreutils-8.14/coreutils-build-with-acl.patch

-- 
1.7.4



