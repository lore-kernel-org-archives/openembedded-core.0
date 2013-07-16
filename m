Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 727E36B201
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 07:33:37 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6G7XcWG027364
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jul 2013 00:33:38 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Tue, 16 Jul 2013 00:33:37 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 16 Jul 2013 15:33:34 +0800
Message-ID: <cover.1373954600.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH V2 0/2] fix rootless X write to usb storage failed
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
X-List-Received-Date: Tue, 16 Jul 2013 07:33:38 -0000
Content-Type: text/plain

Change from V1:
* Drop pmount, and investigate udev script to fix this problem.

Hi Paul and Ross,

Thanks for your valuable suggestions, I send another solution to you
for reviewing and would you please give me your advise.

If you have a better idea, would you please share with us.

By the way, I also try another solution which is to modify util-mount
to allow normal user (non root) to invoke mount/umount to mount a
filesystem, but I think it's not good because it has security issue.

Thanks,
Hongxu

The following changes since commit a63229917a5708de2d161aba0d67168ce0da6365:

  meta-yocto-bsp: update reference board SRCREVs (2013-07-10 09:45:51 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-fat
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-fat

Hongxu Jia (2):
  udev-extraconf: allow users in disk group to write vfat filesystem
  xuser-account: add xuser to disk group

 meta/recipes-core/udev/udev-extraconf/mount.sh          | 11 +++++++++++
 meta/recipes-support/user-creation/xuser-account_0.1.bb |  2 +-
 2 files changed, 12 insertions(+), 1 deletion(-)

-- 
1.8.1.2


