Return-Path: <Jackie.Huang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0FF58612D1
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Jul 2013 09:10:16 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r639AHAW008395
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 3 Jul 2013 02:10:17 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Wed, 3 Jul 2013 02:10:14 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 3 Jul 2013 17:10:12 +0800
Message-ID: <cover.1372842406.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1] udev-extraconf: blacklist /dev/dm-*
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
X-List-Received-Date: Wed, 03 Jul 2013 09:10:16 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

The following changes since commit 3e1dbabbf33a2e461abc92ff10cd970fe604ee38:

  sysstat: backport a patch to fix a parallel building error (2013-07-02 07:58:10 -0700)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_udev-extraconf_0703_1
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_udev-extraconf_0703_1

Jackie Huang (1):
  udev-extraconf: blacklist /dev/dm-*

 .../udev/udev-extraconf/mount.blacklist            |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

-- 
1.7.4.1


