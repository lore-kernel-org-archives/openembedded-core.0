Return-Path: <juro.bystricky@intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id D43E678260
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Sep 2017 23:18:03 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	14 Sep 2017 16:18:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,395,1500966000"; d="scan'208";a="149361970"
Received: from juro-s2600cwr.jf.intel.com ([10.7.198.159])
	by orsmga005.jf.intel.com with ESMTP; 14 Sep 2017 16:18:04 -0700
From: Juro Bystricky <juro.bystricky@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 16:18:07 -0700
Message-Id: <1505431088-87267-1-git-send-email-juro.bystricky@intel.com>
X-Mailer: git-send-email 2.7.4
Cc: jurobystricky@hotmail.com
Subject: [PATCH 0/1] gcc 6.3 with glib 2.26
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
X-List-Received-Date: Thu, 14 Sep 2017 23:18:05 -0000

When one chooses to use gcc 6.3 with
GCCVERSION = "6.3%"
bitbake libgcc fails.

This patch fixes building this particular issue.
However, there is at least one more recipe that fails with gcc 6.3
(mesa_17.1.7.bb).

Juro Bystricky (1):
  gcc-6.3.inc: Use ucontext_t not struct ucontext.

 meta/recipes-devtools/gcc/gcc-6.3.inc              |   1 +
 .../gcc/gcc-6.3/0055-unwind_h-glibc26.patch        | 139 +++++++++++++++++++++
 2 files changed, 140 insertions(+)
 create mode 100644 meta/recipes-devtools/gcc/gcc-6.3/0055-unwind_h-glibc26.patch

-- 
2.7.4


