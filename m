Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6904BD172D2
	for <webhook@archiver.kernel.org>; Sun,  1 Feb 2026 13:12:57 +0000 (UTC)
Received: from a27-29.smtp-out.us-west-2.amazonses.com (a27-29.smtp-out.us-west-2.amazonses.com [54.240.27.29])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.29189.1769951567213826413
 for <openembedded-core@lists.openembedded.org>;
 Sun, 01 Feb 2026 05:12:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=cwggYWMP;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=RbZ5D2+I;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.29, mailfrom: 0101019c19559b28-92983e09-3b89-40f6-af9f-b7be3721acaf-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Mt9+syEYrJTwT8vnsdgOdrP9U8gTCjXyItp/OL+8R2Q=;
	b=cwggYWMPti3QcqnlDrqo4zYTQh61M479+fblZw/lbAMrSw5FFdSvHGDZzP/xVi9X
	qcDGLbSIp9vpeag+CeyyvzpUe+eqPKt0dMbN+y/g0rYnu/ZoYq5ATPACZYRboNLF8Dr
	zka8ZUlFGH+btUCttRP8MewJRKZGQvMCEfdaVVmc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1769951566;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Mt9+syEYrJTwT8vnsdgOdrP9U8gTCjXyItp/OL+8R2Q=;
	b=RbZ5D2+IK/WPSNAzArLjoE75RZoK0CaXeQmiW9R6mCVTii+KuEMaV+X1bDyZolhs
	GlKqJqCBFOElwKug6J1XMgeT/Lzh+X5p8BRpD7VW7W4jdIBXz6Q5ibuH1ZRK0nQ/NJx
	mSpKHwNwCw3IQuhrjgBv1yrMjx3X0eHvYp0AH/aM=
Content-Type: multipart/mixed; boundary="===============4589471734758396279=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: openembedded-core@lists.openembedded.org
Cc: 
Subject: [AUH] lua: upgrading to 5.5.0 FAILED
Message-ID: <0101019c19559b28-92983e09-3b89-40f6-af9f-b7be3721acaf-000000@us-west-2.amazonses.com>
Date: Sun, 1 Feb 2026 13:12:46 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2026.02.01-54.240.27.29
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 01 Feb 2026 13:12:57 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/230272

--===============4589471734758396279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *lua* to *5.5.0* has Failed(do_compile).

Detailed error information:

do_compile failed



Next steps:
    - apply the patch: git am 0001-lua-upgrade-5.4.8-5.5.0.patch
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
From 7f67699eb79dd425afd7b5a01ec90ebe06c2dcf6 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sun, 1 Feb 2026 07:58:39 +0000
Subject: [PATCH] lua: upgrade 5.4.8 -> 5.5.0

---
 .../lua/{lua_5.4.8.bb => lua_5.5.0.bb}        | 37 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 2 deletions(-)
 rename meta/recipes-devtools/lua/{lua_5.4.8.bb => lua_5.5.0.bb} (63%)

diff --git a/meta/recipes-devtools/lua/lua_5.4.8.bb b/meta/recipes-devtools/lua/lua_5.5.0.bb
similarity index 63%
rename from meta/recipes-devtools/lua/lua_5.4.8.bb
rename to meta/recipes-devtools/lua/lua_5.5.0.bb
index 1d37cddeb8..3b23b1d4ad 100644
--- a/meta/recipes-devtools/lua/lua_5.4.8.bb
+++ b/meta/recipes-devtools/lua/lua_5.5.0.bb
@@ -1,7 +1,40 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- doc/readme.html
+# +++ doc/readme.html
+# @@ -1,9 +1,3 @@
+# -Copyright &copy; 1994&ndash;2025 Lua.org, PUC-Rio.
+# -
+# -<P>
+# -Permission is hereby granted, free of charge, to any person obtaining a copy
+# -of this software and associated documentation files (the "Software"), to deal
+# -in the Software without restriction, including without limitation the rights
+#  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+#  copies of the Software, and to permit persons to whom the Software is
+#  furnished to do so, subject to the following conditions:
+# @@ -20,3 +14,9 @@
+#  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+#  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+#  THE SOFTWARE.
+# +</BLOCKQUOTE>
+# +<P>
+# +
+# +<P CLASS="footer">
+# +Last update:
+# +Wed Dec 10 11:37:23 UTC 2025
+# 
+#
+
 SUMMARY = "Lua is a powerful light-weight programming language designed \
 for extending applications."
 LICENSE = "MIT"
-LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=0e573c143cb6491b41cf02cfbcb8c267"
+LIC_FILES_CHKSUM = "file://doc/readme.html;beginline=305;endline=326;md5=b61eb40fb7838eaf69a3186c50060b8c"
 HOMEPAGE = "http://www.lua.org/"
 
 SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
@@ -12,7 +45,7 @@ SRC_URI = "http://www.lua.org/ftp/lua-${PV}.tar.gz;name=tarballsrc \
 # if no test suite matches PV release of Lua exactly, download the suite for the closest Lua release.
 PV_testsuites = "${PV}"
 
-SRC_URI[tarballsrc.sha256sum] = "4f18ddae154e793e46eeab727c59ef1c0c0c2b744e7b94219710d76f530629ae"
+SRC_URI[tarballsrc.sha256sum] = "57ccc32bbbd005cab75bcc52444052535af691789dba2b9016d5c50640d68b3d"
 SRC_URI[tarballtest.sha256sum] = "9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5"
 
 inherit pkgconfig binconfig ptest
-- 
2.47.1


--===============4589471734758396279==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="0001-lua-upgrade-5.4.8-5.5.0.patch"

RnJvbSA3ZjY3Njk5ZWI3OWRkNDI1YWZkN2I1YTAxZWM5MGViZTA2YzJkY2Y2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFN1biwgMSBGZWIgMjAyNiAwNzo1ODozOSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIGx1
YTogdXBncmFkZSA1LjQuOCAtPiA1LjUuMAoKLS0tCiAuLi4vbHVhL3tsdWFfNS40LjguYmIgPT4g
bHVhXzUuNS4wLmJifSAgICAgICAgfCAzNyArKysrKysrKysrKysrKysrKystCiAxIGZpbGUgY2hh
bmdlZCwgMzUgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvbHVhL3tsdWFfNS40LjguYmIgPT4gbHVhXzUuNS4wLmJifSAoNjMlKQoKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUuNC44LmJiIGIvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL2x1YS9sdWFfNS41LjAuYmIKc2ltaWxhcml0eSBpbmRleCA2MyUKcmVu
YW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL2x1YS9sdWFfNS40LjguYmIKcmVuYW1lIHRv
IG1ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUuNS4wLmJiCmluZGV4IDFkMzdjZGRlYjgu
LjNiMjNiMWQ0YWQgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUu
NC44LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9sdWEvbHVhXzUuNS4wLmJiCkBAIC0x
LDcgKzEsNDAgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBoYXZlIGJl
ZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBpcyB0aGUg
ZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0LgorIyBQ
bGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1hcml6ZSB0
aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVwZGF0ZTon
IHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJzIHVwZGF0
ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBkb2MvcmVhZG1lLmh0bWwKKyMgKysr
IGRvYy9yZWFkbWUuaHRtbAorIyBAQCAtMSw5ICsxLDMgQEAKKyMgLUNvcHlyaWdodCAmY29weTsg
MTk5NCZuZGFzaDsyMDI1IEx1YS5vcmcsIFBVQy1SaW8uCisjIC0KKyMgLTxQPgorIyAtUGVybWlz
c2lvbiBpcyBoZXJlYnkgZ3JhbnRlZCwgZnJlZSBvZiBjaGFyZ2UsIHRvIGFueSBwZXJzb24gb2J0
YWluaW5nIGEgY29weQorIyAtb2YgdGhpcyBzb2Z0d2FyZSBhbmQgYXNzb2NpYXRlZCBkb2N1bWVu
dGF0aW9uIGZpbGVzICh0aGUgIlNvZnR3YXJlIiksIHRvIGRlYWwKKyMgLWluIHRoZSBTb2Z0d2Fy
ZSB3aXRob3V0IHJlc3RyaWN0aW9uLCBpbmNsdWRpbmcgd2l0aG91dCBsaW1pdGF0aW9uIHRoZSBy
aWdodHMKKyMgIHRvIHVzZSwgY29weSwgbW9kaWZ5LCBtZXJnZSwgcHVibGlzaCwgZGlzdHJpYnV0
ZSwgc3VibGljZW5zZSwgYW5kL29yIHNlbGwKKyMgIGNvcGllcyBvZiB0aGUgU29mdHdhcmUsIGFu
ZCB0byBwZXJtaXQgcGVyc29ucyB0byB3aG9tIHRoZSBTb2Z0d2FyZSBpcworIyAgZnVybmlzaGVk
IHRvIGRvIHNvLCBzdWJqZWN0IHRvIHRoZSBmb2xsb3dpbmcgY29uZGl0aW9uczoKKyMgQEAgLTIw
LDMgKzE0LDkgQEAKKyMgIExJQUJJTElUWSwgV0hFVEhFUiBJTiBBTiBBQ1RJT04gT0YgQ09OVFJB
Q1QsIFRPUlQgT1IgT1RIRVJXSVNFLCBBUklTSU5HIEZST00sCisjICBPVVQgT0YgT1IgSU4gQ09O
TkVDVElPTiBXSVRIIFRIRSBTT0ZUV0FSRSBPUiBUSEUgVVNFIE9SIE9USEVSIERFQUxJTkdTIElO
CisjICBUSEUgU09GVFdBUkUuCisjICs8L0JMT0NLUVVPVEU+CisjICs8UD4KKyMgKworIyArPFAg
Q0xBU1M9ImZvb3RlciI+CisjICtMYXN0IHVwZGF0ZToKKyMgK1dlZCBEZWMgMTAgMTE6Mzc6MjMg
VVRDIDIwMjUKKyMgCisjCisKIFNVTU1BUlkgPSAiTHVhIGlzIGEgcG93ZXJmdWwgbGlnaHQtd2Vp
Z2h0IHByb2dyYW1taW5nIGxhbmd1YWdlIGRlc2lnbmVkIFwKIGZvciBleHRlbmRpbmcgYXBwbGlj
YXRpb25zLiIKIExJQ0VOU0UgPSAiTUlUIgotTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZG9j
L3JlYWRtZS5odG1sO2JlZ2lubGluZT0zMDU7ZW5kbGluZT0zMjY7bWQ1PTBlNTczYzE0M2NiNjQ5
MWI0MWNmMDJjZmJjYjhjMjY3IgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxlOi8vZG9jL3JlYWRt
ZS5odG1sO2JlZ2lubGluZT0zMDU7ZW5kbGluZT0zMjY7bWQ1PWI2MWViNDBmYjc4MzhlYWY2OWEz
MTg2YzUwMDYwYjhjIgogSE9NRVBBR0UgPSAiaHR0cDovL3d3dy5sdWEub3JnLyIKIAogU1JDX1VS
SSA9ICJodHRwOi8vd3d3Lmx1YS5vcmcvZnRwL2x1YS0ke1BWfS50YXIuZ3o7bmFtZT10YXJiYWxs
c3JjIFwKQEAgLTEyLDcgKzQ1LDcgQEAgU1JDX1VSSSA9ICJodHRwOi8vd3d3Lmx1YS5vcmcvZnRw
L2x1YS0ke1BWfS50YXIuZ3o7bmFtZT10YXJiYWxsc3JjIFwKICMgaWYgbm8gdGVzdCBzdWl0ZSBt
YXRjaGVzIFBWIHJlbGVhc2Ugb2YgTHVhIGV4YWN0bHksIGRvd25sb2FkIHRoZSBzdWl0ZSBmb3Ig
dGhlIGNsb3Nlc3QgTHVhIHJlbGVhc2UuCiBQVl90ZXN0c3VpdGVzID0gIiR7UFZ9IgogCi1TUkNf
VVJJW3RhcmJhbGxzcmMuc2hhMjU2c3VtXSA9ICI0ZjE4ZGRhZTE1NGU3OTNlNDZlZWFiNzI3YzU5
ZWYxYzBjMGMyYjc0NGU3Yjk0MjE5NzEwZDc2ZjUzMDYyOWFlIgorU1JDX1VSSVt0YXJiYWxsc3Jj
LnNoYTI1NnN1bV0gPSAiNTdjY2MzMmJiYmQwMDVjYWI3NWJjYzUyNDQ0MDUyNTM1YWY2OTE3ODlk
YmEyYjkwMTZkNWM1MDY0MGQ2OGIzZCIKIFNSQ19VUklbdGFyYmFsbHRlc3Quc2hhMjU2c3VtXSA9
ICI5NTgxZDVhN2MzOWZmYmYyOWI4Y2NkZTI3MDkwODNjMzgwZjdiYmRkYmQ5NjhkY2IxNTcxMmQy
ZjJlMzNmNGU1IgogCiBpbmhlcml0IHBrZ2NvbmZpZyBiaW5jb25maWcgcHRlc3QKLS0gCjIuNDcu
MQoK

--===============4589471734758396279==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemux86-64.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 951 .bb files complete (0 cached, 951 parsed). 1957 targets, 47 skipped, 0 masked, 0 errors.
Removing 1 recipes from the qemux86_64 sysroot...done.
Removing 1 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.16.0"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.3.99+snapshot-6fd8fe0c682b2d5fd502e71093dcc256036f6a00"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:6fd8fe0c682b2d5fd502e71093dcc256036f6a00"
meta-yocto-bsp       
meta-poky            = "master:de4abc0a175af12eacc761a2e1e60ca7fdfeaa1b"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 159 Local 95 Mirrors 0 Missed 64 Current 296 (59% match, 85% complete)
done.
Removing 24 stale sstate objects for arch x86-64-v3...done.
Removing 1 stale sstate objects for arch x86_64...done.
Removing 16 stale sstate objects for arch qemux86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 385 of 455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 391 of 455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 405 of 455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 416 of 455 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 420 of 455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 421 of 455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/systemd/systemd-systemctl-native_258.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 430 of 455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_stash_locale_setscene)
NOTE: Running setscene task 435 of 455 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glibc-2.42+git-r1: task do_stash_locale_setscene: Started
NOTE: recipe gawk-native-5.3.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-native-5.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe qemu-native-10.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 436 of 455 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu-native_10.2.0.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-5.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe systemd-systemctl-native-258.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running task 856 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch)
NOTE: Running task 857 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_fetch)
NOTE: Running setscene task 440 of 455 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_create_spdx_setscene)
NOTE: recipe ncurses-6.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running task 870 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_fetch)
NOTE: recipe lua-native-5.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 872 of 1317 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch)
NOTE: recipe gawk-native-5.3.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lua-5.5.0-r0: task do_fetch: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Started
NOTE: recipe readline-8.3-r0: task do_fetch: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_create_spdx_setscene: Started
NOTE: Running task 877 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_unpack)
NOTE: recipe lua-native-5.5.0-r0: task do_fetch: Started
NOTE: recipe lua-native-5.5.0-r0: task do_fetch: Succeeded
NOTE: Running task 878 of 1317 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_unpack)
NOTE: recipe meson-native-1.10.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 448 of 455 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.14.2.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_unpack: Started
NOTE: recipe ncurses-6.5-r0: task do_fetch: Succeeded
NOTE: Running task 903 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_unpack)
NOTE: recipe lua-native-5.5.0-r0: task do_unpack: Started
NOTE: recipe readline-8.3-r0: task do_unpack: Succeeded
NOTE: Running task 904 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_patch)
NOTE: recipe lua-native-5.5.0-r0: task do_unpack: Succeeded
NOTE: Running task 905 of 1317 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_patch)
NOTE: recipe python3-native-3.14.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_unpack: Started
NOTE: recipe glibc-2.42+git-r1: task do_stash_locale_setscene: Succeeded
NOTE: Running setscene task 449 of 455 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/gawk/gawk_5.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe readline-8.3-r0: task do_patch: Started
NOTE: recipe python3-native-3.14.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-native-10.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 453 of 455 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 454 of 455 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/meson/meson_1.10.1.bb:do_populate_sysroot_setscene)
NOTE: recipe lua-native-5.5.0-r0: task do_patch: Started
NOTE: recipe lua-native-5.5.0-r0: task do_patch: Succeeded
NOTE: Running task 931 of 1317 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_deploy_source_date_epoch)
NOTE: recipe gawk-native-5.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe meson-native-1.10.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe lua-native-5.5.0-r0: task do_deploy_source_date_epoch: Started
WARNING: lua-5.5.0-r0 do_fetch: Checksum failure encountered with download of http://www.lua.org/tests/lua-5.5.0-tests.tar.gz;name=tarballtest - will attempt other sources if available
NOTE: recipe ncurses-native-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gawk-native-5.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1075 of 1317 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe readline-8.3-r0: task do_patch: Succeeded
NOTE: recipe meson-native-1.10.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1116 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_prepare_recipe_sysroot)
NOTE: recipe lua-native-5.5.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-native-5.5.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_deploy_source_date_epoch unihash changed to 040cada2914b329281820fb425fd76210948c70d9be21a6ca1992e2a03898056
NOTE: recipe glibc-2.42+git-r1: task do_prepare_recipe_sysroot: Started
NOTE: recipe lua-native-5.5.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_unpack: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 1135 of 1317 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_configure)
NOTE: Running task 1136 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_patch: Started
NOTE: recipe lua-native-5.5.0-r0: task do_configure: Started
NOTE: recipe lua-native-5.5.0-r0: task do_configure: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 1137 of 1317 (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile)
NOTE: Setscene tasks completed
NOTE: Running task 1138 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_configure)
NOTE: recipe lua-native-5.5.0-r0: task do_compile: Started
NOTE: recipe glibc-2.42+git-r1: task do_configure: Started
NOTE: recipe ncurses-6.5-r0: task do_patch: Succeeded
NOTE: recipe glibc-2.42+git-r1: task do_configure: Succeeded
NOTE: Running task 1140 of 1317 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glibc/glibc_2.42.bb:do_compile)
NOTE: recipe glibc-2.42+git-r1: task do_compile: Started
NOTE: recipe lua-5.5.0-r0: task do_fetch: Failed
Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 16 -l 75 CC=gcc  -fPIC MYCFLAGS=-isystem/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/usr/include -O2 -pipe -fPIC MYLDFLAGS=-L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/usr/lib                         -L/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/lib                         -Wl,--enable-new-dtags                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/usr/lib                         -Wl,-rpath-link,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/lib                         -Wl,-rpath,/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/usr/lib                         -Wl,-rpath,/srv/pokybuild/yo
 cto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/recipe-sysroot-native/lib                         -Wl,-O1 -Wl,--allow-shlib-undefined -Wl,--dynamic-linker=/srv/pokybuild/yocto-worker/auh/build/build/tmp/sysroots-uninative/x86_64-linux/lib/ld-linux-x86-64.so.2 -pthread AR=ar rcD RANLIB=ranlib -D linux-readline
| make: *** No rule to make target 'linux-readline'.  Stop.
| ERROR: oe_runmake failed
| WARNING: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.646666:168 exit 1 from 'exit 1'
| WARNING: Backtrace (BB generated script):
| 	#1: bbfatal_log, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.646666, line 168
| 	#2: die, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.646666, line 152
| 	#3: oe_runmake, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.646666, line 147
| 	#4: do_compile, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.646666, line 142
| 	#5: main, /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.646666, line 181
NOTE: recipe lua-native-5.5.0-r0: task do_compile: Failed
NOTE: recipe glibc-2.42+git-r1: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 1140 tasks of which 1123 didn't need to be rerun and 2 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 1 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201075715.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20260201075715.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 2 tasks failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lua/5.5.0/temp/log.do_fetch.646009
  virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/log.do_compile.646666
Summary: There was 1 WARNING message.
Summary: There were 4 ERROR messages, returning a non-zero exit code.
ERROR: lua-5.5.0-r0 do_fetch: Fetcher failure for URL: 'http://www.lua.org/tests/lua-5.5.0-tests.tar.gz;name=tarballtest'. Checksum mismatch!
File: '/srv/pokybuild/yocto-worker/auh/build/build/downloads/lua-5.5.0-tests.tar.gz.tmp' has sha256 checksum '5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472' when '9581d5a7c39ffbf29b8ccde2709083c380f7bbddbd968dcb15712d2f2e33f4e5' was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[tarballtest.sha256sum] = "5e47bbfad7db2965d69580e918ee64edeb8d8d32de404b8dae9ce5c6d76a1472"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
ERROR: lua-5.5.0-r0 do_fetch: Bitbake Fetcher Error: FetchError('Unable to fetch URL from any source.', 'http://www.lua.org/tests/lua-5.5.0-tests.tar.gz;name=tarballtest')
ERROR: lua-native-5.5.0-r0 do_compile: oe_runmake failed
ERROR: lua-native-5.5.0-r0 do_compile: Execution of '/srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/run.do_compile.646666' failed with exit code 1
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux/lua/5.5.0/temp/log.do_fetch.646009
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_fetch) failed with exit code '1'
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86_64-linux/lua-native/5.5.0/temp/log.do_compile.646666
ERROR: Task (virtual:native:/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/lua/lua_5.5.0.bb:do_compile) failed with exit code '1'

--===============4589471734758396279==--

