Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id BEBBD60703
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Sep 2014 03:01:17 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8931HKs002505
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Sep 2014 20:01:17 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.187) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Mon, 8 Sep 2014 20:01:16 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 9 Sep 2014 11:01:35 +0800
Message-ID: <cover.1410231534.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/2] Fix the problem of being unable to login in rescue mode if password is set
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
X-List-Received-Date: Tue, 09 Sep 2014 03:01:23 -0000
Content-Type: text/plain

To reproduce the problem:
1. Add in local.conf:
   INHERIT += "extrausers"
   EXTRA_USERS_PARAMS = "usermod -P 'root' root; \
                      useradd -P 'test' test;"
2. bitbake core-image-minimal
3. runqemu qemux86 nographic bootparams="-s"

The following changes since commit 4c0a9ccbad2889b27b4b1d2ab91215a4bdcca3ce:

  python-numpy: Fix build for mips64 (2014-09-01 18:00:32 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/sulogin-shadow
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/sulogin-shadow

Chen Qi (2):
  util-linux: split out util-linux-sulogin
  extrausers: add util-linux-sulogin to IMAGE_INSTALL

 meta/classes/extrausers.bbclass             | 2 +-
 meta/recipes-core/util-linux/util-linux.inc | 9 ++++++---
 2 files changed, 7 insertions(+), 4 deletions(-)

-- 
1.9.1


