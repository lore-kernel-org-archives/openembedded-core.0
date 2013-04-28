Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UWN1q-00011b-Bd
	for openembedded-core@lists.openembedded.org;
	Sun, 28 Apr 2013 10:32:23 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3S8EPwG027810
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 28 Apr 2013 01:14:26 -0700 (PDT)
Received: from pek-hjia-d1.wrs.com (128.224.162.213) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.2.342.3; Sun, 28 Apr 2013 01:14:24 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Sun, 28 Apr 2013 16:14:14 +0800
Message-ID: <cover.1367133417.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH 0/1 V3]udev-extraconf:fix rootless X write to usb storage failed
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 28 Apr 2013 08:32:23 -0000
Content-Type: text/plain

Change from V2: reference other distribution (ubuntu 12.10).

The following changes since commit addcfcda84ed6b43b00f569a6060e3b78196ef52:

  glib-2.0: disable tests for native builds, and respect ptest for LSB (2013-04-23 13:00:43 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-udev-xuser
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-udev-xuser

Hongxu Jia (1):
  udev-extraconf:fix rootless X write to usb storage failed

 meta/recipes-core/udev/udev-extraconf/mount.sh |   16 ++++++++++++++++
 1 file changed, 16 insertions(+)

-- 
1.7.10.4



