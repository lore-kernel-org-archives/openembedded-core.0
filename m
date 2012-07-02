Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SlmGx-0000Bb-QC
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 21:27:00 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q62JFsD1013661
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 2 Jul 2012 12:15:54 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 2 Jul 2012 12:15:54 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Mon, 2 Jul 2012 14:25:27 -0500
Message-ID: <cover.1341257063.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Update oprofile to know about OE root home directory
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
X-List-Received-Date: Mon, 02 Jul 2012 19:27:00 -0000
Content-Type: text/plain

The root home directory is /home/root and not /root, adjust oprofile to match.

The following changes since commit 64422f7c5da160050a5454817c8fa9d070104b34:

  package.bbclass: Add missing PKGR, PKGV, PKGE and ALTERNATIVE variables from PACKAGEVARS (2012-07-02 16:44:57 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/oprofile
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/oprofile

Mark Hatle (1):
  oprofile: Change /root to /home/root

 meta/recipes-kernel/oprofile/oprofile.inc          |    3 +-
 .../oprofile/oprofile/oprofile-root.patch          |  108 ++++++++++++++++++++
 2 files changed, 110 insertions(+), 1 deletions(-)
 create mode 100644 meta/recipes-kernel/oprofile/oprofile/oprofile-root.patch

-- 
1.7.3.4



