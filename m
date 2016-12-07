Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id 5270971BD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:35 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172594"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:36 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:23 -0600
Message-Id: <bebe5f569c56c11e3991f55f315c8c8aebc6b90a.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 18/32] oeqa: Move common files to oeqa/files instead of runtime only
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Those files are used by runtime and sdk test cases, so move to
base directory of oeqa module.

[YOCTO #10599]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/{runtime => }/files/test.c   | 0
 meta/lib/oeqa/{runtime => }/files/test.cpp | 0
 meta/lib/oeqa/{runtime => }/files/test.pl  | 0
 meta/lib/oeqa/{runtime => }/files/test.py  | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oeqa/{runtime => }/files/test.c (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.cpp (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.pl (100%)
 rename meta/lib/oeqa/{runtime => }/files/test.py (100%)

diff --git a/meta/lib/oeqa/runtime/files/test.c b/meta/lib/oeqa/files/test.c
similarity index 100%
rename from meta/lib/oeqa/runtime/files/test.c
rename to meta/lib/oeqa/files/test.c
diff --git a/meta/lib/oeqa/runtime/files/test.cpp b/meta/lib/oeqa/files/test.cpp
similarity index 100%
rename from meta/lib/oeqa/runtime/files/test.cpp
rename to meta/lib/oeqa/files/test.cpp
diff --git a/meta/lib/oeqa/runtime/files/test.pl b/meta/lib/oeqa/files/test.pl
similarity index 100%
rename from meta/lib/oeqa/runtime/files/test.pl
rename to meta/lib/oeqa/files/test.pl
diff --git a/meta/lib/oeqa/runtime/files/test.py b/meta/lib/oeqa/files/test.py
similarity index 100%
rename from meta/lib/oeqa/runtime/files/test.py
rename to meta/lib/oeqa/files/test.py
-- 
2.1.4


