Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RdtWX-0008Dr-I2
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Dec 2011 02:02:13 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pBN0t5TO004353
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Dec 2011 16:55:05 -0800 (PST)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 22 Dec 2011 16:55:05 -0800
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 22 Dec 2011 19:01:34 -0600
Message-ID: <cover.1324601996.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/7] Misc fixes and cleanups
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
X-List-Received-Date: Fri, 23 Dec 2011 01:02:13 -0000
Content-Type: text/plain

Misc fixes and cleanups that affect various parts of the system...

The following changes since commit c38693f78c968ab5f4bb557c20d1c8c55393ed6b:

  opkg: Fix installation order in feeds with mutiple providers of packages (2011-12-22 22:38:09 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/misc-fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/misc-fixes

Mark Hatle (7):
  package.bbclass: Adjust RPM call to use dynamic location for magic
    files
  package_rpm.bbclass:  Add RPMSPEC_PREAMBLE
  rpm_5.4.0: Fix configuration issue with native/nativesdk
  udev: Remove linux-libc-headers dependency
  gperf: Add missing SRC checksum
  which: Add missing SRC checksums
  base.bbclass: Allow buildstats to be optionally supplied

 meta/classes/base.bbclass                  |    1 -
 meta/classes/package.bbclass               |    2 +-
 meta/classes/package_rpm.bbclass           |    8 +++++++-
 meta/conf/local.conf.sample                |    3 ++-
 meta/recipes-core/udev/udev-new.inc        |    2 +-
 meta/recipes-devtools/rpm/rpm_5.4.0.bb     |    3 ++-
 meta/recipes-extended/gperf/gperf_3.0.3.bb |    3 +++
 meta/recipes-extended/which/which_2.18.bb  |    3 +++
 8 files changed, 19 insertions(+), 6 deletions(-)

-- 
1.7.3.4



