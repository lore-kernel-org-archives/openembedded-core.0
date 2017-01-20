Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id 34EAB76536
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:43 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:44 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567422"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:43 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:09:49 -0600
Message-Id: <c141877010e29ac26cb59273117db443f3643c96.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 18/55] oeqa/sdk: Move test cases inside cases directory
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

For match with the new structure of the OEQA framework.

In the new framework Test component base directory in this case
sdk module will contain case and context implementations.

[YOCTO #10599]

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
Signed-off-by: Mariano Lopez <mariano.lopez@linux.intel.com>
---
 meta/lib/oeqa/sdk/{ => cases}/__init__.py        | 0
 meta/lib/oeqa/sdk/{ => cases}/buildcvs.py        | 0
 meta/lib/oeqa/sdk/{ => cases}/buildgalculator.py | 0
 meta/lib/oeqa/sdk/{ => cases}/buildiptables.py   | 0
 meta/lib/oeqa/sdk/{ => cases}/gcc.py             | 0
 meta/lib/oeqa/sdk/{ => cases}/perl.py            | 0
 meta/lib/oeqa/sdk/{ => cases}/python.py          | 0
 7 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oeqa/sdk/{ => cases}/__init__.py (100%)
 rename meta/lib/oeqa/sdk/{ => cases}/buildcvs.py (100%)
 rename meta/lib/oeqa/sdk/{ => cases}/buildgalculator.py (100%)
 rename meta/lib/oeqa/sdk/{ => cases}/buildiptables.py (100%)
 rename meta/lib/oeqa/sdk/{ => cases}/gcc.py (100%)
 rename meta/lib/oeqa/sdk/{ => cases}/perl.py (100%)
 rename meta/lib/oeqa/sdk/{ => cases}/python.py (100%)

diff --git a/meta/lib/oeqa/sdk/__init__.py b/meta/lib/oeqa/sdk/cases/__init__.py
similarity index 100%
rename from meta/lib/oeqa/sdk/__init__.py
rename to meta/lib/oeqa/sdk/cases/__init__.py
diff --git a/meta/lib/oeqa/sdk/buildcvs.py b/meta/lib/oeqa/sdk/cases/buildcvs.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildcvs.py
rename to meta/lib/oeqa/sdk/cases/buildcvs.py
diff --git a/meta/lib/oeqa/sdk/buildgalculator.py b/meta/lib/oeqa/sdk/cases/buildgalculator.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildgalculator.py
rename to meta/lib/oeqa/sdk/cases/buildgalculator.py
diff --git a/meta/lib/oeqa/sdk/buildiptables.py b/meta/lib/oeqa/sdk/cases/buildiptables.py
similarity index 100%
rename from meta/lib/oeqa/sdk/buildiptables.py
rename to meta/lib/oeqa/sdk/cases/buildiptables.py
diff --git a/meta/lib/oeqa/sdk/gcc.py b/meta/lib/oeqa/sdk/cases/gcc.py
similarity index 100%
rename from meta/lib/oeqa/sdk/gcc.py
rename to meta/lib/oeqa/sdk/cases/gcc.py
diff --git a/meta/lib/oeqa/sdk/perl.py b/meta/lib/oeqa/sdk/cases/perl.py
similarity index 100%
rename from meta/lib/oeqa/sdk/perl.py
rename to meta/lib/oeqa/sdk/cases/perl.py
diff --git a/meta/lib/oeqa/sdk/python.py b/meta/lib/oeqa/sdk/cases/python.py
similarity index 100%
rename from meta/lib/oeqa/sdk/python.py
rename to meta/lib/oeqa/sdk/cases/python.py
-- 
2.1.4


