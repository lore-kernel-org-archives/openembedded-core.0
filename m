Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SIRWm-0002Nr-Ng
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Apr 2012 23:26:05 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q3CLGgQG006908
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Apr 2012 14:16:42 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Thu, 12 Apr 2012 14:16:42 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 12 Apr 2012 16:21:21 -0500
Message-ID: <cover.1334265557.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/2] Two small fixes, pseudo and rpm
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
X-List-Received-Date: Thu, 12 Apr 2012 21:26:05 -0000
Content-Type: text/plain

pseudo was adding in an rpath, prevent that

rpm-native was not resolving dependencies that looked like possible
filename properly.


The following changes since commit 71e95c744eaa4dda1b3237db2e13f666f121c92b:

  package_rpm.bbclass: Set tmppath for rpm to somewhere which won't conflict with the rootfs (2012-04-12 21:24:55 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/fixes
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/fixes

Mark Hatle (2):
  pseudo: Tell pseudo to avoid specifying an RPATH
  rpm: Ensure that we check both providename and filepaths

 meta/recipes-devtools/pseudo/pseudo.inc            |    8 ++--
 meta/recipes-devtools/pseudo/pseudo_1.3.bb         |    2 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    2 +-
 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch |   36 ++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.0.bb             |    3 +-
 5 files changed, 44 insertions(+), 7 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/rpm-resolvedep.patch

-- 
1.7.3.4



