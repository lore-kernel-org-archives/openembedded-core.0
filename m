X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
From: "Anuj Mittal" <anuj.mittal@intel.com>
Subject: [hardknott][PATCH 10/11] recipes-support/ptest-runner: Bump to v2.4.2
Date: Tue,  5 Oct 2021 00:50:54 +0800
Message-Id: <c0993e6c4108ae65537ad6e70de90387dacc5495.1633366030.git.anuj.mittal@intel.com>
In-Reply-To: <cover.1633366030.git.anuj.mittal@intel.com>
References: <cover.1633366030.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
List-id: <openembedded-core.lists.openembedded.org>
To: openembedded-core@lists.openembedded.org

From: Anibal Limon <anibal.limon@linaro.org>

Changes,

bcb8280 utils.c: add system data collection when a test gets stuck.
c29240c utils.c: handle test timeouts directly with poll()
d6f509f tests/utils.c: fix a memory corruption in find_word
c10e747 main: Do not return number of failed tests when calling ptest-runner
4958988 utils.c: fix memory leak in run_ptests()
fcfa6a1 clang: clean-ups to avoid -Weverything warnings.
215e52d Makefile: allow using CC env var to pick compiler
fdd233d mem: Simplify memory management
e5e218a mem: Fix memleak for ptest_opts
0dc42eb git: Extend the gitignore

Signed-off-by: Aníbal Limón <anibal.limon@linaro.org>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 710fa373375beb977af704e17a925ed41c9a858d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
---
 .../{ptest-runner_2.4.1.bb => ptest-runner_2.4.2.bb}            | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta/recipes-support/ptest-runner/{ptest-runner_2.4.1.bb => ptest-runner_2.4.2.bb} (93%)

diff --git a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
similarity index 93%
rename from meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
rename to meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
index 6bd10d2fec..b14b947f97 100644
--- a/meta/recipes-support/ptest-runner/ptest-runner_2.4.1.bb
+++ b/meta/recipes-support/ptest-runner/ptest-runner_2.4.2.bb
@@ -7,7 +7,7 @@ HOMEPAGE = "http://git.yoctoproject.org/cgit/cgit.cgi/ptest-runner2/about/"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://LICENSE;md5=751419260aa954499f7abaabaa882bbe"
 
-SRCREV = "cce0edb4282ee081d043030bfdf29f3e4052f86c"
+SRCREV = "bcb82804daa8f725b6add259dcef2067e61a75aa"
 PV .= "+git${SRCPV}"
 
 SRC_URI = "git://git.yoctoproject.org/ptest-runner2 \
-- 
2.31.1

