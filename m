Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RLi86-0007iC-Id
	for openembedded-core@lists.openembedded.org;
	Wed, 02 Nov 2011 22:13:50 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pA2L7fNg017570
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 2 Nov 2011 14:07:41 -0700 (PDT)
Received: from localhost.localdomain (172.25.34.61) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 2 Nov 2011 14:07:41 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 2 Nov 2011 16:11:57 -0500
Message-ID: <cover.1320268188.git.mark.hatle@windriver.com>
X-Mailer: git-send-email 1.7.3.4
MIME-Version: 1.0
X-Originating-IP: [172.25.34.61]
Subject: [PATCH 0/1] Uprev to pseudo 1.2
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
X-List-Received-Date: Wed, 02 Nov 2011 21:13:51 -0000
Content-Type: text/plain

Uprev to pseudo 1.2.

This was heavily tested by building oe-core with numerous image 
configurations.  Each configuration generated the same image before and 
after the change from the current to new version of pseudo.

The primary purpose of this change is to enable the PSEUDO_UNLOAD 
functionality that may be used for performance enhancements in future 
versions of oe-core.

The following changes since commit 37579d7d74d127c90c1e078d05c5bf4ba0b3f755:

  meta: glib-2.0: don't apply qsort_r test removable patch for native version (2011-11-02 09:08:21 +0000)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib mhatle/pseudo
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=mhatle/pseudo

Mark Hatle (1):
  pseudo: Uprev pseudo to version 1.2

 .../conf/distro/include/distro_tracking_fields.inc |    6 +-
 .../pseudo/pseudo/realpath_fix.patch               |  165 --------------------
 .../pseudo/{pseudo_1.1.1.bb => pseudo_1.2.bb}      |    7 +-
 meta/recipes-devtools/pseudo/pseudo_git.bb         |    6 +-
 4 files changed, 9 insertions(+), 175 deletions(-)
 delete mode 100644 meta/recipes-devtools/pseudo/pseudo/realpath_fix.patch
 rename meta/recipes-devtools/pseudo/{pseudo_1.1.1.bb => pseudo_1.2.bb} (48%)

-- 
1.7.3.4



