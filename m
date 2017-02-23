Return-Path: <markus.lehtonen@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id F3C8172FE9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Feb 2017 10:24:21 +0000 (UTC)
Received: from orsmga005.jf.intel.com ([10.7.209.41])
	by fmsmga105.fm.intel.com with ESMTP; 23 Feb 2017 02:24:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.35,197,1484035200"; d="scan'208";a="68119648"
Received: from mburny-mobl.ger.corp.intel.com (HELO
	mqz-osx-suse64.fi.intel.com) ([10.252.22.38])
	by orsmga005.jf.intel.com with ESMTP; 23 Feb 2017 02:24:22 -0800
From: Markus Lehtonen <markus.lehtonen@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 23 Feb 2017 12:24:17 +0200
Message-Id: <1487845460-27178-1-git-send-email-markus.lehtonen@linux.intel.com>
X-Mailer: git-send-email 2.6.6
Subject: [PATCH 0/3] Fix rpm signing with GPG v2.1
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
X-List-Received-Date: Thu, 23 Feb 2017 10:24:22 -0000

This patchset makes signing work with all versions of GPG.  Previously, rpm
package signing in oe-core was not working with GPG v2.1 (which is becoming
more widespread). This was caused by a change in passphrase dialogue handling
of GPG.

[YOCTO #11054]

Markus Lehtonen (3):
  rpm: support customizing gpg command line
  lib/oe/gpg_sign: make gpg version a property of the signer
  lib/oe/gpg_sign: fix rpm signing with gpg > 2.1

 meta/lib/oe/gpg_sign.py                            | 12 +++---
 .../0001-macros-add-_gpg_sign_cmd_extra_args.patch | 43 ++++++++++++++++++++++
 meta/recipes-devtools/rpm/rpm_5.4.16.bb            |  1 +
 3 files changed, 51 insertions(+), 5 deletions(-)
 create mode 100644 meta/recipes-devtools/rpm/rpm/0001-macros-add-_gpg_sign_cmd_extra_args.patch

-- 
2.6.6


