Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 55FCA78276
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Jan 2018 20:24:07 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	04 Jan 2018 12:24:09 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.46,315,1511856000"; d="scan'208";a="164250094"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga004.jf.intel.com with ESMTP; 04 Jan 2018 12:24:08 -0800
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu,  4 Jan 2018 12:23:59 -0800
Message-Id: <1515097444-25092-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/5] improve reproducibility of several packages
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
X-List-Received-Date: Thu, 04 Jan 2018 20:24:08 -0000

The patches in this patch set are independent and can be applied in any order/subset.
They all allow building binary reproducible packages if built on
the same host. This is accomplished mostly by removing various
buil dhost information leaks or useless timestams.



Juro Bystricky (5):
  python3-dev: improve reproducibility
  gcc-runtime: improve reproducibility
  attr-doc: improve reproducibility
  sed-ptest: improve reproducibility
  openssl-ptest: improve reproducibility

 meta/recipes-connectivity/openssl/openssl10.inc |  6 ++++++
 meta/recipes-devtools/gcc/gcc-runtime.inc       | 12 ++++++++++++
 meta/recipes-devtools/python/python3_3.5.3.bb   |  5 +++++
 meta/recipes-extended/sed/sed_4.2.2.bb          |  6 ++++++
 meta/recipes-support/attr/ea-acl.inc            |  2 +-
 5 files changed, 30 insertions(+), 1 deletion(-)

-- 
2.7.4


