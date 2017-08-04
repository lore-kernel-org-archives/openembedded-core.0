Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 1800B71BB9
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Aug 2017 10:00:40 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v74A0gtq013768
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 4 Aug 2017 03:00:42 -0700 (PDT)
Received: from pek-ddu-u1642.wrs.com (128.224.162.194) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Fri, 4 Aug 2017 03:00:41 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 4 Aug 2017 18:00:14 +0800
Message-ID: <cover.1501840728.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH V2 0/1] ltp: upgrade to upstream latest commit on 20170804
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
X-List-Received-Date: Fri, 04 Aug 2017 10:00:41 -0000
Content-Type: text/plain

The following changes since commit 9ed748a542b520c1cb763d981969233c0f5efd4e:

  bitbake: daemonize: Always print any remaning UI events at exit (2017-08-03 11:14:13 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/ltp-upgrade-to-20170804
  https://github.com//tree/dengke/ltp-upgrade-to-20170804

Dengke Du (1):
  ltp: upgrade to upstream latest commit on 20170804

 .../ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch   |  34 ------
 ...TH_MAX-undeclared-when-building-with-musl.patch |  31 -----
 ...faccessat-and-fchmodat-Fix-build-warnings.patch |  68 -----------
 ...d_key02-update-to-test-fix-for-nonempty-N.patch | 136 ---------------------
 meta/recipes-extended/ltp/ltp_20170516.bb          |  14 +--
 5 files changed, 1 insertion(+), 282 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch

-- 
2.7.4


