Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD56E78D3F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 09:39:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w7D9d4rg028186
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Aug 2018 02:39:04 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Mon, 13 Aug 2018 02:39:04 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 13 Aug 2018 17:43:21 +0800
Message-ID: <cover.1534150669.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] mandb: fix runtime problem and rootfs time problem
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
X-List-Received-Date: Mon, 13 Aug 2018 09:39:03 -0000
Content-Type: text/plain

The following changes since commit 028a292001f64ad86c6b960a05ba1f6fd72199de:

  binutils: enable x86_64-pep for producing EFI binaries on x86-64 (2018-08-09 23:47:56 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/yocto12872
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/yocto12872

Chen Qi (2):
  man-db: add volatile configuration file for sysvinit
  man-db: rdepend on base-passwd to ensure installation order

 meta/recipes-extended/man-db/files/99_mandb  |  1 +
 meta/recipes-extended/man-db/man-db_2.8.3.bb | 13 ++++++++++++-
 2 files changed, 13 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-extended/man-db/files/99_mandb

-- 
1.9.1


