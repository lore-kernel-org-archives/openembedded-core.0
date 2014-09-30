Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 87B5A7163C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 09:34:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s8U9YD86026735
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 30 Sep 2014 02:34:13 -0700 (PDT)
Received: from pek-hostel-deb02.wrs.com (128.224.153.152) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.174.1; Tue, 30 Sep 2014 02:34:12 -0700
From: Chong Lu <Chong.Lu@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Tue, 30 Sep 2014 17:33:03 +0800
Message-ID: <cover.1412068156.git.Chong.Lu@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/3] Update three packages
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
X-List-Received-Date: Tue, 30 Sep 2014 09:34:19 -0000
Content-Type: text/plain

The following changes since commit 39ca8b429b6244e9649e7303cbb240adf007bf22:

  bitbake: toastergui fix size rendering in dirinfo page (2014-09-29 14:11:59 +0100)

are available in the git repository at:

  git://git.pokylinux.org/poky-contrib chonglu/updatepkg
  http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=chonglu/updatepkg

Chong Lu (3):
  tcl: Upgrade to 8.6.2
  strace: Upgrade to 4.9
  byacc: Upgrade to 20140715

 ...-conflict-between-sys-ptrace.h-and-linux-.patch | 108 ---------------------
 .../strace-fix-64-bit-process-detection.patch      |  34 -------
 .../Makefile-ptest.patch                           |  44 ++++++---
 .../{strace-4.8 => strace-4.9}/git-version-gen     |   0
 .../strace/{strace-4.8 => strace-4.9}/run-ptest    |   0
 .../strace-add-configure-options.patch             |  37 ++++---
 .../strace/{strace_4.8.bb => strace_4.9.bb}        |   8 +-
 .../tcltk/{tcl_8.6.1.bb => tcl_8.6.2.bb}           |   5 +-
 .../byacc/{byacc_20140422.bb => byacc_20140715.bb} |   4 +-
 9 files changed, 57 insertions(+), 183 deletions(-)
 delete mode 100644 meta/recipes-devtools/strace/strace-4.8/0001-Work-around-conflict-between-sys-ptrace.h-and-linux-.patch
 delete mode 100644 meta/recipes-devtools/strace/strace-4.8/strace-fix-64-bit-process-detection.patch
 rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/Makefile-ptest.patch (61%)
 rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/git-version-gen (100%)
 rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/run-ptest (100%)
 rename meta/recipes-devtools/strace/{strace-4.8 => strace-4.9}/strace-add-configure-options.patch (63%)
 rename meta/recipes-devtools/strace/{strace_4.8.bb => strace_4.9.bb} (77%)
 rename meta/recipes-devtools/tcltk/{tcl_8.6.1.bb => tcl_8.6.2.bb} (94%)
 rename meta/recipes-extended/byacc/{byacc_20140422.bb => byacc_20140715.bb} (74%)

-- 
1.9.1


