Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 33CBD7CF0F
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Mar 2019 03:31:19 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x2B3UTQs009735
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 10 Mar 2019 20:31:10 -0700
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.439.0; Sun, 10 Mar 2019 20:30:47 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 11 Mar 2019 11:40:42 +0800
Message-ID: <cover.1552275615.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: backport one more patch to fix version.h parallel build failure
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
X-List-Received-Date: Mon, 11 Mar 2019 03:31:19 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 5220a105a74780a5c5a7d1cc6d1ab71e18d2e565:

  python: time.tzset missing (2019-03-09 14:43:12 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-one-more
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-one-more

Chen Qi (1):
  systemd: backport one more patch to fix version.h parallel build
    failure

 ...clare-version.h-as-dependency-for-systemd.patch | 32 ++++++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb           |  1 +
 2 files changed, 33 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dependency-for-systemd.patch

-- 
1.9.1


