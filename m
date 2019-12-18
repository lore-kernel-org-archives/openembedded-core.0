Return-Path: <anuj.mittal@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 2BF1F7FF5A
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Dec 2019 03:21:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:03 -0800
X-IronPort-AV: E=Sophos;i="5.69,327,1571727600"; d="scan'208";a="205701708"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.17.193])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	17 Dec 2019 19:21:02 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 18 Dec 2019 11:20:48 +0800
Message-Id: <cover.1576638856.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [zeus][PATCH 0/9] zeus -next review
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
X-List-Received-Date: Wed, 18 Dec 2019 03:21:02 -0000
Content-Transfer-Encoding: 8bit

Next set of changes for zeus. Tested on autobuilder. Please let me know
if there are any comments.

Thanks,

Anuj

The following changes since commit 9c0c8e51dd345dd1b6ba240b027d24a18f55757c:

  YP 3.0.1 Docs: Fixed manual revision tables. (2019-12-16 23:32:39 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib anujm/zeus

Adrian Bunk (2):
  openssl: Whitelist CVE-2019-0190
  python/python3: Whitelist CVE-2019-18348

Anuj Mittal (3):
  git: upgrade 2.23.0 -> 2.23.1
  openssl: fix CVE-2019-1551
  sysstat: fix CVE-2019-19725

Khem Raj (1):
  nss: Backport clang build fix

Quanyang Wang (1):
  lttng-modules: fix NULL pointer deference error when testing
    rpc_task_running

Richard Purdie (1):
  qemu-helper-native/systemtap-native: Ensure sysroots are populated
    with dependencies

Slavic Brutalik (1):
  systemd-systemctl: Fix handling of aliased targets

 meta/classes/cross.bbclass                    |   1 +
 meta/classes/native.bbclass                   |   1 +
 .../openssl/openssl/CVE-2019-1551.patch       | 758 ++++++++++++++++++
 .../openssl/openssl_1.1.1d.bb                 |   5 +
 .../systemd/systemd-systemctl/systemctl       |   2 +-
 meta/recipes-devtools/git/git_2.23.0.bb       |  11 -
 meta/recipes-devtools/git/git_2.23.1.bb       |  11 +
 meta/recipes-devtools/python/python.inc       |   3 +
 meta/recipes-devtools/python/python3_3.7.5.bb |   3 +
 .../sysstat/sysstat/CVE-2019-19725.patch      |  28 +
 .../sysstat/sysstat_12.1.6.bb                 |   1 +
 ...ops-when-trace-sunrpc_task-events-in.patch |  94 +++
 ...rpc_clnt-dereference-in-rpc_task_que.patch |  44 +
 ...rpc-use-signed-integer-for-client-id.patch | 105 +++
 ...nrpc-introduce-lttng_get_clid-helper.patch | 130 +++
 .../lttng/lttng-modules_2.10.11.bb            |   4 +
 ...ppc64-inline-assembler-for-clang-r-j.patch |  35 +
 meta/recipes-support/nss/nss_3.45.bb          |   1 +
 18 files changed, 1225 insertions(+), 12 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/CVE-2019-1551.patch
 delete mode 100644 meta/recipes-devtools/git/git_2.23.0.bb
 create mode 100644 meta/recipes-devtools/git/git_2.23.1.bb
 create mode 100644 meta/recipes-extended/sysstat/sysstat/CVE-2019-19725.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0001-Fix-SUNRPC-Fix-oops-when-trace-sunrpc_task-events-in.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0002-Fix-sunrpc-null-rpc_clnt-dereference-in-rpc_task_que.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0003-Fix-sunrpc-use-signed-integer-for-client-id.patch
 create mode 100644 meta/recipes-kernel/lttng/lttng-modules/0004-sunrpc-introduce-lttng_get_clid-helper.patch
 create mode 100644 meta/recipes-support/nss/nss/0001-Bug-1493916-Fix-ppc64-inline-assembler-for-clang-r-j.patch

-- 
2.21.0


