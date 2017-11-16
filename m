Return-Path: <juro.bystricky@intel.com>
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	by mail.openembedded.org (Postfix) with ESMTP id 847AA787B4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Nov 2017 19:49:02 +0000 (UTC)
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Nov 2017 11:49:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.44,405,1505804400"; 
   d="scan'208";a="3105423"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga003.jf.intel.com with ESMTP; 16 Nov 2017 11:49:03 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 16 Nov 2017 11:48:46 -0800
Message-Id: <1510861730-82471-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/4] improve reproducibility of several packages
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
X-List-Received-Date: Thu, 16 Nov 2017 19:49:03 -0000

These are independent patches with the same theme: leaking build host
information in various distributed files.


Juro Bystricky (4):
  gnutls: improve reproducibility
  grub-efi_2.02.bb: improve reproducibility
  x11perf: improve reproducibility
  sudo: improve reproducibility

 meta/recipes-bsp/grub/grub-efi_2.02.bb          | 10 ++++++++++
 meta/recipes-extended/sudo/sudo.inc             |  6 ++++++
 meta/recipes-graphics/xorg-app/x11perf_1.6.0.bb |  4 ++++
 meta/recipes-support/gnutls/gnutls.inc          |  5 +++++
 4 files changed, 25 insertions(+)

-- 
2.7.4


