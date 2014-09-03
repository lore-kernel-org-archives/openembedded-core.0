Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 1A0CE6ACBA
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 06:32:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s836WH4Z000728
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 2 Sep 2014 23:32:17 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Tue, 2 Sep 2014 23:32:16 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Sep 2014 14:32:13 +0800
Message-ID: <cover.1409725792.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/1] testimage/targetcontrol.py: test sudo available while invoking runqemu
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
X-List-Received-Date: Wed, 03 Sep 2014 06:32:20 -0000
Content-Type: text/plain

The following changes since commit 83ebcb1f0c6ec48c526d14324b3b2037f0f4fe43:

  bitbake: process: Ensure abnormal exits set an error level (2014-09-02 18:10:37 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-testimage
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-testimage

Hongxu Jia (1):
  targetcontrol.py: test sudo available while invoking runqemu

 meta/lib/oeqa/targetcontrol.py | 12 ++++++++++++
 1 file changed, 12 insertions(+)

-- 
1.9.1


