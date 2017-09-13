Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	by mail.openembedded.org (Postfix) with ESMTP id F308F783FD
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Sep 2017 20:58:16 +0000 (UTC)
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	13 Sep 2017 13:58:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.42,389,1500966000"; d="scan'208";a="128470706"
Received: from babarret-mobl1.amr.corp.intel.com (HELO
	peggleto-mobl.ger.corp.intel.com) ([10.249.71.243])
	by orsmga004.jf.intel.com with ESMTP; 13 Sep 2017 13:58:15 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 14 Sep 2017 08:57:43 +1200
Message-Id: <cover.1505336248.git.paul.eggleton@linux.intel.com>
X-Mailer: git-send-email 2.9.5
Subject: [PATCH 0/1] oe-selftest: devtool: fix test_devtool_add hanging on some machines
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
X-List-Received-Date: Wed, 13 Sep 2017 20:58:17 -0000

The following changes since commit de70799af1a8bfe2fac22b90401053275d4714ba:

  image_types: support lz4 compressed squashfs (2017-09-12 23:54:43 +0100)

are available in the git repository at:

  git://git.openembedded.org/openembedded-core-contrib paule/devtool-edit-recipe-selftest-fix
  http://cgit.openembedded.org/openembedded-core-contrib/log/?h=paule/devtool-edit-recipe-selftest-fix

Paul Eggleton (1):
  oe-selftest: devtool: fix test_devtool_add hanging on some machines

 meta/lib/oeqa/selftest/cases/devtool.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.9.5


