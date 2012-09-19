Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1TEGlZ-00024b-MP
	for openembedded-core@lists.openembedded.org;
	Wed, 19 Sep 2012 11:40:22 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q8J9RcxC029979
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Sep 2012 02:27:39 -0700 (PDT)
Received: from fc17-64.wrs.com (128.224.163.124) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Wed, 19 Sep 2012 02:27:38 -0700
From: Robert Yang <liezhi.yang@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Wed, 19 Sep 2012 17:33:02 +0800
Message-ID: <cover.1348038052.git.liezhi.yang@windriver.com>
X-Mailer: git-send-email 1.7.11.2
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH 0/1] opkg 0.1.8: remove it since it doesn't work
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
X-List-Received-Date: Wed, 19 Sep 2012 09:40:22 -0000
Content-Type: text/plain

Test info:
# With PACKAGE_CLASSES = "package_ipk"
$ bitbake core-image-sato core-image-minimal meta-toolchain meta-toolchain-sdk \
	adt-installer meta-ide-support
$ bitbake package-index

All the builds are OK.

// Robert

The following changes since commit 913944d904266bf90af0cad94b4f0fb3652bd29d:

  upstream_tracking: update lsb and ltp (2012-09-14 17:12:52 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib robert/rm_opkg018
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=robert/rm_opkg018

Robert Yang (1):
  opkg 0.1.8: remove it since it doesn't work

 meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch | 19 -------------------
 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb        | 10 ----------
 meta/recipes-devtools/opkg/opkg_0.1.8.bb              | 11 -----------
 3 files changed, 40 deletions(-)
 delete mode 100644 meta/recipes-devtools/opkg/opkg-0.1.8/headerfix.patch
 delete mode 100644 meta/recipes-devtools/opkg/opkg-nogpg_0.1.8.bb
 delete mode 100644 meta/recipes-devtools/opkg/opkg_0.1.8.bb

-- 
1.7.11.2



