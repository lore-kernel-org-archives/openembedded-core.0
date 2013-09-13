Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 7EA4E601DB
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 12:02:33 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r8DC2akV009413
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 05:02:36 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 13 Sep 2013 05:02:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 20:02:31 +0800
Message-ID: <cover.1379073449.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/1]LSB 4.1 Library Check: fix unable to find library libqt-mt.so.3
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
X-List-Received-Date: Fri, 13 Sep 2013 12:02:34 -0000
Content-Type: text/plain

*Problem

Build core-image-lsb for lsb test which doesn't include meta-qt layer,
and there is a LSB 4.1 Library Check failure: unable to find library
libqt-mt.so.3

//Hongxu

The following changes since commit dd36930f3f37b2e0e1258de28ac1b1fa99cf196f:

  bitbake: data_smart: Account for changes in append/prepend/remove in the config hash (2013-09-12 17:03:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-lsb-libqt3
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-lsb-libqt3

Hongxu Jia (1):
  LSB 4.1 Library Check: fix unable to find library libqt-mt.so.3

 meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb | 10 ++++++++++
 1 file changed, 10 insertions(+)

-- 
1.8.1.2


