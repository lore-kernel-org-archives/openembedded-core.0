Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9027178B63
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 09:06:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w5C96BMN001474
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2018 02:06:11 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.399.0; Tue, 12 Jun 2018 02:06:11 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 12 Jun 2018 17:08:55 +0800
Message-ID: <cover.1528772440.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH V3 0/1] oeqa/runtime/cases/selftest.py: rename to _selftest.py
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
X-List-Received-Date: Tue, 12 Jun 2018 09:06:10 -0000
Content-Type: text/plain

Changes in V3:
* Also rename selftest.json to _selftest.json to avoid runtime_test.py failure in oe-selftest.
* Fixed a typo (sato -> full-cmdline)

Changes in V2:
* Fix to depend on _selftest.Selftest.test_install_package.


The following changes since commit fe6e6231441188c3ffe52ef5811a8f30d29ea952:

  local.conf.sample: update libsdl mentions to libsdl2 (2018-06-07 08:53:19 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/rename_selftest
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/rename_selftest

Chen Qi (1):
  oeqa/runtime/cases/selftest.py: rename to _selftest.py

 .../lib/oeqa/runtime/cases/{selftest.json => _selftest.json}          | 0
 meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py}    | 2 +-
 meta/lib/oeqa/selftest/cases/runtime_test.py                          | 4 ++--
 3 files changed, 3 insertions(+), 3 deletions(-)
 rename meta-selftest/lib/oeqa/runtime/cases/{selftest.json => _selftest.json} (100%)
 rename meta-selftest/lib/oeqa/runtime/cases/{selftest.py => _selftest.py} (94%)

-- 
1.9.1


