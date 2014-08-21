Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0F1E56FE55
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 10:24:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s7LAOEGZ001940
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Aug 2014 03:24:14 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Thu, 21 Aug 2014 03:24:13 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 21 Aug 2014 18:24:41 +0800
Message-ID: <cover.1408616635.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH V2 0/1] sudo: remove volatile configuration file
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
X-List-Received-Date: Thu, 21 Aug 2014 10:24:20 -0000
Content-Type: text/plain

The following changes since commit 47d1fc9f5c38f3d092937c47bd4c2f45adaa7fe6:

  qemu: fix Darwin cross-compilation (2014-08-18 20:43:24 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/sudo_volatile
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/sudo_volatile

Chen Qi (1):
  sudo: remove volatile configuration file

 meta/recipes-extended/sudo/files/volatiles.99_sudo |    1 -
 meta/recipes-extended/sudo/sudo_1.8.10p3.bb        |    7 ++-----
 2 files changed, 2 insertions(+), 6 deletions(-)
 delete mode 100644 meta/recipes-extended/sudo/files/volatiles.99_sudo

-- 
1.7.9.5


