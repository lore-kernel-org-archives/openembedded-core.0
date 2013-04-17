Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1USOTI-00085C-HA
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Apr 2013 11:16:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3H8wZ5l005012
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 17 Apr 2013 01:58:35 -0700 (PDT)
Received: from localhost.localdomain (128.224.162.205) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server
	(TLS) id 14.2.342.3; Wed, 17 Apr 2013 01:58:34 -0700
From: Kang Kai <kai.kang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 17 Apr 2013 17:00:24 +0800
Message-ID: <cover.1366187846.git.kai.kang@windriver.com>
X-Mailer: git-send-email 1.7.5.4
MIME-Version: 1.0
X-Originating-IP: [128.224.162.205]
Subject: [PATCH 0/1] Fix libpam test case failure
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
X-List-Received-Date: Wed, 17 Apr 2013 09:16:17 -0000
Content-Type: text/plain

Backport patches from upstream to fix YOCTO #4107.

The following changes since commit 595e92c76700306f9ff8fcf1557eb7ade1f3e907:

  systemd: Fix shell variable assignment spacing (2013-04-16 23:15:54 +0100)

are available in the git repository at:
  git://git.pokylinux.org/poky-contrib kangkai/libpam
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/libpam

Kai Kang (1):
  libpam: backport patches from upstream

 .../add-checks-for-crypt-returning-NULL.patch      |   63 ++++++++++++++++++++
 ...-enforce_for_root-semantics-change-in-pam.patch |   35 +++++++++++
 meta/recipes-extended/pam/libpam_1.1.6.bb          |    2 +
 3 files changed, 100 insertions(+), 0 deletions(-)
 create mode 100644 meta/recipes-extended/pam/libpam/add-checks-for-crypt-returning-NULL.patch
 create mode 100644 meta/recipes-extended/pam/libpam/reflect-the-enforce_for_root-semantics-change-in-pam.patch

-- 
1.7.5.4



