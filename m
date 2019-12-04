Return-Path: <anuj.mittal@intel.com>
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	by mail.openembedded.org (Postfix) with ESMTP id 44BB86B513
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Dec 2019 13:32:01 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:02 -0800
X-IronPort-AV: E=Sophos;i="5.69,277,1571727600"; d="scan'208";a="205389399"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.255.164.178])
	by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Dec 2019 05:32:01 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  4 Dec 2019 21:31:41 +0800
Message-Id: <cover.1575465665.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [zeus][PATCH 00/10] zeus -next review
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
X-List-Received-Date: Wed, 04 Dec 2019 13:32:01 -0000
Content-Transfer-Encoding: 8bit

Next set of patches for zeus. Please let me know if there are any
comments.

Thanks,

Anuj

The following changes since commit 5d50b0549e5d91cb3072dada0e33a43dfb9e2071:

  bitbake: runqueue.py: not show warning for deferred multiconfig task (2019-11-29 11:26:18 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib anujm/zeus

Adrian Bunk (1):
  bind: Whitelist CVE-2019-6470

Anuj Mittal (4):
  ghostscript: fix for CVE-2019-14811 is same as CVE-2019-14813
  nasm: fix CVE-2019-14248
  glibc: fix CVE-2019-19126
  libarchive: fix CVE-2019-19221

Christopher Larson (1):
  dosfstools: fix CP437 error from `dosfsck -l`

Hongxu Jia (1):
  go: fix CVE-2019-17596

Ross Burton (1):
  libsoup-2.4: upgrade to 2.66.4

Stefan Ghinea (1):
  ghostscript: CVE-2019-14869

Vinay Kumar (1):
  gdb: Fix CVE-2019-1010180

 .../bind/bind_9.11.5-P4.bb                    |   4 +
 .../glibc/glibc/CVE-2019-19126.patch          |  32 +++++
 meta/recipes-core/glibc/glibc_2.30.bb         |   1 +
 .../dosfstools/dosfstools_4.1.bb              |   3 +
 meta/recipes-devtools/gdb/gdb-8.3.1.inc       |   1 +
 .../gdb/gdb/CVE-2019-1010180.patch            | 132 ++++++++++++++++++
 meta/recipes-devtools/go/go-1.12.inc          |   1 +
 .../go/go-1.12/0010-fix-CVE-2019-17596.patch  |  42 ++++++
 .../nasm/nasm/CVE-2019-14248.patch            |  43 ++++++
 meta/recipes-devtools/nasm/nasm_2.14.02.bb    |   1 +
 .../ghostscript/CVE-2019-14811-0001.patch     |   1 +
 .../ghostscript/CVE-2019-14869-0001.patch     |  70 ++++++++++
 .../ghostscript/ghostscript_9.27.bb           |   1 +
 .../libarchive/CVE-2019-19221.patch           | 101 ++++++++++++++
 .../libarchive/libarchive_3.4.0.bb            |   1 +
 ...up-2.4_2.66.2.bb => libsoup-2.4_2.66.4.bb} |   6 +-
 16 files changed, 437 insertions(+), 3 deletions(-)
 create mode 100644 meta/recipes-core/glibc/glibc/CVE-2019-19126.patch
 create mode 100644 meta/recipes-devtools/gdb/gdb/CVE-2019-1010180.patch
 create mode 100644 meta/recipes-devtools/go/go-1.12/0010-fix-CVE-2019-17596.patch
 create mode 100644 meta/recipes-devtools/nasm/nasm/CVE-2019-14248.patch
 create mode 100644 meta/recipes-extended/ghostscript/ghostscript/CVE-2019-14869-0001.patch
 create mode 100644 meta/recipes-extended/libarchive/libarchive/CVE-2019-19221.patch
 rename meta/recipes-support/libsoup/{libsoup-2.4_2.66.2.bb => libsoup-2.4_2.66.4.bb} (89%)

-- 
2.21.0


