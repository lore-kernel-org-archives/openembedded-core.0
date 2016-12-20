Return-Path: <Dengke.Du@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 119B176643
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Dec 2016 05:53:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id uBK5rJok019538
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 19 Dec 2016 21:53:19 -0800 (PST)
Received: from pek-lpgtest20.wrs.com (128.224.179.28) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.294.0; Mon, 19 Dec 2016 21:53:18 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <ross.burton@intel.com>
Date: Tue, 20 Dec 2016 13:53:14 +0800
Message-ID: <cover.1482212391.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: [PATCH V3 0/2] apr: fix off_t size can't match when configure and in target glibc
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
X-List-Received-Date: Tue, 20 Dec 2016 05:53:21 -0000
Content-Type: text/plain

Changed in V3:
	As Ross said, remove other instances of the APR_CHECK_SIZEOF_EXTENDED
macros in configure.in, this include "pid_t size_t ssize_t" types.

The following changes since commit d0d260b0b85790ceb136dd6b0445e8e33d038f5e:

  u-boot/beaglebone: Select Beaglebone Black target specifically. (2016-12-17 09:57:37 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/fix-apr-configure-error-for-cross-compiling
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=dengke/fix-apr-configure-error-for-cross-compiling

Dengke Du (2):
  Revert "subversion: fix "svnadmin create" fail on x86"
  apr: fix off_t size can't match when configure and in target glibc

 .../0001-fix-svnadmin-create-fail-on-x86.patch     | 56 ----------------
 .../subversion/subversion_1.9.5.bb                 |  1 -
 ..._t-size-doesn-t-match-in-glibc-when-cross.patch | 76 ++++++++++++++++++++++
 meta/recipes-support/apr/apr_1.5.2.bb              |  1 +
 4 files changed, 77 insertions(+), 57 deletions(-)
 delete mode 100644 meta/recipes-devtools/subversion/subversion/0001-fix-svnadmin-create-fail-on-x86.patch
 create mode 100644 meta/recipes-support/apr/apr/0001-apr-fix-off_t-size-doesn-t-match-in-glibc-when-cross.patch

-- 
2.7.4


