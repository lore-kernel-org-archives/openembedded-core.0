Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SC7bi-0000Ic-Fo
	for openembedded-core@lists.openembedded.org;
	Mon, 26 Mar 2012 12:57:03 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2QAm0lY016168
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 03:48:00 -0700 (PDT)
Received: from localhost (128.224.162.28) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 26 Mar 2012 03:48:00 -0700
Message-ID: <cover.1332758293.git.xiaofeng.yan@windriver.com>
Old-Date: Mon, 26 Mar 2012 18:38:13 +0800
Date: Mon, 26 Mar 2012 18:49:11 +0800
To: <openembedded-core@lists.openembedded.org>
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 0/9]Realize archiving functions
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
X-List-Received-Date: Mon, 26 Mar 2012 10:57:03 -0000
Content-Type: text/plain

From: Xiaofeng Yan <xiaofeng.yan@windriver.com>

Hi Saul,

I have modified archiver.bbclass according to your suggestion.
- If the original source is tarball, then copy this package to ${DEPLOY_DIR}/sources
- If the original source comes from git, then archive this directory unpacked to tarball

If you have any suggestion, I will modify this bbclass.

Pull URL: git://git.pokylinux.org/poky-contrib.git
  Branch: xiaofeng/1977
  Browse: http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=xiaofeng/1977

Thanks,
    Xiaofeng Yan <xiaofeng.yan@windriver.com>
---


Xiaofeng Yan (9):
  sourcepkg.bbclass: Remove sourcepkg.bbclass
  src_distribute.bbclass: Remove src__distribute.bbclass
  src_distributelocal.bbclass: Remove src_distribute_local.bbclass
  package_rpm: Add srpm function to this bbclass
  archiver.bbclass:
  archive-original-source.bbclass: Archive original source
  archive-configured-source.bbclass: Archive configured source
  archive-patched-source.bbclass: Archive patched source
  local.conf.sample: Add set for archiving packages

 meta-yocto/conf/local.conf.sample              |   33 ++
 meta/classes/archive-configured-source.bbclass |   14 +
 meta/classes/archive-original-source.bbclass   |   14 +
 meta/classes/archive-patched-source.bbclass    |   14 +
 meta/classes/archiver.bbclass                  |  460 ++++++++++++++++++++++++
 meta/classes/package_rpm.bbclass               |   53 +++-
 meta/classes/sourcepkg.bbclass                 |  107 ------
 meta/classes/src_distribute.bbclass            |   49 ---
 meta/classes/src_distribute_local.bbclass      |   33 --
 9 files changed, 585 insertions(+), 192 deletions(-)
 create mode 100644 meta/classes/archive-configured-source.bbclass
 create mode 100644 meta/classes/archive-original-source.bbclass
 create mode 100644 meta/classes/archive-patched-source.bbclass
 create mode 100644 meta/classes/archiver.bbclass
 delete mode 100644 meta/classes/sourcepkg.bbclass
 delete mode 100644 meta/classes/src_distribute.bbclass
 delete mode 100644 meta/classes/src_distribute_local.bbclass



