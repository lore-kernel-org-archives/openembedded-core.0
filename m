Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 925866B118
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 04:11:47 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r684BnKS028126
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 7 Jul 2013 21:11:50 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 7 Jul 2013 21:11:47 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 8 Jul 2013 12:11:45 +0800
Message-ID: <cover.1373254421.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] nativesdk-glib-2.0: cannot build on hosts without libffi.so.5
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
X-List-Received-Date: Mon, 08 Jul 2013 04:11:48 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit e2fa93a52c32522d4831e3d29f87bae4c6625f27:

  glib: fix the python script munging for cross compile (2013-07-08 11:25:29 +0800)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_glib_0708_5
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_glib_0708_5

Jackie Huang (1):
  nativesdk-glib-2.0: cannot build on hosts without libffi.so.5

 meta/recipes-core/glib-2.0/glib-2.0_2.36.2.bb |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

-- 
1.7.4.1


