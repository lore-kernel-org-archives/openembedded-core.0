Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 967D76B8D5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 04:30:04 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7S4U5RF002464
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Aug 2013 21:30:05 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.347.0; Tue, 27 Aug 2013 21:30:04 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 28 Aug 2013 12:30:00 +0800
Message-ID: <cover.1377660850.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1] list-packageconfig-flags.py: fix searching bitbake module failed
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
X-List-Received-Date: Wed, 28 Aug 2013 04:30:04 -0000
Content-Type: text/plain

The following changes since commit b467b99a5d25efe5eadfb07dbecba608575256ac:

  linux-yocto: switch genericx86 to use common-pc (2013-08-24 09:37:49 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-list-pkgconfig
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-list-pkgconfig

Hongxu Jia (1):
  list-packageconfig-flags.py: fix searching bitbake module failed

 scripts/contrib/list-packageconfig-flags.py | 32 ++++++++++++++++++++++-------
 1 file changed, 25 insertions(+), 7 deletions(-)

-- 
1.8.1.2


