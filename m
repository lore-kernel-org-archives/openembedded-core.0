Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9F1536AF67
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 05:42:05 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6C5g6p3012749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 22:42:06 -0700 (PDT)
Received: from pek-cc-pb05l.wrs.com (128.224.157.65) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Thu, 11 Jul 2013 22:42:06 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 12 Jul 2013 13:42:03 +0800
Message-ID: <cover.1373607104.git.jackie.huang@windriver.com>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH 0/1 v2] kbd: Limit the kbdrate application to x86, mips and sparc
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
X-List-Received-Date: Fri, 12 Jul 2013 05:42:06 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

v2 comments:
Drop the patch that detects the arch in runtime and print an error, and just
detect the target platform in the build system and skip installing the kbdrate
for architectures it won't work.

tested for qemux86, qemux86-64, qemuppc, qemuarm, qemumips, qemumips64

--
The following changes since commit 4f5009dcbbeb27bdf5dcaebb3b457fecef410ebe:

  security_flags: Add addition recipes to the non pie list (2013-07-10 09:40:42 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib jhuang0/r_bbappend_kbd-rework_0712_2
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=jhuang0/r_bbappend_kbd-rework_0712_2

Jackie Huang (1):
  kbd: Limit the kbdrate application to x86, mips and sparc

 meta/recipes-core/kbd/kbd_1.15.2.bb |    8 ++++++++
 1 files changed, 8 insertions(+), 0 deletions(-)

-- 
1.7.4.1


