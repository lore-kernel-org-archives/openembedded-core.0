Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 99F3678AAF
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Aug 2018 05:21:34 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w715LY3l020841
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jul 2018 22:21:35 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 31 Jul 2018 22:21:34 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 1 Aug 2018 13:25:34 +0800
Message-ID: <cover.1533101098.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] base-files: fix handling of resize
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
X-List-Received-Date: Wed, 01 Aug 2018 05:21:34 -0000
Content-Type: text/plain

The following changes since commit 666e0783525a298217787e3d2f1460c57c2f59ca:

  gcc-7.3: Backport fixes for std::pair high memory usage (2018-07-31 22:55:35 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/base-files-resize
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/base-files-resize

Chen Qi (1):
  base-files: fix handling of resize

 meta/recipes-core/base-files/base-files/profile   | 6 +-----
 meta/recipes-core/base-files/base-files_3.0.14.bb | 1 +
 2 files changed, 2 insertions(+), 5 deletions(-)

-- 
1.9.1


