Return-Path: <Dengke.Du@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 89F28600E2
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Feb 2017 16:12:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id v19GCgBh019534
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 9 Feb 2017 08:12:43 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 08:12:41 -0800
From: Dengke Du <dengke.du@windriver.com>
To: <openembedded-core@lists.openembedded.org>
Date: Thu, 9 Feb 2017 11:12:39 -0500
Message-ID: <cover.1486656412.git.dengke.du@windriver.com>
X-Mailer: git-send-email 2.8.1
MIME-Version: 1.0
Subject: [PATCH V2 0/1] ltp: upgrade to 20170116
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
X-List-Received-Date: Thu, 09 Feb 2017 16:12:43 -0000
Content-Type: text/plain

Changed in V2:
	Add Upstream-Status for 0001-add-_GNU_SOURCE-to-pec_listener.c.patch

The following changes since commit 03b1180825df3e6b7595e7cab6531d0c02998430:

  yocto-bsps: add 4.9 bbappend (2017-02-06 14:45:53 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib dengke/ltp-upgrade-to-20170116
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=dengke/ltp-upgrade-to-20170116

Dengke Du (1):
  ltp: upgrade to 20170116

 .../0001-add-_GNU_SOURCE-to-pec_listener.c.patch   |  39 ++
 .../ltp/0001-ltp-Don-t-link-against-libfl.patch    |  30 --
 ...TH_MAX-undeclared-when-building-with-musl.patch |  30 ++
 ...sendfile-Use-off64_t-instead-of-__off64_t.patch |  31 --
 ...RDSIZE-undeclared-when-building-with-musl.patch |  30 ++
 .../ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch | 394 ---------------------
 .../ltp/0009-Guard-error.h-with-__GLIBC__.patch    | 270 --------------
 ...ition-of-struct-msgbuf-error-building-wit.patch |  35 ++
 .../0011-Rename-sigset-variable-to-sigset1.patch   |  77 ++--
 ...fsstress.c-Replace-__int64_t-with-int64_t.patch | 351 ------------------
 ...nclude-fcntl.h-for-getting-O_-definitions.patch |  67 ----
 ...ing-Include-sys-types.h-for-pid_t-definit.patch |  56 ---
 ...015-mincore01-Rename-PAGESIZE-to-pagesize.patch |  64 ----
 ...Change-header-from-ustat.h-to-sys-ustat.h.patch |  45 ---
 .../0017-replace-sigval_t-with-union-sigval.patch  |  88 -----
 ...lace-canonicalize_file_name-with-realpath.patch |  32 --
 .../ltp/ltp/0022-include-sys-types.h.patch         |  29 --
 ...sconf01-Use-_SC_2_C_VERSION-conditionally.patch |  23 +-
 .../ltp/0029-trace_shed-Fix-build-with-musl.patch  |  32 --
 ...READ_MUTEX_RECURSIVE-in-place-of-PTHREAD_.patch |  26 +-
 ...age-size-offset-as-per-page-size-alignmen.patch |  33 --
 ...-regen.sh-Include-asm-unistd.h-explicitly.patch |  30 --
 .../ltp/ltp/0035-fix-test_proc_kill-hang.patch     |  27 +-
 ...rs-netns_netlink-Avoid-segmentation-fault.patch |  50 ---
 ...ix-option-group-test-replace-CWD-qith-PWD.patch |  44 ---
 .../ltp/fcntl-fix-the-time-def-to-use-time_t.patch |  17 +-
 .../ltp/{ltp_20160126.bb => ltp_20170116.bb}       |  31 +-
 27 files changed, 234 insertions(+), 1747 deletions(-)
 create mode 100644 meta/recipes-extended/ltp/ltp/0001-add-_GNU_SOURCE-to-pec_listener.c.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0001-ltp-Don-t-link-against-libfl.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0006-fix-PATH_MAX-undeclared-when-building-with-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0006-sendfile-Use-off64_t-instead-of-__off64_t.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0007-fix-__WORDSIZE-undeclared-when-building-with-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0007-replace-SIGCLD-with-SIGCHLD.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0009-Guard-error.h-with-__GLIBC__.patch
 create mode 100644 meta/recipes-extended/ltp/ltp/0009-fix-redefinition-of-struct-msgbuf-error-building-wit.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0012-fsstress.c-Replace-__int64_t-with-int64_t.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0013-include-fcntl.h-for-getting-O_-definitions.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0014-hyperthreading-Include-sys-types.h-for-pid_t-definit.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0015-mincore01-Rename-PAGESIZE-to-pagesize.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0016-ustat-Change-header-from-ustat.h-to-sys-ustat.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0017-replace-sigval_t-with-union-sigval.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0019-tomoyo-Replace-canonicalize_file_name-with-realpath.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0022-include-sys-types.h.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0029-trace_shed-Fix-build-with-musl.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0031-vma03-fix-page-size-offset-as-per-page-size-alignmen.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0032-regen.sh-Include-asm-unistd.h-explicitly.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0037-containers-netns_netlink-Avoid-segmentation-fault.patch
 delete mode 100644 meta/recipes-extended/ltp/ltp/0038-run-posix-option-group-test-replace-CWD-qith-PWD.patch
 rename meta/recipes-extended/ltp/{ltp_20160126.bb => ltp_20170116.bb} (78%)

-- 
2.8.1


