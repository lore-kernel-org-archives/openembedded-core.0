Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B8FF86105E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 02:07:53 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r8I27t84005218
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 19:07:55 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Tue, 17 Sep 2013 19:07:55 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 18 Sep 2013 10:07:52 +0800
Message-ID: <cover.1379469908.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [v2 PATCH 0/1] libunistring: remove the test to convert euc-jp in configure
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
X-List-Received-Date: Wed, 18 Sep 2013 02:07:54 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
Add the commit logs in the patch header

--
The following changes since commit 2e90f8846db0f3ed99a175befff9ec67fe12bc4e:

  perf: Ensure we use CFLAGS and LDFLAGS settings from kernel build system (2013-09-17 20:53:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/d_guile-libunstring_0916_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/d_guile-libunstring_0916_2

Jackie Huang (1):
  libunistring: remove the test to convert euc-jp in configure

 ...conv-m4-remove-the-test-to-convert-euc-jp.patch |   42 ++++++++++++++++++++
 .../libunistring/libunistring_0.9.3.bb             |    4 +-
 2 files changed, 45 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-support/libunistring/libunistring/iconv-m4-remove-the-test-to-convert-euc-jp.patch

-- 
1.7.4.1


