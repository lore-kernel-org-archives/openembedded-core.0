Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 88C976E5FC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 07:38:58 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v7B7cxZC001436
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Aug 2017 00:38:59 -0700 (PDT)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.3.361.1;
	Fri, 11 Aug 2017 00:38:58 -0700
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Fri, 11 Aug 2017 03:38:56 -0400
Message-ID: <cover.1502436943.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V3 0/1] ltp: upgrade to upstream latest commit on 20170804
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
X-List-Received-Date: Fri, 11 Aug 2017 07:38:58 -0000
Content-Type: text/plain

The following changes since commit 5e4bd86130866d4a92fa7b0fa6d3628126dfdf91:

  libinput: Upgrade 1.7.3 -> 1.8.1 (2017-08-09 09:38:25 +0100)

are available in the git repository at:

  https://github.com/DengkeDu/openembedded-core.git dengke/ltp-fix-PAGE_SIZE
  https://github.com//tree/dengke/ltp-fix-PAGE_SIZE

Dengke Du (1):
  ltp: upgrade to upstream latest commit on 20170804

 .../ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch   |  34 ------
 ...TH_MAX-undeclared-when-building-with-musl.patch |  31 -----
 ...faccessat-and-fchmodat-Fix-build-warnings.patch |  68 -----------
 ...E_SIZE-redefinition-and-O_CREAT-undeclear.patch | 113 +++++++++++++++++
 ...d_key02-update-to-test-fix-for-nonempty-N.patch | 136 ---------------------
 meta/recipes-extended/ltp/ltp_20170516.bb          |  18 +--
 6 files changed, 115 insertions(+), 285 deletions(-)
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-dirtyc0w-Include-stdint.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0037-faccessat-and-fchmodat-Fix-build-warnings.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0037-ltp-fix-PAGE_SIZE-redefinition-and-O_CREAT-undeclear.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0038-syscalls-add_key02-update-to-test-fix-for-nonempty-N.patch

-- 
2.8.1


