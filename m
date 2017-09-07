Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7D3EF71CBD
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Sep 2017 02:31:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v872VxWs002309
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 6 Sep 2017 19:32:01 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.167) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.361.1; Wed, 6 Sep 2017 19:31:58 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 7 Sep 2017 10:37:09 +0800
Message-ID: <cover.1504751799.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] iputils: backport patch to fix arping hang problem
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
X-List-Received-Date: Thu, 07 Sep 2017 02:32:00 -0000
Content-Type: text/plain

The following changes since commit 8b4f16a9cbbaf521461f699b7264fac2ac872581:

  mesa-gl: Fix build after recent mesa PACKAGECONFIG changes (2017-09-05 15:01:02 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/iputils-hang
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/iputils-hang

Chen Qi (1):
  iputils: backport patch to fix arping hang problem

 ...ing-fix-arping-hang-if-SIGALRM-is-blocked.patch | 44 ++++++++++++++++++++++
 meta/recipes-extended/iputils/iputils_s20151218.bb |  1 +
 2 files changed, 45 insertions(+)
 create mode 100644 meta/recipes-extended/iputils/files/arping-fix-arping-hang-if-SIGALRM-is-blocked.patch

-- 
1.9.1


