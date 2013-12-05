Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 21CDD6DF85
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Dec 2013 08:54:29 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id rB58sSpg020178
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 5 Dec 2013 00:54:28 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.347.0; Thu, 5 Dec 2013 00:54:28 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 5 Dec 2013 16:55:10 +0800
Message-ID: <cover.1386232830.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] libgcrypt: fix compile error with '-O2' in sysroot path
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
X-List-Received-Date: Thu, 05 Dec 2013 08:54:30 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit c51730aaa91066cfb51ad6ec2920fb4f9d9ea94c:

  bitbake: Hob: check if warnings are related to package build (2013-12-03 17:45:54 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/libgcrypt
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/libgcrypt

Chen Qi (1):
  libgcrypt: fix compile error with '-O2' in sysroot path

 ...fix-compile-error-with-O2-in-sysroot-path.patch |   46 ++++++++++++++++++++
 meta/recipes-support/libgcrypt/libgcrypt.inc       |    3 +-
 2 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-support/libgcrypt/files/fix-compile-error-with-O2-in-sysroot-path.patch

-- 
1.7.9.5


