Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 8292E6ED4C
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:17:14 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 06 Mar 2014 02:17:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,599,1389772800"; d="scan'208";a="493390793"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by fmsmga002.fm.intel.com with ESMTP; 06 Mar 2014 02:17:13 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 10:17:07 +0000
Message-Id: <cover.1394100984.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dora][PATCH 0/1] Fix for gnutls compile failure on newer host distros
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
X-List-Received-Date: Thu, 06 Mar 2014 10:17:16 -0000

Backport of the master fix that just went in.


The following change since commit 74bcafd4949b3505bff4c38de6e68ad62f0fe5f6:

  gnutls: Fixed bug that prevented the rejection of v1 intermediate CA certificates. (2014-03-05 12:38:40 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dora-gnutls-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dora-gnutls-fix

Paul Eggleton (1):
  gnutls: fix failure during do_compile

 .../gnutls/gnutls/25_updatedgdocfrommaster.diff    | 636 +++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |   1 +
 2 files changed, 637 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff

-- 
1.8.5.3


