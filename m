Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 4C7866012A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 09:42:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v9R9gk52007805
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 Oct 2017 02:42:47 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.189) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Fri, 27 Oct 2017 02:42:46 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 27 Oct 2017 17:43:49 +0800
Message-ID: <cover.1509097262.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] gcc: fix miscompilation for mips64 which caused systemd's strange behaviour
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
X-List-Received-Date: Fri, 27 Oct 2017 09:42:46 -0000
Content-Type: text/plain

The following changes since commit 65d23bd7986615fdfb0f1717b615534a2a14ab80:

  README.qemu: qemuppc64 is not supported (2017-10-16 23:54:31 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/bug12266
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/bug12266

Chen Qi (2):
  systemd: remove useless options for mips4
  gcc: fix miscompilation on mips64

 meta/recipes-core/systemd/systemd_234.bb           |  3 --
 meta/recipes-devtools/gcc/gcc-7.2.inc              |  1 +
 .../fix-miscompilation-for-O1-on-mips64el.patch    | 35 ++++++++++++++++++++++
 3 files changed, 36 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-devtools/gcc/gcc-7.2/fix-miscompilation-for-O1-on-mips64el.patch

-- 
1.9.1


