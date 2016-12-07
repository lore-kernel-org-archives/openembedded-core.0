Return-Path: <anibal.limon@linux.intel.com>
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	by mail.openembedded.org (Postfix) with ESMTP id AA40171BD7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  7 Dec 2016 20:30:35 +0000 (UTC)
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
	by fmsmga103.fm.intel.com with ESMTP; 07 Dec 2016 12:30:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,315,1477983600"; d="scan'208";a="40172597"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.142])
	by fmsmga006.fm.intel.com with ESMTP; 07 Dec 2016 12:30:37 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Wed,  7 Dec 2016 14:32:24 -0600
Message-Id: <7abb8e63d9500c7fe876811b12c69173e1b3693f.1481142664.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
In-Reply-To: <cover.1481142664.git.anibal.limon@linux.intel.com>
References: <cover.1481142664.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCHv2 19/32] oeqa/sdk: Move test cases inside cases directory
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
X-List-Received-Date: Wed, 07 Dec 2016 20:30:36 -0000
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


