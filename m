Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id AFC146080F
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 Jul 2016 06:43:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u656hqrW018197
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 4 Jul 2016 23:43:52 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.248.2;
	Mon, 4 Jul 2016 23:43:52 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 4 Jul 2016 23:43:46 -0700
Message-ID: <cover.1467700975.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.8.0
MIME-Version: 1.0
Subject: [PATCH 0/6] [jethro] Consolidated pull
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
X-List-Received-Date: Tue, 05 Jul 2016 06:43:53 -0000
Content-Type: text/plain

The following changes since commit 1f4bfa33073584c25396d74f3929f263f3df188b:

  toasterconf.json: exclude releases Toaster can't build (2016-06-03 13:36:19 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/jethro-next
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/jethro-next

Anuj Mittal (1):
  gcc: make sure header path is set correctly

Armin Kuster (2):
  tzcode: update to 2016e
  tzdata: update to 2016e

Enrico Jorns (1):
  perl-ptest.inc: fix tar call to prevent objcopy failure

George McCollister (1):
  wic: fix path parsing, use last occurrence

Nicolas Dechesne (1):
  bluez5: move btmgmt to common READLINE section

 meta/recipes-connectivity/bluez5/bluez5_5.33.bb                  | 2 +-
 meta/recipes-devtools/gcc/gcc-target.inc                         | 1 -
 meta/recipes-devtools/perl/perl-ptest.inc                        | 4 ++--
 .../tzcode/{tzcode-native_2016d.bb => tzcode-native_2016e.bb}    | 9 +++++----
 .../recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb} | 4 ++--
 scripts/lib/wic/plugin.py                                        | 2 +-
 6 files changed, 11 insertions(+), 11 deletions(-)
 rename meta/recipes-extended/tzcode/{tzcode-native_2016d.bb => tzcode-native_2016e.bb} (67%)
 rename meta/recipes-extended/tzdata/{tzdata_2016d.bb => tzdata_2016e.bb} (98%)

-- 
2.8.0


