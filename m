Return-Path: <anuj.mittal@intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id EF8C07FA45
	for <openembedded-core@lists.openembedded.org>;
	Fri,  6 Dec 2019 02:42:13 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 18:42:15 -0800
X-IronPort-AV: E=Sophos;i="5.69,282,1571727600"; d="scan'208";a="201972254"
Received: from anmitta2-mobl1.gar.corp.intel.com ([10.221.16.196])
	by orsmga007-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	05 Dec 2019 18:42:13 -0800
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri,  6 Dec 2019 10:41:50 +0800
Message-Id: <cover.1575599938.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Subject: [zeus][PATCH 00/10] zeus merge request - cover letter only
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
X-List-Received-Date: Fri, 06 Dec 2019 02:42:14 -0000
Content-Transfer-Encoding: 8bit

Hi Richard

Can you please merge these changes in zeus? They can be pulled from
stable/zeus-next.

Thanks,

Anuj

The following changes since commit b57ab03376fffd2546e55596ec03bc595e320fa1:

  oeqa: reproducible: Add option to capture bad packages (2019-11-23 12:51:37 -0800)

are available in the Git repository at:

  git://push.openembedded.org/openembedded-core-contrib stable/zeus-next

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


