Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 03CFA7C043
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 09:01:12 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com ([147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x0M91DsS015538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2019 01:01:13 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.141) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.408.0; Tue, 22 Jan 2019 01:01:12 -0800
From: Chen Qi <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 22 Jan 2019 17:09:49 +0800
Message-ID: <cover.1548147637.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] eSDK.py: unset BBPATH and BUILDDIR to avoid eSDK failure
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
X-List-Received-Date: Tue, 22 Jan 2019 09:01:13 -0000
Content-Type: text/plain

*** BLURB HERE ***
The following changes since commit 6fd870e6a1f61d17e43cf30db4259a939db93820:

  bitbake: bb.tests.codeparser: add parameter expansion modifiers test (2019-01-21 23:44:34 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/eSDK-unset
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/eSDK-unset

Chen Qi (1):
  eSDK.py: unset BBPATH and BUILDDIR to avoid eSDK failure

 meta/lib/oeqa/selftest/cases/eSDK.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
1.9.1


