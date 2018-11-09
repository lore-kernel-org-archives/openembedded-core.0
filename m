Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 032596007A
	for <openembedded-core@lists.openembedded.org>;
	Fri,  9 Nov 2018 08:56:30 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id wA98uV9V004150
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 9 Nov 2018 00:56:31 -0800 (PST)
Received: from pek-lpg-core1-vm2.wrs.com (128.224.156.107) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.408.0; Fri, 9 Nov 2018 00:56:30 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>,
	<richard.purdie@linuxfoundation.org>
Date: Fri, 9 Nov 2018 17:07:02 +0800
Message-ID: <cover.1541754319.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Subject: [PATCH 0/6] upgrade 6 recipes
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
X-List-Received-Date: Fri, 09 Nov 2018 08:56:31 -0000
Content-Type: text/plain

The following changes since commit bb06900a1f29fdd4066f6d7e7a961d230c2e9438:

  perf: Disable libunwind for ARC & RISCV64 (2018-11-06 12:15:59 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/upgrade-20181109
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/upgrade-20181109

Hongxu Jia (6):
  apr: upgrade 1.6.3 -> 1.6.5
  gnupg: upgrade 2.2.9 -> 2.2.10
  ncurses: upgrade 6.1 -> 6.1+20180714
  man-db: 2.8.3 -> 2.8.4
  gpgme: 1.11.1 -> 1.12.0
  rpcbind: 0.2.4 -> 1.2.5

 ...ses_6.1+20180630.bb => ncurses_6.1+20180714.bb} |   2 +-
 .../man-db/{man-db_2.8.3.bb => man-db_2.8.4.bb}    |   5 +-
 ...r-all-svc_getargs-calls-with-svc_freeargs.patch | 221 ---------------------
 ...proc_dump-Fixed-typo-in-memory-leak-patch.patch |  30 ---
 ..._callit_com-Stop-freeing-a-static-pointer.patch | 100 ----------
 .../rpcbind/{rpcbind_0.2.4.bb => rpcbind_1.2.5.bb} |   7 +-
 .../apr/0008-apr-fix-ptest-hang-in-teststr.patch   |  32 ---
 .../apr/{apr_1.6.3.bb => apr_1.6.5.bb}             |   7 +-
 ...c-use-a-custom-value-for-the-location-of-.patch |   4 +-
 meta/recipes-support/gnupg/gnupg/relocate.patch    |  12 +-
 .../gnupg/{gnupg_2.2.9.bb => gnupg_2.2.10.bb}      |   4 +-
 .../gpgme/gpgme/0001-pkgconfig.patch               |   8 +-
 ...python-gpg-error-config-should-not-be-use.patch |  30 +--
 .../0003-Correctly-install-python-modules.patch    |   6 +-
 .../gpgme/gpgme/0004-python-import.patch           |   2 +-
 ...g-skip-all-lib-or-usr-lib-directories-in-.patch |   2 +-
 .../gpgme/gpgme/0006-fix-build-path-issue.patch    |   6 +-
 ...ch => 0007-python-Add-variables-to-tests.patch} |  52 ++---
 .../gpgme/{gpgme_1.11.1.bb => gpgme_1.12.0.bb}     |   7 +-
 19 files changed, 66 insertions(+), 471 deletions(-)
 rename meta/recipes-core/ncurses/{ncurses_6.1+20180630.bb => ncurses_6.1+20180714.bb} (86%)
 rename meta/recipes-extended/man-db/{man-db_2.8.3.bb => man-db_2.8.4.bb} (90%)
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/0001-rpcbind-pair-all-svc_getargs-calls-with-svc_freeargs.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/pmapproc_dump-Fixed-typo-in-memory-leak-patch.patch
 delete mode 100644 meta/recipes-extended/rpcbind/rpcbind/rpcbproc_callit_com-Stop-freeing-a-static-pointer.patch
 rename meta/recipes-extended/rpcbind/{rpcbind_0.2.4.bb => rpcbind_1.2.5.bb} (85%)
 delete mode 100644 meta/recipes-support/apr/apr/0008-apr-fix-ptest-hang-in-teststr.patch
 rename meta/recipes-support/apr/{apr_1.6.3.bb => apr_1.6.5.bb} (95%)
 rename meta/recipes-support/gnupg/{gnupg_2.2.9.bb => gnupg_2.2.10.bb} (92%)
 rename meta/recipes-support/gpgme/gpgme/{0007-qt-python-Add-variables-to-tests.patch => 0007-python-Add-variables-to-tests.patch} (43%)
 rename meta/recipes-support/gpgme/{gpgme_1.11.1.bb => gpgme_1.12.0.bb} (93%)

-- 
2.7.4


