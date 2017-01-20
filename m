Return-Path: <anibal.limon@linux.intel.com>
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	by mail.openembedded.org (Postfix) with ESMTP id DC950771D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 17:07:49 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga105.fm.intel.com with ESMTP; 20 Jan 2017 09:07:50 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.33,259,1477983600"; d="scan'208";a="1115567472"
Received: from alimonb-mobl1.zpn.intel.com ([10.219.5.143])
	by fmsmga002.fm.intel.com with ESMTP; 20 Jan 2017 09:07:50 -0800
From: =?UTF-8?q?An=C3=ADbal=20Lim=C3=B3n?= <anibal.limon@linux.intel.com>
To: openembedded-core@lists.openembedded.org
Date: Fri, 20 Jan 2017 11:10:03 -0600
Message-Id: <a4d0cbb7f848d7dba0b54344733792ee1efabb65.1484929088.git.anibal.limon@linux.intel.com>
X-Mailer: git-send-email 2.1.4
In-Reply-To: <cover.1484929088.git.anibal.limon@linux.intel.com>
References: <cover.1484929088.git.anibal.limon@linux.intel.com>
MIME-Version: 1.0
Subject: [PATCH 32/55] oeqa/runtime: Move to runtime_cases
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
X-List-Received-Date: Fri, 20 Jan 2017 17:07:50 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The new oeqa core framework will modify the structure of the runtime
folder the new runtime folder will have python code inside to support
runtime test cases.

Signed-off-by: Aníbal Limón <anibal.limon@linux.intel.com>
---
 meta/lib/oeqa/{runtime => runtime_cases}/_ptest.py               | 0
 meta/lib/oeqa/{runtime => runtime_cases}/_qemutiny.py            | 0
 meta/lib/oeqa/{runtime => runtime_cases}/buildcvs.py             | 0
 meta/lib/oeqa/{runtime => runtime_cases}/buildgalculator.py      | 0
 meta/lib/oeqa/{runtime => runtime_cases}/buildiptables.py        | 0
 meta/lib/oeqa/{runtime => runtime_cases}/connman.py              | 0
 meta/lib/oeqa/{runtime => runtime_cases}/date.py                 | 0
 meta/lib/oeqa/{runtime => runtime_cases}/df.py                   | 0
 meta/lib/oeqa/{runtime => runtime_cases}/files/hellomod.c        | 0
 meta/lib/oeqa/{runtime => runtime_cases}/files/hellomod_makefile | 0
 meta/lib/oeqa/{runtime => runtime_cases}/files/testmakefile      | 0
 meta/lib/oeqa/{runtime => runtime_cases}/gcc.py                  | 0
 meta/lib/oeqa/{runtime => runtime_cases}/kernelmodule.py         | 0
 meta/lib/oeqa/{runtime => runtime_cases}/ldd.py                  | 0
 meta/lib/oeqa/{runtime => runtime_cases}/logrotate.py            | 0
 meta/lib/oeqa/{runtime => runtime_cases}/multilib.py             | 0
 meta/lib/oeqa/{runtime => runtime_cases}/pam.py                  | 0
 meta/lib/oeqa/{runtime => runtime_cases}/parselogs.py            | 0
 meta/lib/oeqa/{runtime => runtime_cases}/perl.py                 | 0
 meta/lib/oeqa/{runtime => runtime_cases}/ping.py                 | 0
 meta/lib/oeqa/{runtime => runtime_cases}/python.py               | 0
 meta/lib/oeqa/{runtime => runtime_cases}/rpm.py                  | 0
 meta/lib/oeqa/{runtime => runtime_cases}/scanelf.py              | 0
 meta/lib/oeqa/{runtime => runtime_cases}/scp.py                  | 0
 meta/lib/oeqa/{runtime => runtime_cases}/skeletoninit.py         | 0
 meta/lib/oeqa/{runtime => runtime_cases}/smart.py                | 0
 meta/lib/oeqa/{runtime => runtime_cases}/ssh.py                  | 0
 meta/lib/oeqa/{runtime => runtime_cases}/syslog.py               | 0
 meta/lib/oeqa/{runtime => runtime_cases}/systemd.py              | 0
 meta/lib/oeqa/{runtime => runtime_cases}/x32lib.py               | 0
 meta/lib/oeqa/{runtime => runtime_cases}/xorg.py                 | 0
 31 files changed, 0 insertions(+), 0 deletions(-)
 rename meta/lib/oeqa/{runtime => runtime_cases}/_ptest.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/_qemutiny.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/buildcvs.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/buildgalculator.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/buildiptables.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/connman.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/date.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/df.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/files/hellomod.c (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/files/hellomod_makefile (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/files/testmakefile (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/gcc.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/kernelmodule.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/ldd.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/logrotate.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/multilib.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/pam.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/parselogs.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/perl.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/ping.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/python.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/rpm.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/scanelf.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/scp.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/skeletoninit.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/smart.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/ssh.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/syslog.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/systemd.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/x32lib.py (100%)
 rename meta/lib/oeqa/{runtime => runtime_cases}/xorg.py (100%)

diff --git a/meta/lib/oeqa/runtime/_ptest.py b/meta/lib/oeqa/runtime_cases/_ptest.py
similarity index 100%
rename from meta/lib/oeqa/runtime/_ptest.py
rename to meta/lib/oeqa/runtime_cases/_ptest.py
diff --git a/meta/lib/oeqa/runtime/_qemutiny.py b/meta/lib/oeqa/runtime_cases/_qemutiny.py
similarity index 100%
rename from meta/lib/oeqa/runtime/_qemutiny.py
rename to meta/lib/oeqa/runtime_cases/_qemutiny.py
diff --git a/meta/lib/oeqa/runtime/buildcvs.py b/meta/lib/oeqa/runtime_cases/buildcvs.py
similarity index 100%
rename from meta/lib/oeqa/runtime/buildcvs.py
rename to meta/lib/oeqa/runtime_cases/buildcvs.py
diff --git a/meta/lib/oeqa/runtime/buildgalculator.py b/meta/lib/oeqa/runtime_cases/buildgalculator.py
similarity index 100%
rename from meta/lib/oeqa/runtime/buildgalculator.py
rename to meta/lib/oeqa/runtime_cases/buildgalculator.py
diff --git a/meta/lib/oeqa/runtime/buildiptables.py b/meta/lib/oeqa/runtime_cases/buildiptables.py
similarity index 100%
rename from meta/lib/oeqa/runtime/buildiptables.py
rename to meta/lib/oeqa/runtime_cases/buildiptables.py
diff --git a/meta/lib/oeqa/runtime/connman.py b/meta/lib/oeqa/runtime_cases/connman.py
similarity index 100%
rename from meta/lib/oeqa/runtime/connman.py
rename to meta/lib/oeqa/runtime_cases/connman.py
diff --git a/meta/lib/oeqa/runtime/date.py b/meta/lib/oeqa/runtime_cases/date.py
similarity index 100%
rename from meta/lib/oeqa/runtime/date.py
rename to meta/lib/oeqa/runtime_cases/date.py
diff --git a/meta/lib/oeqa/runtime/df.py b/meta/lib/oeqa/runtime_cases/df.py
similarity index 100%
rename from meta/lib/oeqa/runtime/df.py
rename to meta/lib/oeqa/runtime_cases/df.py
diff --git a/meta/lib/oeqa/runtime/files/hellomod.c b/meta/lib/oeqa/runtime_cases/files/hellomod.c
similarity index 100%
rename from meta/lib/oeqa/runtime/files/hellomod.c
rename to meta/lib/oeqa/runtime_cases/files/hellomod.c
diff --git a/meta/lib/oeqa/runtime/files/hellomod_makefile b/meta/lib/oeqa/runtime_cases/files/hellomod_makefile
similarity index 100%
rename from meta/lib/oeqa/runtime/files/hellomod_makefile
rename to meta/lib/oeqa/runtime_cases/files/hellomod_makefile
diff --git a/meta/lib/oeqa/runtime/files/testmakefile b/meta/lib/oeqa/runtime_cases/files/testmakefile
similarity index 100%
rename from meta/lib/oeqa/runtime/files/testmakefile
rename to meta/lib/oeqa/runtime_cases/files/testmakefile
diff --git a/meta/lib/oeqa/runtime/gcc.py b/meta/lib/oeqa/runtime_cases/gcc.py
similarity index 100%
rename from meta/lib/oeqa/runtime/gcc.py
rename to meta/lib/oeqa/runtime_cases/gcc.py
diff --git a/meta/lib/oeqa/runtime/kernelmodule.py b/meta/lib/oeqa/runtime_cases/kernelmodule.py
similarity index 100%
rename from meta/lib/oeqa/runtime/kernelmodule.py
rename to meta/lib/oeqa/runtime_cases/kernelmodule.py
diff --git a/meta/lib/oeqa/runtime/ldd.py b/meta/lib/oeqa/runtime_cases/ldd.py
similarity index 100%
rename from meta/lib/oeqa/runtime/ldd.py
rename to meta/lib/oeqa/runtime_cases/ldd.py
diff --git a/meta/lib/oeqa/runtime/logrotate.py b/meta/lib/oeqa/runtime_cases/logrotate.py
similarity index 100%
rename from meta/lib/oeqa/runtime/logrotate.py
rename to meta/lib/oeqa/runtime_cases/logrotate.py
diff --git a/meta/lib/oeqa/runtime/multilib.py b/meta/lib/oeqa/runtime_cases/multilib.py
similarity index 100%
rename from meta/lib/oeqa/runtime/multilib.py
rename to meta/lib/oeqa/runtime_cases/multilib.py
diff --git a/meta/lib/oeqa/runtime/pam.py b/meta/lib/oeqa/runtime_cases/pam.py
similarity index 100%
rename from meta/lib/oeqa/runtime/pam.py
rename to meta/lib/oeqa/runtime_cases/pam.py
diff --git a/meta/lib/oeqa/runtime/parselogs.py b/meta/lib/oeqa/runtime_cases/parselogs.py
similarity index 100%
rename from meta/lib/oeqa/runtime/parselogs.py
rename to meta/lib/oeqa/runtime_cases/parselogs.py
diff --git a/meta/lib/oeqa/runtime/perl.py b/meta/lib/oeqa/runtime_cases/perl.py
similarity index 100%
rename from meta/lib/oeqa/runtime/perl.py
rename to meta/lib/oeqa/runtime_cases/perl.py
diff --git a/meta/lib/oeqa/runtime/ping.py b/meta/lib/oeqa/runtime_cases/ping.py
similarity index 100%
rename from meta/lib/oeqa/runtime/ping.py
rename to meta/lib/oeqa/runtime_cases/ping.py
diff --git a/meta/lib/oeqa/runtime/python.py b/meta/lib/oeqa/runtime_cases/python.py
similarity index 100%
rename from meta/lib/oeqa/runtime/python.py
rename to meta/lib/oeqa/runtime_cases/python.py
diff --git a/meta/lib/oeqa/runtime/rpm.py b/meta/lib/oeqa/runtime_cases/rpm.py
similarity index 100%
rename from meta/lib/oeqa/runtime/rpm.py
rename to meta/lib/oeqa/runtime_cases/rpm.py
diff --git a/meta/lib/oeqa/runtime/scanelf.py b/meta/lib/oeqa/runtime_cases/scanelf.py
similarity index 100%
rename from meta/lib/oeqa/runtime/scanelf.py
rename to meta/lib/oeqa/runtime_cases/scanelf.py
diff --git a/meta/lib/oeqa/runtime/scp.py b/meta/lib/oeqa/runtime_cases/scp.py
similarity index 100%
rename from meta/lib/oeqa/runtime/scp.py
rename to meta/lib/oeqa/runtime_cases/scp.py
diff --git a/meta/lib/oeqa/runtime/skeletoninit.py b/meta/lib/oeqa/runtime_cases/skeletoninit.py
similarity index 100%
rename from meta/lib/oeqa/runtime/skeletoninit.py
rename to meta/lib/oeqa/runtime_cases/skeletoninit.py
diff --git a/meta/lib/oeqa/runtime/smart.py b/meta/lib/oeqa/runtime_cases/smart.py
similarity index 100%
rename from meta/lib/oeqa/runtime/smart.py
rename to meta/lib/oeqa/runtime_cases/smart.py
diff --git a/meta/lib/oeqa/runtime/ssh.py b/meta/lib/oeqa/runtime_cases/ssh.py
similarity index 100%
rename from meta/lib/oeqa/runtime/ssh.py
rename to meta/lib/oeqa/runtime_cases/ssh.py
diff --git a/meta/lib/oeqa/runtime/syslog.py b/meta/lib/oeqa/runtime_cases/syslog.py
similarity index 100%
rename from meta/lib/oeqa/runtime/syslog.py
rename to meta/lib/oeqa/runtime_cases/syslog.py
diff --git a/meta/lib/oeqa/runtime/systemd.py b/meta/lib/oeqa/runtime_cases/systemd.py
similarity index 100%
rename from meta/lib/oeqa/runtime/systemd.py
rename to meta/lib/oeqa/runtime_cases/systemd.py
diff --git a/meta/lib/oeqa/runtime/x32lib.py b/meta/lib/oeqa/runtime_cases/x32lib.py
similarity index 100%
rename from meta/lib/oeqa/runtime/x32lib.py
rename to meta/lib/oeqa/runtime_cases/x32lib.py
diff --git a/meta/lib/oeqa/runtime/xorg.py b/meta/lib/oeqa/runtime_cases/xorg.py
similarity index 100%
rename from meta/lib/oeqa/runtime/xorg.py
rename to meta/lib/oeqa/runtime_cases/xorg.py
-- 
2.1.4


