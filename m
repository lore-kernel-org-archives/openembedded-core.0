Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 7DD986EEF0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 10:59:49 +0000 (UTC)
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP; 05 Mar 2014 02:59:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="466974614"
Received: from maurorob-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.80])
	by orsmga001.jf.intel.com with ESMTP; 05 Mar 2014 02:59:48 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 10:59:27 +0000
Message-Id: <cover.1394017098.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dora][PATCH 0/2] gnutls CVE fixes for dora
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
X-List-Received-Date: Wed, 05 Mar 2014 10:59:51 -0000

The following changes since commit 07df3db5dd62e793770af6e47ea2f830272e8afc:

  systemd: journald fix ignored disk space restrictions (2014-02-14 12:27:46 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dora-gnutls
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dora-gnutls

Karl Hiramoto (2):
  gnutls: CVE-2014-0092 correct return codes
  gnutls: Fixed bug that prevented the rejection of v1 intermediate CA
    certificates.

 .../CVE-2014-0092-corrected-return-codes.patch     | 106 +++++++++++++++++++++
 ...14-1959-rejection-of-v1-intermediate-cert.patch |  33 +++++++
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |   2 +
 3 files changed, 141 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-0092-corrected-return-codes.patch
 create mode 100644 meta/recipes-support/gnutls/gnutls/CVE-2014-1959-rejection-of-v1-intermediate-cert.patch

-- 
1.8.5.3


