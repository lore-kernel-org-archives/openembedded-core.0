Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S7RHe-0002Pn-Vu
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 13:56:59 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2DCmDaT028749
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 05:48:13 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 13 Mar 2012 05:48:13 -0700
Message-ID: <cover.1331642569.git.xiaofeng.yan@windriver.com>
Old-Date: Tue, 13 Mar 2012 20:42:49 +0800
Date: Tue, 13 Mar 2012 20:52:16 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/7] Realize archiving functions
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
X-List-Received-Date: Tue, 13 Mar 2012 12:56:59 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

archiver.bbclass is for archiving sources , patches and logs including .bb and .inc files by configuring conf/local.conf  which control what a archiving package should include.
For archiving a source rpm package, I add some functions to package_rpm.bbclass.
I also merge source_pkg.bbclass src_distribute.bbclass src_distribute_local.bbclass to archiver.bbclass due to their similar functions.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/1977
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1977

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (7):
  package_rpm: Add srpm function to this bbclass
  archiver.bbclass: New bbclass for archiving sources, patches,logs and
    scripts
  archive-patched-source.bbclass: Archive patched source
  archive-configured-source.bbclass: Archive configured source
  archive-original-source.bbclass: Archive original source
  local.conf.sample: Add set for archiving packages
  sourcepkg, src_distribute, src_distribute_local: remove three bbclass

 meta-yocto/conf/local.conf.sample              |   25 ++
 meta/classes/archive-configured-source.bbclass |   14 +
 meta/classes/archive-original-source.bbclass   |   14 +
 meta/classes/archive-patched-source.bbclass    |   14 +
 meta/classes/archiver.bbclass                  |  421 ++++++++++++++++++++++++
 meta/classes/package_rpm.bbclass               |   63 ++++
 meta/classes/sourcepkg.bbclass                 |  107 ------
 meta/classes/src_distribute.bbclass            |   49 ---
 meta/classes/src_distribute_local.bbclass      |   33 --
 9 files changed, 551 insertions(+), 189 deletions(-)
 create mode 100644 meta/classes/archive-configured-source.bbclass
 create mode 100644 meta/classes/archive-original-source.bbclass
 create mode 100644 meta/classes/archive-patched-source.bbclass
 create mode 100644 meta/classes/archiver.bbclass
 delete mode 100644 meta/classes/sourcepkg.bbclass
 delete mode 100644 meta/classes/src_distribute.bbclass
 delete mode 100644 meta/classes/src_distribute_local.bbclass



