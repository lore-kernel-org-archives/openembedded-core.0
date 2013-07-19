Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DFE16B260
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 09:39:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6J9dDSo007156
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jul 2013 02:39:13 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.233) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 19 Jul 2013 02:39:13 -0700
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 19 Jul 2013 17:39:24 +0800
Message-ID: <cover.1374226651.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: qingtao.cao@windriver.com
Subject: [PATCH 0/3] run-postinsts fixes
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
X-List-Received-Date: Fri, 19 Jul 2013 09:39:12 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

The following changes since commit 31e6eee860b5f9f4ac9ef0889bcff5648de6e3f9:

  poky-tiny.conf: blacklist core-image-weston option (2013-07-18 21:26:58 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/run-postinsts-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/run-postinsts-fixes

Chen Qi (3):
  rpm: remove the obsolete rpm-postinsts.bb
  run-postinsts: fix comment
  run-postinsts: add more logging to the log file to make things
    clearer

 meta/recipes-devtools/rpm/rpm-postinsts.bb         |   54 --------------------
 .../run-postinsts/run-postinsts/run-postinsts      |    6 ++-
 2 files changed, 4 insertions(+), 56 deletions(-)
 delete mode 100644 meta/recipes-devtools/rpm/rpm-postinsts.bb

-- 
1.7.9.5


