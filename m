Return-Path: <anders@chargestorm.se>
Received: from STOEXHUB01.domain01.net (STOEXHUB01.domain01.net
	[83.145.59.142])
	by mail.openembedded.org (Postfix) with ESMTP id 1E73D60FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 19:21:33 +0000 (UTC)
Received: from localhost (83.252.255.124) by STOEXHUB01.domain01.net
	(10.12.10.1) with Microsoft SMTP Server id 8.3.279.1; Fri, 13 Sep 2013
	21:21:33 +0200
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 13 Sep 2013 21:21:30 +0200
Message-ID: <cover.1379100075.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.4.rc3
MIME-Version: 1.0
Cc: Anders Darander <anders@chargestorm.se>
Subject: [PATCH 0/1] Re-add u-boot-fw-utils
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
X-List-Received-Date: Fri, 13 Sep 2013 19:21:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

    
The latest upgrade changed u-boot-fw-utils to u-boot-fw-utils-cross, which
removed the on-target fw_printenv (and fw_setenv).
    
    

The following changes since commit b26157a8b575aa7b5c96ffe782fc23ec0920311c:

  libnewt-python: Don't write a whiptail package (2013-09-12 08:23:35 +0100)

are available in the git repository at:

  git://github.com/darander/oe-core u-boot-fw-utils
  https://github.com/darander/oe-core/tree/u-boot-fw-utils

Anders Darander (1):
  u-boot-fw-utils: reinstate target recipe for fw_printenv

 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 meta/recipes-bsp/u-boot/u-boot-fw-utils_2013.07.bb

-- 
1.8.4.rc3


