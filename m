Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 94AE76B2FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 12:09:13 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6QC9D34004771
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 05:09:13 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.194) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Fri, 26 Jul 2013 05:09:13 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 26 Jul 2013 20:09:07 +0800
Message-ID: <cover.1374835913.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.8.1.2
MIME-Version: 1.0
Subject: [PATCH 0/3]fix confliction of attempted installing su binary among busybox, shadow and util-linux
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
X-List-Received-Date: Fri, 26 Jul 2013 12:09:13 -0000
Content-Type: text/plain

The following changes since commit 67864ca79da08df752487a3a4e1a975546da123d:

  systemd: Remove systemd_unitdir if systemd is not in distro features (2013-07-24 11:35:39 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-su
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-su

Hongxu Jia (3):
  util-linux: use u-a for su
  shadow: use u-a for su
  move /bin/su to /usr/bin/su to match util-linux and shadow

 .../busybox/busybox-1.21.1/su-usr-bin.patch        | 26 ++++++++++++++++++++++
 meta/recipes-core/busybox/busybox_1.21.1.bb        |  1 +
 meta/recipes-core/util-linux/util-linux.inc        |  7 ++++++
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |  3 ++-
 4 files changed, 36 insertions(+), 1 deletion(-)
 create mode 100644 meta/recipes-core/busybox/busybox-1.21.1/su-usr-bin.patch

-- 
1.8.1.2


