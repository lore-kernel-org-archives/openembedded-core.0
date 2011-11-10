Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1ROZQE-0002NG-Cm
	for openembedded-core@lists.openembedded.org;
	Thu, 10 Nov 2011 19:32:22 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pAAIQ4U0024440
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Nov 2011 10:26:04 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 10 Nov 2011 10:26:03 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 10 Nov 2011 12:30:37 -0600
Message-ID: <cover.1320949721.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/5] Change the way RPM handles pre/post scripts
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Nov 2011 18:32:22 -0000
Content-Type: text/plain

We change the way rootfs_rpm handles pre / post scripts in order to
enable preinst scripts and better handling of post scripts.

The following changes since commit 379c77d1516fe8fdbd1cd7063f709b5266872b03:

  populate_*.bbclass: Correct INSTALL variable name after recent multilib changes (2011-11-10 18:05:06 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/rpm
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/rpm

Mark Hatle (5):
  rootfs_rpm.bbclass: Enable pre and post install scripts
  rootfs_rpm.bbclass: Turn off script debugging
  wpa-supplicant: Avoid blocking the post install script at cross
    rootfs time.
  shadow: Generate the shadow files at rootfs construction
  sudo: Avoid post install scripts

 meta/classes/package_rpm.bbclass                   |   33 ++++-
 meta/classes/rootfs_rpm.bbclass                    |   27 +---
 .../wpa-supplicant/wpa-supplicant-0.7.inc          |    4 +-
 .../wpa-supplicant/wpa-supplicant_0.7.3.bb         |    2 +-
 .../rpm/rpm/rpm-scriptletexechelper.patch          |  159 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 meta/recipes-extended/shadow/shadow_4.1.4.3.bb     |   12 +-
 meta/recipes-extended/sudo/sudo.inc                |    8 -
 meta/recipes-extended/sudo/sudo_1.8.3.bb           |    5 +-
 9 files changed, 214 insertions(+), 39 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-scriptletexechelper.patch

-- 
1.7.3.4



