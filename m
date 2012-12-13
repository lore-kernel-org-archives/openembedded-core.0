Received: from stoexhubfe02.domain01.net ([83.145.59.141])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders@chargestorm.se>) id 1Tj5Pr-0007ri-EK
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Dec 2012 10:49:32 +0100
Received: from localhost (83.252.253.85) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Thu, 13 Dec 2012
	10:34:11 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 13 Dec 2012 10:35:40 +0100
Message-ID: <cover.1355391318.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.7.10.4
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] Split out ralink firmware
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
X-List-Received-Date: Thu, 13 Dec 2012 09:49:32 -0000
Content-Type: text/plain

This splits out the ralink drivers in a linux-firmware-ralink package.

It's done in the same style as the other splits previously done.

The following changes since commit b8b1b39961332c99d62ee466f7859bd62a0f806f:

  bitbake.conf/utils: Drop some OVERRIDES from FILESPATH (2012-12-11 15:58:27 +0000)

are available in the git repository at:

  git://github.com/darander/oe-core linux-firmware
  https://github.com/darander/oe-core/tree/linux-firmware

Anders Darander (1):
  linux-firmware: split out ralink drivers

 meta/recipes-kernel/linux-firmware/linux-firmware_git.bb |   10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

-- 
1.7.10.4



