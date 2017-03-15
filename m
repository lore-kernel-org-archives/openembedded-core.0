Return-Path: <juro.bystricky@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id E36556079F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Mar 2017 19:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1489606755; x=1521142755;
	h=from:to:cc:subject:date:message-id;
	bh=NpJGJi6nZwgix0Y48kaqkmIKQwLCoRfhtdnF4S9rG9w=;
	b=HMcuM8p4JN4MQeVPFR5JzVmE69XrR5H7dvr8gvcvJ14dM30SAZnawoqw
	Y+eMgearKMgkF7Uu8yO2BCoGbrkXcA==;
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Mar 2017 12:39:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,170,1486454400"; d="scan'208";a="60846097"
Received: from juro-precision-t5610.jf.intel.com ([10.7.198.53])
	by orsmga002.jf.intel.com with ESMTP; 15 Mar 2017 12:39:14 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 15 Mar 2017 12:39:11 -0700
Message-Id: <1489606752-37886-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: richard.purdie@intel.com, jurobystricky@hotmmail.com
Subject: [morty][PATCH 0/1] relaxed testing for shell
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
X-List-Received-Date: Wed, 15 Mar 2017 19:39:14 -0000

Due to the recently implemented update-alternatives for bash binary,
sanity checker may end up with a (false-positive) error such as:

Error, /bin/sh links to /bin/bash.bash, must be dash or bash

This patch is also desired for "morty", even if it may not support
update-alternatives for bash, otherwise, for example builds using
"master" toaster will fail when using "morty" release.


Juro Bystricky (1):
  sanity.bbclass: modify check for shell

 meta/classes/sanity.bbclass | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

-- 
2.7.4


