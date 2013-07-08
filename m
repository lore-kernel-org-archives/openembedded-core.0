Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AD9D46B0D0
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 03:30:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r683U8XP027768
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 20:30:08 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 20:30:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2013 11:30:03 +0800
Message-ID: <cover.1373253998.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] glib: fix the python script munging for cross compile
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
X-List-Received-Date: Mon, 08 Jul 2013 03:30:05 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 226f2074b7530a82f4cf0e614eecd58f1fd2c22b:

  glib-2.0: inherit pythonnative (2013-07-08 11:22:38 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_glib_0708_4
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_glib_0708_4

Jackie Huang (1):
  glib: fix the python script munging for cross compile

 .../glib-2.0/glib-2.0/glib2-python-ref.patch       |   33 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb      |    1 +
 2 files changed, 34 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/glib2-python-ref.patch

-- 
1.7.4.1


