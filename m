Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25C69CCF9F8
	for <webhook@archiver.kernel.org>; Wed,  5 Nov 2025 23:16:23 +0000 (UTC)
Received: from a27-23.smtp-out.us-west-2.amazonses.com (a27-23.smtp-out.us-west-2.amazonses.com [54.240.27.23])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.2350.1762384572719947972
 for <openembedded-core@lists.openembedded.org>;
 Wed, 05 Nov 2025 15:16:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=mylDgdkl;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=DQWN0x8z;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.23, mailfrom: 0101019a564e6e30-8e620e91-9d2f-412b-befd-fc42b9d7d2d2-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1762384572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=ioMnrZItB+pg65+7BbBG8sXELI9730SPiUcCYd7lQ1k=;
	b=mylDgdklp5ZENfiu6jlLJZu5J8oXeTOXkZ5BTIwCrUFi7rs007ycCXi8CxI4MQfR
	2NQSbjTme8o8t6dp/XhEOEg3szEv0Brm2FEQZFGrlgcO9cZl3FeIcqLCB8OJ2aKrY9p
	OUN++38W0Z39LJTjffq9R/jpWZ84jkmiSEqmXKlU=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1762384572;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=ioMnrZItB+pg65+7BbBG8sXELI9730SPiUcCYd7lQ1k=;
	b=DQWN0x8zHR0DULlLKAzPeRUmKlUN7r7hrbotZu+1Xj21xZsRcrgBroDL+8tpgOmK
	CJLkzpllbITNfV02bW1gcgSme4mt0oRKsigbFlUTBoVzCrGCWbQiPt4pfNWH/fwPAM6
	1HhxF8PJB3SUYQfcNVMpiwGq0xMnhOLg7jBsb8HY=
Content-Type: multipart/mixed; boundary="===============7361298688470106464=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-native,qemu-system-native,qemu: upgrading to
 10.1.2,10.1.2,10.1.2 SUCCEEDED
Message-ID: <0101019a564e6e30-8e620e91-9d2f-412b-befd-fc42b9d7d2d2-000000@us-west-2.amazonses.com>
Date: Wed, 5 Nov 2025 23:16:11 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.05-54.240.27.23
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 05 Nov 2025 23:16:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/225787

--===============7361298688470106464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-native,qemu-system-native,qemu* to *10.1.2,10.1.2,10.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-native-qemu-system-native-qemu-upgrade-10.0.6-1.patch
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
From a0aa1fa0cc26d4f4a1092765332f74ccab479f02 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 5 Nov 2025 13:13:52 +0000
Subject: [PATCH] qemu-native,qemu-system-native,qemu: upgrade 10.0.6 ->
 10.1.2,10.0.6 -> 10.1.2,10.0.6 -> 10.1.2

---
 ...native_10.0.6.bb => qemu-native_10.1.2.bb} | 43 +++++++++++++++++++
 ...10.0.6.bb => qemu-system-native_10.1.2.bb} | 43 +++++++++++++++++++
 meta/recipes-devtools/qemu/qemu.inc           |  7 +--
 ...n-environment-space-to-boot-loader-q.patch |  4 +-
 .../0002-apic-fixup-fallthrough-to-PIC.patch  |  6 +--
 ...mu-Do-not-include-file-if-not-exists.patch |  6 +--
 ...er-space-mmap-tweaks-to-address-musl.patch |  6 +--
 .../qemu/0006-qemu-Determinism-fixes.patch    |  6 +--
 ...d-use-relative-path-to-refer-to-file.patch |  2 +-
 ...and-MAP_SHARED_VALIDATE-on-needed-li.patch |  2 +-
 ...gure-lookup-meson-exutable-from-PATH.patch |  6 +--
 ...and-the-python-venv-aren-t-used-for-.patch |  6 +--
 .../qemu/qemu/fix-strerrorname_np.patch       |  6 +--
 .../qemu/{qemu_10.0.6.bb => qemu_10.1.2.bb}   | 43 +++++++++++++++++++
 14 files changed, 158 insertions(+), 28 deletions(-)
 rename meta/recipes-devtools/qemu/{qemu-native_10.0.6.bb => qemu-native_10.1.2.bb} (13%)
 rename meta/recipes-devtools/qemu/{qemu-system-native_10.0.6.bb => qemu-system-native_10.1.2.bb} (42%)
 rename meta/recipes-devtools/qemu/{qemu_10.0.6.bb => qemu_10.1.2.bb} (41%)

diff --git a/meta/recipes-devtools/qemu/qemu-native_10.0.6.bb b/meta/recipes-devtools/qemu/qemu-native_10.1.2.bb
similarity index 13%
rename from meta/recipes-devtools/qemu/qemu-native_10.0.6.bb
rename to meta/recipes-devtools/qemu/qemu-native_10.1.2.bb
index 26fa84c180..324cf9d51a 100644
--- a/meta/recipes-devtools/qemu/qemu-native_10.0.6.bb
+++ b/meta/recipes-devtools/qemu/qemu-native_10.1.2.bb
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
diff --git a/meta/recipes-devtools/qemu/qemu-system-native_10.0.6.bb b/meta/recipes-devtools/qemu/qemu-system-native_10.1.2.bb
similarity index 42%
rename from meta/recipes-devtools/qemu/qemu-system-native_10.0.6.bb
rename to meta/recipes-devtools/qemu/qemu-system-native_10.1.2.bb
index 22462e2499..511c23c3ba 100644
--- a/meta/recipes-devtools/qemu/qemu-system-native_10.0.6.bb
+++ b/meta/recipes-devtools/qemu/qemu-system-native_10.1.2.bb
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
index 3ed5dcc671..f3f277f253 100644
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
@@ -38,7 +39,7 @@ SRC_URI = "https://download.qemu.org/${BPN}-${PV}.tar.xz \
 UPSTREAM_CHECK_URI = "https://www.qemu.org"
 UPSTREAM_CHECK_REGEX = "qemu-(?P<pver>\d+(\.\d+)+)\.tar"
 
-SRC_URI[sha256sum] = "c7c40c4b166871e775804e97fce4da65665d1cc93a5c6c9e2ede9d9ee992e7a0"
+SRC_URI[sha256sum] = "9d75f331c1a5cb9b6eb8fd9f64f563ec2eab346c822cb97f8b35cd82d3f11479"
 
 CVE_STATUS[CVE-2007-0998] = "not-applicable-config: The VNC server can expose host files uder some circumstances. We don't enable it by default."
 
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
index f27208f45f..6c3e1daf13 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
+From 6a70f876b06b36f473d647a00a5dc8df7c25ec73 Mon Sep 17 00:00:00 2001
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
index ad5c5ba03e..44de8b31b1 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
+From 59e57ea9385183fce06bc75b93a7e6bdd813c307 Mon Sep 17 00:00:00 2001
 From: Mark Asselstine <mark.asselstine@windriver.com>
 Date: Tue, 26 Feb 2013 11:43:28 -0500
 Subject: [PATCH] apic: fixup fallthrough to PIC
@@ -29,10 +29,10 @@ Signed-off-by: He Zhe <zhe.he@windriver.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/hw/intc/apic.c b/hw/intc/apic.c
-index d18c1dbf2..45dde1fc5 100644
+index 143d08f1a..5bb008d59 100644
 --- a/hw/intc/apic.c
 +++ b/hw/intc/apic.c
-@@ -758,7 +758,7 @@ int apic_accept_pic_intr(DeviceState *dev)
+@@ -756,7 +756,7 @@ int apic_accept_pic_intr(DeviceState *dev)
      APICCommonState *s = APIC(dev);
      uint32_t lvt0;
  
diff --git a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
index c04e42608f..e168a196e1 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
+From 05d79339b72fd39e587c15f4b89a7baa04d29442 Mon Sep 17 00:00:00 2001
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
index 388d11d10d..4c6b6546ec 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
+From 390b312a449a5ad1c0b4937bd4ad927106c45e31 Mon Sep 17 00:00:00 2001
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
index 4690d86315..c3d7f90a50 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
+From f144efa94cbb84d6b700fb8fb71fd152865038dc Mon Sep 17 00:00:00 2001
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
index 7c24f432f2..5d28f8740f 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
+From a13e034b38192f7d21f1ee1f17276211120188e0 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 54421544bb..c96661419c 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
+From 06f0cc7ee827ce227d225f923b8a3343f3b466b0 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd..bb20d58c36 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
+From 4dc6eea7eddc4a5409a439b43dabce3e8ff95cac Mon Sep 17 00:00:00 2001
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
index b06020d106..50aa7015eb 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
+From 1d6b87d8abf4ad143548e56dea10774b4e7b1b53 Mon Sep 17 00:00:00 2001
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
  
diff --git a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
index 1cc973443e..b7773265a2 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
+From 9e0b7dd41cb1776739fc80f5ffe41be53a8ed84b Mon Sep 17 00:00:00 2001
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
diff --git a/meta/recipes-devtools/qemu/qemu_10.0.6.bb b/meta/recipes-devtools/qemu/qemu_10.1.2.bb
similarity index 41%
rename from meta/recipes-devtools/qemu/qemu_10.0.6.bb
rename to meta/recipes-devtools/qemu/qemu_10.1.2.bb
index 5d544d8d13..72e06126bb 100644
--- a/meta/recipes-devtools/qemu/qemu_10.0.6.bb
+++ b/meta/recipes-devtools/qemu/qemu_10.1.2.bb
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


--===============7361298688470106464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/canyonlands.dtb /usr/share/qemu/bamboo.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb /usr/share/qemu/petalogix-ml605.dtb", added "/usr/share/qemu/dtb/petalogix-s3adsp1800.dtb /usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/dtb/bamboo.dtb /usr/share/qemu/ast27x0_bootrom.bin /usr/share/qemu/dtb/petalogix-ml605.dtb"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py", added "/usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/AP
 IC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch
 64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp"
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

--===============7361298688470106464==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-native-qemu-system-native-qemu-upgrade-10.0.6-1.patch"

RnJvbSBhMGFhMWZhMGNjMjZkNGY0YTEwOTI3NjUzMzJmNzRjY2FiNDc5ZjAyIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgNSBOb3YgMjAyNSAxMzoxMzo1MiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXUtbmF0aXZlLHFlbXUtc3lzdGVtLW5hdGl2ZSxxZW11OiB1cGdyYWRlIDEwLjAuNiAtPgogMTAu
MS4yLDEwLjAuNiAtPiAxMC4xLjIsMTAuMC42IC0+IDEwLjEuMgoKLS0tCiAuLi5uYXRpdmVfMTAu
MC42LmJiID0+IHFlbXUtbmF0aXZlXzEwLjEuMi5iYn0gfCA0MyArKysrKysrKysrKysrKysrKysr
CiAuLi4xMC4wLjYuYmIgPT4gcWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjEuMi5iYn0gfCA0MyArKysr
KysrKysrKysrKysrKysrCiBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LmluYyAgICAg
ICAgICAgfCAgNyArLS0KIC4uLm4tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5w
YXRjaCB8ICA0ICstCiAuLi4vMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRj
aCAgfCAgNiArLS0KIC4uLm11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRj
aCB8ICA2ICstLQogLi4uZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNo
IHwgIDYgKy0tCiAuLi4vcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2ggICAg
fCAgNiArLS0KIC4uLmQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaCB8
ICAyICstCiAuLi5hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2ggfCAg
MiArLQogLi4uZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoIHwgIDYg
Ky0tCiAuLi5hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2ggfCAgNiAr
LS0KIC4uLi9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9ucC5wYXRjaCAgICAgICB8ICA2ICst
LQogLi4uL3FlbXUve3FlbXVfMTAuMC42LmJiID0+IHFlbXVfMTAuMS4yLmJifSAgIHwgNDMgKysr
KysrKysrKysrKysrKysrKwogMTQgZmlsZXMgY2hhbmdlZCwgMTU4IGluc2VydGlvbnMoKyksIDI4
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11LW5h
dGl2ZV8xMC4wLjYuYmIgPT4gcWVtdS1uYXRpdmVfMTAuMS4yLmJifSAoMTMlKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11LXN5c3RlbS1uYXRpdmVfMTAuMC42LmJiID0+
IHFlbXUtc3lzdGVtLW5hdGl2ZV8xMC4xLjIuYmJ9ICg0MiUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUve3FlbXVfMTAuMC42LmJiID0+IHFlbXVfMTAuMS4yLmJifSAoNDElKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjAu
Ni5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjEuMi5iYgpz
aW1pbGFyaXR5IGluZGV4IDEzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LW5hdGl2ZV8xMC4wLjYuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUtbmF0aXZlXzEwLjEuMi5iYgppbmRleCAyNmZhODRjMTgwLi4zMjRjZjlkNTFhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8xMC4wLjYu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfMTAuMS4yLmJi
CkBAIC0xLDMgKzEsNDYgQEAKKyMgRklYTUU6IHRoZSBMSUNfRklMRVNfQ0hLU1VNIHZhbHVlcyBo
YXZlIGJlZW4gdXBkYXRlZCBieSAnZGV2dG9vbCB1cGdyYWRlJy4KKyMgVGhlIGZvbGxvd2luZyBp
cyB0aGUgZGlmZmVyZW5jZSBiZXR3ZWVuIHRoZSBvbGQgYW5kIHRoZSBuZXcgbGljZW5zZSB0ZXh0
LgorIyBQbGVhc2UgdXBkYXRlIHRoZSBMSUNFTlNFIHZhbHVlIGlmIG5lZWRlZCwgYW5kIHN1bW1h
cml6ZSB0aGUgY2hhbmdlcyBpbgorIyB0aGUgY29tbWl0IG1lc3NhZ2UgdmlhICdMaWNlbnNlLVVw
ZGF0ZTonIHRhZy4KKyMgKGV4YW1wbGU6ICdMaWNlbnNlLVVwZGF0ZTogY29weXJpZ2h0IHllYXJz
IHVwZGF0ZWQuJykKKyMKKyMgVGhlIGNoYW5nZXM6CisjCisjIC0tLSBDT1BZSU5HCisjICsrKyBD
T1BZSU5HCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgCQkgICAgICAgVmVyc2lvbiAyLCBKdW5lIDE5
OTEKKyMgIAorIyAgIENvcHlyaWdodCAoQykgMTk4OSwgMTk5MSBGcmVlIFNvZnR3YXJlIEZvdW5k
YXRpb24sIEluYy4sCisjIC0gNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9u
LCBNQSAwMjExMC0xMzAxIFVTQQorIyArIDxodHRwczovL2ZzZi5vcmcvPgorIyAgIEV2ZXJ5b25l
IGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAg
IG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2Vk
LgorIyAgCisjIEBAIC0zMDQsOCArMzA0LDcgQEAKKyMgICAgICBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBmb3IgbW9yZSBkZXRhaWxzLgorIyAgCisjICAgICAgWW91IHNob3VsZCBoYXZlIHJl
Y2VpdmVkIGEgY29weSBvZiB0aGUgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgYWxvbmcKKyMg
LSAgICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCB3cml0ZSB0byB0aGUgRnJlZSBTb2Z0d2Fy
ZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAtICAgIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxv
b3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EuCisjICsgICAgd2l0aCB0aGlzIHByb2dyYW07
IGlmIG5vdCwgc2VlIDxodHRwczovL3d3dy5nbnUub3JnL2xpY2Vuc2VzLz4uCisjICAKKyMgIEFs
c28gYWRkIGluZm9ybWF0aW9uIG9uIGhvdyB0byBjb250YWN0IHlvdSBieSBlbGVjdHJvbmljIGFu
ZCBwYXBlciBtYWlsLgorIyAgCisjIC0tLSBDT1BZSU5HLkxJQgorIyArKysgQ09QWUlORy5MSUIK
KyMgQEAgLTIsNyArMiw3IEBACisjICAgICAgICAgICAgICAgICAgICAgICAgIFZlcnNpb24gMi4x
LCBGZWJydWFyeSAxOTk5CisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5OTEsIDE5OTkgRnJlZSBT
b2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuCisjIC0gNTEgRnJhbmtsaW4gU3RyZWV0LCBGaWZ0aCBG
bG9vciwgQm9zdG9uLCBNQSAgMDIxMTAtMTMwMSAgVVNBCisjICsgPGh0dHBzOi8vZnNmLm9yZy8+
CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0
aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQg
aXMgbm90IGFsbG93ZWQuCisjICAKKyMgCisjCisKIEJQTiA9ICJxZW11IgogCiBERVBFTkRTICs9
ICJnbGliLTIuMC1uYXRpdmUgemxpYi1uYXRpdmUiCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfMTAuMC42LmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjEuMi5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDQyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3Rl
bS1uYXRpdmVfMTAuMC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LXN5c3RlbS1uYXRpdmVfMTAuMS4yLmJiCmluZGV4IDIyNDYyZTI0OTkuLjUxMWMyM2MzYmEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2
ZV8xMC4wLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0t
bmF0aXZlXzEwLjEuMi5iYgpAQCAtMSwzICsxLDQ2IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVT
X0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisj
IFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUg
bmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBu
ZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdl
IHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6
IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0g
Q09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMiw3ICsyLDcgQEAKKyMgIAkJICAgICAgIFZl
cnNpb24gMiwgSnVuZSAxOTkxCisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJl
ZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwgRmlm
dGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgKyA8aHR0cHM6Ly9mc2Yub3Jn
Lz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJi
YXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBp
dCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyBAQCAtMzA0LDggKzMwNCw3IEBACisjICAgICAgR05V
IEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAgICAgIFlv
dSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBM
aWNlbnNlIGFsb25nCisjIC0gICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8g
dGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSAgICA1MSBGcmFua2xpbiBT
dHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyArICAgIHdp
dGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNl
cy8+LgorIyAgCisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3Ug
YnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyAtLS0gQ09QWUlORy5MSUIKKyMg
KysrIENPUFlJTkcuTElCCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgICAgICAgICAgICAgICAgICAg
ICAgICBWZXJzaW9uIDIuMSwgRmVicnVhcnkgMTk5OQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAx
OTkxLCAxOTk5IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAtIDUxIEZyYW5rbGlu
IFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEgIFVTQQorIyArIDxo
dHRwczovL2ZzZi5vcmcvPgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBk
aXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwg
YnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIAorIworCiBCUE4gPSAicWVt
dSIKIAogcmVxdWlyZSBxZW11LW5hdGl2ZS5pbmMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUuaW5jIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5p
bmMKaW5kZXggM2VkNWRjYzY3MS4uZjNmMjc3ZjI1MyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS5pbmMKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS5pbmMKQEAgLTE1LDggKzE1LDkgQEAgcmVxdWlyZSBxZW11LXRhcmdldHMuaW5jCiAjIHdl
IG5lZWQgYSBmdWxsIHB5dGhvbjMtbmF0aXZlIHNldHVwCiBpbmhlcml0IHBrZ2NvbmZpZyBwdGVz
dCB1cGRhdGUtcmMuZCBzeXN0ZW1kIHB5dGhvbjNuYXRpdmUKIAotTElDX0ZJTEVTX0NIS1NVTSA9
ICJmaWxlOi8vQ09QWUlORzttZDU9NDQxYzI4ZDJjZjg2ZTE1YTM3ZmE0N2UxNWE3MmZiYWMgXAot
ICAgICAgICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5MSUI7ZW5kbGluZT0yNDttZDU9OGM1
ZWZkYTZjZjFlMWIwM2RjZmQwZTZjMGQyNzFjN2YiCitMSUNfRklMRVNfQ0hLU1VNID0gImZpbGU6
Ly9DT1BZSU5HO21kNT1hM2I1MGQ4Yjg4ZGNjMGViM2Q3ZDM5Yjc2MGI5ZTgyMSBcCisgICAgICAg
ICAgICAgICAgICAgIGZpbGU6Ly9DT1BZSU5HLkxJQjtlbmRsaW5lPTI0O21kNT04YTgxNzhjMDY0
Nzg3NDdhNzcxNTg4YWRlYzk2NTIzMiBcCisgICAgICAgICAgICAgICAgICAgICIKIAogU1JDX1VS
SSA9ICJodHRwczovL2Rvd25sb2FkLnFlbXUub3JnLyR7QlBOfS0ke1BWfS50YXIueHogXAogICAg
ICAgICAgICBmaWxlOi8vcG93ZXJwY19yb20uYmluIFwKQEAgLTM4LDcgKzM5LDcgQEAgU1JDX1VS
SSA9ICJodHRwczovL2Rvd25sb2FkLnFlbXUub3JnLyR7QlBOfS0ke1BWfS50YXIueHogXAogVVBT
VFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd3d3LnFlbXUub3JnIgogVVBTVFJFQU1fQ0hFQ0tf
UkVHRVggPSAicWVtdS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImM3YzQwYzRiMTY2ODcxZTc3NTgwNGU5N2ZjZTRkYTY1NjY1ZDFjYzkzYTVjNmM5
ZTJlZGU5ZDllZTk5MmU3YTAiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiOWQ3NWYzMzFjMWE1Y2I5
YjZlYjhmZDlmNjRmNTYzZWMyZWFiMzQ2YzgyMmNiOTdmOGIzNWNkODJkM2YxMTQ3OSIKIAogQ1ZF
X1NUQVRVU1tDVkUtMjAwNy0wOTk4XSA9ICJub3QtYXBwbGljYWJsZS1jb25maWc6IFRoZSBWTkMg
c2VydmVyIGNhbiBleHBvc2UgaG9zdCBmaWxlcyB1ZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcy4gV2Ug
ZG9uJ3QgZW5hYmxlIGl0IGJ5IGRlZmF1bHQuIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3Bh
Y2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRl
ci1xLnBhdGNoCmluZGV4IGYyNzIwOGY0NWYuLjZjM2UxZGFmMTMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9u
bWVudC1zcGFjZS10by1ib290LWxvYWRlci1xLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10
by1ib290LWxvYWRlci1xLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNzI3M2ZjYWM2ODU3
NzUwZjA3YTI2MzJiZGI2YjBlZDY2YWU5ODJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSA2YTcwZjg3NmIwNmIzNmY0NzNkNjQ3YTAwYTVkYzhkZjdjMjVlYzczIE1vbiBTZXAgMTcgMDA6
MDA6MDAgMjAwMQogRnJvbTogSmFzb24gV2Vzc2VsIDxqYXNvbi53ZXNzZWxAd2luZHJpdmVyLmNv
bT4KIERhdGU6IEZyaSwgMjggTWFyIDIwMTQgMTc6NDI6NDMgKzA4MDAKIFN1YmplY3Q6IFtQQVRD
SF0gcWVtdTogQWRkIGFkZGl0aW9uIGVudmlyb25tZW50IHNwYWNlIHRvIGJvb3QgbG9hZGVyCkBA
IC0xOCw3ICsxOCw3IEBAIFNpZ25lZC1vZmYtYnk6IFJveSBMaSA8cm9uZ3FpbmcubGlAd2luZHJp
dmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL2h3L21pcHMvbWFsdGEuYyBiL2h3L21pcHMvbWFsdGEuYwotaW5kZXgg
OGU5Y2VhNzBiLi4yMjY4YThiNjEgMTAwNjQ0CitpbmRleCBjYmRiYjIxMDUuLjYyNjgxZmRhZSAx
MDA2NDQKIC0tLSBhL2h3L21pcHMvbWFsdGEuYwogKysrIGIvaHcvbWlwcy9tYWx0YS5jCiBAQCAt
NjUsNyArNjUsNyBAQApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBh
dGNoCmluZGV4IGFkNWM1YmEwM2UuLjQ0ZGU4YjMxYjEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1
cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE5Yjk1MDcz
ZTVkNDJkYzRhYTUzOTJkYTNkNDIyYWI2NjgwMDMxMDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDU5ZTU3ZWE5Mzg1MTgzZmNlMDZiYzc1YjkzYTdlNmJkZDgxM2MzMDcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrIEFzc2Vsc3RpbmUgPG1hcmsuYXNzZWxzdGluZUB3
aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyNiBGZWIgMjAxMyAxMTo0MzoyOCAtMDUwMAogU3Vi
amVjdDogW1BBVENIXSBhcGljOiBmaXh1cCBmYWxsdGhyb3VnaCB0byBQSUMKQEAgLTI5LDEwICsy
OSwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBIZSBaaGUgPHpoZS5oZUB3aW5kcml2ZXIuY29tPgogIDEg
ZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQogCiBkaWZmIC0tZ2l0
IGEvaHcvaW50Yy9hcGljLmMgYi9ody9pbnRjL2FwaWMuYwotaW5kZXggZDE4YzFkYmYyLi40NWRk
ZTFmYzUgMTAwNjQ0CitpbmRleCAxNDNkMDhmMWEuLjViYjAwOGQ1OSAxMDA2NDQKIC0tLSBhL2h3
L2ludGMvYXBpYy5jCiArKysgYi9ody9pbnRjL2FwaWMuYwotQEAgLTc1OCw3ICs3NTgsNyBAQCBp
bnQgYXBpY19hY2NlcHRfcGljX2ludHIoRGV2aWNlU3RhdGUgKmRldikKK0BAIC03NTYsNyArNzU2
LDcgQEAgaW50IGFwaWNfYWNjZXB0X3BpY19pbnRyKERldmljZVN0YXRlICpkZXYpCiAgICAgIEFQ
SUNDb21tb25TdGF0ZSAqcyA9IEFQSUMoZGV2KTsKICAgICAgdWludDMyX3QgbHZ0MDsKICAKZGlm
ZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5v
dC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5w
YXRjaAppbmRleCBjMDRlNDI2MDhmLi5lMTY4YTE5NmUxIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5v
dC1leGlzdHMucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0
LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCkBAIC0xLDQgKzEs
NCBAQAotRnJvbSA5MTMwNjRmOWZlNzI0ZmExYjcwYjliZjZkZDM0NDRjN2RkZGViOTI4IE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwNWQ3OTMzOWI3MmZkMzllNTg3YzE1ZjRiODlhN2Jh
YTA0ZDI5NDQyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogT2xla3NpeSBPYml0b3Rz
a3l5IDxvb2JpdG90c0BjaXNjby5jb20+CiBEYXRlOiBXZWQsIDI1IE1hciAyMDIwIDIxOjIxOjM1
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6IERvIG5vdCBpbmNsdWRlIGZpbGUgaWYgbm90
IGV4aXN0cwpAQCAtMTYsMTAgKzE2LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFNha2liIFNhamFsIDxz
YWtpYi5zYWphbEB3aW5kcml2ZXIuY29tPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMo
KykKIAogZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvc3lzY2FsbC5jIGIvbGludXgtdXNlci9zeXNj
YWxsLmMKLWluZGV4IDhiZmU0OTEyZS4uZDA0OTg0ZjY2IDEwMDY0NAoraW5kZXggOTEzNjBhMDcy
Li5hY2ZkZGNmMGEgMTAwNjQ0CiAtLS0gYS9saW51eC11c2VyL3N5c2NhbGwuYwogKysrIGIvbGlu
dXgtdXNlci9zeXNjYWxsLmMKLUBAIC0xMTgsNyArMTE4LDkgQEAKK0BAIC0xMTksNyArMTE5LDkg
QEAKICAjaW5jbHVkZSA8bGludXgvYmxrcGcuaD4KICAjaW5jbHVkZSA8bmV0cGFja2V0L3BhY2tl
dC5oPgogICNpbmNsdWRlIDxsaW51eC9uZXRsaW5rLmg+CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAt
dHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVz
cy1tdXNsLnBhdGNoCmluZGV4IDM4OGQxMWQxMGQuLjRjNmI2NTQ2ZWMgMTAwNjQ0Ci0tLSBhL21l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3Bh
Y2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vh
a3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMmFkZmM3MDNl
OTQ4MTliMGRhY2E5OGZkZTFkMGEzMDE2OGMyOTJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQor
RnJvbSAzOTBiMzEyYTQ0OWE1YWQxYzBiNDkzN2JkNGFkOTI3MTA2YzQ1ZTMxIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4
Zm91bmRhdGlvbi5vcmc+CiBEYXRlOiBGcmksIDggSmFuIDIwMjEgMTc6Mjc6MDYgKzAwMDAKIFN1
YmplY3Q6IFtQQVRDSF0gcWVtdTogQWRkIHNvbWUgdXNlciBzcGFjZSBtbWFwIHR3ZWFrcyB0byBh
ZGRyZXNzIG11c2wgMzIgYml0CkBAIC0yMiwxMCArMjIsMTAgQEAgU2lnbmVkLW9mZi1ieTogUmlj
aGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRhdGlvbi5vcmcKICAxIGZpbGUg
Y2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEv
bGludXgtdXNlci9tbWFwLmMgYi9saW51eC11c2VyL21tYXAuYwotaW5kZXggZDFmMzZlNmYxLi4y
NmNjZjhmNGQgMTAwNjQ0CitpbmRleCAwMDJlMWU2NjguLjkxMjgzOWRlYyAxMDA2NDQKIC0tLSBh
L2xpbnV4LXVzZXIvbW1hcC5jCiArKysgYi9saW51eC11c2VyL21tYXAuYwotQEAgLTExMDgsMTIg
KzExMDgsMTYgQEAgYWJpX2xvbmcgdGFyZ2V0X21yZW1hcChhYmlfdWxvbmcgb2xkX2FkZHIsIGFi
aV91bG9uZyBvbGRfc2l6ZSwKK0BAIC0xMTA5LDEyICsxMTA5LDE2IEBAIGFiaV9sb25nIHRhcmdl
dF9tcmVtYXAoYWJpX3Vsb25nIG9sZF9hZGRyLCBhYmlfdWxvbmcgb2xkX3NpemUsCiAgICAgIGlu
dCBwcm90OwogICAgICB2b2lkICpob3N0X2FkZHI7CiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaCBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZp
eGVzLnBhdGNoCmluZGV4IDQ2OTBkODYzMTUuLmMzZDdmOTBhNTAgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVy
bWluaXNtLWZpeGVzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMDMyNzI2ZTlkYThkZTAw
ODhkNmM3MGNmZDkyZTBhNTIxNTUzMTVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBm
MTQ0ZWZhOTRjYmI4NGQ2YjcwMGZiOGZiNzFmZDE1Mjg2NTAzOGRjIE1vbiBTZXAgMTcgMDA6MDA6
MDAgMjAwMQogRnJvbTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxpbnV4Zm91bmRh
dGlvbi5vcmc+CiBEYXRlOiBNb24sIDEgTWFyIDIwMjEgMTM6MDA6NDcgKzAwMDAKIFN1YmplY3Q6
IFtQQVRDSF0gcWVtdTogRGV0ZXJtaW5pc20gZml4ZXMKQEAgLTE2LDEwICsxNiwxMCBAQCBSUCAy
MDIxLzMvMQogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQog
CiBkaWZmIC0tZ2l0IGEvc2NyaXB0cy9kZWNvZGV0cmVlLnB5IGIvc2NyaXB0cy9kZWNvZGV0cmVl
LnB5Ci1pbmRleCBlOGI3MmRhM2EuLjVjZDg2YjE0MiAxMDA2NDQKK2luZGV4IGY5OTI0NzJiNy4u
MmU0MjE4YjE0IDEwMDY0NAogLS0tIGEvc2NyaXB0cy9kZWNvZGV0cmVlLnB5CiArKysgYi9zY3Jp
cHRzL2RlY29kZXRyZWUucHkKLUBAIC0xNTU4LDcgKzE1NTgsNyBAQCBkZWYgbWFpbigpOgorQEAg
LTE1NTksNyArMTU1OSw3IEBAIGRlZiBtYWluKCk6CiAgICAgIHRvcHBhdCA9IEV4Y011bHRpUGF0
dGVybigwKQogIAogICAgICBmb3IgZmlsZW5hbWUgaW4gYXJnczoKZGlmZiAtLWdpdCBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVs
YXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xz
L3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJl
ZmVyLXRvLWZpbGUucGF0Y2gKaW5kZXggN2MyNGY0MzJmMi4uNWQyOGY4NzQwZiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxk
LXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2
ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGViZWFi
MDY3NDczMDZlYzE2Mjk5MjA3YmY0YmQ3NDgxYTQ3MmI0ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGExM2UwMzRiMzgxOTJmN2QyMWYxZWUxZjE3Mjc2MjExMTIwMTg4ZTAgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5k
cml2ZXIuY29tPgogRGF0ZTogVGh1LCAxNCBKYW4gMjAyMSAwNjozMzowNCArMDAwMAogU3ViamVj
dDogW1BBVENIXSB0ZXN0cy9tZXNvbi5idWlsZDogdXNlIHJlbGF0aXZlIHBhdGggdG8gcmVmZXIg
dG8gZmlsZXMKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAw
OC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBh
dGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lO
Qy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKaW5kZXggNTQ0MjE1
NDRiYi4uYzk2NjYxNDE5YyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVk
ZWQtbGkucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURl
ZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gK
QEAgLTEsNCArMSw0IEBACi1Gcm9tIDljMjI1MjM0YTc1NmYyNzQ1Y2YwNGMzYzNhZjZlZjZiNmFj
ZjQyNzcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDA2ZjBjYzdlZTgyN2NlMjI3ZDIy
NWY5MjNiOGEzMzQzZjNiNDY2YjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVt
IFJhaiA8cmFqLmtoZW1AZ21haWwuY29tPgogRGF0ZTogTW9uLCAyMSBNYXIgMjAyMiAxMDowOToz
OCAtMDcwMAogU3ViamVjdDogW1BBVENIXSBEZWZpbmUgTUFQX1NZTkMgYW5kIE1BUF9TSEFSRURf
VkFMSURBVEUgb24gbmVlZGVkIGxpbnV4CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBB
VEgucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJl
LWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKaW5kZXggMjhhMTBkOThiZC4u
YmIyMGQ1OGMzNiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCisrKyBi
L21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1l
c29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWFkZjNm
YzNlYTJjYmNjYjQxZDQ5Njk1YTUzYzc0ZmVkNjg1MGZiMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
MDEKK0Zyb20gNGRjNmVlYTdlZGRjNGE1NDA5YTQzOWI0M2RhYmNlM2U4ZmY5NWNhYyBNb24gU2Vw
IDE3IDAwOjAwOjAwIDIwMDEKIEZyb206ID0/VVRGLTg/cT9NYXJ0aW49MjBIdW5kZWI9QzM9Qjhs
bD89IDxtYXJ0aW5AZ2Vhbml4LmNvbT4KIERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTQ6MDI6NTUg
KzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gY29uZmlndXJlOiBsb29rdXAgbWVzb24gZXh1dGFibGUg
ZnJvbSBQQVRICkBAIC05LDEwICs5LDEwIEBAIFVwc3RyZWFtLVN0YXR1czogSW5hcHByb3ByaWF0
ZSBbd29ya2Fyb3VuZCwgd291bGQgbmVlZCBhIHJlYWwgZml4IGZvciB1cHN0cmVhbV0KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDYgZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQg
YS9jb25maWd1cmUgYi9jb25maWd1cmUKLWluZGV4IDAyZjFkZDIzMS4uMmM1ZWNkMzQ2IDEwMDc1
NQoraW5kZXggMjc0YTc3ODc2Li44NGU0Mjk0MDkgMTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsr
KyBiL2NvbmZpZ3VyZQotQEAgLTk4MywxMiArOTgzLDcgQEAgbWt2ZW52PSIkcHl0aG9uICR7c291
cmNlX3BhdGh9L3B5dGhvbi9zY3JpcHRzL21rdmVudi5weSIKK0BAIC05OTUsMTIgKzk5NSw3IEBA
IG1rdmVudj0iJHB5dGhvbiAke3NvdXJjZV9wYXRofS9weXRob24vc2NyaXB0cy9ta3ZlbnYucHki
CiAgJG1rdmVudiBlbnN1cmVncm91cCAtLWRpciAiJHtzb3VyY2VfcGF0aH0vcHl0aG9uL3doZWVs
cyIgXAogICAgICAgJHtzb3VyY2VfcGF0aH0vcHl0aG9uZGVwcy50b21sIG1lc29uIHx8IGV4aXQg
MQogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFl
bXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFu
ZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaAppbmRleCBiMDYwMjBkMTA2
Li41MGFhNzAxNWViIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9y
LS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1F
bnN1cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaApAQCAt
MSw0ICsxLDQgQEAKLUZyb20gMGQ4NTk4ODQ1N2E0NzVjMjViODQwODVjZjA5MDA0MDE1MGE5YzE2
ZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gMWQ2Yjg3ZDhhYmY0YWQxNDM1NDhlNTZk
ZWExMDc3NGI0ZTdiMWI1MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQg
UHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogV2VkLCAy
MiBNYXkgMjAyNCAxMzo1ODoyMyArMDIwMAogU3ViamVjdDogW1BBVENIXSBxZW11OiBFbnN1cmUg
cGlwIGFuZCB0aGUgcHl0aG9uIHZlbnYgYXJlbid0IHVzZWQgZm9yIG1lc29uCkBAIC0yOSwxMCAr
MjksMTAgQEAgU2lnbmVkLW9mZi1ieTogUmljaGFyZCBQdXJkaWUgPHJpY2hhcmQucHVyZGllQGxp
bnV4Zm91bmRhdGlvbi5vcmc+CiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMiBk
ZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2NvbmZpZ3VyZSBiL2NvbmZpZ3VyZQotaW5kZXgg
MmM1ZWNkMzQ2Li41MzE1ZWRlMzUgMTAwNzU1CitpbmRleCA4NGU0Mjk0MDkuLjFhOTU4NWU4ZSAx
MDA3NTUKIC0tLSBhL2NvbmZpZ3VyZQogKysrIGIvY29uZmlndXJlCi1AQCAtOTY5LDE0ICs5Njks
MTQgQEAgcHl0aG9uPSIkKGNvbW1hbmQgLXYgIiRweXRob24iKSIKK0BAIC05ODEsMTQgKzk4MSwx
NCBAQCBweXRob249IiQoY29tbWFuZCAtdiAiJHB5dGhvbiIpIgogIGVjaG8gInB5dGhvbiBkZXRl
cm1pbmVkIHRvIGJlICckcHl0aG9uJyIKICBlY2hvICJweXRob24gdmVyc2lvbjogJCgkcHl0aG9u
IC0tdmVyc2lvbikiCiAgCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2gKaW5kZXggMWNjOTczNDQzZS4uYjc3NzMy
NjVhMiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXgtc3Ry
ZXJyb3JuYW1lX25wLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
Zml4LXN0cmVycm9ybmFtZV9ucC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2UwOTY1NGZh
MTc5YWQ1ZmFiMWRjMGE0Nzg4NmM2YTFhMmFjYzA5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gOWUwYjdkZDQxY2IxNzc2NzM5ZmM4MGY1ZmZlNDFiZTUzYThlZDg0YiBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IE5hdGFuYWVsIENvcGEgPG5jb3BhQGFscGluZWxpbnV4Lm9y
Zz4KIERhdGU6IFdlZCwgMTggU2VwIDIwMjQgMTY6MTk6MzcgLTA3MDAKIFN1YmplY3Q6IFtQQVRD
SF0gdGFyZ2V0L3Jpc2N2L2t2bTogZG8gbm90IHVzZSBub24tcG9ydGFibGUgc3RyZXJyb3JuYW1l
X25wKCkKQEAgLTIwLDEwICsyMCwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBOYXRhbmFlbCBDb3BhIDxu
Y29wYUBhbHBpbmVsaW51eC5vcmc+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAy
IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMg
Yi90YXJnZXQvcmlzY3Yva3ZtL2t2bS1jcHUuYwotaW5kZXggODAwMWNhMTUzLi43OWZiNDNmOTIg
MTAwNjQ0CitpbmRleCA1YzE5MDYyYzEuLjU5YjRiZjE2YSAxMDA2NDQKIC0tLSBhL3RhcmdldC9y
aXNjdi9rdm0va3ZtLWNwdS5jCiArKysgYi90YXJnZXQvcmlzY3Yva3ZtL2t2bS1jcHUuYwotQEAg
LTE5NjgsOCArMTk2OCw3IEBAIHN0YXRpYyBib29sIGt2bV9jcHVfcmVhbGl6ZShDUFVTdGF0ZSAq
Y3MsIEVycm9yICoqZXJycCkKK0BAIC0xOTkzLDggKzE5OTMsNyBAQCBzdGF0aWMgYm9vbCBrdm1f
Y3B1X3JlYWxpemUoQ1BVU3RhdGUgKmNzLCBFcnJvciAqKmVycnApCiAgICAgIGlmIChyaXNjdl9o
YXNfZXh0KCZjcHUtPmVudiwgUlZWKSkgewogICAgICAgICAgcmV0ID0gcHJjdGwoUFJfUklTQ1Zf
Vl9TRVRfQ09OVFJPTCwgUFJfUklTQ1ZfVl9WU1RBVEVfQ1RSTF9PTik7CiAgICAgICAgICBpZiAo
cmV0KSB7CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjAu
Ni5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVfMTAuMS4yLmJiCnNpbWlsYXJp
dHkgaW5kZXggNDElCnJlbmFtZSBmcm9tIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXVf
MTAuMC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjEu
Mi5iYgppbmRleCA1ZDU0NGQ4ZDEzLi43MmUwNjEyNmJiIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjAuNi5iYgorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11XzEwLjEuMi5iYgpAQCAtMSwzICsxLDQ2IEBACisjIEZJWE1FOiB0aGUgTElD
X0ZJTEVTX0NIS1NVTSB2YWx1ZXMgaGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFk
ZScuCisjIFRoZSBmb2xsb3dpbmcgaXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFu
ZCB0aGUgbmV3IGxpY2Vuc2UgdGV4dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1
ZSBpZiBuZWVkZWQsIGFuZCBzdW1tYXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBt
ZXNzYWdlIHZpYSAnTGljZW5zZS1VcGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1V
cGRhdGU6IGNvcHlyaWdodCB5ZWFycyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIwor
IyAtLS0gQ09QWUlORworIyArKysgQ09QWUlORworIyBAQCAtMiw3ICsyLDcgQEAKKyMgIAkJICAg
ICAgIFZlcnNpb24gMiwgSnVuZSAxOTkxCisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5ODksIDE5
OTEgRnJlZSBTb2Z0d2FyZSBGb3VuZGF0aW9uLCBJbmMuLAorIyAtIDUxIEZyYW5rbGluIFN0cmVl
dCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgKyA8aHR0cHM6Ly9m
c2Yub3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0
ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFu
Z2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyBAQCAtMzA0LDggKzMwNCw3IEBACisjICAg
ICAgR05VIEdlbmVyYWwgUHVibGljIExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAg
ICAgIFlvdSBzaG91bGQgaGF2ZSByZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1
YmxpYyBMaWNlbnNlIGFsb25nCisjIC0gICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3Jp
dGUgdG8gdGhlIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSAgICA1MSBGcmFu
a2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyAr
ICAgIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9s
aWNlbnNlcy8+LgorIyAgCisjICBBbHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFj
dCB5b3UgYnkgZWxlY3Ryb25pYyBhbmQgcGFwZXIgbWFpbC4KKyMgIAorIyAtLS0gQ09QWUlORy5M
SUIKKyMgKysrIENPUFlJTkcuTElCCisjIEBAIC0yLDcgKzIsNyBAQAorIyAgICAgICAgICAgICAg
ICAgICAgICAgICBWZXJzaW9uIDIuMSwgRmVicnVhcnkgMTk5OQorIyAgCisjICAgQ29weXJpZ2h0
IChDKSAxOTkxLCAxOTk5IEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAtIDUxIEZy
YW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEgIFVTQQor
IyArIDxodHRwczovL2ZzZi5vcmcvPgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5
IGFuZCBkaXN0cmlidXRlIHZlcmJhdGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1
bWVudCwgYnV0IGNoYW5naW5nIGl0IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIAorIworCiBCQkNM
QVNTRVhURU5EID0gIm5hdGl2ZXNkayIKIAogcmVxdWlyZSBxZW11LmluYwotLSAKMi40Ny4xCgo=

--===============7361298688470106464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/qemu: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-10.0.6.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.1.2.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://00
 02-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/x86-64-v3-poky-linux/qemu: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGSIZE changed from 341237945 to 340790311 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-common: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/bamboo.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb /usr/share/qemu/petalogix-ml605.dtb /usr/share/qemu/canyonlands.dtb", added "/usr/share/qemu/ast27x0_bootrom.bin /usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/dtb/petalogix-ml605.dtb /usr/share/qemu/dtb/bamboo.dtb /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1865481488 to 1870683112 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: FILELIST: added "/usr/lib/qemu/ptest/tests/qtest/.debug/aspeed_scu-test /usr/lib/qemu/ptest/tests/tcg/plugins/.debug/libpatch.so /usr/lib/qemu/ptest/tests/qtest/.debug/ast2700-hace-test"
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGSIZE changed from 885233 to 881537 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 185300405 to 181836303 (-2%)
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py", added "/usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/li
 b/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/data/acpi/aarch64/
 virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGSIZE changed from 33861132 to 32256545 (-5%)
packages/x86-64-v3-poky-linux/qemu/qemu-src: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-src: FILELIST: directory renamed /usr/src/debug/qemu/10.0.6/include/hw/block -> /usr/src/debug/qemu/10.1.2/include/hw/block, directory renamed /usr/src/debug/qemu/10.0.6/include/scsi -> /usr/src/debug/qemu/10.1.2/include/scsi, directory renamed /usr/src/debug/qemu/10.0.6/util -> /usr/src/debug/qemu/10.1.2/util, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/hyperv -> /usr/src/debug/qemu/10.1.2/include/hw/hyperv, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-arm-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-arm-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/semihosting -> /usr/src/debug/qemu/10.1.2/include/semihosting, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/xen/interface/arch-x86 -> /usr/src/debug/qemu/10.1.2/include/hw/xen/interface/arch-x86, directory renamed /usr/sr
 c/debug/qemu/10.0.6/include/hw/intc -> /usr/src/debug/qemu/10.1.2/include/hw/intc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/xen/interface -> /usr/src/debug/qemu/10.1.2/include/hw/xen/interface, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips64el-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips64el-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/sensor -> /usr/src/debug/qemu/10.1.2/include/hw/sensor, directory renamed /usr/src/debug/qemu/10.0.6/include/monitor -> /usr/src/debug/qemu/10.1.2/include/monitor, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/audio -> /usr/src/debug/qemu/10.1.2/include/hw/audio, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/firmware -> /usr/src/debug/qemu/10.1.2/include/hw/firmware, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-aarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-aarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-riscv64-softmmu.a
 .p -> /usr/src/debug/qemu/10.1.2/libqemu-riscv64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/gdbstub -> /usr/src/debug/qemu/10.1.2/include/gdbstub, directory renamed /usr/src/debug/qemu/10.0.6/include/libdecnumber -> /usr/src/debug/qemu/10.1.2/include/libdecnumber, directory renamed /usr/src/debug/qemu/10.0.6/tcg/i386 -> /usr/src/debug/qemu/10.1.2/tcg/i386, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mipsel-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mipsel-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/libdecnumber/dpd -> /usr/src/debug/qemu/10.1.2/include/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/southbridge -> /usr/src/debug/qemu/10.1.2/include/hw/southbridge, directory renamed /usr/src/debug/qemu/10.0.6/include/user -> /usr/src/debug/qemu/10.1.2/include/user, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/cxl -> /usr/src/debug/qemu/10.1.2/include/hw/cxl, directory renamed /usr/src/de
 bug/qemu/10.0.6/include/crypto -> /usr/src/debug/qemu/10.1.2/include/crypto, directory renamed /usr/src/debug/qemu/10.0.6/contrib/ivshmem-server -> /usr/src/debug/qemu/10.1.2/contrib/ivshmem-server, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/fsi -> /usr/src/debug/qemu/10.1.2/include/hw/fsi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/pci -> /usr/src/debug/qemu/10.1.2/include/hw/pci, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/mem -> /usr/src/debug/qemu/10.1.2/include/hw/mem, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/ssi -> /usr/src/debug/qemu/10.1.2/include/hw/ssi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/ide -> /usr/src/debug/qemu/10.1.2/include/hw/ide, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/xen -> /usr/src/debug/qemu/10.1.2/include/hw/xen, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/dma -> /usr/src/debug/qemu/10.1.2/include/hw/dma, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/
 isa -> /usr/src/debug/qemu/10.1.2/include/hw/isa, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/adc -> /usr/src/debug/qemu/10.1.2/include/hw/adc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/i2c -> /usr/src/debug/qemu/10.1.2/include/hw/i2c, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/ppc -> /usr/src/debug/qemu/10.1.2/include/hw/ppc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/rtc -> /usr/src/debug/qemu/10.1.2/include/hw/rtc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/usb -> /usr/src/debug/qemu/10.1.2/include/hw/usb, directory renamed /usr/src/debug/qemu/10.0.6/target/mips -> /usr/src/debug/qemu/10.1.2/target/mips, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/cpu -> /usr/src/debug/qemu/10.1.2/include/hw/cpu, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/net -> /usr/src/debug/qemu/10.1.2/include/hw/net, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-arm-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/lib
 qemu-arm-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw -> /usr/src/debug/qemu/10.1.2/include/hw, directory renamed /usr/src/debug/qemu/10.0.6/ui/shader -> /usr/src/debug/qemu/10.1.2/ui/shader, directory renamed /usr/src/debug/qemu/10.0.6/include/disas -> /usr/src/debug/qemu/10.1.2/include/disas, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-aarch64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-aarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/backends/tpm -> /usr/src/debug/qemu/10.1.2/backends/tpm, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-riscv64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-riscv64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/hw/mips -> /usr/src/debug/qemu/10.1.2/hw/mips, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/ipmi -> /usr/src/d
 ebug/qemu/10.1.2/include/hw/ipmi, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-loongarch64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-loongarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/ebpf -> /usr/src/debug/qemu/10.1.2/ebpf, directory renamed /usr/src/debug/qemu/10.0.6/include/chardev -> /usr/src/debug/qemu/10.1.2/include/chardev, directory renamed /usr/src/debug/qemu/10.0.6/hw/acpi -> /usr/src/debug/qemu/10.1.2/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.6/monitor -> /usr/src/debug/qemu/10.1.2/monitor, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/pci-host -> /usr/src/debug/qemu/10.1.2/include/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.6/hw/loongarch -> /usr/src/debug/qemu/10.1.2/hw/loongarch, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/core -> /usr/src/debug/qemu/10.1.2/
 include/hw/core, directory renamed /usr/src/debug/qemu/10.0.6/include/io -> /usr/src/debug/qemu/10.1.2/include/io, directory renamed /usr/src/debug/qemu/10.0.6/host/include/x86_64/host -> /usr/src/debug/qemu/10.1.2/host/include/x86_64/host, directory renamed /usr/src/debug/qemu/10.0.6/accel/tcg -> /usr/src/debug/qemu/10.1.2/accel/tcg, directory renamed /usr/src/debug/qemu/10.0.6/audio -> /usr/src/debug/qemu/10.1.2/audio, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/sh4 -> /usr/src/debug/qemu/10.1.2/include/hw/sh4, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/watchdog -> /usr/src/debug/qemu/10.1.2/include/hw/watchdog, directory renamed /usr/src/debug/qemu/10.0.6/include/qom -> /usr/src/debug/qemu/10.1.2/include/qom, directory renamed /usr/src/debug/qemu/10.0.6/include/qobject -> /usr/src/debug/qemu/10.1.2/include/qobject, directory renamed /usr/src/debug/qemu/10.0.6/hw/block/dataplane -> /usr/src/debug/qemu/10.1.2/hw/block/dataplane, directory renamed /usr/src/d
 ebug/qemu/10.0.6/include/hw/xen/interface/io -> /usr/src/debug/qemu/10.1.2/include/hw/xen/interface/io, directory renamed /usr/src/debug/qemu/10.0.6/target/loongarch -> /usr/src/debug/qemu/10.1.2/target/loongarch, directory renamed /usr/src/debug/qemu/10.0.6/include/authz -> /usr/src/debug/qemu/10.1.2/include/authz, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/misc/macio -> /usr/src/debug/qemu/10.1.2/include/hw/misc/macio, directory renamed /usr/src/debug/qemu/10.0.6/target/ppc -> /usr/src/debug/qemu/10.1.2/target/ppc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/sd -> /usr/src/debug/qemu/10.1.2/include/hw/sd, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/scsi -> /usr/src/debug/qemu/10.1.2/include/hw/scsi, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips64el-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips64el-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc
 64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/hw/riscv -> /usr/src/debug/qemu/10.1.2/hw/riscv, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-loongarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-loongarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-i386-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-i386-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/fpu -> /usr/src/debug/qemu/10.1.2/include/fpu, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/hw/virtio -> /usr/src/debug/qemu/10.1.2/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/mips -> /usr/src/debug/qemu/10.1.2/include/hw/mips, directory renamed /usr/src/debug/qemu/10.0.6/inclu
 de/standard-headers/linux -> /usr/src/debug/qemu/10.1.2/include/standard-headers/linux, directory renamed /usr/src/debug/qemu/10.0.6/hw/block -> /usr/src/debug/qemu/10.1.2/hw/block, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-x86_64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-x86_64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/net -> /usr/src/debug/qemu/10.1.2/include/net, directory renamed /usr/src/debug/qemu/10.0.6/block -> /usr/src/debug/qemu/10.1.2/block, directory renamed /usr/src/debug/qemu/10.0.6/linux-headers/asm -> /usr/src/debug/qemu/10.1.2/linux-headers/asm, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/acpi -> /usr/src/debug/qemu/10.1.2/include/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-riscv32-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-riscv32-linux-user.a.
 p, directory renamed /usr/src/debug/qemu/10.0.6/subprojects/libvduse -> /usr/src/debug/qemu/10.1.2/subprojects/libvduse, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/pci-bridge -> /usr/src/debug/qemu/10.1.2/include/hw/pci-bridge, directory renamed /usr/src/debug/qemu/10.0.6/include/tcg -> /usr/src/debug/qemu/10.1.2/include/tcg, directory renamed /usr/src/debug/qemu/10.0.6/hw/i386/kvm -> /usr/src/debug/qemu/10.1.2/hw/i386/kvm, directory renamed /usr/src/debug/qemu/10.0.6/migration -> /usr/src/debug/qemu/10.1.2/migration, directory renamed /usr/src/debug/qemu/10.0.6/hw/usb -> /usr/src/debug/qemu/10.1.2/hw/usb, directory renamed /usr/src/debug/qemu/10.0.6/storage-daemon/qapi -> /usr/src/debug/qemu/10.1.2/storage-daemon/qapi, directory renamed /usr/src/debug/qemu/10.0.6/include -> /usr/src/debug/qemu/10.1.2/include, directory renamed /usr/src/debug/qemu/10.0.6/ui -> /usr/src/debug/qemu/10.1.2/ui, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/uefi -> /usr/src/debug/q
 emu/10.1.2/include/hw/uefi, directory renamed /usr/src/debug/qemu/10.0.6/crypto -> /usr/src/debug/qemu/10.1.2/crypto, directory renamed /usr/src/debug/qemu/10.0.6/hw/arm -> /usr/src/debug/qemu/10.1.2/hw/arm, directory renamed /usr/src/debug/qemu/10.0.6/target/i386 -> /usr/src/debug/qemu/10.1.2/target/i386, directory renamed /usr/src/debug/qemu/10.0.6/hw/pci-host -> /usr/src/debug/qemu/10.1.2/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.6/hw/net -> /usr/src/debug/qemu/10.1.2/hw/net, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/nvram -> /usr/src/debug/qemu/10.1.2/include/hw/nvram, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/xen/interface/hvm -> /usr/src/debug/qemu/10.1.2/include/hw/xen/interface/hvm, directory renamed /usr/src/debug/qemu/10.0.6/linux-user -> /usr/src/debug/qemu/10.1.2/linux-user, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/gpio -> /usr/src/debug/qemu/10.1.2/include/hw/gpio, directory renamed /usr/src/debug/qemu/10.0.6/host
 /include/i386/host -> /usr/src/debug/qemu/10.1.2/host/include/i386/host, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/timer -> /usr/src/debug/qemu/10.1.2/include/hw/timer, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/block -> /usr/src/debug/qemu/10.1.2/include/block, directory renamed /usr/src/debug/qemu/10.0.6/disas -> /usr/src/debug/qemu/10.1.2/disas, directory renamed /usr/src/debug/qemu/10.0.6/include/migration -> /usr/src/debug/qemu/10.1.2/include/migration, directory renamed /usr/src/debug/qemu/10.0.6/libcommon.a.p -> /usr/src/debug/qemu/10.1.2/libcommon.a.p, directory renamed /usr/src/debug/qemu/10.0.6/hw/intc -> /usr/src/debug/qemu/10.1.2/hw/intc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/ipack -> /usr/src/debug/qemu/10.1.2/include/hw/ipack, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-riscv32-softmmu.a.p -> 
 /usr/src/debug/qemu/10.1.2/libqemu-riscv32-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/standard-headers/asm-x86 -> /usr/src/debug/qemu/10.1.2/include/standard-headers/asm-x86, directory renamed /usr/src/debug/qemu/10.0.6/tests -> /usr/src/debug/qemu/10.1.2/tests, directory renamed /usr/src/debug/qemu/10.0.6/linux-headers/linux -> /usr/src/debug/qemu/10.1.2/linux-headers/linux, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/remote -> /usr/src/debug/qemu/10.1.2/include/hw/remote, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/input -> /usr/src/debug/qemu/10.1.2/include/hw/input, directory renamed /usr/src/debug/qemu/10.0.6/qga -> /usr/src/debug/qemu/10.1.2/qga, directory renamed /usr/src/debug/qemu/10.0.6/include/ui -> /usr/src/debug/qemu/10.1.2/include/ui, directory renamed /usr/src/debug/qemu/10.0.6/subprojects/libvhost-user -> /usr/src/debug/qemu/10.1.2/subprojects/libvhost-user, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/virtio 
 -> /usr/src/debug/qemu/10.1.2/include/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.6/host/include/generic/host -> /usr/src/debug/qemu/10.1.2/host/include/generic/host, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mipsel-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mipsel-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc64le-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc64le-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/net -> /usr/src/debug/qemu/10.1.2/net, directory renamed /usr/src/debug/qemu/10.0.6/hw/net/fsl_etsec -> /usr/src/debug/qemu/10.1.2/hw/net/fsl_etsec, directory renamed /usr/src/debug/qemu/10.0.6 -> /usr/src/debug/qemu/10.1.2, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/display -> /usr/src/debug/qemu/10.1.2/include/hw/display, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/loongarch -> /usr/src/debug/qemu/10.1.2/include/hw/loongarch, directory renamed /usr/src/debug/qemu/10.0.6
 /host/include/i386/host/crypto -> /usr/src/debug/qemu/10.1.2/host/include/i386/host/crypto, removed "/usr/src/debug/qemu/10.0.6/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.0.6/include/exec/tswap.h /usr/src/debug/qemu/10.0.6/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.0.6/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.0.6/include/qemu/thread-posix.h /usr/src/debug/qemu/10.0.6/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.0.6/trace/tr
 ace-nbd.h /usr/src/debug/qemu/10.0.6/trace/trace-nbd.c /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.0.6/include/exec/exec-all.h /usr/src/debug/qemu/10.0.6/include/exec/cpu-common.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.0.6/include/hw/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.0.6/include/qemu/base64.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.0.6/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.0.6/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.0.6/tr
 ace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.0.6/include/exec/memory-internal.h /usr/src/debug/qemu/10.0.6/include/system/dump.h /usr/src/debug/qemu/10.0.6/include/system/tpm_util.h /usr/src/debug/qemu/10.0.6/include/qemu/unicode.h /usr/src/debug/qemu/10.0.6/include/qemu/keyval.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.0.6/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.0.6/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.0.6/include/hw/char/serial.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.0.6/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.0.6/include/qemu/qdist.h /usr/src/debug/qemu/10.0.6/include/qapi/visitor.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-net.trace-events /usr/src/debug/q
 emu/10.0.6/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.0.6/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_intc.c /usr/src/debug/qemu/10.0.6/include/qemu/mprotect.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_intc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.0.6/include/exec/hwaddr.h /usr/src/debug/qemu/10.0.6/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_dma.c /usr/src/debug/qemu/10.0.6/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_dma.h /usr/src/debug/qemu/10.0.6/include/exec/cpu-all.h /usr/src/debug/qemu/10.0.6/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.0.6/include/exec/ioport.
 h /usr/src/debug/qemu/10.0.6/include/exec/page-vary.h /usr/src/debug/qemu/10.0.6/include/hw/i386/x86.h /usr/src/debug/qemu/10.0.6/include/qemu/stats64.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_core.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_core.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_audio.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_block.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_input.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_timer.h /usr/src/debug/
 qemu/10.0.6/trace/trace-hw_xen.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_audio.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_block.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_input.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.0.6/include/system/rng-random.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_timer.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_xen.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.0.6/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.0.6/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-tpm.c /
 usr/src/debug/qemu/10.0.6/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.0.6/include/qemu/buffer.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.0.6/include/qemu/drm.h /usr/src/debug/qemu/10.0.6/include/qemu/reserved-region.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.0.6/include/hw/vfio/vfio-common.h /usr/src/debug/qemu/10.0.6/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.0.6/include/qemu/qtree.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.0.6/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.0.6/include/qemu/filemonitor.h /usr/src/debug/qemu/10.0.6/include/exec/abi_ptr.h /usr/src/debug/qemu/10.0.6/include/hw/arm/s
 oc_dma.h /usr/src/debug/qemu/10.0.6/include/hw/char/escc.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.0.6/include/qemu/bcd.h /usr/src/debug/qemu/10.0.6/trace/trace-ui.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.0.6/trace/trace-ui.h /usr/src/debug/qemu/10.0.6/qapi/qapi-features.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_char.h /usr/src/debug/qemu/10.0.6/target/arm/cpu-features.h /usr/src/debug/qemu/10.0.6/trace/trace-io.c /usr/src/debug/qemu/10.0.6/include/exec/address-spaces.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_char.c /u
 sr/src/debug/qemu/10.0.6/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.0.6/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.0.6/include/qemu/hbitmap.h /usr/src/debug/qemu/10.0.6/trace/trace-io.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.0.6/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.0.6/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.0.6/include/system/block-backend-common.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.0.6/include/hw/i386/microvm.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.0.6/include/qapi/type-helpers.h /usr/src/debug/qemu/10.0.6/trace/event-internal.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10
 .0.6/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.0.6/include/qemu/futex.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.0.6/include/exec/ramlist.h /usr/src/debug/qemu/10.0.6/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.0.6/include/qemu/queue.h /usr/src/debug/qemu/10.0.6/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.0.6/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.0.6/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.0.6/include/system/cpu-timers.h /usr/src/debug/qemu/10.0.6/include/exec/cpu_ldst.h /usr/src/debug/qemu/10.0.6/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.0.6/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_isa.h /usr/src/debug/qemu/10.0.6/include/syste
 m/hostmem.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_isa.c /usr/src/debug/qemu/10.0.6/include/system/cryptodev.h /usr/src/debug/qemu/10.0.6/include/qemu/cpuid.h /usr/src/debug/qemu/10.0.6/include/qemu/timer.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.0.6/include/qemu/progress_meter.h /usr/src/debug/qemu/10.0.6/include/exec/translation-block.h /usr/src/debug/qemu/10.0.6/include/qemu/timed-average.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine-target.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.0.6/include/qemu/sockets.h /usr/src/debug/qemu/10.0.6/include/qemu/id.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.0.6/includ
 e/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.0.6/include/hw/i386/pc.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386.h /usr/src/debug/qemu/10.0.6/include/qemu/main-loop.h /usr/src/debug/qemu/10.0.6/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.0.6/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.0.6/include/qemu/accel.h /usr/src/debug/qemu/10.0.6/include/qemu/config-file.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.0.6/include/exec/gdbstub.h /usr/src/debug/qemu/10.0.6/include/qemu/osdep.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-emit-events.h /usr/s
 rc/debug/qemu/10.0.6/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.0.6/trace/trace-gdbstub.h /usr/src/debug/qemu/10.0.6/qapi/qapi-emit-events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.0.6/trace/trace-gdbstub.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.0.6/include/qemu/iova-tree.h /usr/src/debug/qemu/10.0.6/include/hw/i386/apic.h /usr/src/debug/qemu/10.0.6/include/qemu/module.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_ide.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.0.6/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ide.c /usr/src/debug/qemu/10.0.6/
 include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.0.6/include/qemu/bitops.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.0.6/include/qemu/readline.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.0.6/trace/trace-migration.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.0.6/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.0.6/trace/trace-migration.c /usr/src/debug/qemu/10.0.6/target/arm/multiprocessing.h /usr/src/debug/qemu/10.0.6/target/arm/cpregs.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_net.h /usr/src/debug/q
 emu/10.0.6/include/hw/char/parallel.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-hw_net.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.0.6/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.0.6/include/qemu/dbus.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.0.6/include/qemu/qemu-print.h /usr/src/debug/qemu/10.0.6/include/qemu/bswap.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.0.6/include/exec/target_page.h /usr/src/debug/qemu/10.0.6/include/system/host_iommu_device.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_mips.c /usr/src/debug/qemu/10.0.6/include/qemu/yank.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_mips.h /usr/src/debug/qemu/10.0.6/
 qapi/qapi-types-replay.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.0.6/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.0.6/include/qemu/range.h /usr/src/debug/qemu/10.0.6/trace/trace-root.c /usr/src/debug/qemu/10.0.6/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.0.6/trace/trace-root.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.0.6/include/system/kvm.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.0.6/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.0.6/include/qemu/atomic.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qom.h /usr/src/debug/qem
 u/10.0.6/include/system/dump-arch.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.0.6/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.0.6/include/qemu/xxhash.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.0.6/include/qemu/bitmap.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.0.6/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.0.6/include/hw/char/serial-isa.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.0.6/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.0.6/include/hw
 /misc/npcm7xx_rng.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-job.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-net.h /usr/src/debug/qemu/10.0.6/trace/trace-target_riscv.c /usr/src/debug/qemu/10.0.6/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.0.6/trace/trace-target_riscv.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-job.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-net.c /usr/src/debug/qemu/10.0.6/include/exec/plugin-gen.h /usr/src/debug/qemu/10.0.6/include/exec/translator.h /usr/src/debug/qemu/10.0.6/include/qemu/defer-call.h /usr/src/debug/qemu/10.0.6/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.0.6/include/qemu/lockable.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.0.6/include/qemu/crc32c.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.0
 .6/include/hw/i386/apic_internal.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-dump.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.0.6/include/qemu/uuid.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.0.6/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_virtio_t
 race_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_remote.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.0.6/include/qapi/compat-policy.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_remote.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-char.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-t
 ypes-qdev.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-char.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-target_arm.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_mem.h /usr/src/debug/qemu/10.0.6/trace/trace-target_arm.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_mem.c /usr/src/debug/qemu/10.0.6/include/exe
 c/page-protection.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-char.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-char.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.0.6/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.0.6/include/system/tpm.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.0.6/hw/vfio/pci.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386_kvm.h /usr/src/debug/qe
 mu/10.0.6/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.0.6/include/hw/char/pl011.h /usr/src/debug/qemu/10.0.6/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.0.6/include/qemu/cpu-float.h /usr/src/debug/qemu/10.0.6/include/qemu/madvise.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-misc-target.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.0.6/include/qemu/hw-version.h /usr/src/debug/qemu/10.0.6/include/system/runstate.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-misc-target.h /usr/src/debug/qemu/10.0.6/include/system/tpm_backend.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_machine_target_trace_events.c /usr/src/debug/qemu/10.0.6/include/system/block-backend-io.h /usr/src/debug/qemu/10.0.6/include/qapi/qmp-registry.h /u
 sr/src/debug/qemu/10.0.6/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.0.6/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_machine_target_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.0.6/trace/trace-linux_user.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.0.6/trace/trace-linux_user.h /usr/src/debug/qemu/10.0.6/include/system/arch_init.h /usr/src/debug/qemu/10.0.6/target/riscv/pmp.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.0.6/target/riscv/cpu.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.0.6/include/qemu/selfmap.h /usr/src/debug/qemu/10.0.6/include/qemu/seqlock.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-replay.h /us
 r/src/debug/qemu/10.0.6/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.0.6/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.0.6/include/qemu/job.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_adc.h /usr/src/debug/qemu/10.0.6/trace/trace-target_ppc.h /usr/src/debug/qemu/10.0.6/include/qemu/iov.h /usr/src/debug/qemu/10.0.6/include/qemu/thread-context.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-machine-target.c /usr/src/debug/qemu/10.0.6/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_adc.c /usr/src/debug/qemu/10.0.6/trace/trace-target_ppc.c /usr/src/debug/qemu/10.0.6/trace/trace-chardev.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.0.6/include/system/seccomp.h /usr/src/debug/qemu/10.0.6/trace/trace-chardev.c /usr/src/debug/qemu/10.0.6/include/qemu/event_notifier.h /usr/src/debug/qemu/10.0.6/include/qemu/
 async-teardown.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.0.6/include/system/tcg.h /usr/src/debug/qemu/10.0.6/include/qapi/qmp-event.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.0.6/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.0.6/include/system/dirtylimit.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.0.6/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.0.6/include/exec/replay-core.h /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-
 block.c /usr/src/debug/qemu/10.0.6/include/system/device_tree.h /usr/src/debug/qemu/10.0.6/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_arm.c /usr/src/debug/qemu/10.0.6/include/system/iommufd.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_arm.h /usr/src/debug/qemu/10.0.6/trace/control-internal.h /usr/src/debug/qemu/10.0.6/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.0.6/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-job.h /usr/src/debug/qemu/10.0.6/include/system/watchdog.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.0.6/trace/trace-system.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-job.c /usr/src/debug/qemu/10.0.6/include/hw/riscv/spike.h /usr/src/debug/qemu/10.0.6/trace/trace-system.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.0.6/include/system/cpu-throttle.h /usr/src/debug/qemu/10.0.6
 /include/qemu/qemu-progress.h /usr/src/debug/qemu/10.0.6/include/system/balloon.h /usr/src/debug/qemu/10.0.6/include/system/kvm_xen.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.0.6/include/system/kvm_int.h /usr/src/debug/qemu/10.0.6/include/system/xen.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.0.6/include/qapi/util.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.0.6/hw/i386/acpi-build.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_misc_target_trace_events.h /usr/src/debug/
 qemu/10.0.6/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_misc_target_trace_events.c /usr/src/debug/qemu/10.0.6/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.0.6/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.0.6/include/qemu/host-utils.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine-target.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-ui.c /usr/src/debug/
 qemu/10.0.6/include/qemu/envlist.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine-target.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.0.6/include/qemu/fifo32.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.0.6/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.0.6/hw/ppc/e500-ccsr.h /usr/src/debug/qemu/10.0.6/include/system/dma.h /usr/src/debug/qemu/10.0.6/include/hw/misc/led.h /usr/src/debug/qemu/10.0.6/include/hw/misc/tz-mpc.h /usr/src/debug
 /qemu/10.0.6/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.0.6/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-error.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.0.6/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.0.6/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.0.6/include/exec/cputlb.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.0.6/include/exec/memory.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events
 .c /usr/src/debug/qemu/10.0.6/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/unimp.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/boot.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/numa.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/virt.h /usr/src/debug/qemu/10.0.6/include/qemu/thread.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.0.6/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-misc-target.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-types-misc-target.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine-target.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-event
 s-migration.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.0.6/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.0.6/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-common.c /usr/src/debug/qemu/10.0.6/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.0.6/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-common.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.0.6/target/arm/idau.h /usr/src/debug/qemu/10.0.6/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-control.h /usr/src/debug/qemu/
 10.0.6/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-error.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.0.6/include/qemu/transactions.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.0.6/include/qemu/ratelimit.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.0.6/include/system/accel-ops.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.0.6/include/qemu/throttle.h /usr/src/debug/qemu/10.0.6/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.0.6/qapi/qap
 i-events-block.h /usr/src/debug/qemu/10.0.6/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.0.6/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.0.6/include/system/memory_mapping.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc-target.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc-target.h /usr/src/debug/qemu/10.0.6/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.0.6/include/qemu/notify.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc-target.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_usb.c /usr/src/debug/qemu/10.0.6/target/arm/internals.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_usb.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.0.6/trace/tra
 ce-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.0.6/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.0.6/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/arm/digic.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.0.6/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.0.6/include/system/qtest.h /usr/src/debug/qemu/10.0.6/include/system/reset.h /usr/src/debug/qemu/10.0.6/include/system/stats.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine-target.h /usr/src/debug/qemu/10.0.6/trace/trace-audio.c /usr/src/debug/qemu/10.0.6/include/qemu/memalign.h /usr/src/debug/qemu/10.0.6/include/exec/memattrs.h /usr/src/debug/qemu/10.0.6/include/exec/memopidx.h /usr/src/debug/qemu/10.0.6/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.0.6/include/system/rtc.h /usr/src/d
 ebug/qemu/10.0.6/qapi/qapi-types-machine-target.c /usr/src/debug/qemu/10.0.6/trace/trace-audio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.0.6/include/exec/tlb-common.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.0.6/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.0.6/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-misc-target.c /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.0.6/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.0.6/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.0.6/include/qemu/cacheflush.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_co
 re_trace_events.h /usr/src/debug/qemu/10.0.6/include/qemu/chardev_open.h /usr/src/debug/qemu/10.0.6/include/qemu/qht.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.0.6/include/qemu/coroutine_int.h /usr/src/debug/qemu/10.0.6/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.0.6/include/qemu/cutils.h /usr/src/debug/qemu/10.0.6/include/qemu/coroutine.h /usr/src/debug/qemu/10.0.6/include/system/hw_accel.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.0.6/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.0.6/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.0.6/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.0.6/include/exec/target_long.h /usr/src/debug/qemu/10.0.6/include/hw/misc/armsse-mhu.h /usr/src/debug/q
 emu/10.0.6/include/hw/i386/vmport.h /usr/src/debug/qemu/10.0.6/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.0.6/include/system/spdm-socket.h /usr/src/debug/qemu/10.0.6/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.0.6/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi.h /usr/src/debug/qemu/10.0.6/include/qemu/interval-tree.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.0.6/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.0.6/include/exec/memop.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.0.6/trace/control.h /usr/src/debug/qemu/10.0.6/include/exec/vaddr.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cxl.c /usr/src/deb
 ug/qemu/10.0.6/include/qemu/typedefs.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-control.h /usr/src/debug/qemu/10.0.6/trace/trace-block.c /usr/src/debug/qemu/10.0.6/trace/trace-block.h /usr/src/debug/qemu/10.0.6/include/exec/ram_addr.h /usr/src/debug/qemu/10.0.6/include/exec/ramblock.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-control.c /usr/src/debug/qemu/10.0.6/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.0.6/include/qemu/plugin.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.0.6/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.0.6/include/exec/breakpoint.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.0.6/include/qemu/qemu-plugin.h /usr
 /src/debug/qemu/10.0.6/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.0.6/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.0.6/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.0.6/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-net.c /usr/src/debug/qemu/10.0.6/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.0.6/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.0.6/include/qemu/fifo8.h /usr/src/debug/qemu/10.0.6/include/qemu/path.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-net.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.0.6/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspee
 d_scu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.0.6/target/arm/gtimer.h /usr/src/debug/qemu/10.0.6/include/hw/i386/topology.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.0.6/include/qemu/plugin-event.h /usr/src/debug/qemu/10.0.6/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.0.6/include/system/iothread.h /usr/src/debug/qemu/10.0.6/qapi/qapi-introspect.h /usr/src/debug/qemu/10.0.6/target/arm/syndrome.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.0.6/include/qemu/qsp.h /usr/src/debug/qemu/10.0.6/qapi/qapi-introspect.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_dis
 play.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_display.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.0.6/include/system/numa.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-net.h /usr/src/debug/qemu/10.0.6/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.0.6/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine-target.trace-events /usr/src/debug/qemu/10.0.6/qap
 i/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.0.6/target/arm/cpu.h /usr/src/debug/qemu/10.0.6/trace/trace-net.c /usr/src/debug/qemu/10.0.6/include/system/rng.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_misc.h /usr/src/debug/qemu/10.0.6/trace/trace-backends.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.0.6/trace/trace-backends.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_misc.c /usr/src/debug/qemu/10.0.6/include/system/os-posix.h /usr/src/debug/qemu/10.0.6/target/riscv/pmu.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.0.6/trace/trace-monitor.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.0.6/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.0.6/trace/trace-monitor.h /usr/src/debug/qemu/
 10.0.6/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.0.6/include/hw/arm/boot.h /usr/src/debug/qemu/10.0.6/include/system/replay.h /usr/src/debug/qemu/10.0.6/include/system/system.h /usr/src/debug/qemu/10.0.6/include/system/event-loop-base.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.0.6/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.0.6/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_sd.h /usr/src/debug/qemu
 /10.0.6/include/system/cpus.h /usr/src/debug/qemu/10.0.6/include/qemu/int128.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_sd.c /usr/src/debug/qemu/10.0.6/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.0.6/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.0.6/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.0.6/
 include/system/blockdev.h /usr/src/debug/qemu/10.0.6/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.0.6/include/exec/tb-flush.h /usr/src/debug/qemu/10.0.6/include/system/accel-blocker.h /usr/src/debug/qemu/10.0.6/include/qemu/error-report.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_pci.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.0.6/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_pci.c /usr/src/debug/qemu/10.0.6/include/qapi/error.h /usr/src/debug/qemu/10.0.6/include/qemu/datadir.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-tpm.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.0.6/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_com
 mands_pci_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.0.6/include/qemu/lockcnt.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.0.6/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.0.6/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.0
 .6/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.0.6/include/hw/arm/omap.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.0.6/include/hw/arm/virt.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.0.6/trace/trace-scsi.c /usr/src/debug/qemu/10.0.6/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.0.6/include/qemu/rcu.h /usr/src/debug/qemu/10.0.6/trace/trace-authz.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-scsi.h /usr/src/debug/qemu/10.0.6/trace/trace-authz.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.0.6/include/qemu/pmem.h /usr/src/debug/qemu/10.0.6/
 trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.0.6/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.0.6/target/arm/cpu-qom.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.0.6/include/qemu/option.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.0.6/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.0.6/include/exec/log.h /usr/src/debug/qemu/10.0.6/include/hw/arm/armsse.h /usr/src/debug/qemu/10.0.6/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.0.6/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.0.6/include/qemu/log.h /usr/src/debug/qemu/10.0.6/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.0.6/trace/trace-qom.c /usr/src/debug/qemu/10.0.6/trace/trace-util.h /usr/src/d
 ebug/qemu/10.0.6/include/qemu/memfd.h /usr/src/debug/qemu/10.0.6/trace/trace-qom.h /usr/src/debug/qemu/10.0.6/trace/trace-util.c /usr/src/debug/qemu/10.0.6/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.0.6/include/system/runstate-action.h /usr/src/debug/qemu/10.0.6/trace/trace-target_i386.c /usr/src/debug/qemu/10.0.6/trace/trace-target_i386.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.0.6/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.0.6/include/system/dirtyrate.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.0.6/include/qemu/guest-random.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.0.6/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.0.6/include/qemu/systemd.h /usr/src/debug/qemu/10.0.6/include/qemu/option_int.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.0.6/inclu
 de/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.0.6/include/qemu/help_option.h", added "/usr/src/debug/qemu/10.1.2/trace/trace-chardev.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-accelerator.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc-arm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.1.2/include/system/seccomp.h /usr/src/debug/qemu/10.1.2/trace/trace-chardev.c /usr/src/debug/qemu/10.1.2/include/qemu/event_notifier.h /usr/src/debug/qemu/10.1.2/include/qemu/async-teardown.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-accelerator.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc-arm.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.1.2/include/system/tcg.h /usr/src/debug/qemu/10.1.2/include/qapi/qmp-event.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10
 .1.2/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-migration.h /usr/src/debug/qemu/10.1.2/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.1.2/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.1.2/include/system/dirtylimit.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.1.2/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.1.2/include/exec/replay-core.h /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.1.2/include/system/device_tree.h /usr/src/debug/qemu/10.1.2/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_arm.c /usr/src/deb
 ug/qemu/10.1.2/include/system/iommufd.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_arm.h /usr/src/debug/qemu/10.1.2/trace/control-internal.h /usr/src/debug/qemu/10.1.2/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.1.2/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-job.h /usr/src/debug/qemu/10.1.2/include/system/watchdog.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.1.2/trace/trace-system.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-job.c /usr/src/debug/qemu/10.1.2/include/hw/riscv/spike.h /usr/src/debug/qemu/10.1.2/trace/trace-system.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.1.2/include/system/cpu-throttle.h /usr/src/debug/qemu/10.1.2/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.1.2/include/system/balloon.h /usr/src/debug/qemu/10.1.2/include/system/kvm_xen.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.1.2/include/system/kvm_int.h /usr/src/deb
 ug/qemu/10.1.2/include/system/xen.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-device.h /usr/src/debug/qemu/10.1.2/include/qapi/util.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.1.2/hw/i386/acpi-build.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.1.2/include/accel/tcg/cpu-ldst-common.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.1.2/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.1.2/include/hw/char/cms
 dk-apb-uart.h /usr/src/debug/qemu/10.1.2/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.1.2/include/qemu/host-utils.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-accelerator.c /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-accelerator.h /usr/src/debug/qemu/10.1.2/include/system/address-spaces.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.1.2/include/accel/accel-ops.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.1.2/include/qemu/envlist.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.1.2/qapi/qapi-com
 mands-run-state.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.1.2/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.1.2/include/qemu/fifo32.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.1.2/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.1.2/include/system/dma.h /usr/src/debug/qemu/10.1.2/include/hw/misc/led.h /usr/src/debug/qemu/10.1.2/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.1.2/include/hw/i386/hostm
 em-epc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-error.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.1.2/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.1.2/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.1.2/include/exec/cputlb.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/unimp.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/boot.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/numa.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/virt.h /usr/src/debug/qemu/10.1.2
 /include/qemu/thread.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.1.2/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-container.h /usr/src/debug/qemu/10.1.2/include/accel/accel-cpu-ops.h /usr/src/debug/qemu/10.1.2/include/hw/arm/max78000_soc.h /usr/src/debug/qemu/10.1.2/target/riscv/time_helper.h /usr/src/debug/qemu/10.1.2/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.1.2/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-pmc-iou-
 slcr.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-common.c /usr/src/debug/qemu/10.1.2/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.1.2/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.1.2/accel/dummy-cpus.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine-s390x.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-common.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine-s390x.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.1.2/hw/vfio-user/proxy.h /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.1.2/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.1.2/target/arm/idau.h /usr/src/debug/qemu/10.1.2/trace
 /trace-hw_i386_xen.c /usr/src/debug/qemu/10.1.2/include/qemu/target-info-impl.h /usr/src/debug/qemu/10.1.2/include/qemu/target-info-qapi.h /usr/src/debug/qemu/10.1.2/include/system/memory.h /usr/src/debug/qemu/10.1.2/include/system/replay.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.1.2/include/hw/misc/max78000_aes.h /usr/src/debug/qemu/10.1.2/include/hw/misc/max78000_gcr.h /usr/src/debug/qemu/10.1.2/include/hw/misc/max78000_icc.h /usr/src/debug/qemu/10.1.2/include/qemu/transactions.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.1.2/include/qemu/ratelimit.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.1.2/include/qemu/throttle.h /usr/src/debug/qemu/10.
 1.2/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block.h /usr/src/debug/qemu/10.1.2/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.1.2/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.1.2/include/system/memory_mapping.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.1.2/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.1.2/include/qemu/notify.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_usb.c /usr/src/debug/qemu/10.1.2/target/arm/internals.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_usb.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.1.2/include/exec/memory_ldst_phys.h.inc /usr/src/debu
 g/qemu/10.1.2/qapi/qapi-commands-machine-s390x.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.1.2/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/arm/digic.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.1.2/include/system/qtest.h /usr/src/debug/qemu/10.1.2/include/system/reset.h /usr/src/debug/qemu/10.1.2/include/system/stats.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-i386.h /usr/src/debug/qemu/10.1.2/trace/trace-audio.c /usr/src/debug/qemu/10.1.2/include/exec/memattrs.h /usr/src/debug/qemu/10.1.2/include/exec/memopidx.h /usr/src/debug/qemu/10.1.2/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.1.2/include/qemu/memalign.h /usr/src/debug/qemu/10.1.2/include/system/rtc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-i386.c
  /usr/src/debug/qemu/10.1.2/trace/trace-audio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.1.2/include/hw/misc/max78000_trng.h /usr/src/debug/qemu/10.1.2/include/exec/tlb-common.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.1.2/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.1.2/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.1.2/hw/vfio/vfio-display.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.1.2/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.1.2/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.1.2/include/qemu/cacheflush.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_
 core_trace_events.h /usr/src/debug/qemu/10.1.2/include/qemu/chardev_open.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.1.2/include/qemu/qht.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.1.2/include/qemu/coroutine_int.h /usr/src/debug/qemu/10.1.2/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.1.2/include/qemu/cutils.h /usr/src/debug/qemu/10.1.2/include/qemu/coroutine.h /usr/src/debug/qemu/10.1.2/include/system/hw_accel.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.1.2/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.1.2/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.1.2/include/accel/tcg/cpu-mmu-index.h /usr/src/debug/qemu/10.1.2/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/s390x/storage-keys.h /usr/src/de
 bug/qemu/10.1.2/include/exec/target_long.h /usr/src/debug/qemu/10.1.2/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.1.2/include/hw/i386/vmport.h /usr/src/debug/qemu/10.1.2/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.1.2/include/qemu/target-info.h /usr/src/debug/qemu/10.1.2/include/system/spdm-socket.h /usr/src/debug/qemu/10.1.2/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.1.2/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi.h /usr/src/debug/qemu/10.1.2/include/qemu/interval-tree.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.1.2/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.1.2/include/exec/memop.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.1.2/trace/control.h /usr/src/debug/qemu/10.1.2/include/exec/vaddr.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-cxl.h /us
 r/src/debug/qemu/10.1.2/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.1.2/include/qemu/typedefs.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-control.h /usr/src/debug/qemu/10.1.2/trace/trace-block.c /usr/src/debug/qemu/10.1.2/target/i386/kvm/tdx-quote-generator.h /usr/src/debug/qemu/10.1.2/trace/trace-block.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-control.c /usr/src/debug/qemu/10.1.2/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.1.2/include/qemu/plugin.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.1.2/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.1.2/include/exec/breakpoint.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.1.2/q
 api/qapi-events-block-core.c /usr/src/debug/qemu/10.1.2/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.1.2/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.1.2/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.1.2/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-net.c /usr/src/debug/qemu/10.1.2/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.1.2/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.1.2/include/qemu/fifo8.h /usr/src/debug/qemu/10.1.2/include/qemu/path.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-accelerator.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-net.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-a10-dramc.h /usr/src/debu
 g/qemu/10.1.2/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.1.2/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.1.2/target/arm/gtimer.h /usr/src/debug/qemu/10.1.2/include/hw/i386/topology.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.1.2/include/qemu/plugin-event.h /usr/src/debug/qemu/10.1.2/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.1.2/include/system/iothread.h /usr/src/debug/qemu/10.1.2/qapi/qapi-introspect.h /usr/src/debug/qemu/10.1.2/target/arm/syndrome.h /usr/src/debug/qemu/10.1.2/qapi/qapi-command
 s-block-export.h /usr/src/debug/qemu/10.1.2/include/qemu/qsp.h /usr/src/debug/qemu/10.1.2/qapi/qapi-introspect.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_display.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_arm_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_display.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_arm_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.1.2/include/system/numa.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-net.h /usr/src/debug/qemu/10.1.2/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/arm/bcm2838_peripherals.h /usr/src/d
 ebug/qemu/10.1.2/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.1.2/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.1.2/target/arm/cpu.h /usr/src/debug/qemu/10.1.2/target/sh4/cpu.h /usr/src/debug/qemu/10.1.2/trace/trace-net.c /usr/src/debug/qemu/10.1.2/include/system/rng.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_misc.h /usr/src/debug/qemu/10.1.2/trace/trace-backends.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.1.2/include/exec/mmap-lock.h /usr/src/debug/qemu/10.1.2/trace/trace-backends.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_misc.c /usr/src/debug/qemu/10.1.2/include/system/os-posix.h /usr/src/debug/qemu/10.1.2/target/riscv/pmu.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.1.2/qapi/qapi-c
 ommands-cryptodev.c /usr/src/debug/qemu/10.1.2/trace/trace-monitor.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.1.2/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.1.2/trace/trace-monitor.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.1.2/include/hw/arm/boot.h /usr/src/debug/qemu/10.1.2/include/system/event-loop-base.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.1.2/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.1.2/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/iommu.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-authz.h /usr/sr
 c/debug/qemu/10.1.2/qapi/qapi-visit-block.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_sd.h /usr/src/debug/qemu/10.1.2/include/system/cpus.h /usr/src/debug/qemu/10.1.2/include/qemu/int128.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_sd.c /usr/src/debug/qemu/10.1.2/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-arm.trace-events /usr/src/debug/qemu/10.1.2/include/standard-headers/uefi/uefi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-common.c /u
 sr/src/debug/qemu/10.1.2/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.1.2/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.1.2/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.1.2/include/system/blockdev.h /usr/src/debug/qemu/10.1.2/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.1.2/include/exec/tb-flush.h /usr/src/debug/qemu/10.1.2/include/system/accel-blocker.h /usr/src/debug/qemu/10.1.2/include/qemu/error-report.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_pci.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.1.2/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_pci.c /usr/src/debug/qemu/10.1.2/include/
 qapi/error.h /usr/src/debug/qemu/10.1.2/include/qemu/datadir.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-tpm.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.1.2/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.1.2/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.1.2/include/qemu/lockcnt.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.1.2/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_machine_s390x_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_pci_trace_events.
 c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_machine_s390x_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.1.2/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.1.2/include/hw/arm/omap.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.1.2/include/hw/arm/virt.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.1.2/hw/vfio-user/container.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.1.2/trace/trace-scsi.c /usr/src/debug/qemu/10.1.2/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.1.2/include/qemu/rcu.h /usr/src/debug/qemu/
 10.1.2/trace/trace-authz.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-scsi.h /usr/src/debug/qemu/10.1.2/trace/trace-authz.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.1.2/include/qemu/pmem.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.1.2/target/arm/cpu-qom.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.1.2/include/qemu/option.h /usr/src/debug/qemu/10.1.2/include/system/system.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.1.2/include/exec/log.h /usr/src/debug/qemu/10.1.2/include/hw/arm/armsse.h /usr/src/debug/qemu/10.1.2/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.1.2/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.1.2/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.1.2/include/qemu/log.h /usr/src/debug/qemu/10.1.2/include/system/
 ioport.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.1.2/trace/trace-qom.c /usr/src/debug/qemu/10.1.2/trace/trace-util.h /usr/src/debug/qemu/10.1.2/include/qemu/memfd.h /usr/src/debug/qemu/10.1.2/trace/trace-qom.h /usr/src/debug/qemu/10.1.2/include/hw/char/max78000_uart.h /usr/src/debug/qemu/10.1.2/trace/trace-util.c /usr/src/debug/qemu/10.1.2/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.1.2/include/system/runstate-action.h /usr/src/debug/qemu/10.1.2/trace/trace-target_i386.c /usr/src/debug/qemu/10.1.2/trace/trace-target_i386.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.1.2/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.1.2/include/system/dirtyrate.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-trace.trace-events /usr/src/deb
 ug/qemu/10.1.2/include/qemu/guest-random.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.1.2/hw/vfio-user/device.h /usr/src/debug/qemu/10.1.2/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/tb-cpu-state.h /usr/src/debug/qemu/10.1.2/include/qemu/option_int.h /usr/src/debug/qemu/10.1.2/include/qemu/systemd.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc-i386.c /usr/src/debug/qemu/10.1.2/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.1.2/include/qemu/help_option.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc-i386.h /usr/src/debug/qemu/10.1.2/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.1.2/include/system/igvm-cfg.h /usr/src/debug/qemu/10.1.2/include/exec/tswap.h /usr/src/debug/qemu/10.1.2/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine-s390x.h /usr/src/debug/qemu/10.1.2/trace/tr
 ace-hw_pci_host.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine-s390x.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.1.2/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.1.2/include/qemu/thread-posix.h /usr/src/debug/qemu/10.1.2/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-nbd.h /usr/src/debug/qemu/10.1.2/trace/trace-nbd.c /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.1.2/include/exec/cpu-common.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.1.2/include/h
 w/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.1.2/include/qemu/base64.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.1.2/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.1.2/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.1.2/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.1.2/include/system/dump.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_accelerator_trace_events.h /usr/src/debug/qemu/10.1.2/include/system/tpm_util.h /usr/src/debug/qemu/10.1.2/include/qemu/unicode.h /usr/src/debug/qemu/10.1.2/trace/trace-
 qapi_commands_accelerator_trace_events.c /usr/src/debug/qemu/10.1.2/include/qemu/keyval.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.1.2/include/system/xen-mapcache.h /usr/src/debug/qemu/10.1.2/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.1.2/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.1.2/include/hw/char/serial.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.1.2/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.1.2/include/qemu/qdist.h /usr/src/debug/qemu/10.1.2/include/qapi/visitor.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-bloc
 k-core.h /usr/src/debug/qemu/10.1.2/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_intc.c /usr/src/debug/qemu/10.1.2/include/qemu/mprotect.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_intc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.1.2/include/exec/hwaddr.h /usr/src/debug/qemu/10.1.2/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.1.2/include/exec/watchpoint.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_dma.c /usr/src/debug/qemu/10.1.2/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_dma.h /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.1.2/include/exec/page-vary.h /usr/src/debug/qemu/10.1.2/include/hw/i386/x86.h /usr/src/debug/qemu/10.1.2/include/qemu/stats64.h /usr/src/debug/qemu/10.1.2/includ
 e/hw/vfio/vfio-region.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_core.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_core.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_audio.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_block.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_input.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_timer.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_xen.c /usr/src/debug/qemu/10
 .1.2/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_audio.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_block.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_input.c /usr/src/debug/qemu/10.1.2/include/system/ramblock.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.1.2/include/system/rng-random.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_timer.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_xen.h /usr/src/debug/qemu/10.1.2/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.1.2/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_p
 ci_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc-i386.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/helper-retaddr.h /usr/src/debug/qemu/10.1.2/include/qemu/buffer.h /usr/src/debug/qemu/10.1.2/include/qemu/drm.h /usr/src/debug/qemu/10.1.2/include/qemu/reserved-region.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc-i386.c /usr/src/debug/qemu/10.1.2/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.1
 .2/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.1.2/include/qemu/qtree.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.1.2/hw/vfio/vfio-listener.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.1.2/include/exec/icount.h /usr/src/debug/qemu/10.1.2/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.1.2/include/qemu/filemonitor.h /usr/src/debug/qemu/10.1.2/include/exec/abi_ptr.h /usr/src/debug/qemu/10.1.2/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.1.2/include/hw/char/escc.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.1.2/include/qemu/bcd.h /usr/src/debug/qemu/10.1.2/trace/trace-ui.c /usr/src/debug/qemu/10.1.2/include/hw/r
 iscv/xiangshan_kmh.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.1.2/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.1.2/trace/trace-ui.h /usr/src/debug/qemu/10.1.2/qapi/qapi-features.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_char.h /usr/src/debug/qemu/10.1.2/target/arm/cpu-features.h /usr/src/debug/qemu/10.1.2/trace/trace-io.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_char.c /usr/src/debug/qemu/10.1.2/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.1.2/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.1.2/include/qemu/hbitmap.h /usr/src/debug/qemu/10.1.2/trace/trace-io.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-sockets.c /usr/src/d
 ebug/qemu/10.1.2/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.1.2/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.1.2/include/system/block-backend-common.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.1.2/include/hw/i386/microvm.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.1.2/include/qapi/type-helpers.h /usr/src/debug/qemu/10.1.2/trace/event-internal.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.1.2/include/qemu/futex.h /usr/src/debug/qemu/10.1.2/nbd/nbd-internal.h /usr/src/debug/qemu/10.1.2/include/exec/ramlist.h /usr/src/
 debug/qemu/10.1.2/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.1.2/include/qemu/queue.h /usr/src/debug/qemu/10.1.2/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/cpu-ldst.h /usr/src/debug/qemu/10.1.2/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.1.2/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.1.2/include/system/cpu-timers.h /usr/src/debug/qemu/10.1.2/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.1.2/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_isa.h /usr/src/debug/qemu/10.1.2/include/system/hostmem.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_isa.c /usr/src/debug/qemu/10.1.2/include/system/cryptodev.h /usr/src/debug/qemu/10.1.2/include/qemu/cpuid.h /usr/src/debug/qemu/10.1.2/include/qemu/timer.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.1.2/include/qemu/progress_meter.h /usr/src/debug/qemu/10.1.2/include/exec
 /translation-block.h /usr/src/debug/qemu/10.1.2/include/qemu/timed-average.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.1.2/include/qemu/sockets.h /usr/src/debug/qemu/10.1.2/target/i386/kvm/tdx.h /usr/src/debug/qemu/10.1.2/include/qemu/id.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.1.2/include/qapi/error-internal.h /usr/src/debug/qemu/10.1.2/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.1.2/include/hw/i386/pc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-dump.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386.h /usr/src/debug/qemu/10.1.2/include/qemu/main-loop
 .h /usr/src/debug/qemu/10.1.2/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.1.2/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.1.2/include/qemu/accel.h /usr/src/debug/qemu/10.1.2/include/qemu/config-file.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/probe.h /usr/src/debug/qemu/10.1.2/include/exec/gdbstub.h /usr/src/debug/qemu/10.1.2/include/qemu/osdep.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-pci.c /usr/src/debug
 /qemu/10.1.2/trace/trace-gdbstub.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.1.2/trace/trace-gdbstub.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine-s390x.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.1.2/include/qemu/iova-tree.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine-s390x.c /usr/src/debug/qemu/10.1.2/include/hw/i386/apic.h /usr/src/debug/qemu/10.1.2/include/hw/i386/tdvf.h /usr/src/debug/qemu/10.1.2/include/qemu/module.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_ide.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.1.2/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ide.c /usr/src/debug/qemu/10.1.2
 /include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.1.2/include/qemu/bitops.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.1.2/include/qemu/readline.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.1.2/trace/trace-migration.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.1.2/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_i386_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.1.2/trace/trace-migration.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_i386_trace_events.h /usr/src/debug/qemu/10.1.2/target/arm/multiprocessing.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_com
 mands_transaction_trace_events.c /usr/src/debug/qemu/10.1.2/target/arm/cpregs.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_net.h /usr/src/debug/qemu/10.1.2/hw/i386/tdvf-hob.h /usr/src/debug/qemu/10.1.2/include/hw/char/parallel.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-hw_net.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.1.2/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.1.2/include/qemu/dbus.h /usr/src/debug/qemu/10.1.2/include/qemu/qemu-print.h /usr/src/debug/qemu/10.1.2/include/qemu/bswap.h /usr/src/debug/qemu/10.1.2/include/system/hvf.h /usr/src/debug/qemu/10.1.2/include/exec/target_page.h /usr/src/debug/qemu/10.1.2/include/system/host_iommu_device.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_mips.c /usr/src/debug/qemu/10.1.2/include/qemu/yank.h /usr/src/debug/qemu/10.1.2/qapi/qapi-
 visit-cryptodev.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_mips.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.1.2/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.1.2/include/qemu/range.h /usr/src/debug/qemu/10.1.2/trace/trace-root.c /usr/src/debug/qemu/10.1.2/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.1.2/trace/trace-root.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc-arm.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.1.2/include/system/kvm.h /usr/src/debug/qemu/10.1.2/q
 api/qapi-types-misc-arm.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.1.2/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.1.2/include/qemu/atomic.h /usr/src/debug/qemu/10.1.2/include/qemu/host-pci-mmio.h /usr/src/debug/qemu/10.1.2/include/system/dump-arch.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-i386.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.1.2/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.1.2/include/qemu/xxhash.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.1.2/include/qemu/bitmap.h /usr/src/debug/qemu/10.
 1.2/qapi/qapi-types-accelerator.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.1.2/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-accelerator.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.1.2/include/hw/char/serial-isa.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.1.2/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-job.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-net.h /usr/src/debug/qemu/10.1.2/trace/trace-target_riscv.c /usr/src/debug/qemu/10.1.2/include/qemu/vhost-user-
 server.h /usr/src/debug/qemu/10.1.2/trace/trace-target_riscv.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-job.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-net.c /usr/src/debug/qemu/10.1.2/include/exec/plugin-gen.h /usr/src/debug/qemu/10.1.2/include/exec/translator.h /usr/src/debug/qemu/10.1.2/include/qemu/defer-call.h /usr/src/debug/qemu/10.1.2/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.1.2/include/accel/accel-cpu.h /usr/src/debug/qemu/10.1.2/include/qemu/lockable.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.1.2/include/qemu/crc32c.h /usr/src/debug/qemu/10.1.2/common-user/plugin-api.c.inc /usr/src/debug/qemu/10.1.2/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.1.2/include/hw/i386/apic_internal.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-vis
 it-qdev.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-error.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.1.2/include/qemu/uuid.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-arm.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-arm.c /usr/src/debug/qemu/10.1.2/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/deb
 ug/qemu/10.1.2/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_remote.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.1.2/include/qapi/compat-policy.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_remote.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-char.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-vf
 io.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-char.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_vfio_user.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-target_arm.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_mem.h /usr/src/debug/qemu/10.1.2/target/riscv/cpu_cfg_fields.h.inc /usr/src/debug/qemu/10.1.2/trace/trace-hw_vfio_user.h /usr/src/debug/qemu/10.1.2/trace/trace-target_arm.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_mem.c /usr/src/debug/qemu/10.1
 .2/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-char.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.1.2/hw/vfio-user/protocol.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-char.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.1.2/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.1.2/include/system/tpm.h /usr/src/debug/qemu/10.1.2/target/arm/cpu-sysregs.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.1.2/hw/vfio/pci.h /usr/src/debug
 /qemu/10.1.2/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.1.2/include/system/ram_addr.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.1.2/include/hw/char/pl011.h /usr/src/debug/qemu/10.1.2/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.1.2/include/qemu/cpu-float.h /usr/src/debug/qemu/10.1.2/include/qemu/madvise.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.1.2/include/qemu/hw-version.h /usr/src/debug/qemu/10.1.2/include/system/runstate.h /usr/src/debug/qemu/10.1.2/include/system/tpm_backend.h /usr/src/debug/qemu/10.1.2/include/system/block-backend-io.h /usr/src/debug/qemu/10.1.2/include/qapi/qmp-registry.h /usr/src/
 debug/qemu/10.1.2/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.1.2/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.1.2/trace/trace-linux_user.c /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-cpr.h /usr/src/debug/qemu/10.1.2/trace/trace-linux_user.h /usr/src/debug/qemu/10.1.2/include/system/arch_init.h /usr/src/debug/qemu/10.1.2/target/riscv/pmp.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.1.2/target/riscv/cpu.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.1.2/include/qemu/selfmap.h /usr/src/debug/qemu/10.1.2/include/qemu/seqlock.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.1.2/trace/trace-
 hw_net_can.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.1.2/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.1.2/include/qemu/job.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_adc.h /usr/src/debug/qemu/10.1.2/trace/trace-target_ppc.h /usr/src/debug/qemu/10.1.2/include/qemu/iov.h /usr/src/debug/qemu/10.1.2/include/qemu/thread-context.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_adc.c /usr/src/debug/qemu/10.1.2/trace/trace-target_ppc.c"
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31678344 to 33668088 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29184224 to 30750096 (+5%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26872104 to 28372920 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14807816 to 14339640 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13609896 to 13191992 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13750632 to 13328632 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15702472 to 15226936 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13601704 to 13183800 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15808384 to 15303728 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 16966344 to 16416152 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 16030312 to 15603064 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16101992 to 15678840 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12136320 to 11736304 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26923080 to 28498424 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGSIZE changed from 5334176 to 5795152 (+9%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGSIZE changed from 3351680 to 3446352 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGSIZE changed from 2716032 to 2748208 (+1%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGSIZE changed from 2577768 to 2635448 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGSIZE changed from 3149632 to 3211600 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGSIZE changed from 3182112 to 3248176 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGSIZE changed from 3173920 to 3239984 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGSIZE changed from 3137344 to 3203408 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGSIZE changed from 2988992 to 3050736 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGSIZE changed from 3063808 to 3125552 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGSIZE changed from 3055616 to 3117360 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGSIZE changed from 3469856 to 3535728 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGSIZE changed from 3535392 to 3605360 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGSIZE changed from 2008704 to 2062256 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGSIZE changed from 878792 to 825816 (-6%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGSIZE changed from 2700416 to 2736688 (+1%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
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

--===============7361298688470106464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 948 .bb files complete (0 cached, 948 parsed). 1946 targets, 54 skipped, 0 masked, 0 errors.
Removing 149 recipes from the qemux86_64 sysroot...done.
Removing 135 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-9a8b8b49c9862612cd0e36ef2382ad3d6fbf3502"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:9a8b8b49c9862612cd0e36ef2382ad3d6fbf3502"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 973 Local 743 Mirrors 0 Missed 230 Current 411 (76% match, 83% complete)
Removing 3 stale sstate objects for arch x86_64...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch allarch...done.
NOTE: Executing Tasks
NOTE: Running setscene task 418 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 429 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 463 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 516 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 524 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 543 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 546 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 547 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 557 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 561 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 562 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 576 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 585 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 591 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 595 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 606 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe qemu-10.1.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 610 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 612 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: Running setscene task 615 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe qemu-10.1.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: Running setscene task 619 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 622 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-21.1.4-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 624 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 626 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 629 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 633 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 634 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 636 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_create_spdx_setscene)
NOTE: recipe libatomic-ops-7.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 637 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 639 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 641 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 643 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 644 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 649 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 650 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 651 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 653 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 654 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 655 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 656 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 657 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: recipe llvm-21.1.4-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 661 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 663 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 666 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 678 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 682 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: recipe libsdl2-2.32.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 684 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 689 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 692 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 697 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 702 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 710 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 712 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 715 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 723 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_packagedata_setscene: Started
NOTE: recipe qemu-10.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 726 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 727 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-10.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 729 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 730 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 732 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 733 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 734 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 735 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe libclc-21.1.4-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 739 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 741 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 745 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 748 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 756 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 760 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 767 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 768 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 771 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: Running setscene task 773 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 776 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 783 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 784 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 787 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.4-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 788 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 792 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 793 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 794 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: Running setscene task 798 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 799 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 806 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: Running setscene task 807 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 809 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 810 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 811 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 812 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 813 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 814 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 815 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 816 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 818 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 822 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 824 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 825 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 826 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 827 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libclc-21.1.4-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 829 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 830 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 831 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 837 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 839 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 842 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 843 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 844 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 847 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 848 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 853 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 854 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 856 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_packagedata_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 857 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_create_spdx_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 858 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 859 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 860 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 861 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 862 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libatomic-ops-7.8.4-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 867 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 870 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libclc-21.1.4-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 872 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 875 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 879 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 880 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 882 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 883 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_packagedata_setscene)
NOTE: recipe libclc-21.1.4-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 886 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 887 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 889 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_packagedata_setscene: Started
NOTE: Running setscene task 892 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 896 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 900 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe llvm-21.1.4-r1: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 902 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 908 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 912 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 913 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 915 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 916 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe llvm-21.1.4-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 917 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 918 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 921 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 922 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 927 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 928 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 929 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 931 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 932 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 937 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 939 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 941 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 947 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 950 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 951 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 952 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 954 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 956 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 962 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 963 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 965 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 966 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ofono-2.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 970 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 971 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 972 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 974 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 975 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 977 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ofono-2.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 980 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 981 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 983 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 985 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 989 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 990 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 992 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 993 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 994 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 995 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libatomic-ops-7.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 998 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1000 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1002 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1003 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1004 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1008 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1012 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1015 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1016 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1017 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1018 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1021 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1024 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1025 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1026 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1028 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1031 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1032 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1033 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1034 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1035 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1037 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1038 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1040 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1041 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_create_spdx_setscene)
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe ell-0.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1043 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ofono-2.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1044 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1045 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1046 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1052 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe ofono-2.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1057 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1062 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_recipe_qa_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.84-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1064 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1067 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1068 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1070 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1071 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1072 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1073 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1074 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1075 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1076 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1078 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1083 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1084 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1085 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1086 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1087 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1088 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1090 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1091 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1092 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1093 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1094 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1095 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1098 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1102 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1104 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1109 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1114 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1116 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1117 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1121 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1123 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1126 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.84-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1130 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1133 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1135 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1137 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.84-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1139 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1140 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1141 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1142 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1147 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1151 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1152 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1153 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1154 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1156 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe llvm-21.1.4-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1157 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1159 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1161 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1163 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1165 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1166 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1167 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1168 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1169 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1170 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1171 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1172 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1174 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-21.1.4-r1: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1175 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1177 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1178 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1179 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1180 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1181 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe llvm-21.1.4-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1183 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1185 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1187 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1189 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1190 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1193 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1197 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1199 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1200 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1201 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1204 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1210 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1211 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1213 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1215 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1219 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1221 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1222 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1223 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1224 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1226 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1227 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1230 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1234 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1236 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1239 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1240 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1241 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1244 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1245 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1246 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1249 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1251 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1252 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1253 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1255 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1258 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1260 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1261 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1263 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1264 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 1265 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1267 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1268 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1270 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1273 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1279 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1281 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1282 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1283 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1284 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1285 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1286 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1287 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1288 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1289 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1290 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 532 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: Running setscene task 1291 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1292 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1293 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1294 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1295 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1296 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1297 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1298 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1302 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/util-linux-libuuid/2.41.1/temp/log.do_packagedata_setscene.3915869
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1303 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1306 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_package_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1308 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1309 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 543 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_package_setscene: Started
NOTE: Running task 603 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 649 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_fetch)
NOTE: Running setscene task 1314 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1316 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1319 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1320 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1322 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1324 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1326 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1328 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1330 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1332 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 732 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 743 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1334 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_unpack: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_package_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 844 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_write_config)
NOTE: Running setscene task 1336 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1337 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1339 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1340 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: Running task 870 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: Running task 895 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 908 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: Running task 912 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_fetch)
NOTE: Running task 914 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: Running setscene task 1342 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_write_config: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 978 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: Running task 981 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_write_config)
NOTE: Running task 988 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: Running task 1040 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1041 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_fetch: Started
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1052 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: Running task 1053 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: Running task 1065 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: Running task 1067 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 1075 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: Running setscene task 1344 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1346 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_write_config: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1347 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: Running task 1078 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running task 1105 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1106 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1109 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: Running task 1110 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1111 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1349 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: Running task 1114 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1115 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_unpack)
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1126 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 1132 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Succeeded
NOTE: Running task 1135 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: Running task 1144 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1145 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1146 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_patch)
NOTE: Running task 1149 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_unpack: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1168 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: Running task 1170 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Started
NOTE: Running task 1171 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: Running task 1172 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1351 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: Running task 1173 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: Running task 1174 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: Running task 1175 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1177 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: Running task 1179 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: Running task 1187 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 1195 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: Running task 1224 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1242 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1251 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: Running setscene task 1352 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1353 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1356 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1357 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running setscene task 1358 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Succeeded
NOTE: Running task 1252 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_patch)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: Running task 1253 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 1268 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: Running task 1289 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_unpack: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1291 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: Running task 1292 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_patch)
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Succeeded
NOTE: Running task 1309 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: Running setscene task 1363 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1364 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 1310 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: Running task 1339 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: Running task 1345 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: Running task 1388 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_patch: Started
NOTE: Running task 1397 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: Running task 1401 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: Running task 1402 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1425 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: Running task 1430 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1431 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: Running task 1432 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Started
NOTE: Running task 1436 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: Running task 1440 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: Running task 1447 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: Running task 1452 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: Running task 1461 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_fetch)
NOTE: Running task 1465 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: Running task 1472 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: Running task 1486 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1365 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1368 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe bluez5-5.84-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: Running setscene task 1369 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_fetch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: Running task 1489 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: Running task 1490 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1501 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: Running task 1502 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: Running task 1532 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: Running task 1533 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: Running task 1546 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1375 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1376 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: Running task 1552 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: Running task 1566 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: recipe bluez5-5.84-r0: task do_unpack: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1568 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Succeeded
NOTE: Running task 1569 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1652 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: Running task 1655 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1664 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_fetch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: Running task 1676 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1700 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: Running task 1715 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: Running task 1719 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_fetch)
NOTE: Running task 1728 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: Running task 1730 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe bluez5-5.84-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: Running task 1731 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_patch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1732 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1733 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: Running task 1734 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: Running task 1735 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_fetch)
NOTE: Running task 1737 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1794 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: Running task 1851 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1854 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: Running task 1856 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Started
NOTE: Running task 1858 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_unpack)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: Running task 1868 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1873 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1874 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_unpack)
NOTE: Running task 1878 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1886 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: Running task 1948 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_write_config)
NOTE: Running task 1954 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Started
NOTE: Running task 1958 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_write_config)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: Running task 1959 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 1961 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Started
NOTE: Running task 1993 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_fetch)
NOTE: recipe bluez5-5.84-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: Running task 1995 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Succeeded
NOTE: Running task 1996 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1997 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: Running task 1998 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1999 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_fetch)
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 2000 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_patch)
NOTE: Running task 2001 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: Running task 2002 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_configure)
NOTE: recipe ell-0.79-r0: task do_fetch: Started
NOTE: Running task 2003 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_patch)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe ell-0.79-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Succeeded
NOTE: Running task 2018 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 2019 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_fetch)
NOTE: Running task 2021 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: Running task 2022 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: Running task 2032 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2034 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe ofono-2.18-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 2040 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_unpack)
NOTE: Running task 2041 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe ofono-2.18-r0: task do_fetch: Succeeded
NOTE: Running task 2053 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Succeeded
NOTE: Running task 2054 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_unpack)
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: Running task 2065 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: Running task 2068 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2069 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: Running task 2072 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_fetch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe ell-0.79-r0: task do_unpack: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe ofono-2.18-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: Running task 2073 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_fetch: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 2074 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_fetch: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_fetch: Succeeded
NOTE: Running task 2076 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_fetch)
NOTE: recipe mesa-2_25.2.5-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_unpack: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Succeeded
NOTE: Running task 2077 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_patch)
NOTE: Running task 2078 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_unpack)
NOTE: Running task 2080 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_write_config)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.79-r0: task do_unpack: Succeeded
NOTE: Running task 2081 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: Running task 2082 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: Running task 2083 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: Running task 2084 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_fetch: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe ell-0.79-r0: task do_patch: Started
NOTE: recipe ofono-2.18-r0: task do_unpack: Succeeded
NOTE: Running task 2085 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.79-r0: task do_patch: Succeeded
NOTE: Running task 2092 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_fetch)
NOTE: Running task 2093 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2095 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: Running task 2096 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2097 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1378 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_patch: Succeeded
NOTE: Running task 2109 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_generate_toolchain_file)
NOTE: recipe ofono-2.18-r0: task do_patch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Started
NOTE: Running task 2110 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe ofono-2.18-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Started
NOTE: Running task 2111 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: Running task 2112 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_fetch: Succeeded
NOTE: Running task 2113 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_unpack)
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_unpack: Started
NOTE: Running task 2123 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_fetch)
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 2126 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_unpack)
NOTE: Running task 2127 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_compile)
NOTE: recipe xkeyboard-config-2.45-r0: task do_unpack: Started
NOTE: recipe qemu-10.1.2-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1381 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_unpack: Started
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: recipe qemu-10.1.2-r0: task do_fetch: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1383 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Started
NOTE: Running task 2135 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2136 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: Running task 2137 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_unpack)
NOTE: Running task 2138 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_unpack: Succeeded
NOTE: Running task 2139 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_patch)
NOTE: Running task 2140 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_patch)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 2142 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Started
NOTE: Running task 2155 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_patch: Started
NOTE: Running task 2156 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: Running task 2157 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_patch: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2164 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: Running task 2181 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_write_config)
NOTE: Running task 2182 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_write_config)
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Succeeded
NOTE: Running task 2184 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_write_config)
NOTE: recipe qemu-10.1.2-r0: task do_unpack: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_unpack: Succeeded
NOTE: Running task 2185 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_patch)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_write_config: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_write_config: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_write_config: Succeeded
NOTE: Running task 2270 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.32.10-r0: task do_patch: Started
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Succeeded
NOTE: Running task 2328 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: Running task 2369 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2458 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2481 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libsdl2-2.32.10-r0: task do_patch: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2550 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2558 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2609 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_install)
NOTE: Running task 2610 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Started
NOTE: Running task 2632 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2667 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2697 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_patch)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Succeeded
NOTE: Running task 2708 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_unpack)
NOTE: Running task 2716 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2717 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_configure)
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Started
NOTE: Running task 2718 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Started
NOTE: Running task 2719 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: Running task 2720 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2721 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: Running task 2749 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2750 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: Running task 2751 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure)
NOTE: Running task 2752 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Setscene tasks completed
NOTE: recipe mesa-2_25.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2754 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: Running task 2761 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: Running task 2775 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.24.0-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2779 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: Running task 2780 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_patch)
NOTE: Running task 2781 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot)
NOTE: Running task 2782 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_configure)
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2783 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package)
NOTE: Running task 2784 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2785 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_write_config)
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2787 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Started
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2789 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2790 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Succeeded
NOTE: Running task 2791 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: recipe mesa-2_25.2.5-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2792 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_generate_toolchain_file)
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: Running task 2793 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_configure)
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_generate_toolchain_file: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Succeeded
NOTE: Running task 2794 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.45-r0: task do_configure: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2795 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot unihash changed to 8c93dafe3f2a8dcf911693c65fcf2f58c29d2f3fa2db913de59bfbaa4259cffd
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Setscene tasks completed
NOTE: Running task 2796 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: Running task 2797 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_configure)
NOTE: Running task 2835 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: Running task 2924 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2971 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: Running task 2972 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_configure)
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: Running task 2973 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2974 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: Running task 2975 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package unihash changed to f1de4a65034064e087b26385d8f52817ed08039c694c8e79fe4b756050c8d095
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata became valid
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running task 2995 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: Running task 2996 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: Running task 2997 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_compile)
NOTE: Running task 2998 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: recipe xkeyboard-config-2.45-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_compile)
NOTE: Running task 3010 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: Running task 3071 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3073 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx)
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3201 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.24.0-r0: task do_configure: Succeeded
NOTE: Running task 3229 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure_ptest_base)
NOTE: Running task 3247 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_collect_spdx_deps)
NOTE: Running task 3248 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Succeeded
NOTE: Running task 3249 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_install)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3250 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3251 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_compile)
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 3252 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Started
NOTE: Running task 3253 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3265 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile)
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Started
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile: Started
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3280 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: recipe xkeyboard-config-2.45-r0: task do_compile: Succeeded
NOTE: Running task 3281 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_install)
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3282 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: Running task 3283 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: Running task 3284 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_compile)
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3285 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_install)
NOTE: Running task 3286 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot)
NOTE: Running task 3287 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.3.2-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to e2c92832420883c099d37fc49de1354f7e963b0c6bf8bf8825f97da9e138c1af
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot became valid
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe qemu-10.1.2-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_install: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_install: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot unihash changed to ba055d9cbae4b9971173b4d630addaf79ce5a8a806728c750e3dab01b6b6b9b9
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package unihash changed to 94343c7646a61c9874b33ee69c8e5bdf004ad72f159f9c1e1ed7dc92223878a0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 9c19ae6f03cc3dc8b4ec2f3c0605b67991bfb80b171d6674fe1e495f5b1eb5c8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Running setscene task 1309 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1310 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1314 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1315 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1317 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1321 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1322 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1323 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1324 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1329 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1339 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata_setscene)
NOTE: Running setscene task 1346 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1347 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running task 3288 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: Running task 3289 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 1348 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1349 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1350 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package_setscene)
NOTE: Running setscene task 1351 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: Running setscene task 1352 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3290 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1353 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package_setscene)
NOTE: Running task 3291 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3292 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: Running task 3293 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_patch)
NOTE: Running task 3294 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot)
NOTE: Running task 3295 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: Running task 3296 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: Running task 3297 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot: Started
NOTE: recipe qemu-10.1.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_install: Started
NOTE: Running task 3298 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install)
NOTE: recipe wayland-1.24.0-r0: task do_install: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 3299 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot)
NOTE: Running setscene task 1354 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1355 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1356 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1357 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1358 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to a2d5048e0b3c86e272f2083bd082768d1fcaffea2075db034279cc196194f2d3
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemu-10.1.2-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot unihash changed to f14fa3bd11c6d876ab8e0c464a4f65d418a4d93e483f58fc4c0f6783d2140802
NOTE: Running setscene task 1324 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot unihash changed to 6fbdbba72bb2b3ac6312582a10f35ea50e61238d681ff1e5c21625ce88bc1f18
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: Running setscene task 1325 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package_setscene)
NOTE: Running setscene task 1326 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running task 3300 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: Running task 3301 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install_ptest_base)
NOTE: Running task 3302 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3303 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: Running task 3304 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3305 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Started
NOTE: Running task 3307 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package)
NOTE: Running task 3308 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: Running task 3309 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Started
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to 8768576a8de799453a98418122f6fbc6580d08ac5f17461e0273938eed3b7584
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe qemu-10.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_package: Started
NOTE: recipe dtc-1.7.2-r0: task do_package: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1345 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package_setscene)
NOTE: Running setscene task 1358 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1359 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1360 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running task 3310 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: Running task 3321 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Started
NOTE: recipe qemu-10.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_deploy_source_date_epoch unihash changed to 16888d5dbe0f450a08866b6ca24156555db8876b71fbedd6521c0b58491c4d8e
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to 71788404568ac79f09a216009a2e373bef6e445e4eaef2b5e72cda8f52762623
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot unihash changed to 4ed40834174648210e0e18148fd20fb45eef14db762c347681d67ea03fd3d9c3
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot unihash changed to bdad3d7c073e257399edd1b221040f6e7d655b8d614e642af7b1d982340eb955
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot became valid
NOTE: Running setscene task 1312 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_package: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_package: Succeeded
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package unihash changed to 6be1547d4109be6d9f0d4e5e3c9261a3518df9ee9e2ba5c005319350ce033d2f
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package unihash changed to 085b35fa1b2f727f17009d67140c8fa9b666f8837aeb8992ca1cd4b3f2520512
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 8ad0f6e9c17cc7ba23686cd1c99a77fd1b5e8393121419c7f66d46f103b60181
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata became valid
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Started
NOTE: Running setscene task 1316 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1318 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1330 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1337 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1356 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1358 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1369 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running task 3322 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: Running task 3323 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_configure)
NOTE: Running task 3324 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package)
NOTE: Running task 3326 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 3327 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_create_spdx)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe wayland-1.24.0-r0: task do_package: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1370 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1371 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3330 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3331 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_spdx)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3333 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3335 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_collect_spdx_deps)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1372 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1373 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1374 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3336 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_configure_ptest_base)
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure_ptest_base: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 3337 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3338 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3339 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot)
NOTE: Running task 3340 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1375 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1376 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package unihash changed to 6d568313ac1554db48d46ab9720ec5e954597e597fb01cd9237c531648d36ead
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata became valid
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 1367 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: Running setscene task 1377 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot unihash changed to a1372d80f2c2864d63e095605153130d8de1275411b14c87419b037b50e373c2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot became valid
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package unihash changed to d89cbb25a9ad78a92a68997da7f0e346b7cc51a16497a89d6f4cebe599adbf5a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata became valid
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1276 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1283 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1287 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1288 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1334 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1340 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1369 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1374 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 3341 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_compile)
NOTE: Running task 3343 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_create_spdx: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1377 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1378 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3344 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1380 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_package_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: Running task 3345 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: Running task 3346 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1381 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1382 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_package_setscene: Succeeded
NOTE: Running task 3417 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: Running setscene task 1383 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: Running task 3418 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3433 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3461 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: Running task 3462 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_configure)
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3463 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.41.1-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: Running task 3464 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: Running task 3465 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3466 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3467 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: Running task 3468 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: Running task 3469 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3470 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_configure: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 3471 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3472 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3473 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3474 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to f06fc14aa0c558b80748f619c011a7fac068240be5a04f1639cce6bea1d1b2c5
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3475 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: Running task 3476 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Succeeded
NOTE: Running task 3477 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_install)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdrm-2.4.125-r0: task do_install: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3478 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3479 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to cb6a6fed61479fb3f58a9c787887beb436f036bc2d7bd7e39a1109d3f393dec2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata became valid
NOTE: recipe libdrm-2.4.125-r0: task do_install: Succeeded
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running task 3480 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot)
NOTE: Running task 3481 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.125-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3483 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3484 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_collect_spdx_deps)
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: Running task 3485 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Running task 3486 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot unihash changed to dce91b97c7d087e1713f8d53ab57e42a13b41769612d50a660cb79211731be70
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: Running task 3487 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx)
NOTE: Running task 3488 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_compile)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: Running task 3489 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_compile_ptest_base)
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3490 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3491 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to 71c3d307f899795b401a27fa92aae28e01a5ce89a8d5855c227e5be840c39cb4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata became valid
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package unihash changed to bac2462d362283a87faf18e4bd3f80213441e43e132f2172de22f40bbb632ca2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package became valid
NOTE: Running setscene task 1320 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1351 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running setscene task 1373 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1375 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: Running task 3492 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_install)
NOTE: Running task 3494 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: Running task 3495 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: Running task 3496 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 3497 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3499 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1376 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package_setscene)
NOTE: Running task 3500 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3501 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3509 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 3510 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3511 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3512 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx)
NOTE: Running task 3513 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 3514 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/util-linux/2.41.1/temp/log.do_packagedata_setscene.3954926
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: recipe libxkbcommon-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 3515 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_install)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3516 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3517 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_install: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: Running task 3518 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_collect_spdx_deps)
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: Running task 3519 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install: Succeeded
NOTE: Running task 3520 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_install_ptest_base)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3521 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3522 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install_ptest_base: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3523 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3524 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3525 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_install: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: Running task 3526 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot)
NOTE: Running task 3527 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_package)
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_package: Started
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1378 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_populate_sysroot unihash changed to faf051da52f4e3b1d8a920a850732da761cbabc1513251c007a99ef23c30b94a
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot unihash changed to c4882239b930ec77eaa31378b417227701cf64e0c139490e8060294595982d7b
NOTE: Running setscene task 1326 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running task 3528 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_package: Succeeded
NOTE: Running task 3529 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_package unihash changed to aa043163e1d7c86d620801a15cc4f63f43d44b89841ae2377ac7fa87c930b012
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata became valid
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1373 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package_setscene)
NOTE: Running setscene task 1381 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3530 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3532 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3533 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_package_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Started
NOTE: Running setscene task 1382 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running task 3555 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1383 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package_setscene)
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package became valid
NOTE: Running setscene task 1383 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3556 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe mesa-2_25.2.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: Running task 3557 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: recipe mesa-2_25.2.5-r0: task do_configure: Started
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3573 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx)
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3586 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_collect_spdx_deps)
NOTE: Running task 3587 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: Running task 3588 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3589 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_compile)
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe util-linux-2.41.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3590 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3591 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Succeeded
NOTE: Running task 3592 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3595 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.2-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3596 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3597 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3598 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_collect_spdx_deps)
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Started
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3599 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx)
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Succeeded
NOTE: Running task 3600 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_25.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3601 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe util-linux-2.41.1-r0: task do_configure: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_compile: Started
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package became valid
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Succeeded
NOTE: Running task 3602 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_install)
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Succeeded
NOTE: Running task 3603 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot)
NOTE: Running task 3604 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot unihash changed to df92eba55d13592b076f0dab7bb2038483496aa7ad3b999e2b9151cac09b33c4
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package unihash changed to 3fbb374c40e3e18cd4ef3cc8c2743dfbc7e4f3885056ce267672138db32d8103
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata became valid
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3606 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3613 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3614 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3616 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3617 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3618 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_configure: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata: Succeeded
NOTE: Running task 3619 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_create_spdx)
NOTE: Running task 3620 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk)
NOTE: Running task 3621 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb)
NOTE: Running task 3622 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm)
NOTE: Running task 3623 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Started
NOTE: recipe bash-5.3-r0: task do_package_qa: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk unihash changed to a7f99344f8ec234e58b86d4784fec777b80e0c883b056b3c868fec0e3afcaff7
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3624 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_collect_spdx_deps)
NOTE: Running task 3625 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_deb: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb unihash changed to 170848a274c4df5466a009ec82a595e43e5275fbf6d83edd52eb39427e4152f7
NOTE: recipe bash-5.3-r0: task do_package_qa: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa unihash changed to 2191a17a6e62778d6a462e7ae8ab1b5ac6e8befe52e8067551c849d2df7d70ce
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm unihash changed to 4b8fac0b68028d9445852a105df45d741ea0b7383c9f1b07b0ca54df87dfb3d0
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3626 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_configure: Succeeded
NOTE: Running task 3627 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3628 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3629 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3630 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: Running task 3631 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Running task 3632 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata unihash changed to 00e797d49cc9ad97ae23f20f4cc65879d906242c15a48bfe9cf2a27eb6aa52f8
NOTE: Setscene tasks completed
NOTE: Running task 3633 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_create_spdx)
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Started
NOTE: recipe eudev-3.2.14-r0: task do_create_spdx: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_compile: Succeeded
NOTE: Running task 3634 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_compile_ptest_base)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_compile_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3635 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_install)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_install: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_install: Succeeded
NOTE: Running task 3636 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3637 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_populate_sysroot)
NOTE: Running task 3638 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_package)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_package: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3639 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3640 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3641 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3642 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_configure)
NOTE: Running task 3643 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_configure)
NOTE: recipe libslirp-4.9.1-r0: task do_configure: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Started
NOTE: recipe dbus-1.16.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3644 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_configure: Started
NOTE: recipe libslirp-4.9.1-r0: task do_configure: Succeeded
NOTE: Running task 3645 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_compile)
NOTE: recipe libslirp-4.9.1-r0: task do_compile: Started
NOTE: recipe libslirp-4.9.1-r0: task do_compile: Succeeded
NOTE: Running task 3646 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_install)
NOTE: recipe libslirp-4.9.1-r0: task do_install: Started
NOTE: recipe libslirp-4.9.1-r0: task do_install: Succeeded
NOTE: Running task 3647 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_populate_sysroot)
NOTE: recipe libslirp-4.9.1-r0: task do_populate_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_configure: Succeeded
NOTE: Running task 3648 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_configure_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3649 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile)
NOTE: recipe dbus-1.16.2-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile: Succeeded
NOTE: Running task 3650 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_compile_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3651 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install)
NOTE: recipe dbus-1.16.2-r0: task do_install: Started
NOTE: recipe vala-0.56.18-r0: task do_configure: Succeeded
NOTE: Running task 3652 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_compile)
NOTE: recipe vala-0.56.18-r0: task do_compile: Started
NOTE: recipe dbus-1.16.2-r0: task do_install: Succeeded
NOTE: Running task 3653 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_install_ptest_base)
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Started
NOTE: recipe dbus-1.16.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3654 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_populate_sysroot)
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Started
NOTE: recipe dbus-1.16.2-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3655 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3656 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_prepare_recipe_sysroot)
NOTE: recipe ell-0.79-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe ell-0.79-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3657 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_configure)
NOTE: recipe ell-0.79-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_package: Succeeded
NOTE: Running task 3658 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata: Started
NOTE: recipe avahi-0.8-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3659 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_configure)
NOTE: recipe avahi-0.8-r0: task do_configure: Started
NOTE: recipe ell-0.79-r0: task do_configure: Succeeded
NOTE: Running task 3660 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_compile)
NOTE: recipe ell-0.79-r0: task do_compile: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_packagedata: Failed
NOTE: recipe ell-0.79-r0: task do_compile: Succeeded
NOTE: recipe avahi-0.8-r0: task do_configure: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_compile: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3660 tasks of which 3227 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105131125.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251105131125.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/glib-2.0/2.86.0/temp/log.do_packagedata.4014992
Summary: There were 285 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-liblastlog2 went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ka went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ko went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ro went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-bits went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chfn went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chsh went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-coresched went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-enosys went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-exch went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fadvise went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lastlog2 went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsclocks went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsfd went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-pipesz went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpgid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uclampset went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-waitpid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkpr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-src went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dbg went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-ptest went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-staticdev went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-dev went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-doc went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ab went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-af went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-am went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-an went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ar went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-as went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ast went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-az went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-be+latin went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bg went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bn-in went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-bs went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ca+valencia went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cs went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-cy went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-da went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-de went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-dz went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-el went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en+shaw went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-ca went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-en-gb went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eo went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-es went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-et went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-eu went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fa went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fi went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fr went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-fur went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ga went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gd went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gl went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-gu went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-he went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hi went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hr went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hu went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-hy went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-id went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ie went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-is went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-it went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ja went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ka went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kab went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kk went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-kn went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ko went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ku went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lt went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-lv went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mai went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mg went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mk went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ml went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mn went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-mr went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ms went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nb went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nds went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ne went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nl went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-nn went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-oc went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-or went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pa went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pl went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ps went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-pt-br went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ro went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ru went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-rw went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-si went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sk went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sl went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sq went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+ije went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sr+latin went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-sv went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ta went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-te went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tg went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-th went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tl went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tr went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-tt went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-ug went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-uk went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-vi went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-wa went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-xh went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-yi went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-cn went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-hk went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-locale-zh-tw went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0 went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-codegen went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-utils went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: QA Issue: Package version for package glib-2.0-bash-completion went backwards which would break package feeds (from 1:2.86.1-r0 to 1:2.86.0-r0) [version-going-backwards]
ERROR: glib-2.0-1_2.86.0-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/glib-2.0/2.86.0/temp/log.do_packagedata.4014992
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata) failed with exit code '1'

--===============7361298688470106464==--

