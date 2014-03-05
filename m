Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 3869E6EE8A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 11:25:31 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 03:25:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="494411926"
Received: from maurorob-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.80])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2014 03:25:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 11:25:22 +0000
Message-Id: <cover.1394018657.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [PATCH 0/3] gnutls fixes for master
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
X-List-Received-Date: Wed, 05 Mar 2014 11:25:32 -0000

Turns out we're using the same old version of gnutls in master as in
dylan and dora, and we need a fix for a compile failure.


The following changes since commit 82c773e88aaefd9321481ad297554d5b4a3ae0b2:

  Revert "ncurses: use ln -r to generate relative symlink" (2014-03-03 15:52:26 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/gnutls
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/gnutls

Karl Hiramoto (2):
  gnutls: CVE-2014-0092 correct return codes
  gnutls: Fixed bug that prevented the rejection of v1 intermediate CA
    certificates.

Paul Eggleton (1):
  gnutls: fix failure during do_compile

 .../gnutls/gnutls/25_updatedgdocfrommaster.diff    | 636 +++++++++++++++++++++
 .../CVE-2014-0092-corrected-return-codes.patch     | 106 ++++
 ...14-1959-rejection-of-v1-intermediate-cert.patch |  33 ++
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |   3 +
 4 files changed, 778 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch

-- 
1.8.5.3


