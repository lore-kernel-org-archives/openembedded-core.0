Return-Path: <yin.thong.choong@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 031D36010D
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Apr 2017 09:29:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=intel.com; i=@intel.com; q=dns/txt; s=intel;
	t=1491298170; x=1522834170;
	h=from:to:cc:subject:date:message-id;
	bh=bKPpWEIZyXnGqJ9SqNQ1UCy9jnGFE8ZczcyjN1jUQYQ=;
	b=dtOSI9ucrg04CNGPmeh7UUvkvwub7gSkub+DNoVUqdatOtT2piksaeIm
	GRxpeEHIXQTTUU+DAAgW+p/WCTCQvg==;
Received: from orsmga001.jf.intel.com ([10.7.209.18])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Apr 2017 02:29:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.36,274,1486454400"; d="scan'208";a="1115160761"
Received: from platypus.jf.intel.com ([10.54.77.139])
	by orsmga001.jf.intel.com with ESMTP; 04 Apr 2017 02:29:29 -0700
From: yin.thong.choong@intel.com
To: openembedded-core@lists.openembedded.org
Date: Tue,  4 Apr 2017 02:29:06 -0700
Message-Id: <1491298154-68270-1-git-send-email-yin.thong.choong@intel.com>
X-Mailer: git-send-email 2.7.4
Subject: [PATCH v2 0/8] Remove all use of fedorahosted SRC_URI [yocto #11226]
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
X-List-Received-Date: Tue, 04 Apr 2017 09:29:29 -0000

From: Choong YinThong <yin.thong.choong@intel.com>

Fedorahosted.org was retired on March 1st, 2017.
Replace all fedorahosted.org SRC_URI with source pagure.io and github.com.

Choong YinThong (8):
  selftest/recipetool: replace fedorahosted.org SRC_URI with github.com
    source
  xmlto: replace fedorahosted.org SRC_URI with pagure.io source
  libuser: replace fedorahosted.org SRC_URI with pagure.io source
  logrotate: replace fedorahosted.org SRC_URI with github.com source
  libnewt: replace fedorahosted.org SRC_URI with pagure.io source
  liberation-fonts: replace fedorahosted.org SRC_URI with pagure.io
    source
  chkconfig: replace fedorahosted.org SRC_URI with github.com source
  cronie: replace fedorahosted.org SRC_URI with github.com source

 meta/lib/oeqa/selftest/recipetool.py                     |  8 ++++----
 meta/recipes-devtools/xmlto/xmlto_0.0.28.bb              |  4 ++--
 meta/recipes-extended/chkconfig/chkconfig_1.3.58.bb      | 12 ++++++++----
 meta/recipes-extended/cronie/cronie_1.5.1.bb             |  6 ++++--
 meta/recipes-extended/libuser/libuser_0.62.bb            |  6 +++---
 meta/recipes-extended/logrotate/logrotate_3.9.1.bb       | 12 ++++++++----
 meta/recipes-extended/newt/libnewt_0.52.19.bb            |  4 ++--
 meta/recipes-graphics/ttf-fonts/liberation-fonts_1.04.bb |  4 ++--
 8 files changed, 33 insertions(+), 23 deletions(-)

-- 
2.7.4


