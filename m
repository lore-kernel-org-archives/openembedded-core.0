Return-Path: <jussi.kukkonen@intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 1A43377FED
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 12:03:00 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	11 Jul 2017 05:02:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.40,346,1496127600"; d="scan'208";a="123754038"
Received: from linux.intel.com ([10.54.29.200])
	by orsmga005.jf.intel.com with ESMTP; 11 Jul 2017 05:02:42 -0700
Received: from theory.fi.intel.com (theory.fi.intel.com [10.237.72.53])
	by linux.intel.com (Postfix) with ESMTP id A30CE5808DD;
	Tue, 11 Jul 2017 05:02:40 -0700 (PDT)
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
To: openembedded-core@lists.openembedded.org, fan.xin@jp.fujitsu.com,
	fathi.boudra@linaro.org
Date: Tue, 11 Jul 2017 15:02:28 +0300
Message-Id: <cover.1499773663.git.jussi.kukkonen@intel.com>
X-Mailer: git-send-email 2.1.4
Subject: [PATCH 0/1] acpitests: Remove as unmaintained
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
X-List-Received-Date: Tue, 11 Jul 2017 12:03:01 -0000

Without meta-oe in bblayers this recipe warns:
   do_populate_lic: acpitests: No generic license file exists for:
   Intel in any provider

The license may actually be open source, hard to tell -- but the
"Intel" license that's in meta-oe is definitely not the correct one.

The recipe also seems unloved and untested... currently it seems to
be a test suite for a release we haven't shipped in a long time. I'm
sending a removal patch in the hopes of maybe finding an interested
maintainer who would fix the license issue and maybe upgrade the
recipe (it's a two-birds-one-stone situation since the new versions
seem to be BSD-licensed). 

CCing people from git log.

Cheers,
  Jussi

The following changes since commit 854c8c2e4c24ea3ddfec6e5b5f6477f0620510e4:

  oeqa/tinfoil: Improve test_wait_event for race issues (2017-07-08 13:34:46 +0100)

are available in the git repository at:

  git://git.yoctoproject.org/poky-contrib jku/acpitests
  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/acpitests

Jussi Kukkonen (1):
  acpitests: Remove as unmaintained

 .../acpica/acpitests/aapits-linux.patch            | 336 ---------------------
 .../acpica/acpitests/aapits-makefile.patch         |  34 ---
 meta/recipes-extended/acpica/acpitests_20140828.bb |  36 ---
 3 files changed, 406 deletions(-)
 delete mode 100644 meta/recipes-extended/acpica/acpitests/aapits-linux.patch
 delete mode 100644 meta/recipes-extended/acpica/acpitests/aapits-makefile.patch
 delete mode 100644 meta/recipes-extended/acpica/acpitests_20140828.bb

-- 
2.1.4


