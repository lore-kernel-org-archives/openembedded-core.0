Return-Path: <Qi.Chen@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id A161C7CD88
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 02:49:46 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x272nQCn023560
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Mar 2019 18:49:37 -0800
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 6 Mar 2019 18:49:04 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Mar 2019 10:58:53 +0800
Message-ID: <cover.1551927438.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] systemd: backport patch to fix parallel build failure
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
X-List-Received-Date: Thu, 07 Mar 2019 02:49:47 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 525c5e516323ff584f65bed3320626b1d056260d:

  README.poky: Add pointers to key contributions wiki guides (2019-03-06 23:12:27 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/systemd-parallel
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/systemd-parallel

Chen Qi (1):
  systemd: backport patch to fix parallel build failure

 ...re-version.h-as-dep-for-various-targets-t.patch | 118 +++++++++++++++++++++
 meta/recipes-core/systemd/systemd_241.bb           |   1 +
 2 files changed, 119 insertions(+)
 create mode 100644 meta/recipes-core/systemd/systemd/0001-meson-declare-version.h-as-dep-for-various-targets-t.patch

-- 
1.9.1


