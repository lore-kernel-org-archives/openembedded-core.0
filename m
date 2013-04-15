Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1URd59-0002KX-LU
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 08:40:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3F6MXFp014894
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Apr 2013 23:22:33 -0700 (PDT)
Received: from pek-hjia-d1.corp.ad.wrs.com (128.224.162.213) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.2.342.3; Sun, 14 Apr 2013 23:22:34 -0700
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 15 Apr 2013 14:22:29 +0800
Message-ID: <cover.1366006383.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
Subject: [PATCH V2 0/3]udev-extraconf:fix rootless X write to usb storage failed
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
X-List-Received-Date: Mon, 15 Apr 2013 06:40:29 -0000
Content-Type: text/plain

Change from V1: rebase from `udev-extraconf: Add -o silent to auto mount for
mount.util-linux' which commit is 52ac48097404a3ebb574f46205e96d9bedfa3f6a.

The following changes since commit 068085f79010e3db70085d4b789f84ae721e4901:

  ref-manual: Review comments applied for patch session (2013-04-13 23:57:17 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib hongxu/fix-udev-xuser
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=hongxu/fix-udev-xuser

Hongxu Jia (3):
  xserver-nodm-init: Add xuser to disk group
  connman.inc: Add xuser to disk group
  udev-extraconf:fix rootless X write to usb storage failed

 meta/recipes-connectivity/connman/connman.inc       |    2 +-
 meta/recipes-core/udev/udev-extraconf/mount.sh      |   19 +++++++++++++++++++
 .../x11-common/xserver-nodm-init.bb                 |    4 ++--
 3 files changed, 22 insertions(+), 3 deletions(-)

-- 
1.7.10.4



