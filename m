Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55959CD98EE
	for <webhook@archiver.kernel.org>; Wed, 17 Jun 2026 05:32:25 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.8947.1781674308708024772
 for <openembedded-core@lists.openembedded.org>;
 Tue, 16 Jun 2026 22:31:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky header.b=A2zpXefB;
 dkim=pass header.i=@amazonses.com header.s=hsbnp7p3ensaochzwyq5wwmceodymuwv header.b=AGXQkk8Y;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019ed41071c0-5f7d0106-e963-4b3b-808d-9136285706e6-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=lvjh2tk576v2ro5mi6k4dt3mc6wpqbky; d=yoctoproject.org;
	t=1781674308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=454175rbu9Z+nZ/eyQYk+rmFGlU4fJipyr7v47PIQtc=;
	b=A2zpXefBwa/m+JTfdOuEJlttmFcfxYXk3RE8jJGobKCQz5pueNTOwrwJ+2SxeGRm
	+7LgNAhyEW9/xH6OXFO2f6nUXPyRlXbw+WGzuW3VsUj+CWUEa39w369bvZRtnVk21/v
	XFv2SIBrF7ZgBDIjBPMKNXqbbK13k3yilsg9rwSE=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=hsbnp7p3ensaochzwyq5wwmceodymuwv; d=amazonses.com; t=1781674308;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=454175rbu9Z+nZ/eyQYk+rmFGlU4fJipyr7v47PIQtc=;
	b=AGXQkk8Yo52wqqPLr9Haj0WSaTr1hlHhFp7m4njEM16Ehg9CxoVAbw5fmB6qxuNu
	0/kCo0iFq1mWQ/1a8qO8HtvTiZfDWLm4yuwFmXRR90Xxf+Ozd6yq+HbLSqa0ad/s7i/
	+62U7x3mB/zNW/s29860tSJOL/ne1PSOvLQgl5vY=
Content-Type: multipart/mixed; boundary="===============7871054213976109841=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Robert Yang <liezhi.yang@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] fmt: upgrading to 12.2.0 SUCCEEDED
Message-ID: <0101019ed41071c0-5f7d0106-e963-4b3b-808d-9136285706e6-000000@us-west-2.amazonses.com>
Date: Wed, 17 Jun 2026 05:31:48 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.06.17-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 17 Jun 2026 05:32:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/238971

--===============7871054213976109841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *fmt* to *12.2.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-fmt-upgrade-12.1.0-12.2.0.patch
    - check the changes to upstream patches and summarize them in the commit message,
    - compile an image that contains the package
    - perform some basic sanity tests
    - amend the patch and sign it off: git commit -s --reset-author --amend
    - send it to the appropriate mailing list

Alternatively, if you believe the recipe should not be upgraded at this time,
you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
automatic upgrades would no longer be attempted.

Please review the attached files for further information and build/update failures.
Any problem please file a bug at https://bugzilla.yoctoproject.org/enter_bug.cgi?product=Automated%20Update%20Handler

Regards,
The Upgrade Helper

-- >8 --
From 5403e4d617b9c4c9da6c790e28e0c8d1f7e8ca0c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 17 Jun 2026 05:14:35 +0000
Subject: [PATCH] fmt: upgrade 12.1.0 -> 12.2.0

---
 ...01-Workaround-an-ABI-issue-in-spdlog.patch |  8 ++---
 .../fmt/{fmt_12.1.0.bb => fmt_12.2.0.bb}      | 30 +++++++++++++++++--
 2 files changed, 31 insertions(+), 7 deletions(-)
 rename meta/recipes-devtools/fmt/{fmt_12.1.0.bb => fmt_12.2.0.bb} (34%)

diff --git a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
index 442506f834..afae644d49 100644
--- a/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
+++ b/meta/recipes-devtools/fmt/fmt/0001-Workaround-an-ABI-issue-in-spdlog.patch
@@ -1,4 +1,4 @@
-From 32f4a4a634c99d4e00cc6149786a9180ad651f76 Mon Sep 17 00:00:00 2001
+From 6ee6b54766c50ae8df9478efd91075543e89f66e Mon Sep 17 00:00:00 2001
 From: Victor Zverovich <viz@meta.com>
 Date: Sat, 22 Mar 2025 06:57:04 -0700
 Subject: [PATCH] Workaround an ABI issue in spdlog
@@ -10,10 +10,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 4 insertions(+), 2 deletions(-)
 
 diff --git a/include/fmt/format.h b/include/fmt/format.h
-index 4a653007..82f80efd 100644
+index 5044befd..f33c8b87 100644
 --- a/include/fmt/format.h
 +++ b/include/fmt/format.h
-@@ -793,7 +793,9 @@ enum { inline_buffer_size = 500 };
+@@ -774,7 +774,9 @@ enum { inline_buffer_size = 500 };
   * converted to `std::string` with `to_string(out)`.
   */
  template <typename T, size_t SIZE = inline_buffer_size,
@@ -24,7 +24,7 @@ index 4a653007..82f80efd 100644
  class basic_memory_buffer : public detail::buffer<T> {
   private:
    T store_[SIZE];
-@@ -2746,7 +2748,7 @@ class bigint {
+@@ -2769,7 +2771,7 @@ class bigint {
    }
  
   public:
diff --git a/meta/recipes-devtools/fmt/fmt_12.1.0.bb b/meta/recipes-devtools/fmt/fmt_12.2.0.bb
similarity index 34%
rename from meta/recipes-devtools/fmt/fmt_12.1.0.bb
rename to meta/recipes-devtools/fmt/fmt_12.2.0.bb
index 22cab6f138..638b78b2ae 100644
--- a/meta/recipes-devtools/fmt/fmt_12.1.0.bb
+++ b/meta/recipes-devtools/fmt/fmt_12.2.0.bb
@@ -1,14 +1,38 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- LICENSE
+# +++ LICENSE
+# @@ -18,10 +18,3 @@
+#  LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
+#  OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
+#  WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
+# -
+# ---- Optional exception to the license ---
+# -
+# -As an exception, if, as a result of your compiling your source code, portions
+# -of this Software are embedded into a machine-executable object form of such
+# -source code, you may redistribute such embedded portions in such object form
+# -without including the above copyright and permission notices.
+# 
+#
+
 SUMMARY = "open-source formatting library for C++"
 DESCRIPTION = "{fmt} is an open-source formatting library for C++. It can be used as a safe and fast alternative to (s)printf and iostreams."
 HOMEPAGE = "https://fmt.dev"
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://LICENSE;md5=b9257785fc4f3803a4b71b76c1412729"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=6ec080902ed8f82f5a97ed13e8042634"
 
-SRC_URI = "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=${PV} \
+SRC_URI = "git://github.com/fmtlib/fmt;branch=main;protocol=https;tag=${PV} \
            file://0001-Workaround-an-ABI-issue-in-spdlog.patch \
            file://run-ptest \
            "
-SRCREV = "407c905e45ad75fc29bf0f9bb7c5c2fd3475976f"
+SRCREV = "1be298e1bd68957e4cd352e1f676f00e07dcfb57"
 
 inherit cmake ptest
 
-- 
2.47.1


--===============7871054213976109841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/fmt/fmt-dbg: FILELIST: removed "/usr/lib/fmt/ptest/.debug/compile-fp-test /usr/lib/.debug/libfmt.so.12.1.0", added "/usr/lib/.debug/libfmt.so.12.2.0 /usr/lib/fmt/ptest/.debug/c-test"
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PKGSIZE changed from 201764768 to 196954856 (-2%)
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-dbg: PV changed from "12.1.0" to "12.2.0"
packages/x86-64-v3-poky-linux/fmt/fmt-dev: FILELIST: added "/usr/include/fmt/fmt-c.h"
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PKGSIZE changed from 590022 to 604440 (+2%)
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-dev: PV changed from "12.1.0" to "12.2.0"
packages/x86-64-v3-poky-linux/fmt/fmt-doc: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-doc: PV changed from "12.1.0" to "12.2.0"
packages/x86-64-v3-poky-linux/fmt/fmt-locale: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-locale: PV changed from "12.1.0" to "12.2.0"
packages/x86-64-v3-poky-linux/fmt/fmt-ptest: FILELIST: removed "/usr/lib/fmt/ptest/compile-fp-test", added "/usr/lib/fmt/ptest/c-test"
packages/x86-64-v3-poky-linux/fmt/fmt-ptest: PKGSIZE changed from 16156044 to 15914164 (-1%)
packages/x86-64-v3-poky-linux/fmt/fmt-ptest: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-ptest: PV changed from "12.1.0" to "12.2.0"
packages/x86-64-v3-poky-linux/fmt/fmt-src: FILELIST: directory renamed /usr/src/debug/fmt/12.1.0/test/gtest/gmock -> /usr/src/debug/fmt/12.2.0/test/gtest/gmock, directory renamed /usr/src/debug/fmt/12.1.0/test/gtest -> /usr/src/debug/fmt/12.2.0/test/gtest, directory renamed /usr/src/debug/fmt/12.1.0/test/gtest/gtest -> /usr/src/debug/fmt/12.2.0/test/gtest/gtest, removed "/usr/src/debug/fmt/12.1.0/test/base-test.cc /usr/src/debug/fmt/12.1.0/test/ranges-odr-test.cc /usr/src/debug/fmt/12.1.0/test/unicode-test.cc /usr/src/debug/fmt/12.1.0/src/format.cc /usr/src/debug/fmt/12.1.0/test/printf-test.cc /usr/src/debug/fmt/12.1.0/test/gtest-extra.h /usr/src/debug/fmt/12.1.0/test/ranges-test.cc /usr/src/debug/fmt/12.1.0/test/test-assert.h /usr/src/debug/fmt/12.1.0/test/xchar-test.cc /usr/src/debug/fmt/12.1.0/test/header-only-test.cc /usr/src/debug/fmt/12.1.0/include/fmt/std.h /usr/src/debug/fmt/12.1.0/test/format-test.cc /usr/src/debug/fmt/12.1.0/test/compile-test.cc /usr/src/debug/fmt/12.1.0/te
 st/scan-test.cc /usr/src/debug/fmt/12.1.0/test/enforce-checks-test.cc /usr/src/debug/fmt/12.1.0/test/no-builtin-types-test.cc /usr/src/debug/fmt/12.1.0/test/util.h /usr/src/debug/fmt/12.1.0/include/fmt/ranges.h /usr/src/debug/fmt/12.1.0/test/compile-fp-test.cc /usr/src/debug/fmt/12.1.0/test/format-impl-test.cc /usr/src/debug/fmt/12.1.0/include/fmt/chrono.h /usr/src/debug/fmt/12.1.0/test/posix-mock-test.cc /usr/src/debug/fmt/12.1.0/test/gtest-extra.cc /usr/src/debug/fmt/12.1.0/include/fmt/color.h /usr/src/debug/fmt/12.1.0/include/fmt/format.h /usr/src/debug/fmt/12.1.0/test/color-test.cc /usr/src/debug/fmt/12.1.0/test/scan.h /usr/src/debug/fmt/12.1.0/test/posix-mock.h /usr/src/debug/fmt/12.1.0/test/mock-allocator.h /usr/src/debug/fmt/12.1.0/test/util.cc /usr/src/debug/fmt/12.1.0/include/fmt/ostream.h /usr/src/debug/fmt/12.1.0/test/os-test.cc /usr/src/debug/fmt/12.1.0/test/ostream-test.cc /usr/src/debug/fmt/12.1.0/test/std-test.cc /usr/src/debug/fmt/12.1.0/test/chrono-test.cc /usr/src/
 debug/fmt/12.1.0/include/fmt/args.h /usr/src/debug/fmt/12.1.0/test/test-main.cc /usr/src/debug/fmt/12.1.0/include/fmt/os.h /usr/src/debug/fmt/12.1.0/include/fmt/xchar.h /usr/src/debug/fmt/12.1.0/include/fmt/base.h /usr/src/debug/fmt/12.1.0/test/args-test.cc /usr/src/debug/fmt/12.1.0/src/os.cc /usr/src/debug/fmt/12.1.0/test/assert-test.cc /usr/src/debug/fmt/12.1.0/test/gtest-extra-test.cc /usr/src/debug/fmt/12.1.0/include/fmt/format-inl.h /usr/src/debug/fmt/12.1.0/include/fmt/printf.h /usr/src/debug/fmt/12.1.0/include/fmt/compile.h", added "/usr/src/debug/fmt/12.2.0/test/base-test.cc /usr/src/debug/fmt/12.2.0/test/ranges-odr-test.cc /usr/src/debug/fmt/12.2.0/test/unicode-test.cc /usr/src/debug/fmt/12.2.0/src/format.cc /usr/src/debug/fmt/12.2.0/test/printf-test.cc /usr/src/debug/fmt/12.2.0/test/gtest-extra.h /usr/src/debug/fmt/12.2.0/test/ranges-test.cc /usr/src/debug/fmt/12.2.0/test/test-assert.h /usr/src/debug/fmt/12.2.0/test/xchar-test.cc /usr/src/debug/fmt/12.2.0/test/header-only-
 test.cc /usr/src/debug/fmt/12.2.0/include/fmt/std.h /usr/src/debug/fmt/12.2.0/test/format-test.cc /usr/src/debug/fmt/12.2.0/test/compile-test.cc /usr/src/debug/fmt/12.2.0/test/scan-test.cc /usr/src/debug/fmt/12.2.0/test/enforce-checks-test.cc /usr/src/debug/fmt/12.2.0/test/no-builtin-types-test.cc /usr/src/debug/fmt/12.2.0/test/util.h /usr/src/debug/fmt/12.2.0/include/fmt/ranges.h /usr/src/debug/fmt/12.2.0/test/format-impl-test.cc /usr/src/debug/fmt/12.2.0/include/fmt/chrono.h /usr/src/debug/fmt/12.2.0/test/posix-mock-test.cc /usr/src/debug/fmt/12.2.0/include/fmt/fmt-c.h /usr/src/debug/fmt/12.2.0/include/fmt/color.h /usr/src/debug/fmt/12.2.0/include/fmt/format.h /usr/src/debug/fmt/12.2.0/test/gtest-extra.cc /usr/src/debug/fmt/12.2.0/test/color-test.cc /usr/src/debug/fmt/12.2.0/test/scan.h /usr/src/debug/fmt/12.2.0/test/posix-mock.h /usr/src/debug/fmt/12.2.0/src/fmt-c.cc /usr/src/debug/fmt/12.2.0/test/mock-allocator.h /usr/src/debug/fmt/12.2.0/test/util.cc /usr/src/debug/fmt/12.2.0/i
 nclude/fmt/ostream.h /usr/src/debug/fmt/12.2.0/test/os-test.cc /usr/src/debug/fmt/12.2.0/test/ostream-test.cc /usr/src/debug/fmt/12.2.0/test/std-test.cc /usr/src/debug/fmt/12.2.0/test/chrono-test.cc /usr/src/debug/fmt/12.2.0/include/fmt/args.h /usr/src/debug/fmt/12.2.0/test/c-test.c /usr/src/debug/fmt/12.2.0/test/test-main.cc /usr/src/debug/fmt/12.2.0/include/fmt/os.h /usr/src/debug/fmt/12.2.0/include/fmt/xchar.h /usr/src/debug/fmt/12.2.0/include/fmt/base.h /usr/src/debug/fmt/12.2.0/test/args-test.cc /usr/src/debug/fmt/12.2.0/src/os.cc /usr/src/debug/fmt/12.2.0/test/assert-test.cc /usr/src/debug/fmt/12.2.0/test/gtest-extra-test.cc /usr/src/debug/fmt/12.2.0/include/fmt/format-inl.h /usr/src/debug/fmt/12.2.0/include/fmt/printf.h /usr/src/debug/fmt/12.2.0/include/fmt/compile.h"
packages/x86-64-v3-poky-linux/fmt/fmt-src: PKGSIZE changed from 2458732 to 2483222 (+1%)
packages/x86-64-v3-poky-linux/fmt/fmt-src: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-src: PV changed from "12.1.0" to "12.2.0"
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: FILELIST: added "/usr/lib/libfmt-c.a"
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: PKGSIZE changed from 0 to 41050 (+100%)
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: PV changed from "12.1.0" to "12.2.0"
packages/x86-64-v3-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.12.1.0", added "/usr/lib/libfmt.so.12.2.0"
packages/x86-64-v3-poky-linux/fmt/fmt: PKGSIZE changed from 149576 to 157768 (+5%)
packages/x86-64-v3-poky-linux/fmt/fmt: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt/fmt: PV changed from "12.1.0" to "12.2.0"
packages/x86-64-v3-poky-linux/fmt: SRC_URI changed from "git://github.com/fmtlib/fmt;branch=master;protocol=https;tag=12.1.0 file://0001-Workaround-an-ABI-issue-in-spdlog.patch file://run-ptest" to "git://github.com/fmtlib/fmt;branch=main;protocol=https;tag=12.2.0 file://0001-Workaround-an-ABI-issue-in-spdlog.patch file://run-ptest"
packages/x86-64-v3-poky-linux/fmt: PKGV changed from 12.1.0 [default] to 12.2.0 [default]
packages/x86-64-v3-poky-linux/fmt: PV changed from "12.1.0" to "12.2.0"
Changes to packages/x86-64-v3-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so.12 changed symlink target from libfmt.so.12.1.0 to libfmt.so.12.2.0
  /usr/lib/libfmt.so.12.1.0 moved to /usr/lib/libfmt.so.12.2.0
  /usr/include/fmt/fmt-c.h was added
  /usr/lib/libfmt-c.a was added

--===============7871054213976109841==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-fmt-upgrade-12.1.0-12.2.0.patch"

RnJvbSA1NDAzZTRkNjE3YjljNGM5ZGE2Yzc5MGUyOGUwYzhkMWY3ZThjYTBjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMTcgSnVuIDIwMjYgMDU6MTQ6MzUgKzAwMDAKU3ViamVjdDogW1BBVENIXSBm
bXQ6IHVwZ3JhZGUgMTIuMS4wIC0+IDEyLjIuMAoKLS0tCiAuLi4wMS1Xb3JrYXJvdW5kLWFuLUFC
SS1pc3N1ZS1pbi1zcGRsb2cucGF0Y2ggfCAgOCArKy0tLQogLi4uL2ZtdC97Zm10XzEyLjEuMC5i
YiA9PiBmbXRfMTIuMi4wLmJifSAgICAgIHwgMzAgKysrKysrKysrKysrKysrKystLQogMiBmaWxl
cyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEv
cmVjaXBlcy1kZXZ0b29scy9mbXQve2ZtdF8xMi4xLjAuYmIgPT4gZm10XzEyLjIuMC5iYn0gKDM0
JSkKCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdC8wMDAxLVdvcmth
cm91bmQtYW4tQUJJLWlzc3VlLWluLXNwZGxvZy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9mbXQvZm10LzAwMDEtV29ya2Fyb3VuZC1hbi1BQkktaXNzdWUtaW4tc3BkbG9nLnBhdGNoCmlu
ZGV4IDQ0MjUwNmY4MzQuLmFmYWU2NDRkNDkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9mbXQvZm10LzAwMDEtV29ya2Fyb3VuZC1hbi1BQkktaXNzdWUtaW4tc3BkbG9nLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10LzAwMDEtV29ya2Fyb3VuZC1hbi1B
QkktaXNzdWUtaW4tc3BkbG9nLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAzMmY0YTRhNjM0
Yzk5ZDRlMDBjYzYxNDk3ODZhOTE4MGFkNjUxZjc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSA2ZWU2YjU0NzY2YzUwYWU4ZGY5NDc4ZWZkOTEwNzU1NDNlODlmNjZlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogVmljdG9yIFp2ZXJvdmljaCA8dml6QG1ldGEuY29tPgogRGF0
ZTogU2F0LCAyMiBNYXIgMjAyNSAwNjo1NzowNCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBXb3Jr
YXJvdW5kIGFuIEFCSSBpc3N1ZSBpbiBzcGRsb2cKQEAgLTEwLDEwICsxMCwxMCBAQCBTaWduZWQt
b2ZmLWJ5OiBLaGVtIFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCA0
IGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9pbmNsdWRlL2Zt
dC9mb3JtYXQuaCBiL2luY2x1ZGUvZm10L2Zvcm1hdC5oCi1pbmRleCA0YTY1MzAwNy4uODJmODBl
ZmQgMTAwNjQ0CitpbmRleCA1MDQ0YmVmZC4uZjMzYzhiODcgMTAwNjQ0CiAtLS0gYS9pbmNsdWRl
L2ZtdC9mb3JtYXQuaAogKysrIGIvaW5jbHVkZS9mbXQvZm9ybWF0LmgKLUBAIC03OTMsNyArNzkz
LDkgQEAgZW51bSB7IGlubGluZV9idWZmZXJfc2l6ZSA9IDUwMCB9OworQEAgLTc3NCw3ICs3NzQs
OSBAQCBlbnVtIHsgaW5saW5lX2J1ZmZlcl9zaXplID0gNTAwIH07CiAgICogY29udmVydGVkIHRv
IGBzdGQ6OnN0cmluZ2Agd2l0aCBgdG9fc3RyaW5nKG91dClgLgogICAqLwogIHRlbXBsYXRlIDx0
eXBlbmFtZSBULCBzaXplX3QgU0laRSA9IGlubGluZV9idWZmZXJfc2l6ZSwKQEAgLTI0LDcgKzI0
LDcgQEAgaW5kZXggNGE2NTMwMDcuLjgyZjgwZWZkIDEwMDY0NAogIGNsYXNzIGJhc2ljX21lbW9y
eV9idWZmZXIgOiBwdWJsaWMgZGV0YWlsOjpidWZmZXI8VD4gewogICBwcml2YXRlOgogICAgVCBz
dG9yZV9bU0laRV07Ci1AQCAtMjc0Niw3ICsyNzQ4LDcgQEAgY2xhc3MgYmlnaW50IHsKK0BAIC0y
NzY5LDcgKzI3NzEsNyBAQCBjbGFzcyBiaWdpbnQgewogICAgfQogIAogICBwdWJsaWM6CmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMi4xLjAuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMi4yLjAuYmIKc2ltaWxhcml0eSBpbmRleCAzNCUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRfMTIuMS4wLmJiCnJlbmFtZSB0
byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvZm10L2ZtdF8xMi4yLjAuYmIKaW5kZXggMjJjYWI2ZjEz
OC4uNjM4Yjc4YjJhZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL2ZtdC9mbXRf
MTIuMS4wLmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9mbXQvZm10XzEyLjIuMC5iYgpA
QCAtMSwxNCArMSwzOCBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhh
dmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlz
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQu
CisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFy
aXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBk
YXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMg
dXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIExJQ0VOU0UKKyMgKysrIExJ
Q0VOU0UKKyMgQEAgLTE4LDEwICsxOCwzIEBACisjICBMSUFCTEUgRk9SIEFOWSBDTEFJTSwgREFN
QUdFUyBPUiBPVEhFUiBMSUFCSUxJVFksIFdIRVRIRVIgSU4gQU4gQUNUSU9OCisjICBPRiBDT05U
UkFDVCwgVE9SVCBPUiBPVEhFUldJU0UsIEFSSVNJTkcgRlJPTSwgT1VUIE9GIE9SIElOIENPTk5F
Q1RJT04KKyMgIFdJVEggVEhFIFNPRlRXQVJFIE9SIFRIRSBVU0UgT1IgT1RIRVIgREVBTElOR1Mg
SU4gVEhFIFNPRlRXQVJFLgorIyAtCisjIC0tLS0gT3B0aW9uYWwgZXhjZXB0aW9uIHRvIHRoZSBs
aWNlbnNlIC0tLQorIyAtCisjIC1BcyBhbiBleGNlcHRpb24sIGlmLCBhcyBhIHJlc3VsdCBvZiB5
b3VyIGNvbXBpbGluZyB5b3VyIHNvdXJjZSBjb2RlLCBwb3J0aW9ucworIyAtb2YgdGhpcyBTb2Z0
d2FyZSBhcmUgZW1iZWRkZWQgaW50byBhIG1hY2hpbmUtZXhlY3V0YWJsZSBvYmplY3QgZm9ybSBv
ZiBzdWNoCisjIC1zb3VyY2UgY29kZSwgeW91IG1heSByZWRpc3RyaWJ1dGUgc3VjaCBlbWJlZGRl
ZCBwb3J0aW9ucyBpbiBzdWNoIG9iamVjdCBmb3JtCisjIC13aXRob3V0IGluY2x1ZGluZyB0aGUg
YWJvdmUgY29weXJpZ2h0IGFuZCBwZXJtaXNzaW9uIG5vdGljZXMuCisjIAorIworCiBTVU1NQVJZ
ID0gIm9wZW4tc291cmNlIGZvcm1hdHRpbmcgbGlicmFyeSBmb3IgQysrIgogREVTQ1JJUFRJT04g
PSAie2ZtdH0gaXMgYW4gb3Blbi1zb3VyY2UgZm9ybWF0dGluZyBsaWJyYXJ5IGZvciBDKysuIEl0
IGNhbiBiZSB1c2VkIGFzIGEgc2FmZSBhbmQgZmFzdCBhbHRlcm5hdGl2ZSB0byAocylwcmludGYg
YW5kIGlvc3RyZWFtcy4iCiBIT01FUEFHRSA9ICJodHRwczovL2ZtdC5kZXYiCiBMSUNFTlNFID0g
Ik1JVCIKLUxJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTovL0xJQ0VOU0U7bWQ1PWI5MjU3Nzg1ZmM0
ZjM4MDNhNGI3MWI3NmMxNDEyNzI5IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vTElDRU5T
RTttZDU9NmVjMDgwOTAyZWQ4ZjgyZjVhOTdlZDEzZTgwNDI2MzQiCiAKLVNSQ19VUkkgPSAiZ2l0
Oi8vZ2l0aHViLmNvbS9mbXRsaWIvZm10O2JyYW5jaD1tYXN0ZXI7cHJvdG9jb2w9aHR0cHM7dGFn
PSR7UFZ9IFwKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9mbXRsaWIvZm10O2JyYW5jaD1t
YWluO3Byb3RvY29sPWh0dHBzO3RhZz0ke1BWfSBcCiAgICAgICAgICAgIGZpbGU6Ly8wMDAxLVdv
cmthcm91bmQtYW4tQUJJLWlzc3VlLWluLXNwZGxvZy5wYXRjaCBcCiAgICAgICAgICAgIGZpbGU6
Ly9ydW4tcHRlc3QgXAogICAgICAgICAgICAiCi1TUkNSRVYgPSAiNDA3YzkwNWU0NWFkNzVmYzI5
YmYwZjliYjdjNWMyZmQzNDc1OTc2ZiIKK1NSQ1JFViA9ICIxYmUyOThlMWJkNjg5NTdlNGNkMzUy
ZTFmNjc2ZjAwZTA3ZGNmYjU3IgogCiBpbmhlcml0IGNtYWtlIHB0ZXN0CiAKLS0gCjIuNDcuMQoK

--===============7871054213976109841==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/fmt/fmt-dev: FILELIST: added "/usr/include/fmt/fmt-c.h"
packages/x86-64-v3-poky-linux/fmt/fmt-ptest: FILELIST: removed "/usr/lib/fmt/ptest/compile-fp-test", added "/usr/lib/fmt/ptest/c-test"
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: PKGSIZE changed from 0 to 41050 (+100%)
packages/x86-64-v3-poky-linux/fmt/fmt-staticdev: FILELIST: added "/usr/lib/libfmt-c.a"
packages/x86-64-v3-poky-linux/fmt/fmt: FILELIST: removed "/usr/lib/libfmt.so.12.1.0", added "/usr/lib/libfmt.so.12.2.0"
Changes to packages/x86-64-v3-poky-linux/fmt (sysroot):
  /usr/lib/libfmt.so.12 changed symlink target from libfmt.so.12.1.0 to libfmt.so.12.2.0
  /usr/lib/libfmt.so.12.1.0 moved to /usr/lib/libfmt.so.12.2.0
  /usr/include/fmt/fmt-c.h was added
  /usr/lib/libfmt-c.a was added

--===============7871054213976109841==--

