Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0417C6057A
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Sep 2016 05:34:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id u8K5YbXZ018216
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Sep 2016 22:34:37 -0700 (PDT)
Received: from ala-blade47.wrs.com (147.11.105.67) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 19 Sep 2016 22:34:36 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 19 Sep 2016 22:34:35 -0700
Message-ID: <cover.1474349633.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 2.9.0
MIME-Version: 1.0
Subject: [PATCH 0/1] openssl: fix do_configure error when cwd is not in @INC
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
X-List-Received-Date: Tue, 20 Sep 2016 05:34:37 -0000
Content-Type: text/plain

The following changes since commit 5ac0604fdc7d5b783011c43d476210b427b5dae0:

  build-appliance-image: Create image in correct location (2016-09-19 08:58:04 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib rbt/openssl
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=rbt/openssl

Robert Yang (1):
  openssl: fix do_configure error when cwd is not in @INC

 .../openssl/openssl-util-perlpath.pl-cwd.patch     | 34 ++++++++++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2h.bb |  1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/openssl-util-perlpath.pl-cwd.patch

-- 
2.9.0


