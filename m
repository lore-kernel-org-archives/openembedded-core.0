Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 39E456AC48
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 02:45:10 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r682jCUs027356
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 19:45:12 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 19:45:10 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2013 10:45:08 +0800
Message-ID: <cover.1373251397.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] glib-2.0: add -march=i486 into CFLAGS automatically when needed.
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
X-List-Received-Date: Mon, 08 Jul 2013 02:45:10 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 3e1dbabbf33a2e461abc92ff10cd970fe604ee38:

  sysstat: backport a patch to fix a parallel building error (2013-07-02 07:58:10 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_glib_0708_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_glib_0708_2

Jackie Huang (1):
  glib-2.0: add -march=i486 into CFLAGS automatically when needed.

 .../add-march-i486-into-CFLAGS-automatically.patch |   39 ++++++++++++++++++++
 meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb      |    1 +
 2 files changed, 40 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-core/glib-2.0/glib-2.0/add-march-i486-into-CFLAGS-automatically.patch

-- 
1.7.4.1


