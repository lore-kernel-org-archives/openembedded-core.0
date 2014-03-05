Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id 318616EEF0
	for <openembedded-core@lists.openembedded.org>;
	Wed,  5 Mar 2014 11:03:07 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga102.jf.intel.com with ESMTP; 05 Mar 2014 02:58:41 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,592,1389772800"; d="scan'208";a="494402230"
Received: from maurorob-mobl.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.80])
	by orsmga002.jf.intel.com with ESMTP; 05 Mar 2014 03:01:56 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  5 Mar 2014 11:01:52 +0000
Message-Id: <cover.1394017266.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dylan][PATCH 0/2] gnutls CVE fixes for dylan
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
X-List-Received-Date: Wed, 05 Mar 2014 11:03:10 -0000

The following changes since commit 42232782b9a3aa0ed03c5dda84fc0b865b74b2dd:

  subversion: fix build problem when sysroot contains '-D' or '-I' (2014-02-17 14:14:24 +0000)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-gnutls
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-gnutls

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


