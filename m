Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id F25EB7705C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Feb 2016 05:54:49 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id u1J5slVN027220
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 18 Feb 2016 21:54:47 -0800 (PST)
Received: from pek-lpggp1.wrs.com (128.224.153.74) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Thu, 18 Feb 2016 21:54:46 -0800
From: Hongxu Jia <hongxu.jia@windriver.com>
To: <openembedded-core@lists.openembedded.org>, <liezhi.yang@windriver.com>,
	<ross.burton@intel.com>, <richard.purdie@linuxfoundation.org>
Date: Fri, 19 Feb 2016 00:54:38 -0500
Message-ID: <cover.1455860789.git.hongxu.jia@windriver.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
Subject: [PATCH 0/6] fix buildpath QA Issue
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
X-List-Received-Date: Fri, 19 Feb 2016 05:54:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Also fix btrfs-tools and git which were found by workd build

Other buildpath fixes is still on the way.

//Hongxu

The following changes since commit ed20c6ca446a8788615e497bd4452195537deab5:

  epiphany: Add libxml2-native to DEPENDS (2016-02-19 01:01:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib hongxu/fix-buildpath
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=hongxu/fix-buildpath

Hongxu Jia (6):
  depmodwrapper-cross: nopackages to avoid QA [buildpaths] issue
  gcc: use relative path for configure script
  bison/gettext: add --with-bisonlocaledir to assign BISON_LOCALEDIR
  openssl: substitute buildpath in source code
  btrfs-tools: fix symlink creation multiple times
  git: fix installed-vs-shipped QA Issue

 meta/recipes-connectivity/openssl/openssl.inc      |  2 +-
 .../substitute-buildpath-in-source-code.patch      | 41 +++++++++++++++
 .../recipes-connectivity/openssl/openssl_1.0.2f.bb |  1 +
 .../gettext-0.19.6/add-with-bisonlocaledir.patch   | 58 ++++++++++++++++++++++
 meta/recipes-core/gettext/gettext_0.19.6.bb        |  4 ++
 .../bison/bison/add-with-bisonlocaledir.patch      | 58 ++++++++++++++++++++++
 meta/recipes-devtools/bison/bison_3.0.4.bb         |  1 +
 .../fix-symlink-creation-multiple-times.patch      | 46 +++++++++++++++++
 .../btrfs-tools/btrfs-tools_4.4.bb                 |  1 +
 meta/recipes-devtools/gcc/gcc-runtime.inc          |  3 +-
 meta/recipes-devtools/gcc/gcc-sanitizers.inc       |  3 +-
 meta/recipes-devtools/gcc/libgcc-common.inc        |  3 +-
 meta/recipes-devtools/gcc/libgfortran.inc          |  3 +-
 meta/recipes-devtools/git/git.inc                  |  2 +
 .../recipes-kernel/kmod/depmodwrapper-cross_1.0.bb |  2 +
 15 files changed, 223 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-connectivity/openssl/openssl/substitute-buildpath-in-source-code.patch
 create mode 100644 meta/recipes-core/gettext/gettext-0.19.6/add-with-bisonlocaledir.patch
 create mode 100644 meta/recipes-devtools/bison/bison/add-with-bisonlocaledir.patch
 create mode 100644 meta/recipes-devtools/btrfs-tools/btrfs-tools/fix-symlink-creation-multiple-times.patch

-- 
1.9.1


