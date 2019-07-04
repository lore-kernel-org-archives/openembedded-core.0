Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 02FE962134
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jul 2019 02:26:20 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x642QLkr013167
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jul 2019 19:26:21 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.148) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.439.0; Wed, 3 Jul 2019 19:26:09 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 4 Jul 2019 10:38:36 +0800
Message-ID: <cover.1562207791.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] grub-efi.bbclass: take into consideration of multilib
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
X-List-Received-Date: Thu, 04 Jul 2019 02:26:21 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 4fd9ee4670293632cc0ca1e64b8833eb6014435d:

  bitbake: bitbake: Add --skip-setscene option (2019-07-03 17:00:57 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/grub-efi-multilib
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/grub-efi-multilib

Chen Qi (1):
  grub-efi.bbclass: take into consideration of multilib

 meta/classes/grub-efi.bbclass | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

-- 
1.9.1


