Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 7F9547716A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:42 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:43 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567398"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:42 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:48 -0600
Message-Id: <b49d142f0b403c846b9d2822ff3a0de845cea2e6.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 17/55] oeqa: Move common files to oeqa/files instead of runtime only
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:42 -0000
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


