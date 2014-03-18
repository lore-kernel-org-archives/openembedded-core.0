Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id CB7716F8D9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 07:11:55 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s2I7BvmN007224
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 00:11:57 -0700 (PDT)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.162.218) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.169.1; Tue, 18 Mar 2014 00:11:56 -0700
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 18 Mar 2014 15:12:07 +0800
Message-ID: <cover.1395126624.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Subject: [PATCH 0/1] expect: fix do_install failure on SLED 11.2
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
X-List-Received-Date: Tue, 18 Mar 2014 07:11:55 -0000
Content-Type: text/plain

The following changes since commit b681d264ab2f721c537bfa87cc2ddbbbf3f8c1a2:

  gettext: upgrade from 0.18.3.1 to 0.18.3.2 (2014-03-17 14:01:08 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib ChenQi/expect-SLED-11.2
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/expect-SLED-11.2

Chen Qi (1):
  expect: fix do_install failure on SLED 11.2

 ...all-scripts-without-using-the-fixline1-tc.patch |   34 ++++++++++++++++++++
 meta/recipes-devtools/expect/expect_5.45.bb        |    1 +
 2 files changed, 35 insertions(+)
 create mode 100644 meta/recipes-devtools/expect/expect/0001-expect-install-scripts-without-using-the-fixline1-tc.patch

-- 
1.7.9.5


