Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id F01726B5D0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Mar 2014 10:16:00 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 06 Mar 2014 02:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.97,599,1389772800"; d="scan'208";a="495057993"
Received: from lbhoopat-mobl1.ger.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.123.174])
	by orsmga002.jf.intel.com with ESMTP; 06 Mar 2014 02:15:31 -0800
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  6 Mar 2014 10:15:23 +0000
Message-Id: <cover.1394100856.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 1.8.5.3
Subject: [dylan][PATCH 0/1] Fix for gnutls compile failure on newer host distros
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
X-List-Received-Date: Thu, 06 Mar 2014 10:16:05 -0000

Backport of the master fix that just went in.

The following change since commit 2d6d738d52fa93de4514b65140b1e68cfae7434a:

  gnutls: Fixed bug that prevented the rejection of v1 intermediate CA certificates. (2014-03-05 12:38:29 +0000)

is available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/dylan-gnutls-fix
  http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=paule/dylan-gnutls-fix

Paul Eggleton (1):
  gnutls: fix failure during do_compile

 .../gnutls/gnutls/25_updatedgdocfrommaster.diff    | 636 +++++++++++++++++++++
 meta/recipes-support/gnutls/gnutls_2.12.23.bb      |   1 +
 2 files changed, 637 insertions(+)
 create mode 100644 meta/recipes-support/gnutls/gnutls/25_updatedgdocfrommaster.diff

-- 
1.8.5.3


