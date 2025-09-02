Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEFC9CAC58C
	for <webhook@archiver.kernel.org>; Tue,  2 Sep 2025 21:56:31 +0000 (UTC)
Received: from a27-33.smtp-out.us-west-2.amazonses.com (a27-33.smtp-out.us-west-2.amazonses.com [54.240.27.33])
 by mx.groups.io with SMTP id smtpd.web11.89792.1756850184412947288
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Sep 2025 14:56:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=GVEz63Db;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=HB3OEf1z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.33, mailfrom: 010101990c6e5cc7-7b5e4b8d-0c50-4fcb-87bd-2e9b131ceb05-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1756850183;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=qe78bSNt0mrvVB8AuQFLlEDuvoxtARSXGzM2Tr6FwOk=;
	b=GVEz63DbdbUyGCC3RQjcCFe+zgPs340wQpye9wvwckgaFcMWJMYKaK+/UZ4FBjlP
	50haddnpL3lbyirIIzZsX0NRRbZUayOuW25N/A6QVdpPUYegfzee5sqdymWvX2P+geY
	U1R/AfM2ggOe7qOdpi277RydE3GsAdrrrAVqCC44=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1756850183;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=qe78bSNt0mrvVB8AuQFLlEDuvoxtARSXGzM2Tr6FwOk=;
	b=HB3OEf1zj/V0h6p7VRtd/yoGVDVXdaq9ahGtgrNAcR5YFOd3HurvVX3zD3GYGLCs
	394YjUJqe6zp4aVNUK/HrU9g+TGYAlE52NIWSLfbiZo2tT1qWogUwhGq0dqbHAVqI4y
	8ojMFKTmSv1+JrRV2EtJ1MpBK7cb1Dys9VPNHGss=
Content-Type: multipart/mixed; boundary="===============8989500631608036186=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu,qemu-native: upgrading to
 10.1.0,10.1.0,10.1.0 SUCCEEDED
Message-ID: <010101990c6e5cc7-7b5e4b8d-0c50-4fcb-87bd-2e9b131ceb05-000000@us-west-2.amazonses.com>
Date: Tue, 2 Sep 2025 21:56:23 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.02-54.240.27.33
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 02 Sep 2025 21:56:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222761

--===============8989500631608036186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu,qemu-native* to *10.1.0,10.1.0,10.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-system-native-qemu-qemu-native-upgrade-10.0.2-1.patch
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
From ff6d47646ab0182954c4fe80db07da71cf54772f Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Tue, 2 Sep 2025 16:10:21 +0000
Subject: [PATCH] qemu-system-native,qemu,qemu-native: upgrade 10.0.2 ->
 10.1.0,10.0.2 -> 10.1.0,10.0.2 -> 10.1.0

---
 ...native_10.0.2.bb => qemu-native_10.1.0.bb} | 43 +++++++++++++++++++
 ...10.0.2.bb => qemu-system-native_10.1.0.bb} | 43 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |  7 +--
 ...n-environment-space-to-boot-loader-q.patch |  4 +-
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  4 +-
 ...mu-Do-not-include-file-if-not-exists.patch |  6 +--
 ...er-space-mmap-tweaks-to-address-musl.patch |  6 +--
 .../qemu/0006-qemu-Determinism-fixes.patch    |  6 +--
 ...d-use-relative-path-to-refer-to-file.patch |  2 +-
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch |  6 +--
 ...and-the-python-venv-aren-t-used-for-.patch |  6 +--
 ...move-deprecated-get_event_loop-calls.patch |  8 ++--
 .../qemu/qemu/fix-strerrorname_np.patch       |  6 +--
 .../qemu/{qemu_10.0.2.bb => qemu_10.1.0.bb}   | 43 +++++++++++++++++++
 15 files changed, 161 insertions(+), 31 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.0.2.bb => qemu-native_10.1.0.bb} (13%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.2.bb => qemu-system-native_10.1.0.bb} (42%)
 rename meta/recipes-devtools/qemu/{qemu_10.0.2.bb => qemu_10.1.0.bb} (41%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-native_10.1.0.bb
similarity index 13%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.1.0.bb
index 26fa84c180..324cf9d51a 100644
--- a/meta/recipes-devtools/qemu/qemu-native_10.0.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_10.1.0.bb
@@ -1,3 +1,46 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#  		       Version 2, June 1991
+#  
+#   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -304,8 +304,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License along
+# -    with this program; if not, write to the Free Software Foundation, Inc.,
+# -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# +    with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# --- COPYING.LIB
+# +++ COPYING.LIB
+# @@ -2,7 +2,7 @@
+#                         Version 2.1, February 1999
+#  
+#   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# - 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# 
+#
+
 BPN = "qemu"
 
 DEPENDS += "glib-2.0-native zlib-native"
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.1.0.bb
similarity index 42%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.1.0.bb
index 22462e2499..511c23c3ba 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.0.2.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_10.1.0.bb
@@ -1,3 +1,46 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#  		       Version 2, June 1991
+#  
+#   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -304,8 +304,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License along
+# -    with this program; if not, write to the Free Software Foundation, Inc.,
+# -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# +    with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# --- COPYING.LIB
+# +++ COPYING.LIB
+# @@ -2,7 +2,7 @@
+#                         Version 2.1, February 1999
+#  
+#   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# - 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# 
+#
+
 BPN = "qemu"
 
 require qemu-native.inc
diff --git a/meta/recipes-devtools/qemu/qemu.inc b/meta/recipes-devtools/qemu/qemu.inc
index 2ee76e9a7c..b8bd65a7c7 100644
--- a/meta/recipes-devtools/qemu/qemu.inc
+++ b/meta/recipes-devtools/qemu/qemu.inc
@@ -15,8 +15,9 @@ require qemu-targets.inc
 # we need a full python3-native setup
 inherit pkgconfig ptest update-rc.d systemd python3native
 
-LIC_FILES_CHKSUM = "file://COPYING;md5=441c28d2cf86e15a37fa47e15a72fbac \
-                    file://COPYING.LIB;endline=24;md5=8c5efda6cf1e1b03dcfd0e6c0d271c7f"
+LIC_FILES_CHKSUM = "file://COPYING;md5=a3b50d8b88dcc0eb3d7d39b760b9e821 \
+                    file://COPYING.LIB;endline=24;md5=8a8178c06478747a771588adec965232 \
+                    "
 
 SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
            file://powerpc_rom.bin \
@@ -39,7 +40,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "ef786f2398cb5184600f69aef4d5d691efd44576a3cff4126d38d4c6fec87759"
+SRC_URI[sha256sum] = "e0517349b50ca73ebec2fa85b06050d5c463ca65c738833bd8fc1f15f180be51"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index f27208f45f..30a9259ba3 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
+From 9c53b803ced73582840ef11e7697ee5c82704bf5 Mon Sep 17 00:00:00 2001
 From: Jason Wessel <jason.wessel@windriver.com>
 Date: Fri, 28 Mar 2014 17:42:43 +0800
 Subject: [PATCH] qemu: Add addition environment space to boot loader
@@ -18,7 +18,7 @@ Signed-off-by: Roy Li <rongqing.li@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/mips/malta.c b/hw/mips/malta.c
-index 8e9cea70b..2268a8b61 100644
+index cbdbb2105..62681fdae 100644
 --- a/hw/mips/malta.c
 +++ b/hw/mips/malta.c
 @@ -65,7 +65,7 @@
diff --git a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
index ad5c5ba03e..b51fb9fd24 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
+From ff38f46371a21f47c0f102acaf6bc355398fe8e0 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -29,7 +29,7 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index d18c1dbf2..45dde1fc5 100644
+index bcb103560..a6f161060 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
 @@ -758,7 +758,7 @@ int apic_accept_pic_intr(DeviceState *dev)
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index c04e42608f..331d2963a9 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
+From 2d636671399f07fbb0566635d304806b58b56009 Mon Sep 17 00:00:00 2001
 From: Oleksiy Obitotskyy <oobitots@cisco.com>
 Date: Wed, 25 Mar 2020 21:21:35 +0200
 Subject: [PATCH] qemu: Do not include file if not exists
@@ -16,10 +16,10 @@ Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
  1 file changed, 2 insertions(+)
 
 diff --git a/linux-user/syscall.c b/linux-user/syscall.c
-index 8bfe4912e..d04984f66 100644
+index 91360a072..acfddcf0a 100644
 --- a/linux-user/syscall.c
 +++ b/linux-user/syscall.c
-@@ -118,7 +118,9 @@
+@@ -119,7 +119,9 @@
  #include <linux/blkpg.h>
  #include <netpacket/packet.h>
  #include <linux/netlink.h>
diff --git a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
index 388d11d10d..a219c623d5 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
+From c9d04680758327fbd269e17d34482201600ffe7f Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Fri, 8 Jan 2021 17:27:06 +0000
 Subject: [PATCH] qemu: Add some user space mmap tweaks to address musl 32 bit
@@ -22,10 +22,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org
  1 file changed, 7 insertions(+), 3 deletions(-)
 
 diff --git a/linux-user/mmap.c b/linux-user/mmap.c
-index d1f36e6f1..26ccf8f4d 100644
+index 002e1e668..912839dec 100644
 --- a/linux-user/mmap.c
 +++ b/linux-user/mmap.c
-@@ -1108,12 +1108,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
+@@ -1109,12 +1109,16 @@ abi_long target_mremap(abi_ulong old_addr, abi_ulong old_size,
      int prot;
      void *host_addr;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
index 4690d86315..7b3ceda125 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
+From 23f0ed44f6bf0f871f224ce4f40c97572cc1664a Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Mon, 1 Mar 2021 13:00:47 +0000
 Subject: [PATCH] qemu: Determinism fixes
@@ -16,10 +16,10 @@ RP 2021/3/1
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/scripts/decodetree.py b/scripts/decodetree.py
-index e8b72da3a..5cd86b142 100644
+index f992472b7..2e4218b14 100644
 --- a/scripts/decodetree.py
 +++ b/scripts/decodetree.py
-@@ -1558,7 +1558,7 @@ def main():
+@@ -1559,7 +1559,7 @@ def main():
      toppat = ExcMultiPattern(0)
  
      for filename in args:
diff --git a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
index 7c24f432f2..91575617cd 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
+From 5596667fc1ab8595c2087140e48cb3e84b45fb97 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 54421544bb..127ff39a74 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
+From fd5c24017f25eb8311502c07dbf4682547cfd302 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd..b30f203a42 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
+From a99a825ce8593d3ac36bf640b28b5e8b0a581e3a Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>
 Date: Wed, 22 May 2024 14:02:55 +0200
 Subject: [PATCH] configure: lookup meson exutable from PATH
@@ -9,10 +9,10 @@ Upstream-Status: Inappropriate [workaround, would need a real fix for upstream]
  1 file changed, 1 insertion(+), 6 deletions(-)
 
 diff --git a/configure b/configure
-index 02f1dd231..2c5ecd346 100755
+index 274a77876..84e429409 100755
 --- a/configure
 +++ b/configure
-@@ -983,12 +983,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
+@@ -995,12 +995,7 @@ mkvenv="$python ${source_path}/python/scripts/mkvenv.py"
  $mkvenv ensuregroup --dir "${source_path}/python/wheels" \
       ${source_path}/pythondeps.toml meson || exit 1
  
diff --git a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
index b06020d106..6304729519 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
+From 077d815cee0ff481e275f35c640873b78a520347 Mon Sep 17 00:00:00 2001
 From: Richard Purdie <richard.purdie@linuxfoundation.org>
 Date: Wed, 22 May 2024 13:58:23 +0200
 Subject: [PATCH] qemu: Ensure pip and the python venv aren't used for meson
@@ -29,10 +29,10 @@ Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 2c5ecd346..5315ede35 100755
+index 84e429409..1a9585e8e 100755
 --- a/configure
 +++ b/configure
-@@ -969,14 +969,14 @@ python="$(command -v "$python")"
+@@ -981,14 +981,14 @@ python="$(command -v "$python")"
  echo "python determined to be '$python'"
  echo "python version: $($python --version)"
  
diff --git a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
index 64816fe7d9..9ea853294c 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
@@ -1,4 +1,4 @@
-From 5240406747fd43886618ae8194153e6fc957a82a Mon Sep 17 00:00:00 2001
+From e9ceb337fcc78809c71f1d56317bfe4e6d137795 Mon Sep 17 00:00:00 2001
 From: John Snow <jsnow@redhat.com>
 Date: Tue, 13 Aug 2024 09:35:30 -0400
 Subject: [PATCH] Remove deprecated get_event_loop calls
@@ -33,7 +33,7 @@ Signed-off-by: John Snow <jsnow@redhat.com>
  3 files changed, 15 insertions(+), 3 deletions(-)
 
 diff --git a/python/qemu/qmp/legacy.py b/python/qemu/qmp/legacy.py
-index 22a2b56..ea9b803 100644
+index 22a2b5616..ea9b8032c 100644
 --- a/python/qemu/qmp/legacy.py
 +++ b/python/qemu/qmp/legacy.py
 @@ -86,7 +86,14 @@ def __init__(self,
@@ -53,7 +53,7 @@ index 22a2b56..ea9b803 100644
          self._timeout: Optional[float] = None
  
 diff --git a/python/qemu/qmp/qmp_tui.py b/python/qemu/qmp/qmp_tui.py
-index 2d9ebbd..d11b9fc 100644
+index 2d9ebbd20..d11b9fc54 100644
 --- a/python/qemu/qmp/qmp_tui.py
 +++ b/python/qemu/qmp/qmp_tui.py
 @@ -377,7 +377,12 @@ def run(self, debug: bool = False) -> None:
@@ -71,7 +71,7 @@ index 2d9ebbd..d11b9fc 100644
  
          # Gracefully handle SIGTERM and SIGINT signals
 diff --git a/python/tests/protocol.py b/python/tests/protocol.py
-index 56c4d44..8dcef57 100644
+index 56c4d441f..8dcef573b 100644
 --- a/python/tests/protocol.py
 +++ b/python/tests/protocol.py
 @@ -228,7 +228,7 @@ def async_test(async_test_method):
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 1cc973443e..3d183bff28 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
+From b841ad53248dad6d48faa144d9ab58a5427ff922 Mon Sep 17 00:00:00 2001
 From: Natanael Copa <ncopa@alpinelinux.org>
 Date: Wed, 18 Sep 2024 16:19:37 -0700
 Subject: [PATCH] target/riscv/kvm: do not use non-portable strerrorname_np()
@@ -20,10 +20,10 @@ Signed-off-by: Natanael Copa <ncopa@alpinelinux.org>
  1 file changed, 1 insertion(+), 2 deletions(-)
 
 diff --git a/target/riscv/kvm/kvm-cpu.c b/target/riscv/kvm/kvm-cpu.c
-index 8001ca153..79fb43f92 100644
+index 5c19062c1..59b4bf16a 100644
 --- a/target/riscv/kvm/kvm-cpu.c
 +++ b/target/riscv/kvm/kvm-cpu.c
-@@ -1968,8 +1968,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
+@@ -1993,8 +1993,7 @@ static bool kvm_cpu_realize(CPUState *cs, Error **errp)
      if (riscv_has_ext(&cpu->env, RVV)) {
          ret = prctl(PR_RISCV_V_SET_CONTROL, PR_RISCV_V_VSTATE_CTRL_ON);
          if (ret) {
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.2.bb b/meta/recipes-devtools/qemu/qemu_10.1.0.bb
similarity index 41%
rename from meta/recipes-devtools/qemu/qemu_10.0.2.bb
rename to meta/recipes-devtools/qemu/qemu_10.1.0.bb
index 5d544d8d13..72e06126bb 100644
--- a/meta/recipes-devtools/qemu/qemu_10.0.2.bb
+++ b/meta/recipes-devtools/qemu/qemu_10.1.0.bb
@@ -1,3 +1,46 @@
+# FIXME: the LIC_FILES_CHKSUM values have been updated by 'devtool upgrade'.
+# The following is the difference between the old and the new license text.
+# Please update the LICENSE value if needed, and summarize the changes in
+# the commit message via 'License-Update:' tag.
+# (example: 'License-Update: copyright years updated.')
+#
+# The changes:
+#
+# --- COPYING
+# +++ COPYING
+# @@ -2,7 +2,7 @@
+#  		       Version 2, June 1991
+#  
+#   Copyright (C) 1989, 1991 Free Software Foundation, Inc.,
+# - 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# @@ -304,8 +304,7 @@
+#      GNU General Public License for more details.
+#  
+#      You should have received a copy of the GNU General Public License along
+# -    with this program; if not, write to the Free Software Foundation, Inc.,
+# -    51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
+# +    with this program; if not, see <https://www.gnu.org/licenses/>.
+#  
+#  Also add information on how to contact you by electronic and paper mail.
+#  
+# --- COPYING.LIB
+# +++ COPYING.LIB
+# @@ -2,7 +2,7 @@
+#                         Version 2.1, February 1999
+#  
+#   Copyright (C) 1991, 1999 Free Software Foundation, Inc.
+# - 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA
+# + <https://fsf.org/>
+#   Everyone is permitted to copy and distribute verbatim copies
+#   of this license document, but changing it is not allowed.
+#  
+# 
+#
+
 BBCLASSEXTEND = "nativesdk"
 
 require qemu.inc
-- 
2.47.1


--===============8989500631608036186==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-system-native-qemu-qemu-native-upgrade-10.0.2-1.patch"

RnJvbSBmZjZkNDc2NDZhYjAxODI5NTRjNGZlODBkYjA3ZGE3MWNmNTQ3NzJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFR1ZSwgMiBTZXAgMjAyNSAxNjoxMDoyMSArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXUtc3lzdGVtLW5hdGl2ZSxxZW11LHFlbXUtbmF0aXZlOiB1cGdyYWRlIDEwLjAuMiAtPgogMTAu
MS4wLDEwLjAuMiAtPiAxMC4xLjAsMTAuMC4yIC0+IDEwLjEuMAoKLS0tCiAuLi5uYXRpdmVfMTAu
MC4yLmJiID0+IHFlbXUtbmF0aXZlXzEwLjEuMC5iYn0gfCA0MyArKysrKysrKysrKysrKysrKysr
CiAuLi4xMC4wLjIuYmIgPT4gcWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjEuMC5iYn0gfCA0MyArKysr
KysrKysrKysrKysrKysrCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyAgICAg
ICAgICAgfCAgNyArLS0KIC4uLm4tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5w
YXRjaCB8ICA0ICstCiAuLi4vMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRj
aCAgfCAgNCArLQogLi4ubXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNo
IHwgIDYgKy0tCiAuLi5lci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2gg
fCAgNiArLS0KIC4uLi9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaCAgICB8
ICA2ICstLQogLi4uZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoIHwg
IDIgKy0KIC4uLmFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaCB8ICAy
ICstCiAuLi5ndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2ggfCAgNiAr
LS0KIC4uLmFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaCB8ICA2ICst
LQogLi4ubW92ZS1kZXByZWNhdGVkLWdldF9ldmVudF9sb29wLWNhbGxzLnBhdGNoIHwgIDggKyst
LQogLi4uL3FlbXUvcWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoICAgICAgIHwgIDYgKy0t
CiAuLi4vcWVtdS97cWVtdV8xMC4wLjIuYmIgPT4gcWVtdV8xMC4xLjAuYmJ9ICAgfCA0MyArKysr
KysrKysrKysrKysrKysrCiAxNSBmaWxlcyBjaGFuZ2VkLCAxNjEgaW5zZXJ0aW9ucygrKSwgMzEg
ZGVsZXRpb25zKC0pCiByZW5hbWUgbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUve3FlbXUtbmF0
aXZlXzEwLjAuMi5iYiA9PiBxZW11LW5hdGl2ZV8xMC4xLjAuYmJ9ICgxMyUpCiByZW5hbWUgbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUve3FlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjIuYmIgPT4g
cWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjEuMC5iYn0gKDQyJSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS97cWVtdV8xMC4wLjIuYmIgPT4gcWVtdV8xMC4xLjAuYmJ9ICg0MSUpCgpk
aWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfMTAuMC4y
LmJiIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfMTAuMS4wLmJiCnNp
bWlsYXJpdHkgaW5kZXggMTMlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUtbmF0aXZlXzEwLjAuMi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS1uYXRpdmVfMTAuMS4wLmJiCmluZGV4IDI2ZmE4NGMxODAuLjMyNGNmOWQ1MWEgMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjAuMi5i
YgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8xMC4xLjAuYmIK
QEAgLTEsMyArMSw0NiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0gdmFsdWVzIGhh
dmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9sbG93aW5nIGlz
IHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNlbnNlIHRleHQu
CisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFy
aXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBk
YXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMg
dXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcKKyMgKysrIENP
UFlJTkcKKyMgQEAgLTIsNyArMiw3IEBACisjICAJCSAgICAgICBWZXJzaW9uIDIsIEp1bmUgMTk5
MQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdhcmUgRm91bmRh
dGlvbiwgSW5jLiwKKyMgLSA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24s
IE1BIDAyMTEwLTEzMDEgVVNBCisjICsgPGh0dHBzOi8vZnNmLm9yZy8+CisjICAgRXZlcnlvbmUg
aXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisjICAg
b2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQu
CisjICAKKyMgQEAgLTMwNCw4ICszMDQsNyBAQAorIyAgICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICAKKyMgICAgICBZb3Ugc2hvdWxkIGhhdmUgcmVj
ZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBhbG9uZworIyAt
ICAgIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJl
IEZvdW5kYXRpb24sIEluYy4sCisjIC0gICAgNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9v
ciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQS4KKyMgKyAgICB3aXRoIHRoaXMgcHJvZ3JhbTsg
aWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMgIAorIyAgQWxz
byBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNvbnRhY3QgeW91IGJ5IGVsZWN0cm9uaWMgYW5k
IHBhcGVyIG1haWwuCisjICAKKyMgLS0tIENPUFlJTkcuTElCCisjICsrKyBDT1BZSU5HLkxJQgor
IyBAQCAtMiw3ICsyLDcgQEAKKyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVyc2lvbiAyLjEs
IEZlYnJ1YXJ5IDE5OTkKKyMgIAorIyAgIENvcHlyaWdodCAoQykgMTk5MSwgMTk5OSBGcmVlIFNv
ZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMgLSA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZs
b29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgKyA8aHR0cHM6Ly9mc2Yub3JnLz4K
KyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRp
bSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBp
cyBub3QgYWxsb3dlZC4KKyMgIAorIyAKKyMKKwogQlBOID0gInFlbXUiCiAKIERFUEVORFMgKz0g
ImdsaWItMi4wLW5hdGl2ZSB6bGliLW5hdGl2ZSIKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2ZV8xMC4wLjIuYmIgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfMTAuMS4wLmJiCnNpbWlsYXJpdHkgaW5k
ZXggNDIlCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVt
LW5hdGl2ZV8xMC4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUtc3lzdGVtLW5hdGl2ZV8xMC4xLjAuYmIKaW5kZXggMjI0NjJlMjQ5OS4uNTExYzIzYzNiYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZl
XzEwLjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1u
YXRpdmVfMTAuMS4wLmJiCkBAIC0xLDMgKzEsNDYgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNf
Q0hLU1VNIHZhbHVlcyBoYXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMg
VGhlIGZvbGxvd2luZyBpcyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBu
ZXcgbGljZW5zZSB0ZXh0LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5l
ZWRlZCwgYW5kIHN1bW1hcml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2Ug
dmlhICdMaWNlbnNlLVVwZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTog
Y29weXJpZ2h0IHllYXJzIHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBD
T1BZSU5HCisjICsrKyBDT1BZSU5HCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgCQkgICAgICAgVmVy
c2lvbiAyLCBKdW5lIDE5OTEKKyMgIAorIyAgIENvcHlyaWdodCAoQykgMTk4OSwgMTk5MSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjIC0gNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0
aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQQorIyArIDxodHRwczovL2ZzZi5vcmcv
PgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJh
dGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0
IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIEBAIC0zMDQsOCArMzA0LDcgQEAKKyMgICAgICBHTlUg
R2VuZXJhbCBQdWJsaWMgTGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAgCisjICAgICAgWW91
IHNob3VsZCBoYXZlIHJlY2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExp
Y2Vuc2UgYWxvbmcKKyMgLSAgICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0
aGUgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAtICAgIDUxIEZyYW5rbGluIFN0
cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EuCisjICsgICAgd2l0
aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgc2VlIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2Vz
Lz4uCisjICAKKyMgIEFsc28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBi
eSBlbGVjdHJvbmljIGFuZCBwYXBlciBtYWlsLgorIyAgCisjIC0tLSBDT1BZSU5HLkxJQgorIyAr
KysgQ09QWUlORy5MSUIKKyMgQEAgLTIsNyArMiw3IEBACisjICAgICAgICAgICAgICAgICAgICAg
ICAgIFZlcnNpb24gMi4xLCBGZWJydWFyeSAxOTk5CisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5
OTEsIDE5OTkgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjIC0gNTEgRnJhbmtsaW4g
U3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBCisjICsgPGh0
dHBzOi8vZnNmLm9yZy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRp
c3RyaWJ1dGUgdmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBi
dXQgY2hhbmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgCisjCisKIEJQTiA9ICJxZW11
IgogCiByZXF1aXJlIHFlbXUtbmF0aXZlLmluYwpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS5pbmMgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11Lmlu
YwppbmRleCAyZWU3NmU5YTdjLi5iOGJkNjVhN2M3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LmluYworKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LmluYwpAQCAtMTUsOCArMTUsOSBAQCByZXF1aXJlIHFlbXUtdGFyZ2V0cy5pbmMKICMgd2Ug
bmVlZCBhIGZ1bGwgcHl0aG9uMy1uYXRpdmUgc2V0dXAKIGluaGVyaXQgcGtnY29uZmlnIHB0ZXN0
IHVwZGF0ZS1yYy5kIHN5c3RlbWQgcHl0aG9uM25hdGl2ZQogCi1MSUNfRklMRVNfQ0hLU1VNID0g
ImZpbGU6Ly9DT1BZSU5HO21kNT00NDFjMjhkMmNmODZlMTVhMzdmYTQ3ZTE1YTcyZmJhYyBcCi0g
ICAgICAgICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkxJQjtlbmRsaW5lPTI0O21kNT04YzVl
ZmRhNmNmMWUxYjAzZGNmZDBlNmMwZDI3MWM3ZiIKK0xJQ19GSUxFU19DSEtTVU0gPSAiZmlsZTov
L0NPUFlJTkc7bWQ1PWEzYjUwZDhiODhkY2MwZWIzZDdkMzliNzYwYjllODIxIFwKKyAgICAgICAg
ICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuTElCO2VuZGxpbmU9MjQ7bWQ1PThhODE3OGMwNjQ3
ODc0N2E3NzE1ODhhZGVjOTY1MjMyIFwKKyAgICAgICAgICAgICAgICAgICAgIgogCiBTUkNfVVJJ
ID0gImh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59LSR7UFZ9LnRhci54eiBcCiAgICAg
ICAgICAgIGZpbGU6Ly9wb3dlcnBjX3JvbS5iaW4gXApAQCAtMzksNyArNDAsNyBAQCBTUkNfVVJJ
ID0gImh0dHBzOi8vZG93bmxvYWQucWVtdS5vcmcvJHtCUE59LSR7UFZ9LnRhci54eiBcCiBVUFNU
UkVBTV9DSEVDS19VUkkgPSAiaHR0cHM6Ly93d3cucWVtdS5vcmciCiBVUFNUUkVBTV9DSEVDS19S
RUdFWCA9ICJxZW11LSg/UDxwdmVyPlxkKyhcLlxkKykrKVwudGFyIgogCi1TUkNfVVJJW3NoYTI1
NnN1bV0gPSAiZWY3ODZmMjM5OGNiNTE4NDYwMGY2OWFlZjRkNWQ2OTFlZmQ0NDU3NmEzY2ZmNDEy
NmQzOGQ0YzZmZWM4Nzc1OSIKK1NSQ19VUklbc2hhMjU2c3VtXSA9ICJlMDUxNzM0OWI1MGNhNzNl
YmVjMmZhODViMDYwNTBkNWM0NjNjYTY1YzczODgzM2JkOGZjMWYxNWYxODBiZTUxIgogCiBDVkVf
U1RBVFVTW0NWRS0yMDA3LTA5OThdID0gIm5vdC1hcHBsaWNhYmxlLWNvbmZpZzogVGhlIFZOQyBz
ZXJ2ZXIgY2FuIGV4cG9zZSBob3N0IGZpbGVzIHVkZXIgc29tZSBjaXJjdW1zdGFuY2VzLiBXZSBk
b24ndCBlbmFibGUgaXQgYnkgZGVmYXVsdC4iCiAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFj
ZS10by1ib290LWxvYWRlci1xLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVy
LXEucGF0Y2gKaW5kZXggZjI3MjA4ZjQ1Zi4uMzBhOTI1OWJhMyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25t
ZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRv
LWJvb3QtbG9hZGVyLXEucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI3MjczZmNhYzY4NTc3
NTBmMDdhMjYzMmJkYjZiMGVkNjZhZTk4MmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDljNTNiODAzY2VkNzM1ODI4NDBlZjExZTc2OTdlZTVjODI3MDRiZjUgTW9uIFNlcCAxNyAwMDow
MDowMCAyMDAxCiBGcm9tOiBKYXNvbiBXZXNzZWwgPGphc29uLndlc3NlbEB3aW5kcml2ZXIuY29t
PgogRGF0ZTogRnJpLCAyOCBNYXIgMjAxNCAxNzo0Mjo0MyArMDgwMAogU3ViamVjdDogW1BBVENI
XSBxZW11OiBBZGQgYWRkaXRpb24gZW52aXJvbm1lbnQgc3BhY2UgdG8gYm9vdCBsb2FkZXIKQEAg
LTE4LDcgKzE4LDcgQEAgU2lnbmVkLW9mZi1ieTogUm95IExpIDxyb25ncWluZy5saUB3aW5kcml2
ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvaHcvbWlwcy9tYWx0YS5jIGIvaHcvbWlwcy9tYWx0YS5jCi1pbmRleCA4
ZTljZWE3MGIuLjIyNjhhOGI2MSAxMDA2NDQKK2luZGV4IGNiZGJiMjEwNS4uNjI2ODFmZGFlIDEw
MDY0NAogLS0tIGEvaHcvbWlwcy9tYWx0YS5jCiArKysgYi9ody9taXBzL21hbHRhLmMKIEBAIC02
NSw3ICs2NSw3IEBACmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0
Y2gKaW5kZXggYWQ1YzViYTAzZS4uYjUxZmI5ZmQyNCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVw
LWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTliOTUwNzNl
NWQ0MmRjNGFhNTM5MmRhM2Q0MjJhYjY2ODAwMzEwNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZmYzOGY0NjM3MWEyMWY0N2MwZjEwMmFjYWY2YmMzNTUzOThmZThlMCBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IE1hcmsgQXNzZWxzdGluZSA8bWFyay5hc3NlbHN0aW5lQHdp
bmRyaXZlci5jb20+CiBEYXRlOiBUdWUsIDI2IEZlYiAyMDEzIDExOjQzOjI4IC0wNTAwCiBTdWJq
ZWN0OiBbUEFUQ0hdIGFwaWM6IGZpeHVwIGZhbGx0aHJvdWdoIHRvIFBJQwpAQCAtMjksNyArMjks
NyBAQCBTaWduZWQtb2ZmLWJ5OiBIZSBaaGUgPHpoZS5oZUB3aW5kcml2ZXIuY29tPgogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
aHcvaW50Yy9hcGljLmMgYi9ody9pbnRjL2FwaWMuYwotaW5kZXggZDE4YzFkYmYyLi40NWRkZTFm
YzUgMTAwNjQ0CitpbmRleCBiY2IxMDM1NjAuLmE2ZjE2MTA2MCAxMDA2NDQKIC0tLSBhL2h3L2lu
dGMvYXBpYy5jCiArKysgYi9ody9pbnRjL2FwaWMuYwogQEAgLTc1OCw3ICs3NTgsNyBAQCBpbnQg
YXBpY19hY2NlcHRfcGljX2ludHIoRGV2aWNlU3RhdGUgKmRldikKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUt
aWYtbm90LWV4aXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAw
NC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaAppbmRleCBjMDRl
NDI2MDhmLi4zMzFkMjk2M2E5IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWlu
Y2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5MTMw
NjRmOWZlNzI0ZmExYjcwYjliZjZkZDM0NDRjN2RkZGViOTI4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSAyZDYzNjY3MTM5OWYwN2ZiYjA1NjY2MzVkMzA0ODA2YjU4YjU2MDA5IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT2xla3NpeSBPYml0b3Rza3l5IDxvb2JpdG90c0Bj
aXNjby5jb20+CiBEYXRlOiBXZWQsIDI1IE1hciAyMDIwIDIxOjIxOjM1ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHFlbXU6IERvIG5vdCBpbmNsdWRlIGZpbGUgaWYgbm90IGV4aXN0cwpAQCAtMTYs
MTAgKzE2LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFNha2liIFNhamFsIDxzYWtpYi5zYWphbEB3aW5k
cml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKIAogZGlmZiAtLWdp
dCBhL2xpbnV4LXVzZXIvc3lzY2FsbC5jIGIvbGludXgtdXNlci9zeXNjYWxsLmMKLWluZGV4IDhi
ZmU0OTEyZS4uZDA0OTg0ZjY2IDEwMDY0NAoraW5kZXggOTEzNjBhMDcyLi5hY2ZkZGNmMGEgMTAw
NjQ0CiAtLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGludXgtdXNlci9zeXNjYWxs
LmMKLUBAIC0xMTgsNyArMTE4LDkgQEAKK0BAIC0xMTksNyArMTE5LDkgQEAKICAjaW5jbHVkZSA8
bGludXgvYmxrcGcuaD4KICAjaW5jbHVkZSA8bmV0cGFja2V0L3BhY2tldC5oPgogICNpbmNsdWRl
IDxsaW51eC9uZXRsaW5rLmg+CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJl
c3MtbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11
LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoCmlu
ZGV4IDM4OGQxMWQxMGQuLmEyMTljNjIzZDUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3Mt
dG8tYWRkcmVzcy1tdXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1t
dXNsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMmFkZmM3MDNlOTQ4MTliMGRhY2E5OGZk
ZTFkMGEzMDE2OGMyOTJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjOWQwNDY4MDc1
ODMyN2ZiZDI2OWUxN2QzNDQ4MjIwMTYwMGZmZTdmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
RnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+
CiBEYXRlOiBGcmksIDggSmFuIDIwMjEgMTc6Mjc6MDYgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0g
cWVtdTogQWRkIHNvbWUgdXNlciBzcGFjZSBtbWFwIHR3ZWFrcyB0byBhZGRyZXNzIG11c2wgMzIg
Yml0CkBAIC0yMiwxMCArMjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJp
Y2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcKICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNl
cnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvbGludXgtdXNlci9tbWFw
LmMgYi9saW51eC11c2VyL21tYXAuYwotaW5kZXggZDFmMzZlNmYxLi4yNmNjZjhmNGQgMTAwNjQ0
CitpbmRleCAwMDJlMWU2NjguLjkxMjgzOWRlYyAxMDA2NDQKIC0tLSBhL2xpbnV4LXVzZXIvbW1h
cC5jCiArKysgYi9saW51eC11c2VyL21tYXAuYwotQEAgLTExMDgsMTIgKzExMDgsMTYgQEAgYWJp
X2xvbmcgdGFyZ2V0X21yZW1hcChhYmlfdWxvbmcgb2xkX2FkZHIsIGFiaV91bG9uZyBvbGRfc2l6
ZSwKK0BAIC0xMTA5LDEyICsxMTA5LDE2IEBAIGFiaV9sb25nIHRhcmdldF9tcmVtYXAoYWJpX3Vs
b25nIG9sZF9hZGRyLCBhYmlfdWxvbmcgb2xkX3NpemUsCiAgICAgIGludCBwcm90OwogICAgICB2
b2lkICpob3N0X2FkZHI7CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaCBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCmluZGV4
IDQ2OTBkODYzMTUuLjdiM2NlZGExMjUgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMDMyNzI2ZTlkYThkZTAwODhkNmM3MGNmZDkyZTBh
NTIxNTUzMTVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAyM2YwZWQ0NGY2YmYwZjg3
MWYyMjRjZTRmNDBjOTc1NzJjYzE2NjRhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
UmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmc+CiBEYXRl
OiBNb24sIDEgTWFyIDIwMjEgMTM6MDA6NDcgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTog
RGV0ZXJtaW5pc20gZml4ZXMKQEAgLTE2LDEwICsxNiwxMCBAQCBSUCAyMDIxLzMvMQogIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0IGEv
c2NyaXB0cy9kZWNvZGV0cmVlLnB5IGIvc2NyaXB0cy9kZWNvZGV0cmVlLnB5Ci1pbmRleCBlOGI3
MmRhM2EuLjVjZDg2YjE0MiAxMDA2NDQKK2luZGV4IGY5OTI0NzJiNy4uMmU0MjE4YjE0IDEwMDY0
NAogLS0tIGEvc2NyaXB0cy9kZWNvZGV0cmVlLnB5CiArKysgYi9zY3JpcHRzL2RlY29kZXRyZWUu
cHkKLUBAIC0xNTU4LDcgKzE1NTgsNyBAQCBkZWYgbWFpbigpOgorQEAgLTE1NTksNyArMTU1OSw3
IEBAIGRlZiBtYWluKCk6CiAgICAgIHRvcHBhdCA9IEV4Y011bHRpUGF0dGVybigwKQogIAogICAg
ICBmb3IgZmlsZW5hbWUgaW4gYXJnczoKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1y
ZWZlci10by1maWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3
LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0
Y2gKaW5kZXggN2MyNGY0MzJmMi4uOTE1NzU2MTdjZCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1w
YXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVy
LXRvLWZpbGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGViZWFiMDY3NDczMDZlYzE2Mjk5
MjA3YmY0YmQ3NDgxYTQ3MmI0ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDU1OTY2
NjdmYzFhYjg1OTVjMjA4NzE0MGU0OGNiM2U4NGI0NWZiOTcgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogVGh1LCAxNCBKYW4gMjAyMSAwNjozMzowNCArMDAwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0
cy9tZXNvbi5idWlsZDogdXNlIHJlbGF0aXZlIHBhdGggdG8gcmVmZXIgdG8gZmlsZXMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZ
TkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJF
RF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKaW5kZXggNTQ0MjE1NDRiYi4uMTI3ZmYzOWE3
NCAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmlu
ZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1h
bmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDljMjI1MjM0YTc1NmYyNzQ1Y2YwNGMzYzNhZjZlZjZiNmFjZjQyNzcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIGZkNWMyNDAxN2YyNWViODMxMTUwMmMwN2RiZjQ2ODI1NDdj
ZmQzMDIgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogRGF0ZTogTW9uLCAyMSBNYXIgMjAyMiAxMDowOTozOCAtMDcwMAogU3ViamVj
dDogW1BBVENIXSBEZWZpbmUgTUFQX1NZTkMgYW5kIE1BUF9TSEFSRURfVkFMSURBVEUgb24gbmVl
ZGVkIGxpbnV4CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1l
eHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKaW5kZXggMjhhMTBkOThiZC4uYjMwZjIwM2E0MiAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1s
b29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZy
b20tUEFUSC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWFkZjNmYzNlYTJjYmNjYjQxZDQ5
Njk1YTUzYzc0ZmVkNjg1MGZiMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYTk5YTgy
NWNlODU5M2QzYWMzNmJmNjQwYjI4YjVlOGIwYTU4MWUzYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKIEZyb206ID0/VVRGLTg/cT9NYXJ0aW49MjBIdW5kZWI9QzM9QjhsbD89IDxtYXJ0aW5AZ2Vh
bml4LmNvbT4KIERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTQ6MDI6NTUgKzAyMDAKIFN1YmplY3Q6
IFtQQVRDSF0gY29uZmlndXJlOiBsb29rdXAgbWVzb24gZXh1dGFibGUgZnJvbSBQQVRICkBAIC05
LDEwICs5LDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0ZSBbd29ya2Fyb3VuZCwg
d291bGQgbmVlZCBhIHJlYWwgZml4IGZvciB1cHN0cmVhbV0KICAxIGZpbGUgY2hhbmdlZCwgMSBp
bnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9j
b25maWd1cmUKLWluZGV4IDAyZjFkZDIzMS4uMmM1ZWNkMzQ2IDEwMDc1NQoraW5kZXggMjc0YTc3
ODc2Li44NGU0Mjk0MDkgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQot
QEAgLTk4MywxMiArOTgzLDcgQEAgbWt2ZW52PSIkcHl0aG9uICR7c291cmNlX3BhdGh9L3B5dGhv
bi9zY3JpcHRzL21rdmVudi5weSIKK0BAIC05OTUsMTIgKzk5NSw3IEBAIG1rdmVudj0iJHB5dGhv
biAke3NvdXJjZV9wYXRofS9weXRob24vc2NyaXB0cy9ta3ZlbnYucHkiCiAgJG1rdmVudiBlbnN1
cmVncm91cCAtLWRpciAiJHtzb3VyY2VfcGF0aH0vcHl0aG9uL3doZWVscyIgXAogICAgICAgJHtz
b3VyY2VfcGF0aH0vcHl0aG9uZGVwcy50b21sIG1lc29uIHx8IGV4aXQgMQogIApkaWZmIC0tZ2l0
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1h
bmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZl
bnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaAppbmRleCBiMDYwMjBkMTA2Li42MzA0NzI5NTE5IDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1
cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10
aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMGQ4NTk4ODQ1N2E0NzVjMjViODQwODVjZjA5MDA0MDE1MGE5YzE2ZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMDc3ZDgxNWNlZTBmZjQ4MWUyNzVmMzVjNjQwODczYjc4YTUyMDM0
NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
LnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAyMiBNYXkgMjAyNCAxMzo1
ODoyMyArMDIwMAogU3ViamVjdDogW1BBVENIXSBxZW11OiBFbnN1cmUgcGlwIGFuZCB0aGUgcHl0
aG9uIHZlbnYgYXJlbid0IHVzZWQgZm9yIG1lc29uCkBAIC0yOSwxMCArMjksMTAgQEAgU2lnbmVk
LW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5v
cmc+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKIAog
ZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQotaW5kZXggMmM1ZWNkMzQ2Li41MzE1
ZWRlMzUgMTAwNzU1CitpbmRleCA4NGU0Mjk0MDkuLjFhOTU4NWU4ZSAxMDA3NTUKIC0tLSBhL2Nv
bmZpZ3VyZQogKysrIGIvY29uZmlndXJlCi1AQCAtOTY5LDE0ICs5NjksMTQgQEAgcHl0aG9uPSIk
KGNvbW1hbmQgLXYgIiRweXRob24iKSIKK0BAIC05ODEsMTQgKzk4MSwxNCBAQCBweXRob249IiQo
Y29tbWFuZCAtdiAiJHB5dGhvbiIpIgogIGVjaG8gInB5dGhvbiBkZXRlcm1pbmVkIHRvIGJlICck
cHl0aG9uJyIKICBlY2hvICJweXRob24gdmVyc2lvbjogJCgkcHl0aG9uIC0tdmVyc2lvbikiCiAg
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTItUmVtb3Zl
LWRlcHJlY2F0ZWQtZ2V0X2V2ZW50X2xvb3AtY2FsbHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMTItUmVtb3ZlLWRlcHJlY2F0ZWQtZ2V0X2V2ZW50X2xvb3AtY2Fs
bHMucGF0Y2gKaW5kZXggNjQ4MTZmZTdkOS4uOWVhODUzMjk0YyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEyLVJlbW92ZS1kZXByZWNhdGVkLWdldF9ldmVu
dF9sb29wLWNhbGxzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAxMi1SZW1vdmUtZGVwcmVjYXRlZC1nZXRfZXZlbnRfbG9vcC1jYWxscy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNTI0MDQwNjc0N2ZkNDM4ODY2MThhZTgxOTQxNTNlNmZjOTU3YTgyYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTljZWIzMzdmY2M3ODgwOWM3MWYxZDU2MzE3
YmZlNGU2ZDEzNzc5NSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvaG4gU25vdyA8
anNub3dAcmVkaGF0LmNvbT4KIERhdGU6IFR1ZSwgMTMgQXVnIDIwMjQgMDk6MzU6MzAgLTA0MDAK
IFN1YmplY3Q6IFtQQVRDSF0gUmVtb3ZlIGRlcHJlY2F0ZWQgZ2V0X2V2ZW50X2xvb3AgY2FsbHMK
QEAgLTMzLDcgKzMzLDcgQEAgU2lnbmVkLW9mZi1ieTogSm9obiBTbm93IDxqc25vd0ByZWRoYXQu
Y29tPgogIDMgZmlsZXMgY2hhbmdlZCwgMTUgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL3B5dGhvbi9xZW11L3FtcC9sZWdhY3kucHkgYi9weXRob24vcWVtdS9x
bXAvbGVnYWN5LnB5Ci1pbmRleCAyMmEyYjU2Li5lYTliODAzIDEwMDY0NAoraW5kZXggMjJhMmI1
NjE2Li5lYTliODAzMmMgMTAwNjQ0CiAtLS0gYS9weXRob24vcWVtdS9xbXAvbGVnYWN5LnB5CiAr
KysgYi9weXRob24vcWVtdS9xbXAvbGVnYWN5LnB5CiBAQCAtODYsNyArODYsMTQgQEAgZGVmIF9f
aW5pdF9fKHNlbGYsCkBAIC01Myw3ICs1Myw3IEBAIGluZGV4IDIyYTJiNTYuLmVhOWI4MDMgMTAw
NjQ0CiAgICAgICAgICBzZWxmLl90aW1lb3V0OiBPcHRpb25hbFtmbG9hdF0gPSBOb25lCiAgCiBk
aWZmIC0tZ2l0IGEvcHl0aG9uL3FlbXUvcW1wL3FtcF90dWkucHkgYi9weXRob24vcWVtdS9xbXAv
cW1wX3R1aS5weQotaW5kZXggMmQ5ZWJiZC4uZDExYjlmYyAxMDA2NDQKK2luZGV4IDJkOWViYmQy
MC4uZDExYjlmYzU0IDEwMDY0NAogLS0tIGEvcHl0aG9uL3FlbXUvcW1wL3FtcF90dWkucHkKICsr
KyBiL3B5dGhvbi9xZW11L3FtcC9xbXBfdHVpLnB5CiBAQCAtMzc3LDcgKzM3NywxMiBAQCBkZWYg
cnVuKHNlbGYsIGRlYnVnOiBib29sID0gRmFsc2UpIC0+IE5vbmU6CkBAIC03MSw3ICs3MSw3IEBA
IGluZGV4IDJkOWViYmQuLmQxMWI5ZmMgMTAwNjQ0CiAgCiAgICAgICAgICAjIEdyYWNlZnVsbHkg
aGFuZGxlIFNJR1RFUk0gYW5kIFNJR0lOVCBzaWduYWxzCiBkaWZmIC0tZ2l0IGEvcHl0aG9uL3Rl
c3RzL3Byb3RvY29sLnB5IGIvcHl0aG9uL3Rlc3RzL3Byb3RvY29sLnB5Ci1pbmRleCA1NmM0ZDQ0
Li44ZGNlZjU3IDEwMDY0NAoraW5kZXggNTZjNGQ0NDFmLi44ZGNlZjU3M2IgMTAwNjQ0CiAtLS0g
YS9weXRob24vdGVzdHMvcHJvdG9jb2wucHkKICsrKyBiL3B5dGhvbi90ZXN0cy9wcm90b2NvbC5w
eQogQEAgLTIyOCw3ICsyMjgsNyBAQCBkZWYgYXN5bmNfdGVzdChhc3luY190ZXN0X21ldGhvZCk6
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJv
cm5hbWVfbnAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJl
cnJvcm5hbWVfbnAucGF0Y2gKaW5kZXggMWNjOTczNDQzZS4uM2QxODNiZmYyOCAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFt
ZV9ucC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2UwOTY1NGZhMTc5YWQ1ZmFiMWRjMGE0
Nzg4NmM2YTFhMmFjYzA5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gYjg0MWFkNTMy
NDhkYWQ2ZDQ4ZmFhMTQ0ZDlhYjU4YTU0MjdmZjkyMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IE5hdGFuYWVsIENvcGEgPG5jb3BhQGFscGluZWxpbnV4Lm9yZz4KIERhdGU6IFdlZCwg
MTggU2VwIDIwMjQgMTY6MTk6MzcgLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gdGFyZ2V0L3Jpc2N2
L2t2bTogZG8gbm90IHVzZSBub24tcG9ydGFibGUgc3RyZXJyb3JuYW1lX25wKCkKQEAgLTIwLDEw
ICsyMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBOYXRhbmFlbCBDb3BhIDxuY29wYUBhbHBpbmVsaW51
eC5vcmc+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAyIGRlbGV0aW9ucygtKQog
CiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMgYi90YXJnZXQvcmlzY3Yv
a3ZtL2t2bS1jcHUuYwotaW5kZXggODAwMWNhMTUzLi43OWZiNDNmOTIgMTAwNjQ0CitpbmRleCA1
YzE5MDYyYzEuLjU5YjRiZjE2YSAxMDA2NDQKIC0tLSBhL3RhcmdldC9yaXNjdi9rdm0va3ZtLWNw
dS5jCiArKysgYi90YXJnZXQvcmlzY3Yva3ZtL2t2bS1jcHUuYwotQEAgLTE5NjgsOCArMTk2OCw3
IEBAIHN0YXRpYyBib29sIGt2bV9jcHVfcmVhbGl6ZShDUFVTdGF0ZSAqY3MsIEVycm9yICoqZXJy
cCkKK0BAIC0xOTkzLDggKzE5OTMsNyBAQCBzdGF0aWMgYm9vbCBrdm1fY3B1X3JlYWxpemUoQ1BV
U3RhdGUgKmNzLCBFcnJvciAqKmVycnApCiAgICAgIGlmIChyaXNjdl9oYXNfZXh0KCZjcHUtPmVu
diwgUlZWKSkgewogICAgICAgICAgcmV0ID0gcHJjdGwoUFJfUklTQ1ZfVl9TRVRfQ09OVFJPTCwg
UFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9PTik7CiAgICAgICAgICBpZiAocmV0KSB7CmRpZmYgLS1n
aXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjAuMi5iYiBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMTAuMS4wLmJiCnNpbWlsYXJpdHkgaW5kZXggNDElCnJl
bmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMTAuMC4yLmJiCnJlbmFt
ZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjEuMC5iYgppbmRleCA1ZDU0
NGQ4ZDEzLi43MmUwNjEyNmJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11XzEwLjAuMi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEw
LjEuMC5iYgpAQCAtMSwzICsxLDQ2IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2
YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xs
b3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vu
c2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFu
ZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGlj
ZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdo
dCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORwor
IyArKysgQ09QWUlORworIyBAQCAtMiw3ICsyLDcgQEAKKyMgIAkJICAgICAgIFZlcnNpb24gMiwg
SnVuZSAxOTkxCisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3Is
IEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgKyA8aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBF
dmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3Bp
ZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3Qg
YWxsb3dlZC4KKyMgIAorIyBAQCAtMzA0LDggKzMwNCw3IEBACisjICAgICAgR05VIEdlbmVyYWwg
UHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAgICAgIFlvdSBzaG91bGQg
aGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFs
b25nCisjIC0gICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSAgICA1MSBGcmFua2xpbiBTdHJlZXQsIEZp
ZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyArICAgIHdpdGggdGhpcyBw
cm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyAg
CisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ry
b25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyAtLS0gQ09QWUlORy5MSUIKKyMgKysrIENPUFlJ
TkcuTElCCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgICAgICAgICAgICAgICAgICAgICAgICBWZXJz
aW9uIDIuMSwgRmVicnVhcnkgMTk5OQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAxOTkxLCAxOTk5
IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwg
RmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEgIFVTQQorIyArIDxodHRwczovL2Zz
Zi5vcmcvPgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRl
IHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5n
aW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIAorIworCiBCQkNMQVNTRVhURU5EID0gIm5h
dGl2ZXNkayIKIAogcmVxdWlyZSBxZW11LmluYwotLSAKMi40Ny4xCgo=

--===============8989500631608036186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/qemu: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-10.0.2.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.1.0.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-ad
 dition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/x86-64-v3-poky-linux/qemu: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/petalogix-ml605.dtb /usr/share/qemu/canyonlands.dtb /usr/share/qemu/bamboo.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb", added "/usr/share/qemu/dtb/petalogix-s3adsp1800.dtb /usr/share/qemu/dtb/petalogix-ml605.dtb /usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/dtb/bamboo.dtb /usr/share/qemu/ast27x0_bootrom.bin"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGSIZE changed from 341237291 to 340789657 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: FILELIST: added "/usr/lib/qemu/ptest/tests/tcg/plugins/.debug/libpatch.so /usr/lib/qemu/ptest/tests/qtest/.debug/aspeed_scu-test /usr/lib/qemu/ptest/tests/qtest/.debug/ast2700-hace-test"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1865076424 to 1870451432 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGSIZE changed from 885233 to 881537 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py", added "/usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SR
 AT /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp
  /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 185304402 to 181840300 (-2%)
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-src: FILELIST: directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/audio -> /usr/src/debug/qemu/10.1.0/audio, directory renamed /usr/src/debug/qemu/10.0.2/include/tcg -> /usr/src/debug/qemu/10.1.0/include/tcg, directory renamed /usr/src/debug/qemu/10.0.2/libcommon.a.p -> /usr/src/debug/qemu/10.1.0/libcommon.a.p, directory renamed /usr/src/debug/qemu/10.0.2/host/include/i386/host/crypto -> /usr/src/debug/qemu/10.1.0/host/include/i386/host/crypto, directory renamed /usr/src/debug/qemu/10.0.2/target/mips -> /usr/src/debug/qemu/10.1.0/target/mips, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-i386-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-i386-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/firmware -> /usr/src/debug/qemu/10.1.0/include/hw/firmware, directory renamed /usr/src/debug/qemu/10.
 0.2/libqemu-mips-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/acpi -> /usr/src/debug/qemu/10.1.0/include/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/misc/macio -> /usr/src/debug/qemu/10.1.0/include/hw/misc/macio, directory renamed /usr/src/debug/qemu/10.0.2/hw/loongarch -> /usr/src/debug/qemu/10.1.0/hw/loongarch, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/virtio -> /usr/src/debug/qemu/10.1.0/include/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface/arch-x86 -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/arch-x86, directory renamed /usr/src/debug/qemu/10.0.2/hw/net -> /usr/src/debug/qemu/10.1.0/hw/net, directory renamed /usr/src/debug/qemu/10.0.2/monitor -> /usr/src/debug/qemu/10.1.0/monitor, directory renamed /usr/src/debug/qemu/10.0.2/hw/arm -> /usr/src/debug/qemu/10.1.0/hw/arm, directory renamed /usr/src/debug/qemu/10.0.2/cry
 pto -> /usr/src/debug/qemu/10.1.0/crypto, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv32-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv32-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/disas -> /usr/src/debug/qemu/10.1.0/disas, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-loongarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-loongarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/hw/pci-host -> /usr/src/debug/qemu/10.1.0/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.2/hw/usb -> /usr/src/debug/qemu/10.1.0/hw/usb, directory renamed /usr/src/debug/qemu/10.0.2/net -> /usr/src/debug/qemu/10.1.0/net, directory renamed /usr/src/debug/qemu/10.0.2/host/include/i386/host -> /usr/src/debug/qemu/10.1.0/host/include/i386/host, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/watchdog -> /usr/src/debug/qemu/10.1.0/include/hw/watchdog, directory renamed /usr/src/debug/qemu/10.0.2/include/standard-headers/asm-x86
  -> /usr/src/debug/qemu/10.1.0/include/standard-headers/asm-x86, directory renamed /usr/src/debug/qemu/10.0.2/include -> /usr/src/debug/qemu/10.1.0/include, directory renamed /usr/src/debug/qemu/10.0.2/include/semihosting -> /usr/src/debug/qemu/10.1.0/include/semihosting, directory renamed /usr/src/debug/qemu/10.0.2/include/ui -> /usr/src/debug/qemu/10.1.0/include/ui, directory renamed /usr/src/debug/qemu/10.0.2 -> /usr/src/debug/qemu/10.1.0, directory renamed /usr/src/debug/qemu/10.0.2/include/migration -> /usr/src/debug/qemu/10.1.0/include/migration, directory renamed /usr/src/debug/qemu/10.0.2/target/ppc -> /usr/src/debug/qemu/10.1.0/target/ppc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/gpio -> /usr/src/debug/qemu/10.1.0/include/hw/gpio, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/hyperv -> /usr/src/debug/qemu/10.1.0/include/h
 w/hyperv, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci-bridge -> /usr/src/debug/qemu/10.1.0/include/hw/pci-bridge, directory renamed /usr/src/debug/qemu/10.0.2/target/i386 -> /usr/src/debug/qemu/10.1.0/target/i386, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/uefi -> /usr/src/debug/qemu/10.1.0/include/hw/uefi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/mem -> /usr/src/debug/qemu/10.1.0/include/hw/mem, directory renamed /usr/src/debug/qemu/10.0.2/host/include/x86_64/host -> /usr/src/debug/qemu/10.1.0/host/include/x86_64/host, directory renamed /usr/src/debug/qemu/10.0.2/include/authz -> /usr/src/debug/qemu/10.1.0/include/authz, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/display -> /usr/src/debug/qemu/10.1.0/include/hw/display, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ssi -> /usr/src/debug/qemu/10.1.0/include/hw/ssi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/sd -> /usr/src/debug/qemu/10.1.0/include/hw/sd,
  directory renamed /usr/src/debug/qemu/10.0.2/hw/intc -> /usr/src/debug/qemu/10.1.0/hw/intc, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64le-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64le-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/tests -> /usr/src/debug/qemu/10.1.0/tests, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/block -> /usr/src/debug/qemu/10.1.0/include/hw/block, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci-host -> /usr/src/debug/qemu/10.1.0/include/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mipsel-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mipsel-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/ui/shader -> /usr/src/debug/qemu/10.1.0/ui/shader, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-arm-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-arm-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/hw/i386/kvm -> /usr/src/debug/qemu/10.1.0/hw/
 i386/kvm, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/linux-user -> /usr/src/debug/qemu/10.1.0/linux-user, directory renamed /usr/src/debug/qemu/10.0.2/hw/block/dataplane -> /usr/src/debug/qemu/10.1.0/hw/block/dataplane, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/audio -> /usr/src/debug/qemu/10.1.0/include/hw/audio, directory renamed /usr/src/debug/qemu/10.0.2/util -> /usr/src/debug/qemu/10.1.0/util, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface/io -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/io, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-
 x86_64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-x86_64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/intc -> /usr/src/debug/qemu/10.1.0/include/hw/intc, directory renamed /usr/src/debug/qemu/10.0.2/storage-daemon/qapi -> /usr/src/debug/qemu/10.1.0/storage-daemon/qapi, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/monitor -> /usr/src/debug/qemu/10.1.0/include/monitor, directory renamed /usr/src/debug/qemu/10.0.2/hw/net/fsl_etsec -> /usr/src/debug/qemu/10.1.0/hw/net/fsl_etsec, directory renamed /usr/src/debug/qemu/10.0.2/include/libdecnumber/dpd -> /usr/src/debug/qemu/10.1.0/include/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/10.0.2/subprojects/libvduse -> /usr/src/debug/qemu/10.1.0/subprojects/libvduse, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/loongarch -> /usr/src/debug/qemu/10.1.
 0/include/hw/loongarch, directory renamed /usr/src/debug/qemu/10.0.2/qga -> /usr/src/debug/qemu/10.1.0/qga, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/sh4 -> /usr/src/debug/qemu/10.1.0/include/hw/sh4, directory renamed /usr/src/debug/qemu/10.0.2/include/user -> /usr/src/debug/qemu/10.1.0/include/user, directory renamed /usr/src/debug/qemu/10.0.2/include/net -> /usr/src/debug/qemu/10.1.0/include/net, directory renamed /usr/src/debug/qemu/10.0.2/ui -> /usr/src/debug/qemu/10.1.0/ui, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-loongarch64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-loongarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface/hvm -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/hvm, directory renamed /usr/src/debug/qemu/10.0.2/include/gdbstub -> /usr/src/debug/qemu/10.1.0/include/gdbstub, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-aarch64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqe
 mu-aarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/libdecnumber -> /usr/src/debug/qemu/10.1.0/include/libdecnumber, directory renamed /usr/src/debug/qemu/10.0.2/include/hw -> /usr/src/debug/qemu/10.1.0/include/hw, directory renamed /usr/src/debug/qemu/10.0.2/block -> /usr/src/debug/qemu/10.1.0/block, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ipack -> /usr/src/debug/qemu/10.1.0/include/hw/ipack, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/southbridge -> /usr/src/debug/qemu/10.1.0/include/hw/southbridge, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ide -> /usr/src/debug/qemu/10.1.0/include/hw/ide, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/dma -> /usr/src/debug/qemu/10.1.0/include/hw/dma, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv32-softmmu.a.p -> /usr/src
 /debug/qemu/10.1.0/libqemu-riscv32-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/rtc -> /usr/src/debug/qemu/10.1.0/include/hw/rtc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/usb -> /usr/src/debug/qemu/10.1.0/include/hw/usb, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/isa -> /usr/src/debug/qemu/10.1.0/include/hw/isa, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ppc -> /usr/src/debug/qemu/10.1.0/include/hw/ppc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen -> /usr/src/debug/qemu/10.1.0/include/hw/xen, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/adc -> /usr/src/debug/qemu/10.1.0/include/hw/adc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/i2c -> /usr/src/debug/qemu/10.1.0/include/hw/i2c, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/cxl -> /usr/src/debug/qemu/10.1.0/include/hw/cxl, directory renamed /usr/src/debug/qemu/10.0.2/include/crypto -> /usr/src/debug/qemu/10.1.0/include/cry
 pto, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/fsi -> /usr/src/debug/qemu/10.1.0/include/hw/fsi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci -> /usr/src/debug/qemu/10.1.0/include/hw/pci, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/cpu -> /usr/src/debug/qemu/10.1.0/include/hw/cpu, directory renamed /usr/src/debug/qemu/10.0.2/contrib/ivshmem-server -> /usr/src/debug/qemu/10.1.0/contrib/ivshmem-server, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/net -> /usr/src/debug/qemu/10.1.0/include/hw/net, directory renamed /usr/src/debug/qemu/10.0.2/accel/tcg -> /usr/src/debug/qemu/10.1.0/accel/tcg, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/timer -> /usr/src/debug/qemu/10.1.0/include/hw/timer, directory renamed /usr/src/debug/qemu/10.0.2/linux-headers/linux -> /usr/src/debug/qemu/10.1.0/linux-headers/linux, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/nvram -> /usr/src/debug/qemu/10.1.0/include/hw/nvram, directory rena
 med /usr/src/debug/qemu/10.0.2/migration -> /usr/src/debug/qemu/10.1.0/migration, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ipmi -> /usr/src/debug/qemu/10.1.0/include/hw/ipmi, directory renamed /usr/src/debug/qemu/10.0.2/hw/acpi -> /usr/src/debug/qemu/10.1.0/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.2/include/chardev -> /usr/src/debug/qemu/10.1.0/include/chardev, directory renamed /usr/src/debug/qemu/10.0.2/ebpf -> /usr/src/debug/qemu/10.1.0/ebpf, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/core -> /usr/src/debug/qemu/10.1.0/include/hw/core, directory renamed /usr/src/debug/qemu/10.0.2/include/io -> /usr/src/debug/qemu/10.1.0/include/io, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64el-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64el-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/input -> /usr/src/debug/qemu/10.1.0/include/hw/input, directory renamed /usr/src/debug/qemu/10.0.2/hw/mips -> /usr/src/
 debug/qemu/10.1.0/hw/mips, directory renamed /usr/src/debug/qemu/10.0.2/include/fpu -> /usr/src/debug/qemu/10.1.0/include/fpu, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64el-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64el-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/scsi -> /usr/src/debug/qemu/10.1.0/include/scsi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-arm-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-arm-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/standard-headers/linux -> /usr/src/debug/qemu/10.1.0/include/standard-headers/linux, directory renamed /usr/src/debug/qemu/10.0.2/include/disas -> /usr/src/debug/qemu/10.1.0/include/disas, directory renamed 
 /usr/src/debug/qemu/10.0.2/include/hw/scsi -> /usr/src/debug/qemu/10.1.0/include/hw/scsi, directory renamed /usr/src/debug/qemu/10.0.2/backends/tpm -> /usr/src/debug/qemu/10.1.0/backends/tpm, directory renamed /usr/src/debug/qemu/10.0.2/target/loongarch -> /usr/src/debug/qemu/10.1.0/target/loongarch, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-aarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-aarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/host/include/generic/host -> /usr/src/debug/qemu/10.1.0/host/include/generic/host, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/linux-headers/asm -> /usr/src/debug/qemu/10.1.0/linux-headers/asm, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/remote -> /usr/src/debug/qemu/10.1.0/include/hw/remote, directory renamed /usr/src/debug/qemu/10.0.2/include/qobject -> /usr/src/debug/
 qemu/10.1.0/include/qobject, directory renamed /usr/src/debug/qemu/10.0.2/subprojects/libvhost-user -> /usr/src/debug/qemu/10.1.0/subprojects/libvhost-user, directory renamed /usr/src/debug/qemu/10.0.2/hw/block -> /usr/src/debug/qemu/10.1.0/hw/block, directory renamed /usr/src/debug/qemu/10.0.2/include/block -> /usr/src/debug/qemu/10.1.0/include/block, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/mips -> /usr/src/debug/qemu/10.1.0/include/hw/mips, directory renamed /usr/src/debug/qemu/10.0.2/tcg/i386 -> /usr/src/debug/qemu/10.1.0/tcg/i386, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/sensor -> /usr/src/debug/qemu/10.1.0/include/hw/sensor, directory renamed /usr/src/debug/qemu/10.0.2/include/qom -> /usr/src/debug/qemu/10.1.0/include/qom, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mipsel-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mipsel-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/hw/virtio -> /usr/src/debug/qemu/10.1.0/hw/virtio, di
 rectory renamed /usr/src/debug/qemu/10.0.2/hw/riscv -> /usr/src/debug/qemu/10.1.0/hw/riscv, removed "/usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.0.2/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.0.2/include/qemu/host-utils.h /usr/src/debug/qemu/10.0.2/include/system/accel-blocker.h /usr/src/debug/qemu/10.0.2/include/exec/plugin-gen.h /usr/src/debug/qemu/10.0.2/include/qemu/main-loop.h /usr/src/debug/qemu/10.0.2/include/qemu/bswap.h /usr/src/debug/qemu/10.0.2/include/qemu/datadir.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.0.2/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-net.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/
 10.0.2/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.0.2/include/qemu/hw-version.h /usr/src/debug/qemu/10.0.2/include/system/dump-arch.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-net.c /usr/src/debug/qemu/10.0.2/include/qemu/lockcnt.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.0.2/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.0.2/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ide.h /usr/src/debug/qemu/10.0.2/include/qemu/async-teardown.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.0.2/include/hw/arm/omap.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ide.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_target_trace_events.h /usr/s
 rc/debug/qemu/10.0.2/trace/trace-authz.h /usr/src/debug/qemu/10.0.2/target/arm/internals.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.0.2/trace/trace-authz.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_target_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.0.2/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-target_arm.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_usb.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-target_arm.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_usb.h /usr/src/debug/q
 emu/10.0.2/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.0.2/target/riscv/cpu.h /usr/src/debug/qemu/10.0.2/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.0.2/trace/trace-root.c /usr/src/debug/qemu/10.0.2/include/qemu/osdep.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.0.2/include/system/tpm_backend.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.0.2/trace/trace-root.h /usr/src/debug/qemu/10.0.2/include/qemu/bcd.h /usr/src/debug/qemu/10.0.2/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.0.2/include/qemu/bitmap.h /usr/src/debug/qemu/10.0.2/include/qemu/cpu-float.h /usr/src/debug/qemu/10.0.2/include/system/host_iommu_device.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-common.h /usr/src/debug/qemu/10.0.2/include/hw/misc/vmcoreinfo.h /usr/src/debug
 /qemu/10.0.2/include/qemu/buffer.h /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.0.2/include/qemu/systemd.h /usr/src/debug/qemu/10.0.2/include/exec/exec-all.h /usr/src/debug/qemu/10.0.2/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.0.2/include/exec/ioport.h /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.0.2/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.0.2/include/qapi/qmp-event.h /usr/src/debug/qemu/10.0.2/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.0.2/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.0.2/include/qemu/iova-tree.h /usr/src/debug/qemu/10.0.2/include/qemu/mprotect.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types.c /us
 r/src/debug/qemu/10.0.2/include/qemu/bitops.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.0.2/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.0.2/include/exec/tlb-common.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.0.2/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.0.2/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.0.2/include/qemu/crc32c.h /usr/src/debug/qemu/10.0.2/include/exec/cpu-common.h /usr/src/debug/qemu/10.0.2/trace/trace-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.0.2/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.0.2/trace/trace-target_riscv.h /usr/src/debug/qemu/10.0.2/trace/trace-block.c /usr/src/debug/qemu/10.0.2/trace/trace-target_riscv.c /usr/src/debug/qemu/10.0.2/include/hw/
 arm/msf2-soc.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/spike.h /usr/src/debug/qemu/10.0.2/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.0.2/trace/trace-target_ppc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.0.2/trace/trace-target_ppc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events.c /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.0.2/target/arm/cpu-qom.h /usr/src/debug/qemu/10.0.2/include/qemu/fifo32.h /usr/src/debug/qemu/10.0.2/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.0.2/include/system/kvm.h /usr/src/debug/qemu/10.0.2/include/system/watchdog.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.0.2/include/qapi/type-helpers.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.0.2/include/hw/i386/x86.h /usr
 /src/debug/qemu/10.0.2/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.0.2/include/qemu/base64.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.0.2/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.0.2/include/qemu/xxhash.h /usr/src/debug/qemu/10.0.2/include/system/block-backend-io.h /usr/src/debug/qemu/10.0.2/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.0.2/include/exec/cpu_ldst.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-misc-target.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_vfio.h
  /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.0.2/include/system/rng.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.0.2/include/hw/i386/topology.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.0.2/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.0.2/trace/trace-net.h /usr/src/debug/qemu/10.0.2/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.0.2/trace/trace-linux_user.h /usr/src/debug/qemu/10.0.2/trace/trace-net.c /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.0.2/trace/trace-linux_user.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.trace-events /us
 r/src/debug/qemu/10.0.2/include/qemu/int128.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.0.2/include/exec/tb-flush.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.0.2/trace/trace-backends.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-backends.c /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.0.2/include/qemu/cacheflush.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc-target.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.c /usr/src
 /debug/qemu/10.0.2/include/qemu/event_notifier.h /usr/src/debug/qemu/10.0.2/trace/trace-util.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.0.2/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armsse.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.0.2/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.0.2/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.0.2/include/system/replay.h /usr/src/debug/qemu/10.0.2/include/system/system.h /usr/src/debug/qemu/10.0.2/trace/trace-util.c /usr/src/debug/qemu/10.0.2/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.0.2/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.0.2/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-acp
 i.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-char.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block.c /usr/src/debug/qemu/10.0.2/include/system/hostmem.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.0.2/include/hw/misc/led.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-target.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.0.2/include/qemu/guest-random.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.0.2/include/exec/log.h /usr/src/debug/qemu/10.0.2/include/qemu/log.h /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.0.2/include/hw/char/serial-isa.h /usr/src/deb
 ug/qemu/10.0.2/qapi/qapi-visit-machine-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-char.c /usr/src/debug/qemu/10.0.2/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.0.2/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.0.2/include/system/cpu-timers.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit.c /usr/src/debug/qemu/10.0.2/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.0.2/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.0.2/include/exec/translator.h /usr/src/debug/qemu/10.0.2/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.0
 .2/include/qemu/help_option.h /usr/src/debug/qemu/10.0.2/include/exec/vaddr.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.0.2/include/system/tpm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.0.2/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-typ
 es-tpm.h /usr/src/debug/qemu/10.0.2/include/system/dump.h /usr/src/debug/qemu/10.0.2/include/qemu/id.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.0.2/trace/trace-monitor.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.0.2/trace/trace-monitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.0.2/include/qemu/timed-average.h /usr/src/debug/qemu/10.0.2/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_arm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_arm.c /usr/src/debug/qemu/10.0.2/include/hw/misc/al
 lwinner-a10-ccm.h /usr/src/debug/qemu/10.0.2/include/qemu/qdist.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.0.2/include/system/accel-ops.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.0.2/include/qapi/error.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.0.2/include/exec/ram_addr.h /usr/src/debug/qemu/10.0.2/include/exec/ramblock.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.0.2/trace/trace-audio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect
 .trace-events /usr/src/debug/qemu/10.0.2/include/hw/arm/digic.h /usr/src/debug/qemu/10.0.2/include/system/qtest.h /usr/src/debug/qemu/10.0.2/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.0.2/include/system/reset.h /usr/src/debug/qemu/10.0.2/include/system/stats.h /usr/src/debug/qemu/10.0.2/trace/trace-audio.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/breakpoint.h /usr/src/debug/qemu/10.0.2/include/qemu/typedefs.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.0.2/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.0.2/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.0.2/include/hw
 /misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.0.2/include/qemu/cpuid.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.0.2/include/qemu/filemonitor.h /usr/src/debug/qemu/10.0.2/include/qemu/keyval.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.0.2/trace/tr
 ace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.0.2/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.0.2/include/system/dirtylimit.h /usr/src/debug/qemu/10.0.2/include/exec/translation-block.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_display.c /usr/src/debug/qemu/10.0.2/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.0.2/include/qemu/module.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_display.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_target_trace_events.c /usr/src/debug/qemu/10.0.2/include/qemu/iov.h /usr/src/debug/qemu/10.0.2/trace/trace-scsi.c /usr/src/de
 bug/qemu/10.0.2/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.0.2/include/qemu/qsp.h /usr/src/debug/qemu/10.0.2/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_target_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-scsi.h /usr/src/debug/qemu/10.0.2/include/hw/arm/virt.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.0.2/hw/ppc/e500-ccsr.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.0.2/include/qemu/qht.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.0.2/include/qemu/notify.h /usr/src/debug/qemu/10.0.2/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_ui_trace_events.h /usr
 /src/debug/qemu/10.0.2/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_xen.h /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.0.2/include/exec/hwaddr.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.0.2/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_xen.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.0.2/include/qemu/timer.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.0.2/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-migration.h /us
 r/src/debug/qemu/10.0.2/include/exec/memory.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.0.2/include/exec/cputlb.h /usr/src/debug/qemu/10.0.2/include/system/runstate.h /usr/src/debug/qemu/10.0.2/include/qemu/pmem.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc-target.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-job.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_sd.h /usr/src/debug/qemu/10.0.2/include/qemu/transactions.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-job.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sd.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_acpi_trace_e
 vents.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.0.2/include/exec/target_long.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.0.2/include/system/dirtyrate.h /usr/src/debug/qemu/10.0.2/include/qemu/envlist.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/10.0.2/include/exec/address-spaces.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.trace-events /u
 sr/src/debug/qemu/10.0.2/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.0.2/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.0.2/include/qemu/throttle.h /usr/src/debug/qemu/10.0.2/target/riscv/pmp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-cpucfg.h /usr/
 src/debug/qemu/10.0.2/include/system/arch_init.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.0.2/trace/control-internal.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.0.2/include/system/tcg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-features.h /usr/src/debug/qemu/10.0.2/include/exec/memattrs.h /usr/src/debug/qemu/10.0.2/include/exec/memopidx.h /usr/src/debug/qemu/10.0.2/include/qemu/memalign.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-core.h /us
 r/src/debug/qemu/10.0.2/include/exec/replay-core.h /usr/src/debug/qemu/10.0.2/qapi/qapi-emit-events.c /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.0.2/include/exec/page-vary.h /usr/src/debug/qemu/10.0.2/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.0.2/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.0.2/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.0.2/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.0.2/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.0.2/include/qemu/progress_meter.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.0.2/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.0.2/qap
 i/qapi-events-char.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.0.2/include/hw/i386/apic_internal.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.0.2/include/hw/i386/microvm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.0.2/include/hw/char/serial.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_com
 mands_introspect_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.0.2/include/system/device_tree.h /usr/src/debug/qemu/10.0.2/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.0.2/trace/trace-chardev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.0.2/qapi/qapi-introspect.h /usr/src/debug/qemu/10.0.2/trace/trace-chardev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-introspect.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.0.2/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.0.2/include/system/rtc.h /usr/src/debug/qemu/10.0.2/include/qemu/defer-call.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_audio.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_block.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_input.h /usr/src/debug/qemu/10.0.2/include/e
 xec/target_page.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_audio.c /usr/src/debug/qemu/10.0.2/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_block.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_input.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_timer.c /usr/src/debug/qemu/10.0.2/include/system/hw_accel.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.0.2/target/arm/multiprocessing.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_intc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_intc.c /usr/src/debug/qemu/10.0.2/include/qemu/yank.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.0.2/include/
 system/rng-random.h /usr/src/debug/qemu/10.0.2/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.0.2/include/system/spdm-socket.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.0.2/include/qemu/madvise.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-hw_char.h /usr/src/debug/qemu/10.0.2/include/qemu/queue.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_char.c /usr/src/debug/qemu/10.0.2/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.0.2/include/qemu/selfmap.h /usr/src/debug/q
 emu/10.0.2/include/qemu/seqlock.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_core.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_core.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.0.2/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.0.2/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.c /usr/src/d
 ebug/qemu/10.0.2/include/qemu/option.h /usr/src/debug/qemu/10.0.2/include/qapi/compat-policy.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.0.2/include/hw/i386/vmport.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc-target.h /usr/src/debug/qemu/10.0.2/include/exec/gdbstub.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc-target.c /usr/src/debug/qemu/10.0.2/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.0.2/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.0.2/include/hw/misc/a9scu.h /usr/src/debug
 /qemu/10.0.2/include/hw/misc/unimp.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/boot.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/numa.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/virt.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.0.2/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.0.2/include/system/numa.h /usr/src/debug/qemu/10.0.2/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.0.2/target/arm/idau.h /usr/src/debug/qemu/10.0.2/include/qemu/path.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.0.2/include/system/block-backend-common.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.0.2/trace/control.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.0.2/include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.0.2/in
 clude/system/tpm_util.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-control.c /usr/src/debug/qemu/10.0.2/include/system/os-posix.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.0.2/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-control.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/lockable.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.0.2/include/system/blockdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.0.2/include/qemu/qtree.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cxl.
 trace-events /usr/src/debug/qemu/10.0.2/include/system/cryptodev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc-target.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.0.2/include/system/cpu-throttle.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.0.2/include/qemu/config-file.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.0.2/include/system/cpus.h /usr/src/debug/qemu/10.0.2/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.0.2/include/qemu/dbus.h /usr/src/debug/qemu/10.0.2/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.0.2/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.0.2/include/qemu/chardev_open.h /usr/src/debug/qemu/10
 .0.2/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_timer.h /usr/src/debug/qemu/10.0.2/hw/vfio/pci.h /usr/src/debug/qemu/10.0.2/target/arm/cpu.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net.c /usr/src/debug/qemu/10.0.2/include/hw/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.0.2/include/system/xen.h /usr/src/debug/qemu/10.0.2/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.0.2/include/qemu/futex.h /usr/src/debug/qemu/10.0.2/include/qemu/ratelimit.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit
 -job.h /usr/src/debug/qemu/10.0.2/include/hw/char/parallel.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/plugin.h /usr/src/debug/qemu/10.0.2/include/qemu/cutils.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.0.2/include/system/event-loop-base.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-common.c /usr/src/debug/qemu/10.0.2/include/qemu/fifo8.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.0.2/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.0.2/include/qemu/atomic.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_control_trace_events.h 
 /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.0.2/include/qemu/range.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.0.2/hw/i386/acpi-build.h /usr/src/debug/qemu/10.0.2/trace/trace-system.c /usr/src/debug/qemu/10.0.2/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-system.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.0.2/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armsse-version.h /usr/src
 /debug/qemu/10.0.2/trace/trace-nbd.h /usr/src/debug/qemu/10.0.2/trace/trace-nbd.c /usr/src/debug/qemu/10.0.2/include/system/seccomp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.0.2/include/qemu/reserved-region.h /usr/src/debug/qemu/10.0.2/include/qemu/hbitmap.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.0.2/target/arm/cpregs.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.0.2/target/arm/cpu-features.h /usr/src/debug/qemu/10.0.2/include/system/balloon.h /usr/src/debug/qemu/10.0.2/include/system/kvm_xen.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-job.h /usr/src/
 debug/qemu/10.0.2/qapi/qapi-events-net.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-job.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-net.c /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.0.2/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.0.2/trace/event-internal.h /usr/src/debug/qemu/10.0.2/include/exec/abi_ptr.h /usr/src/debug/qemu/10.0.2/include/hw/char/escc.h /usr/src/debug/qemu/10.0.2/include/qemu/memfd.h /usr/src/debug/qemu/10.0.2/trace/trace-target_i386.h /usr/src/debug/qemu/10.0.2/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.0.2/include/exec/ramlist.h /usr/src/debug/qemu/10.0.2/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.0.2/include/qemu/accel.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_adc.c /usr/src/debug/qemu/10.0.2
 /trace/trace-target_i386.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_adc.h /usr/src/debug/qemu/10.0.2/include/qemu/readline.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.0.2/include/qemu/plugin-event.h /usr/src/debug/qemu/10.0.2/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit
 -dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.0.2/include/qemu/uuid.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.0.2/trace/trace-ui.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.0.2/trace/trace-ui.c /usr/src/debug/qemu/10.0.
 2/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-error.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.0.2/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.0.2/include/qemu/sockets.h /usr/src/debug/qemu/10.0.2/include/qemu/qemu-print.h /usr/src/debug/qemu/10.0.2/include/system/dma.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/error-report.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.0.2/qapi/qapi
 -types-authz.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-error.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-target.h /usr/src/debug/qemu/10.0.2/include/system/iothread.h /usr/src/debug/qemu/10.0.2/include/hw/i386/apic.h /usr/src/debug/qemu/10.0.2/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine-target.c /usr/src/debug/qemu/10.0.2/target/arm/syndrome.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_tpm_trace_events.c /usr/s
 rc/debug/qemu/10.0.2/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.0.2/include/qemu/rcu.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.0.2/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.0.2/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.0.2/include/qemu/thread-posix.h /usr/src/
 debug/qemu/10.0.2/include/qemu/drm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.0.2/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.0.2/include/exec/memory-internal.h /usr/src/debug/qemu/10.0.2/include/system/kvm_int.h /usr/src/debug/qemu/10.0.2/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/job.h /usr/src/debug/qemu/10.0.2/target/riscv/pmu.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.0.2/include/qemu/coroutine_int.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-ccu.h /usr/src/debu
 g/qemu/10.0.2/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.0.2/include/system/runstate-action.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.0.2/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.0.2/include/hw/char/pl011.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci.c /usr/src/debug/qemu/10.0.2/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.0.2/include/system/iommufd.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.0.2/trace/trace-gdbstub.c /usr/src/debug/qemu/10.0.2/include/qemu/unicode.h /usr/src/debug/qemu/10.0.2/trace/trace-io.c /usr/src/debug/qemu/10.0.2/include/exec/page-protection.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.0.2/target/i386/kvm/kvm_i386.h /usr/sr
 c/debug/qemu/10.0.2/trace/trace-gdbstub.h /usr/src/debug/qemu/10.0.2/trace/trace-io.h /usr/src/debug/qemu/10.0.2/trace/trace-qom.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_dma.c /usr/src/debug/qemu/10.0.2/trace/trace-qom.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_dma.h /usr/src/debug/qemu/10.0.2/include/qemu/thread.h /usr/src/debug/qemu/10.0.2/include/system/memory_mapping.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.0.2/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.0.2/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.0.2/include/hw/arm/boot.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block.c /usr/src/debug/qemu/10.0.2/include/exec/tswap.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block.h /usr/src/debug/qemu/10.0.2/include/qapi/visitor.h /usr/src/debug/qemu/10.0.2/include/qemu/interval-tree.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.0.2/include/hw/i386/pc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_
 mem.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-migration.c /usr/src/debug/qemu/10.0.2/trace/trace-migration.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_mem.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.0.2/target/arm/gtimer.h /usr/src/debug/qemu/10.0.2/include/qapi/util.h /usr/src/debug/qemu/10.0.2/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.0.2/include/qemu/coroutine.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.0.2/include/exec/memop.h /usr/src/debug/qemu/10.0.2/include/qemu/stat
 s64.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.0.2/include/exec/cpu-all.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_remote.c /usr/src/debug/qemu/10.0.2/trace/t
 race-hw_isa.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_isa.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_remote.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.0.2/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.0.2/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_mips.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.0.2/include/qemu/thread-context.h /usr/src/debug/qemu/10.0.2/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_mips.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/
 arm/allwinner-a10.h /usr/src/debug/qemu/10.0.2/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.0.2/include/qemu/option_int.h", added "/usr/src/debug/qemu/10.1.0/include/exec/translator.h /usr/src/debug/qemu/10.1.0/trace/trace-system.c /usr/src/debug/qemu/10.1.0/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.1.0/include/qemu/help_option.h /usr/src/debug/qemu/10.1.0/trace/trace-system.h /usr/src/debug/qemu/10.1.0/include/system/stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.1.0/include/system/seccomp.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-tpm.h /u
 sr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.1.0/target/arm/cpregs.h /usr/src/debug/qemu/10.1.0/include/system/dump.h /usr/src/debug/qemu/10.1.0/include/qemu/hbitmap.h /usr/src/debug/qemu/10.1.0/include/qemu/id.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-i386.h /usr/src/debug/qemu/10.1.0/trace/trace-monitor.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.1.0/trace/trace-monitor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-i386.c /usr/src/debug/qemu/10.1.0/include/system/balloon.h /usr/src/debug/qemu/10.1.0/include/system/kvm_xen.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/proxy.h /usr/src/debug/qemu/10.1.0/include/qemu/timed-average.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/xiangshan_kmh.h /usr/src/debug/qemu
 /10.1.0/include/system/ram_addr.h /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.1.0/include/exec/abi_ptr.h /usr/src/debug/qemu/10.1.0/include/hw/char/escc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.1.0/include/qemu/memfd.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.1.0/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.1.0/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_adc.c /usr/src/debug/qemu/10.1.0/include/qemu/accel.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ad
 c.h /usr/src/debug/qemu/10.1.0/include/qemu/readline.h /usr/src/debug/qemu/10.1.0/trace/trace-audio.h /usr/src/debug/qemu/10.1.0/include/qemu/plugin-event.h /usr/src/debug/qemu/10.1.0/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_aes.h /usr/src/debug/qemu/10.1.0/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_gcr.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_icc.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.1.0/trace/trace-audio.c /usr/src/debug/qemu/10.1.0/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.1.0/include/system/address-spaces.h /usr/src/debug/qemu/10.1.0/include/system/hvf.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.1.0/include/qapi/error-internal.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.h /usr/s
 rc/debug/qemu/10.1.0/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.1.0/include/exec/breakpoint.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.1.0/trace/trace-ui.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-char.c /usr/src/debug/qemu/10.1.0/include/system/kvm_int.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-yank.c /usr/src/debug/qe
 mu/10.1.0/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-accelerator.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.1.0/include/qemu/filemonitor.h /usr/src/debug/qemu/10.1.0/include/qemu/keyval.h /usr/src/debug/qemu/10.1.0/include/qemu/qemu-print.h /usr/src/debug/qemu/10.1.0/include/hw/s390x/storage-keys.h /usr/src/debug/qemu/10.1.0/include/qemu/sockets.h /usr/src/debug/qemu/10.1.0/include/system/dma.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-accelerator.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.h /usr/src/debug/qemu/10.1.0/include/hw/i386
 /apic.h /usr/src/debug/qemu/10.1.0/include/hw/i386/tdvf.h /usr/src/debug/qemu/10.1.0/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.c /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.1.0/include/system/dirtylimit.h /usr/src/debug/qemu/10.1.0/target/arm/syndrome.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/rcu.h /usr/src/debug/qemu/10.1.0/include/qemu/module.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.1.0/include/system/confid
 ential-guest-support.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.1.0/include/qemu/thread-posix.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.1.0/include/hw/arm/virt.h /usr/src/debug/qemu/10.1.0/include/qemu/drm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-i386.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.1.0/include/qemu/job.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-i386.c /usr/src/debug/qemu/10.1.0/includ
 e/qemu/coroutine_int.h /usr/src/debug/qemu/10.1.0/include/qemu/notify.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/helper-retaddr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.1.0/include/exec/hwaddr.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.1.0/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.1.0/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_fsi.h /usr/src/debug/qemu/
 10.1.0/trace/trace-hw_pci.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-accelerator.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.1.0/include/system/iommufd.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-accelerator.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.1.0/include/exec/cputlb.h /usr/src/debug/qemu/10.1.0/include/qemu/unicode.h /usr/src/debug/qemu/10.1.0/trace/trace-io.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.1.0/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.1.0/include/system/runstate.h /usr/src/debug/qemu/10.1.0/include/qemu/pmem.h /usr/src/debug/qemu/10.1.0/trace/trace-io.h /usr/src/debug/qemu/10.1.0/include/hw/
 misc/allwinner-sramc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-job.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_sd.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_dma.c /usr/src/debug/qemu/10.1.0/include/qemu/transactions.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-job.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_dma.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sd.c /usr/src/debug/qemu/10.1.0/include/system/memory_mapping.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.1.0/include/exec/target_long.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-arm.c /usr/src/debug/qemu/10.1.0/include/exec/tswap.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.1.0/include/qemu/interval-tree.h /usr/src/debug/qemu/10.1.0/qapi
 /qapi-commands-machine.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-arm.h /usr/src/debug/qemu/10.1.0/target/riscv/time_helper.h /usr/src/debug/qemu/10.1.0/include/hw/i386/pc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_mem.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_s390x_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_mem.c /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.1.0/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.1.0/target/arm/gtime
 r.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_s390x_trace_events.c /usr/src/debug/qemu/10.1.0/target/riscv/pmp.h /usr/src/debug/qemu/10.1.0/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.1.0/include/qemu/coroutine.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.1.0/include/exec/memop.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.1.0/include/system/ramblock.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu
 /10.1.0/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-s390x.h /usr/src/debug/qemu/10.1.0/include/exec/replay-core.h /usr/src/debug/qemu/10.1.0/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_isa.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-s390x.c /usr/src/debug/qemu/10.1.0/include/exec/page-vary.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_isa.c /usr/src/debug/qemu/10.1.0/hw/vfio/vfio-listener.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.1.0/include/qemu/thread-context.h /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.1.0/trace/trace-accel_tcg.c /usr/s
 rc/debug/qemu/10.1.0/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/progress_meter.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.1.0/include/qemu/option_int.h /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.1.0/include/hw/i386/apic_internal.h /usr/src/debug/qemu/10.1.0/include/hw/i386/microvm.h /usr/src/debug/qemu/10.1.0/include/exec/plugin-gen.h /usr/src/debug/qemu/10.1.0/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.1.0/include/qemu/bswap.h /usr/src/debug/qemu/10.1.0/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.1.0/trace/trace-chardev.h /usr/src/debug/qemu/10.1.0/trace/trace-chardev.c /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.1.0/include/exec/target_page.h /us
 r/src/debug/qemu/10.1.0/include/system/dump-arch.h /usr/src/debug/qemu/10.1.0/include/qemu/lockcnt.h /usr/src/debug/qemu/10.1.0/include/system/hw_accel.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ide.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_intc.h /usr/src/debug/qemu/10.1.0/include/qemu/host-pci-mmio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_ide.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_intc.c /usr/src/debug/qemu/10.1.0/include/qemu/yank.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.1.0/include/system/rng-random.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.1.0/target/arm/internals.h /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.1.0/qa
 pi/qapi-events-block-export.c /usr/src/debug/qemu/10.1.0/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_usb.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ldst-common.h /usr/src/debug/qemu/10.1.0/trace/trace-target_arm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_usb.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-target_arm.h /usr/src/debug/qemu/10.1.0/include/qemu/madvise.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-mmu-index.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.1.0/trace/trace-root.c /usr/src/de
 bug/qemu/10.1.0/hw/vfio/vfio-display.h /usr/src/debug/qemu/10.1.0/include/qemu/osdep.h /usr/src/debug/qemu/10.1.0/include/system/tpm_backend.h /usr/src/debug/qemu/10.1.0/trace/trace-root.h /usr/src/debug/qemu/10.1.0/include/qemu/bcd.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_char.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_char.c /usr/src/debug/qemu/10.1.0/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.1.0/include/qemu/selfmap.h /usr/src/debug/qemu/10.1.0/include/qemu/seqlock.h /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-hw
 _core.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-container.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_core.h /usr/src/debug/qemu/10.1.0/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.1.0/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc.c /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.1.0/include/qemu/iova-tree.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc.h /usr/src/debug/qemu/10.1.0/include/qemu/mprotect.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.1.0/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.1.0/i
 nclude/exec/tlb-common.h /usr/src/debug/qemu/10.1.0/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.1.0/include/qemu/option.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.1.0/include/exec/gdbstub.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.1.0/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.1.0/include/exec/cpu-common.h /usr/src/debug/qemu/10.1.0/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.1.0/include/hw/misc/unimp.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/boot.h /usr/src/debug/qemu/10.1
 .0/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/numa.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/virt.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.1.0/trace/trace-target_riscv.h /usr/src/debug/qemu/10.1.0/trace/trace-target_riscv.c /usr/src/debug/qemu/10.1.0/include/system/numa.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/spike.h /usr/src/debug/qemu/10.1.0/include/system/xen-mapcache.h /usr/src/debug/qemu/10.1.0/trace/trace-target_ppc.h /usr/src/debug/qemu/10.1.0/include/qemu/path.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-target_ppc.c /usr/src/debug/qemu/10.1.0/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.1.0/include/standard-headers/uefi/uefi.h /usr/src/debug/qemu/10.1.0/
 include/system/kvm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.1.0/include/qapi/type-helpers.h /usr/src/debug/qemu/10.1.0/include/system/tpm_util.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/tb-cpu-state.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-control.c /usr/src/debug/qemu/10.1.0/include/system/os-posix.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.1.0/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-control.h /usr/src/debug/qemu/10.1.0/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.1.0/include/system/block-backend-io.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-arm.h /usr/src/debug/qemu/10.1.0/include/qemu/lockable.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc
 -arm.c /usr/src/debug/qemu/10.1.0/include/system/blockdev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-dump.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.1.0/include/system/cpus.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.1.0/include/system/rng.h /usr/src/debug/q
 emu/10.1.0/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.1.0/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.1.0/include/hw/i386/topology.h /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu-ops.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.1.0/include/qemu/dbus.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.1.0/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.1.0/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.1.0/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.1.0/trace/trace-linux_user.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.1.0/target/arm/cpu.h /usr/src/debug/qemu/10.1.0/target/sh4/cpu.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.1.0/trace
 /trace-linux_user.c /usr/src/debug/qemu/10.1.0/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.1.0/target/arm/cpu-sysregs.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.1.0/include/hw/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.1.0/trace/trace-backends.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.1.0/trace/trace-backends.c /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.1.0/include/qemu/cacheflush.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-jo
 b.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.1.0/include/qemu/ratelimit.h /usr/src/debug/qemu/10.1.0/trace/trace-util.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-util.c /usr/src/debug/qemu/10.1.0/include/qemu/plugin.h /usr/src/debug/qemu/10.1.0/include/qemu/cutils.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ldst.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.1.0/include/system/hostmem.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/10.1.0/include/qemu/atomic.h /usr/src/debug/qemu/10.1.0/qapi/q
 api-visit-transaction.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.1.0/include/qemu/guest-random.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.1.0/include/exec/log.h /usr/src/debug/qemu/10.1.0/include/qemu/log.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.1.0/include/hw/char/serial-isa.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_i386_trace_events.h /usr/src/debug/qemu/10.1.0/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.1.0/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.1.0/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_i386_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.1.0/hw/i386/acpi-build.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.1.0/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.1.0/qapi/qa
 pi-types-machine-common.h /usr/src/debug/qemu/10.1.0/include/exec/vaddr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.1.0/include/system/tpm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.1.0/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.1.0/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.1.0/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.1.0/trace/trace-nbd.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.1.0/trace/trace-nbd.c /usr/src/debug/qemu/10.1.0/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/
 iommu.h /usr/src/debug/qemu/10.1.0/include/exec/icount.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.1.0/include/qemu/reserved-region.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.1.0/target/arm/cpu-features.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-job.h /usr/src/debug/qemu/10.1.0/include/hw/arm/max78000_soc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-net.h /usr/src/debug/qemu/10.1.0/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-job.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-net.c /usr/src/debug/qemu/10.1.0/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_arm.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/de
 bug/qemu/10.1.0/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_arm.c /usr/src/debug/qemu/10.1.0/trace/event-internal.h /usr/src/debug/qemu/10.1.0/include/qemu/qdist.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386.h /usr/src/debug/qemu/10.1.0/include/qemu/target-info-impl.h /usr/src/debug/qemu/10.1.0/include/qemu/target-info-qapi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.1.0/include/system/igvm-cfg.h /usr/src/debug/qemu/10.1.0/include/exec/ramlist.h /usr/src/debug/qemu/10.1.0/include/qapi/error.h /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386.c /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-virtio.c /usr/src/debug/qe
 mu/10.1.0/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.1.0/include/hw/arm/digic.h /usr/src/debug/qemu/10.1.0/include/system/qtest.h /usr/src/debug/qemu/10.1.0/include/system/reset.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-char.c /us
 r/src/debug/qemu/10.1.0/include/qemu/uuid.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-ui.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/typedefs.h /usr/src/debug/qemu/10.1.0/include/system/cpu-throttle.h /usr/src/debug/qemu/10.1.0/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.1.0/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.1.0/include/qemu/cpuid.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.1.0/include/qemu/plugin-memory.h /usr/sr
 c/debug/qemu/10.1.0/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_accelerator_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-error.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.1.0/include/qemu/error-report.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-error.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_accelerator_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.1.0/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.1.0/include/system/iothread.h /usr/src/deb
 ug/qemu/10.1.0/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_block.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-s390x.c /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_trng.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-s390x.h /usr/src/debug/qemu/10.1.0/include/exec/translation-block.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_display.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/device.h /usr/src/debug/qemu/10.1.0/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.1.0/qap
 i/qapi-visit-common.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_display.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_timer.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.1.0/include/qemu/iov.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.1.0/include/qemu/qsp.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.1.0/trace/trace-scsi.c /usr/src/debug/qemu/10.1.0/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.1.0/trace/trace-scsi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.1.0/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.1.0/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.1.0/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.1.0/include/qe
 mu/qht.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.1.0/target/riscv/pmu.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.1.0/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_xen.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_xen.c /usr/src/debug/qemu/10.1.0/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/timer.h /usr/src/debug/qemu/10.1.0/include/sy
 stem/runstate-action.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.1.0/include/hw/char/pl011.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.1.0/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.1.0/trace/trace-gdbstub.c /usr/src/debug/qemu/10.1.0/trace/trace-gdbstub.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.1.0/trace/trace-qom.c /usr/src/debug/qemu/10.1.0/trace/trace-qom.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.1.0/include/qemu/thread.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu_cfg_fields.h.inc /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/1
 0.1.0/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi.c /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.1.0/include/system/dirtyrate.h /usr/src/debug/qemu/10.1.0/include/qemu/envlist.h /usr/src/debug/qemu/10.1.0/include/hw/arm/boot.h /usr/src/debug/qemu/10.1.0/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.1.0/include/exec/watchpoint.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/10.1.0/include/qapi/visitor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-ui.c /usr/src/debug/qem
 u/10.1.0/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.1.0/trace/trace-migration.c /usr/src/debug/qemu/10.1.0/trace/trace-migration.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.1.0/include/qapi/util.h /usr/src/debug/qemu/10.1.0/include/qemu/throttle.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-accelerator.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_tpm_trace_event
 s.c /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.1.0/include/qemu/stats64.h /usr/src/debug/qemu/10.1.0/include/system/arch_init.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio_user.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio_user.c /usr/src/debug/qemu/10.1.0/trace/control-internal.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.1.0/include/system/tcg.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.1.0/include/exec/memattrs.h /usr/src/debug/qemu/10.1.0/include/exec/memopidx.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.1.0/include/qemu/memalign.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.1.0/qapi/qapi-features.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qom_trace_events.h /usr/s
 rc/debug/qemu/10.1.0/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-accelerator.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-accelerator.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_remote.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.1.0/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_remote.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_mips.c /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.1.0/
 include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.1.0/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_mips.h /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.1.0/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-vfio.h /usr/src/debug/qe
 mu/10.1.0/include/hw/vfio/vfio-migration.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-char.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.1.0/include/qemu/host-utils.h /usr/src/debug/qemu/10.1.0/include/system/accel-blocker.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.1.0/include/hw/char/serial.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.1.0/include/system/device_tree.h /usr/src/debug/qemu/10.1.0/include/qemu/main-loop.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_arm_trace_events.c /usr/src
 /debug/qemu/10.1.0/include/qemu/datadir.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.1.0/qapi/qapi-introspect.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_arm_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.1.0/qapi/qapi-introspect.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.1.0/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-net.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.1.0/include/system/rtc.h /usr/src/debug/qemu/10.1.0/include/qemu/defer-call.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_input.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_riscv.h /usr/src/debu
 g/qemu/10.1.0/trace/trace-hw_timer.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_audio.h /usr/src/debug/qemu/10.1.0/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.1.0/include/qemu/hw-version.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-net.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_audio.c /usr/src/debug/qemu/10.1.0/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_block.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_input.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.1.0/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.1.0/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.1.0/target/arm/multiprocessing.h /usr/src/debug/qemu/10.1.0/include/qemu/async-teardown.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.1.0/include/hw/arm/omap.h
  /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.1.0/trace/trace-authz.h /usr/src/debug/qemu/10.1.0/trace/trace-authz.c /usr/src/debug/qemu/10.1.0/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.1.0/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.1.0/include/system/spdm-socket.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.1.0/target/riscv/cpu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.1.0/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.1.0/include/qemu/bitmap.h /usr/src/debug/qemu/10.1.0/include/qemu/cpu-float.h /usr/src/debug/qemu/10.1.0/include/system/host_iommu_device.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.1.0/include/qemu/queue.h /usr/src/debug/qemu/
 10.1.0/include/qemu/buffer.h /usr/src/debug/qemu/10.1.0/nbd/nbd-internal.h /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.1.0/include/qemu/systemd.h /usr/src/debug/qemu/10.1.0/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.1.0/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-device.h /usr/src/debug/qemu/10.1.0/include/qapi/qmp-event.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.1.0/include/exec/mmap-lock.h
  /usr/src/debug/qemu/10.1.0/include/qemu/bitops.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.1.0/hw/i386/tdvf-hob.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.1.0/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.1.0/include/qapi/compat-policy.h /usr/src/debug/qemu/10.1.0/accel/dummy-cpus.h /usr/src/debug/qemu/10.1.0/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.1.0/common-user/plugin-api.c.inc /usr/src/debug/qemu/10.1.0/include/hw/i386/vmport.h /usr/src/debug/qemu/10.1.0/include/accel/accel-ops.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block.h /usr/src/debug/qemu/10.1.0/qapi/qapi
 -visit-stats.h /usr/src/debug/qemu/10.1.0/include/qemu/crc32c.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.h /usr/src/debug/qemu/10.1.0/trace/trace-block.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-cpr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.c /usr/src/debug/qemu/10.1.0/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.1.0/trace/trace-block.c /usr/src/debug/qemu/10.1.0/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.1.0/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.1.0/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.1.0/target/arm/idau.h /usr/src/debug/qemu/10.1.0/include/system/block-backend-common.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.1.0/trace/control.h /us
 r/src/debug/qemu/10.1.0/target/arm/cpu-qom.h /usr/src/debug/qemu/10.1.0/include/qemu/fifo32.h /usr/src/debug/qemu/10.1.0/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.1.0/include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/container.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/protocol.h /usr/src/debug/qemu/10.1.0/include/system/watchdog.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.1.0/include/hw/i386/x86.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.1.0/include/qemu/base64.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.1.0/include/qemu/xxhash.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.1.0/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.1.0/include/hw/char/max78000_uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm
 2835_cprman_internals.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.1.0/include/qemu/qtree.h /usr/src/debug/qemu/10.1.0/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.1.0/include/qemu/target-info.h /usr/src/debug/qemu/10.1.0/include/system/cryptodev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.1.0/target/i386/kvm/tdx-quote-generator.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.1.0/include/qemu/config-file.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/probe.h /usr/src/debug/qemu/10.1.0/trace/trace-net.h /usr/src/debug/qemu/10.1.0/include/qemu/chardev_open.h /usr/src/debug/qemu/10.1.0/include/system/cryptodev-vhost.h /u
 sr/src/debug/qemu/10.1.0/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.1.0/trace/trace-net.c /usr/src/debug/qemu/10.1.0/hw/vfio/pci.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net.h /usr/src/debug/qemu/10.1.0/include/qemu/int128.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net.c /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.1.0/include/exec/tb-flush.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-region.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.1.0/include/system/xen.h /usr/src/debug/qemu/10.1.0/include/
 qemu/futex.h /usr/src/debug/qemu/10.1.0/include/qemu/event_notifier.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.1.0/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.1.0/include/hw/char/parallel.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.1.0/include/hw/arm/armsse.h /usr/src/debug/qemu/10.1.0/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.1.0/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.1.0/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.1.0/include/system/ioport.h /usr/src/debug/qemu/10.1.0/include/system/memory.h /usr/src/debug/qemu/10.1.0/include/system/replay.h /usr/src/debug/qemu/10.1.0/include/system/system.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-common.h /usr/src/debug/qemu/10.1.0/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.1.0/include/system/event-loop-base.h /usr/src/debug/qemu/10.1.0/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-common.c /usr/src/debug/qemu/10.1.0/i
 nclude/qemu/fifo8.h /usr/src/debug/qemu/10.1.0/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.1.0/include/hw/misc/led.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.1.0/trace/tr
 ace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.1.0/target/i386/kvm/tdx.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.1.0/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.1.0/include/system/cpu-timers.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.1.0/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.1.0/include/qemu/range.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ufs.c"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGSIZE changed from 33860011 to 32255141 (-5%)
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31678344 to 33668088 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29180128 to 30750096 (+5%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26872104 to 28372856 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14803720 to 14339640 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13605800 to 13191992 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13750632 to 13328632 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15702472 to 15226936 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13601704 to 13183800 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15808384 to 15307824 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 16962248 to 16416152 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 16030216 to 15602968 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16097800 to 15674648 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12132224 to 11736304 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26918984 to 28494264 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGSIZE changed from 5334176 to 5791056 (+9%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGSIZE changed from 3351680 to 3446352 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGSIZE changed from 2716032 to 2748208 (+1%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGSIZE changed from 2569576 to 2635448 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGSIZE changed from 3149632 to 3211600 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGSIZE changed from 3182112 to 3248176 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGSIZE changed from 3173920 to 3235888 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGSIZE changed from 3137344 to 3203408 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGSIZE changed from 2988992 to 3050736 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGSIZE changed from 3063808 to 3125552 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGSIZE changed from 3055616 to 3117360 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGSIZE changed from 3461664 to 3531632 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGSIZE changed from 3535392 to 3601264 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGSIZE changed from 2004608 to 2062256 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGSIZE changed from 878792 to 825816 (-6%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGSIZE changed from 2700416 to 2732592 (+1%)
packages/x86-64-v3-poky-linux/qemu/qemu: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu: PV changed from "10.0.2" to "10.1.0"
Changes to packages/x86-64-v3-poky-linux/qemu (sysroot):
  /usr/share/qemu/qboot.rom changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/qemu/vof.bin changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/qemu/ast27x0_bootrom.bin was added
  /usr/share/qemu/dtb was added
  /usr/share/qemu/dtb/bamboo.dtb was added
  /usr/share/qemu/dtb/canyonlands.dtb was added
  /usr/share/qemu/dtb/petalogix-ml605.dtb was added
  /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb was added
  /usr/share/qemu/bamboo.dtb was removed
  /usr/share/qemu/canyonlands.dtb was removed
  /usr/share/qemu/petalogix-ml605.dtb was removed
  /usr/share/qemu/petalogix-s3adsp1800.dtb was removed
Changes to packages/x86_64-linux/qemu-native (sysroot):
  /usr/share/qemu/dtb was added
  /usr/share/qemu/dtb/bamboo.dtb was added
  /usr/share/qemu/dtb/canyonlands.dtb was added
  /usr/share/qemu/dtb/petalogix-ml605.dtb was added
  /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb was added
Changes to packages/x86_64-linux/qemu-system-native (sysroot):
  /usr/share/qemu/qboot.rom changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/qemu/vof.bin changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/qemu/ast27x0_bootrom.bin was added
  /usr/share/qemu/dtb was added
  /usr/share/qemu/dtb/bamboo.dtb was added
  /usr/share/qemu/dtb/canyonlands.dtb was added
  /usr/share/qemu/dtb/petalogix-ml605.dtb was added
  /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb was added
  /usr/share/qemu/bamboo.dtb was removed
  /usr/share/qemu/canyonlands.dtb was removed
  /usr/share/qemu/petalogix-ml605.dtb was removed
  /usr/share/qemu/petalogix-s3adsp1800.dtb was removed

--===============8989500631608036186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/petalogix-ml605.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb /usr/share/qemu/bamboo.dtb /usr/share/qemu/canyonlands.dtb", added "/usr/share/qemu/dtb/petalogix-ml605.dtb /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb /usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/ast27x0_bootrom.bin /usr/share/qemu/dtb/bamboo.dtb"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py /usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py /usr/lib/qemu/ptest/tests/avocado/replay_linux.py", added "/usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /
 usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tes
 ts/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: RDEPENDS: added "zlib (['>= 1.3.1'])"
Changes to packages/x86-64-v3-poky-linux/qemu (sysroot):
  /usr/share/qemu/qboot.rom changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/qemu/vof.bin changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/qemu/ast27x0_bootrom.bin was added
  /usr/share/qemu/dtb was added
  /usr/share/qemu/dtb/bamboo.dtb was added
  /usr/share/qemu/dtb/canyonlands.dtb was added
  /usr/share/qemu/dtb/petalogix-ml605.dtb was added
  /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb was added
  /usr/share/qemu/bamboo.dtb was removed
  /usr/share/qemu/canyonlands.dtb was removed
  /usr/share/qemu/petalogix-ml605.dtb was removed
  /usr/share/qemu/petalogix-s3adsp1800.dtb was removed
Changes to packages/x86_64-linux/qemu-native (sysroot):
  /usr/share/qemu/dtb was added
  /usr/share/qemu/dtb/bamboo.dtb was added
  /usr/share/qemu/dtb/canyonlands.dtb was added
  /usr/share/qemu/dtb/petalogix-ml605.dtb was added
  /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb was added
Changes to packages/x86_64-linux/qemu-system-native (sysroot):
  /usr/share/qemu/qboot.rom changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/qemu/vof.bin changed permissions from rwxr-xr-x to rw-r--r--
  /usr/share/qemu/ast27x0_bootrom.bin was added
  /usr/share/qemu/dtb was added
  /usr/share/qemu/dtb/bamboo.dtb was added
  /usr/share/qemu/dtb/canyonlands.dtb was added
  /usr/share/qemu/dtb/petalogix-ml605.dtb was added
  /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb was added
  /usr/share/qemu/bamboo.dtb was removed
  /usr/share/qemu/canyonlands.dtb was removed
  /usr/share/qemu/petalogix-ml605.dtb was removed
  /usr/share/qemu/petalogix-s3adsp1800.dtb was removed

--===============8989500631608036186==--

