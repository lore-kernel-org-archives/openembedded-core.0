Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TjSQK-0001FJ-Lu
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Dec 2012 11:23:21 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id qBEA8don015391
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Dec 2012 02:08:39 -0800 (PST)
Received: from pek-qchen1-d1.corp.ad.wrs.com (128.224.163.154) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.318.4; Fri, 14 Dec 2012 02:08:39 -0800
From: <Qi.Chen@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 14 Dec 2012 18:08:51 +0800
Message-ID: <cover.1355479412.git.Qi.Chen@windriver.com>
X-Mailer: git-send-email 1.7.9.5
MIME-Version: 1.0
Cc: Zhenfeng.Zhao@windriver.com
Subject: [PATCH V2 0/1] ICU: upgrade to 50.1
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
X-List-Received-Date: Fri, 14 Dec 2012 10:23:21 -0000
Content-Type: text/plain

From: Chen Qi <Qi.Chen@windriver.com>

Upgrade ICU to 50.1.

Version 2 fixes a bug that version 1 has.
ICU needs the native building directory as an argument to its '--with-cross-build' option when cross compiling.
Taken the situation that different builds may share a common sstate-cache into consideration, we should stage that directory.

The following changes since commit c607095894cab60493ddfc4b967b0325e1c313b4:

  bitbake: Revert "BBHandler: Ensure parser state engine is correctly reset for new parsing" (2012-12-07 18:09:01 +0000)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib ChenQi/ICU-upgrade
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/ICU-upgrade

Chen Qi (1):
  ICU: upgrade to 50.1

 .../icu/files/fix-parallel-build.patch             |   19 -----
 meta/recipes-support/icu/files/gccfix.patch        |   19 -----
 .../icu/files/icu-add-pkgconfig-support.patch      |   43 ------------
 .../icu/files/larger-cmd-size.patch                |   27 -------
 meta/recipes-support/icu/files/noldlibpath.patch   |   52 --------------
 .../icu/files/use-g++-for-linking.patch            |   74 --------------------
 meta/recipes-support/icu/{icu-3.6.inc => icu.inc}  |   54 ++++----------
 meta/recipes-support/icu/icu_3.6.bb                |    6 --
 meta/recipes-support/icu/icu_50.1.bb               |   11 +++
 9 files changed, 24 insertions(+), 281 deletions(-)
 delete mode 100644 meta/recipes-support/icu/files/fix-parallel-build.patch
 delete mode 100644 meta/recipes-support/icu/files/gccfix.patch
 delete mode 100644 meta/recipes-support/icu/files/icu-add-pkgconfig-support.patch
 delete mode 100644 meta/recipes-support/icu/files/larger-cmd-size.patch
 delete mode 100644 meta/recipes-support/icu/files/noldlibpath.patch
 delete mode 100644 meta/recipes-support/icu/files/use-g++-for-linking.patch
 rename meta/recipes-support/icu/{icu-3.6.inc => icu.inc} (42%)
 delete mode 100644 meta/recipes-support/icu/icu_3.6.bb
 create mode 100644 meta/recipes-support/icu/icu_50.1.bb

-- 
1.7.9.5



