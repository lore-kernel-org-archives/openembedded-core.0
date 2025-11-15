Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D6FCEBF78
	for <webhook@archiver.kernel.org>; Sat, 15 Nov 2025 16:38:41 +0000 (UTC)
Received: from a27-193.smtp-out.us-west-2.amazonses.com (a27-193.smtp-out.us-west-2.amazonses.com [54.240.27.193])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.11929.1763224712422590111
 for <openembedded-core@lists.openembedded.org>;
 Sat, 15 Nov 2025 08:38:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=SlgEuhi1;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=jcOXVads;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.193, mailfrom: 0101019a8861f0fe-d28d9183-5407-48a6-a636-4395dfeee481-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1763224711;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=6tcfl5mo6/7RIPQYbgSrsOFsVVkf79UTO1Cr15UNcj8=;
	b=SlgEuhi1roHi4l3uiXNko8FfPMLrnyiE1q15un175ux2NAxN4LGmx16WacA31ZbX
	46Dlf8GzR+T5TaiPxtMMRP7PCZYaAJjVgaVmIfEqHPFBNagT/S9cMhnKbtGvGqzTP0j
	Z9JPX2W9OzcHxHAtXiVC32/xmzCnFMqlJJDmZ0V0=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1763224711;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=6tcfl5mo6/7RIPQYbgSrsOFsVVkf79UTO1Cr15UNcj8=;
	b=jcOXVadsxJtoJ6zbHdSk1gcEHg7XZeisXZazs6sEntm+aEHgU6SYH7WpEz5BSKrM
	ZfoKB1AQXlOpvIwS4c4RE9zC0haYJjPCUR8olOFM/NMTBT+AjXcwZz7dZdwIQbzsYBa
	Vw4lnlV6itavS4CVjS25K6TOvwCYuwzjtJAtYnbE=
Content-Type: multipart/mixed; boundary="===============5578891785752314519=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-system-native,qemu,qemu-native: upgrading to
 10.1.2,10.1.2,10.1.2 SUCCEEDED
Message-ID: <0101019a8861f0fe-d28d9183-5407-48a6-a636-4395dfeee481-000000@us-west-2.amazonses.com>
Date: Sat, 15 Nov 2025 16:38:31 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.11.15-54.240.27.193
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 15 Nov 2025 16:38:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/226311

--===============5578891785752314519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-system-native,qemu,qemu-native* to *10.1.2,10.1.2,10.1.2* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-system-native-qemu-qemu-native-upgrade-10.0.6-1.patch
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
From 6647afdf51bde645563e13088f7c1e2ad209996c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Sat, 15 Nov 2025 06:46:31 +0000
Subject: [PATCH] qemu-system-native,qemu,qemu-native: upgrade 10.0.6 ->
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
index f27208f45f..211afbc17c 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
+From 4d19fbbca483879bc67a78c240e645e04af84cfd Mon Sep 17 00:00:00 2001
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
index ad5c5ba03e..4eee39f99b 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
+From d3663e611e89ecc6e5e757d209dd082817dd170f Mon Sep 17 00:00:00 2001
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
index c04e42608f..56495be323 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
+From 5b220d168e64961a8ede26b67c5b1d188f8d5f11 Mon Sep 17 00:00:00 2001
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
index 388d11d10d..901f3c1aa7 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
+From df31039dd5986617a743ec790bcfac1ae200eee3 Mon Sep 17 00:00:00 2001
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
index 4690d86315..1b4f27b1a5 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
+From 943440cf7b8c54a09c16fa8f0917f9cb14d1d072 Mon Sep 17 00:00:00 2001
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
index 7c24f432f2..fbb01f76cf 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
+From 68835a6d4fe09ab3df81e5f8f854a6736f9e0b0c Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 54421544bb..88fc03e7f8 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
+From 62dbe9a1d6d57eeff579c97bef1fe205f8980d76 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd..42a55abafb 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
+From f31b6836a050cd550f2ee2a8ad8f266b9ad4ae82 Mon Sep 17 00:00:00 2001
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
index b06020d106..bd9670797f 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
+From 8ccfd596e3e7c745e8c910a795cad335e6c60baf Mon Sep 17 00:00:00 2001
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
index 1cc973443e..7665374d51 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
+From 80862e6618d7db707745a076b6c77b93fce6ab7f Mon Sep 17 00:00:00 2001
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


--===============5578891785752314519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/qemu: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-10.0.6.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.1.2.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://00
 02-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/x86-64-v3-poky-linux/qemu: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/canyonlands.dtb /usr/share/qemu/bamboo.dtb /usr/share/qemu/petalogix-ml605.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb", added "/usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/dtb/bamboo.dtb /usr/share/qemu/ast27x0_bootrom.bin /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb /usr/share/qemu/dtb/petalogix-ml605.dtb"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGSIZE changed from 341237945 to 340790311 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: FILELIST: added "/usr/lib/qemu/ptest/tests/qtest/.debug/aspeed_scu-test /usr/lib/qemu/ptest/tests/tcg/plugins/.debug/libpatch.so /usr/lib/qemu/ptest/tests/qtest/.debug/ast2700-hace-test"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1865481488 to 1870683112 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGSIZE changed from 885233 to 881537 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py /usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/README.rst", added "/usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64
 /virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-
 test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 185300405 to 181836303 (-2%)
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-src: FILELIST: directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-x86_64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-x86_64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/nvram -> /usr/src/debug/qemu/10.1.2/include/hw/nvram, directory renamed /usr/src/debug/qemu/10.0.6/include/qom -> /usr/src/debug/qemu/10.1.2/include/qom, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-aarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-aarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/pci-bridge -> /usr/src/debug/qemu/10.1.2/include/hw/pci-bridge, directory renamed /usr/src/debug/qemu/10.0.6/include/standard-headers/asm-x86 -> /usr/src/debug/qemu/10.1.2/include/standard-headers/asm-x86, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-aarch64-linux-
 user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-aarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mipsel-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mipsel-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-riscv64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-riscv64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/watchdog -> /usr/src/debug/qemu/10.1.2/include/hw/watchdog, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/firmware -> /usr/src/debug/qemu/10.1.2/include/hw/firmware, directory renamed /usr/src/debug/qemu/10.0.6/hw/block/dataplane -> /usr/src/debug/qemu/10.1.2/hw/block/dataplane, directory renamed /usr/src/debug/qemu/10.0.6/accel/tcg -> /usr/src/debug/qemu/10.1.2/accel/tcg, directory renamed /usr/src/debug/qemu/10.0.6/disas -> /usr/src/debug/qemu/10.1.2/disas, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/remote -> /usr/src/debug/qemu/10.1.2/include/hw/remote, directory rename
 d /usr/src/debug/qemu/10.0.6/backends/tpm -> /usr/src/debug/qemu/10.1.2/backends/tpm, directory renamed /usr/src/debug/qemu/10.0.6/include/tcg -> /usr/src/debug/qemu/10.1.2/include/tcg, directory renamed /usr/src/debug/qemu/10.0.6/tests -> /usr/src/debug/qemu/10.1.2/tests, directory renamed /usr/src/debug/qemu/10.0.6/include/net -> /usr/src/debug/qemu/10.1.2/include/net, directory renamed /usr/src/debug/qemu/10.0.6/hw/virtio -> /usr/src/debug/qemu/10.1.2/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.6/hw/mips -> /usr/src/debug/qemu/10.1.2/hw/mips, directory renamed /usr/src/debug/qemu/10.0.6/hw/acpi -> /usr/src/debug/qemu/10.1.2/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-i386-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-i386-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-riscv32-softmmu.a.p -> /us
 r/src/debug/qemu/10.1.2/libqemu-riscv32-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/gpio -> /usr/src/debug/qemu/10.1.2/include/hw/gpio, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/xen/interface/io -> /usr/src/debug/qemu/10.1.2/include/hw/xen/interface/io, directory renamed /usr/src/debug/qemu/10.0.6/block -> /usr/src/debug/qemu/10.1.2/block, directory renamed /usr/src/debug/qemu/10.0.6/include/disas -> /usr/src/debug/qemu/10.1.2/include/disas, directory renamed /usr/src/debug/qemu/10.0.6/host/include/i386/host/crypto -> /usr/src/debug/qemu/10.1.2/host/include/i386/host/crypto, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/uefi -> /usr/src/debug/qemu/10.1.2/include/hw/uefi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/input -> /usr/src/debug/qemu/10.1.2/include/hw/input, directory renamed /usr/s
 rc/debug/qemu/10.0.6/subprojects/libvhost-user -> /usr/src/debug/qemu/10.1.2/subprojects/libvhost-user, directory renamed /usr/src/debug/qemu/10.0.6/qga -> /usr/src/debug/qemu/10.1.2/qga, directory renamed /usr/src/debug/qemu/10.0.6/hw/net -> /usr/src/debug/qemu/10.1.2/hw/net, directory renamed /usr/src/debug/qemu/10.0.6/include/io -> /usr/src/debug/qemu/10.1.2/include/io, directory renamed /usr/src/debug/qemu/10.0.6/host/include/i386/host -> /usr/src/debug/qemu/10.1.2/host/include/i386/host, directory renamed /usr/src/debug/qemu/10.0.6/ebpf -> /usr/src/debug/qemu/10.1.2/ebpf, directory renamed /usr/src/debug/qemu/10.0.6/hw/arm -> /usr/src/debug/qemu/10.1.2/hw/arm, directory renamed /usr/src/debug/qemu/10.0.6/crypto -> /usr/src/debug/qemu/10.1.2/crypto, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/loongarch -> /usr/src/debug/qemu/10.1.2/include/hw/loongarch, directory renamed /usr/src/debug/qemu/10.0.6/include -> /usr/src/debug/qemu/10.1.2/include, directory renamed /usr/
 src/debug/qemu/10.0.6/include/libdecnumber -> /usr/src/debug/qemu/10.1.2/include/libdecnumber, directory renamed /usr/src/debug/qemu/10.0.6/hw/pci-host -> /usr/src/debug/qemu/10.1.2/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/hyperv -> /usr/src/debug/qemu/10.1.2/include/hw/hyperv, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/misc/macio -> /usr/src/debug/qemu/10.1.2/include/hw/misc/macio, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-loongarch64-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-loongarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/hw/usb -> /usr/src/debug/qemu/10.1.2/hw/usb, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-arm-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-arm-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/mips -> /usr/src/debug/qemu/10
 .1.2/include/hw/mips, directory renamed /usr/src/debug/qemu/10.0.6/hw/block -> /usr/src/debug/qemu/10.1.2/hw/block, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/sensor -> /usr/src/debug/qemu/10.1.2/include/hw/sensor, directory renamed /usr/src/debug/qemu/10.0.6 -> /usr/src/debug/qemu/10.1.2, directory renamed /usr/src/debug/qemu/10.0.6/include/block -> /usr/src/debug/qemu/10.1.2/include/block, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/acpi -> /usr/src/debug/qemu/10.1.2/include/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips64el-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips64el-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/monitor -> /usr/src/debug/qemu/10.1.2/include/monitor, directory renamed /usr/src/debug/qemu/10.0.6/linux-headers/asm -> /usr/src/debug/qemu/10.1.2/linux-headers/asm, directory renamed /usr/src/debug/qemu/10.0.6/linux-headers/linux -> /usr/src/debug/qemu/10.1.2/linux-headers/linux, directory r
 enamed /usr/src/debug/qemu/10.0.6/include/hw/xen/interface -> /usr/src/debug/qemu/10.1.2/include/hw/xen/interface, directory renamed /usr/src/debug/qemu/10.0.6/include/fpu -> /usr/src/debug/qemu/10.1.2/include/fpu, directory renamed /usr/src/debug/qemu/10.0.6/libcommon.a.p -> /usr/src/debug/qemu/10.1.2/libcommon.a.p, directory renamed /usr/src/debug/qemu/10.0.6/linux-user -> /usr/src/debug/qemu/10.1.2/linux-user, directory renamed /usr/src/debug/qemu/10.0.6/target/mips -> /usr/src/debug/qemu/10.1.2/target/mips, directory renamed /usr/src/debug/qemu/10.0.6/include/libdecnumber/dpd -> /usr/src/debug/qemu/10.1.2/include/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/10.0.6/tcg/i386 -> /usr/src/debug/qemu/10.1.2/tcg/i386, directory renamed /usr/src/debug/qemu/10.0.6/audio -> /usr/src/debug/qemu/10.1.2/audio, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/intc -> /usr/src/debug/qemu/10.1.2/include/hw/intc, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-riscv32-lin
 ux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-riscv32-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/sd -> /usr/src/debug/qemu/10.1.2/include/hw/sd, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/audio -> /usr/src/debug/qemu/10.1.2/include/hw/audio, directory renamed /usr/src/debug/qemu/10.0.6/subprojects/libvduse -> /usr/src/debug/qemu/10.1.2/subprojects/libvduse, directory renamed /usr/src/debug/qemu/10.0.6/include/semihosting -> /usr/src/debug/qemu/10.1.2/include/semihosting, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/pci-host -> /usr/src/debug/qemu/10.1.2/include/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.6/hw/intc -> /usr/src/debug/qemu/10.1.2/hw/intc, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips64el-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips64el-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/hw/net/fsl_etsec -> /usr/src/debug/qemu/10.1.2/hw/net/fsl_etsec, directory renamed
  /usr/src/debug/qemu/10.0.6/include/hw/ipmi -> /usr/src/debug/qemu/10.1.2/include/hw/ipmi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/virtio -> /usr/src/debug/qemu/10.1.2/include/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.6/include/chardev -> /usr/src/debug/qemu/10.1.2/include/chardev, directory renamed /usr/src/debug/qemu/10.0.6/monitor -> /usr/src/debug/qemu/10.1.2/monitor, directory renamed /usr/src/debug/qemu/10.0.6/net -> /usr/src/debug/qemu/10.1.2/net, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mipsel-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mipsel-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/gdbstub -> /usr/src/debug/qemu/10.1.2/include/gdbstub, directory renamed /usr/src/debug/qemu/10.0.6/include/standard-headers/linux -> /usr/src/debug/qemu/10.1.2/include/standard-headers/linux, 
 directory renamed /usr/src/debug/qemu/10.0.6/target/loongarch -> /usr/src/debug/qemu/10.1.2/target/loongarch, directory renamed /usr/src/debug/qemu/10.0.6/storage-daemon/qapi -> /usr/src/debug/qemu/10.1.2/storage-daemon/qapi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/southbridge -> /usr/src/debug/qemu/10.1.2/include/hw/southbridge, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/timer -> /usr/src/debug/qemu/10.1.2/include/hw/timer, directory renamed /usr/src/debug/qemu/10.0.6/include/hw -> /usr/src/debug/qemu/10.1.2/include/hw, directory renamed /usr/src/debug/qemu/10.0.6/target/i386 -> /usr/src/debug/qemu/10.1.2/target/i386, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/hw/riscv -> /usr/src/debug/qemu/10.1.2/hw/riscv, directory renamed /usr/src/debug/qemu/10.0.6/include/migration -> /usr/src/debug/qemu/10.1.2/include/migration, direc
 tory renamed /usr/src/debug/qemu/10.0.6/include/user -> /usr/src/debug/qemu/10.1.2/include/user, directory renamed /usr/src/debug/qemu/10.0.6/hw/i386/kvm -> /usr/src/debug/qemu/10.1.2/hw/i386/kvm, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-loongarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-loongarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/xen/interface/arch-x86 -> /usr/src/debug/qemu/10.1.2/include/hw/xen/interface/arch-x86, directory renamed /usr/src/debug/qemu/10.0.6/host/include/x86_64/host -> /usr/src/debug/qemu/10.1.2/host/include/x86_64/host, directory renamed /usr/src/debug/qemu/10.0.6/migration -> /usr/src/debug/qemu/10.1.2/migration, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/xen/interface/hvm -> /usr/src/debug/qemu/10.1.2/include/hw/xen/interface/hvm, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/core -> /usr/src/debug/qemu/10.1.2/include/hw/core, directory renamed /usr/src/debug/qemu/10.0.6/include
 /hw/ppc -> /usr/src/debug/qemu/10.1.2/include/hw/ppc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/rtc -> /usr/src/debug/qemu/10.1.2/include/hw/rtc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/usb -> /usr/src/debug/qemu/10.1.2/include/hw/usb, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/cpu -> /usr/src/debug/qemu/10.1.2/include/hw/cpu, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/net -> /usr/src/debug/qemu/10.1.2/include/hw/net, directory renamed /usr/src/debug/qemu/10.0.6/ui/shader -> /usr/src/debug/qemu/10.1.2/ui/shader, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/ssi -> /usr/src/debug/qemu/10.1.2/include/hw/ssi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/fsi -> /usr/src/debug/qemu/10.1.2/include/hw/fsi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/pci -> /usr/src/debug/qemu/10.1.2/include/hw/pci, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/xen -> /usr/src/debug/qemu/10.1.2/include/hw/xen,
  directory renamed /usr/src/debug/qemu/10.0.6/include/authz -> /usr/src/debug/qemu/10.1.2/include/authz, directory renamed /usr/src/debug/qemu/10.0.6/include/crypto -> /usr/src/debug/qemu/10.1.2/include/crypto, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/mem -> /usr/src/debug/qemu/10.1.2/include/hw/mem, directory renamed /usr/src/debug/qemu/10.0.6/target/ppc -> /usr/src/debug/qemu/10.1.2/target/ppc, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/adc -> /usr/src/debug/qemu/10.1.2/include/hw/adc, directory renamed /usr/src/debug/qemu/10.0.6/contrib/ivshmem-server -> /usr/src/debug/qemu/10.1.2/contrib/ivshmem-server, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/cxl -> /usr/src/debug/qemu/10.1.2/include/hw/cxl, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/dma -> /usr/src/debug/qemu/10.1.2/include/hw/dma, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/i2c -> /usr/src/debug/qemu/10.1.2/include/hw/i2c, directory renamed /usr/src/debug/qem
 u/10.0.6/include/hw/isa -> /usr/src/debug/qemu/10.1.2/include/hw/isa, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/ide -> /usr/src/debug/qemu/10.1.2/include/hw/ide, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-arm-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-arm-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/host/include/generic/host -> /usr/src/debug/qemu/10.1.2/host/include/generic/host, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/ipack -> /usr/src/debug/qemu/10.1.2/include/hw/ipack, directory renamed /usr/src/debug/qemu/10.0.6/include/qobject -> /usr/src/debug/qemu/10.1.2/include/qobject, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-ppc64le-linux-user.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-ppc64le-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.6/ui -> /usr/src/debug/qemu/10.1.2
 /ui, directory renamed /usr/src/debug/qemu/10.0.6/include/ui -> /usr/src/debug/qemu/10.1.2/include/ui, directory renamed /usr/src/debug/qemu/10.0.6/util -> /usr/src/debug/qemu/10.1.2/util, directory renamed /usr/src/debug/qemu/10.0.6/include/scsi -> /usr/src/debug/qemu/10.1.2/include/scsi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/block -> /usr/src/debug/qemu/10.1.2/include/hw/block, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/display -> /usr/src/debug/qemu/10.1.2/include/hw/display, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/scsi -> /usr/src/debug/qemu/10.1.2/include/hw/scsi, directory renamed /usr/src/debug/qemu/10.0.6/include/hw/sh4 -> /usr/src/debug/qemu/10.1.2/include/hw/sh4, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-mips-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-mips-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.6/libqemu-riscv64-softmmu.a.p -> /usr/src/debug/qemu/10.1.2/libqemu-riscv64-softmmu.a.p, directory 
 renamed /usr/src/debug/qemu/10.0.6/hw/loongarch -> /usr/src/debug/qemu/10.1.2/hw/loongarch, removed "/usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.0.6/hw/vfio/pci.h /usr/src/debug/qemu/10.0.6/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.0.6/include/qemu/datadir.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.0.6/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.0.6/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.0.6/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-job.c /usr
 /src/debug/qemu/10.0.6/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.0.6/include/qemu/async-teardown.h /usr/src/debug/qemu/10.0.6/include/qemu/atomic.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.0.6/include/qemu/qemu-print.h /usr/src/debug/qemu/10.0.6/include/qemu/yank.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.0.6/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.0.6/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.0.6/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_display.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_dump_trace_events.h /usr/src/
 debug/qemu/10.0.6/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.0.6/include/qemu/fifo8.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_display.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.0.6/include/qemu/madvise.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.0.6/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.0.6/include/exec/abi_ptr.h /usr/src/debug/qemu/10.0.6/include/hw/char/escc.h /usr/src/debug/qemu/10.0.6/include/qapi/qmp-event.h /usr/src/debug/qemu/10.0.6/include/qemu/path.h /usr/src
 /debug/qemu/10.0.6/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.0.6/include/qemu/typedefs.h /usr/src/debug/qemu/10.0.6/include/exec/log.h /usr/src/debug/qemu/10.0.6/include/qemu/log.h /usr/src/debug/qemu/10.0.6/qapi/qapi-emit-events.c /usr/src/debug/qemu/10.0.6/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.0.6/trace/trace-backends.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.0.6/trace/trace-backends.c /usr/src/debug/qemu/10.0.6/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.0.6/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.0.6/include/exec/ramlist.h /usr/src/debug/qemu/10.0.6/include/qemu/cacheflush.h /usr/src/debug/qemu/10.0.6/qapi/qapi-command
 s-virtio.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.0.6/target/riscv/pmp.h /usr/src/debug/qemu/10.0.6/trace/trace-target_ppc.c /usr/src/debug/qemu/10.0.6/include/qapi/type-helpers.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-events-machine-target.c /usr/src/debug/qemu/10.0.6/include/exec/target_page.h /usr/src/debug/qemu/10.0.6/include/exec/gdbstub.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.0.6/include/qemu/xxhash.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.0.6/trac
 e/trace-target_ppc.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.0.6/include/exec/memattrs.h /usr/src/debug/qemu/10.0.6/include/exec/memopidx.h /usr/src/debug/qemu/10.0.6/include/qemu/memalign.h /usr/src/debug/qemu/10.0.6/include/qemu/ratelimit.h /usr/src/debug/qemu/10.0.6/include/system/accel-ops.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.0.6/include/qemu/sockets.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_nvme.h /usr/
 src/debug/qemu/10.0.6/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qom.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.0.6/include/exec/ramblock.h /usr/src/debug/qemu/10.0.6/include/exec/ram_addr.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qom.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_misc_target_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-ui.c /usr/src/debug/qemu/10.0.6/include/qemu/qsp.h /usr/src/debug/qemu/10.0.6/qapi/qapi-features.h /usr/src/debug/qemu/10.0.6/include/qemu/iova-tree.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.0.6/trace/trace
 -hw_remote.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_remote.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_misc_target_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-ui.h /usr/src/debug/qemu/10.0.6/trace/trace-io.c /usr/src/debug/qemu/10.0.6/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.0.6/include/system/cpu-throttle.h /usr/src/debug/qemu/10.0.6/trace/trace-io.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.0.6/include/exec/hwaddr.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.0.
 6/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands.c /usr/src/debug/qemu/10.0.6/include/hw/i386/microvm.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.0.6/include/exec/cputlb.h /usr/src/debug/qemu/10.0.6/include/qemu/bitmap.h /usr/src/debug/qemu/10.0.6/include/qemu/plugin-event.h /usr/src/debug/qemu/10.0.6/include/system/tpm_backend.h /usr/src/debug/qemu/10.0.6/trace/trace-util.c /usr/src/debug/qemu/10.0.6/include/hw/vfio/vfio-common.h /usr/src/debug/qemu/10.0.6/trace/trace-target_arm.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.0.6/include/exec/page-protection.h /usr/src/debug/qemu/10.0.6/trace/trace-target_arm.h /usr/src/debug/qemu/10.0.6/trace/trace-util.h /usr/src/debug/qemu/10.0.6/trace/trace-backends_tpm.c /usr/src/debug
 /qemu/10.0.6/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.0.6/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.0.6/include/system/runstate.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.0.6/include/system/block-backend-common.h /usr/src/debug/qemu/10.0.6/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.0.6/include/qemu/throttle.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-misc-target.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.0.6/include/system/tpm_util.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.0.6/include/qemu/interval-tree.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/
 vfio/vfio-platform.h /usr/src/debug/qemu/10.0.6/trace/trace-linux_user.c /usr/src/debug/qemu/10.0.6/include/hw/i386/vmport.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_machine_target_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.0.6/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-linux_user.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_machine_target_trace_events.c /usr/src/debug/qemu/10.0.6/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.0.6/include/hw/i386/x86.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.0.6/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-ma
 chine-target.h /usr/src/debug/qemu/10.0.6/trace/trace-authz.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine-target.c /usr/src/debug/qemu/10.0.6/include/qemu/futex.h /usr/src/debug/qemu/10.0.6/trace/trace-authz.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.0.6/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.0.6/include/qemu/error-report.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.0.6/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.0.6/include/qemu/cpuid.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.0.6/include/exec/vaddr.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-qom.h /usr/sr
 c/debug/qemu/10.0.6/include/exec/translation-block.h /usr/src/debug/qemu/10.0.6/include/system/cryptodev.h /usr/src/debug/qemu/10.0.6/include/qemu/hw-version.h /usr/src/debug/qemu/10.0.6/include/qemu/chardev_open.h /usr/src/debug/qemu/10.0.6/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.0.6/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.0.6/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.0.6/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.0.6/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.0.6/trace/trace-migration.h /usr/src/debug/qemu/10.0.6/trace/trace-gdbstub.c /usr/src/debug/qemu/10.0.6/trace/trace-migration.c /usr/src/debug/qemu/10.0.6/trace/trace-gdbstub.h /usr/src/debug/qemu/10.0.6/include/exec/replay-core.h /usr/src/debug/qemu/10.0.6/trace/trace-block.c /usr/src/debug/qemu/10.0.6/include/qemu/range.h /usr/src/debug/qemu/10.0.6/trace/trace-block.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-a10
 -ccm.h /usr/src/debug/qemu/10.0.6/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.0.6/include/system/hostmem.h /usr/src/debug/qemu/10.0.6/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.0.6/include/system/accel-blocker.h /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.0.6/hw/i386/acpi-build.h /usr/src/debug/qemu/10.0.6/include/qemu/rcu.h /usr/src/debug/qemu/10.0.6/include/qapi/error.h /usr/src/debug/qemu/10.0.6/target/arm/syndrome.h /usr/src/debug/qemu/10.0.6/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.0.6/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.0.6/include/qemu/keyval.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.0.6/include/hw/arm/digic.h /usr/src/debug/qemu/10.0.6/include/system/qtest.h /
 usr/src/debug/qemu/10.0.6/include/system/reset.h /usr/src/debug/qemu/10.0.6/include/system/stats.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.0.6/include/qemu/qdist.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.0.6/trace/control-internal.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.0.6/trace/trace-system.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block.h /usr/src/debug/qemu/10.0.6/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-job.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-dump.c /usr
 /src/debug/qemu/10.0.6/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-job.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.0.6/include/exec/tswap.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.0.6/trace/trace-audio.h /usr/src/debug/qemu/10.0.6/include/qemu/help_option.h /usr/src/debug/qemu/10.0.6/include/
 hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.0.6/include/qemu/defer-call.h /usr/src/debug/qemu/10.0.6/trace/trace-audio.c /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.0.6/trace/trace-net.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine-target.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-net.c /usr/src/debug/qemu/10.0.6/include/system/arch_init.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_arm.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.0.6/include/qemu/cutils.h /usr/src/debug/qemu/10.0.6/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_arm.h /usr/src/debug/qemu/10.0.6/target/arm/internals.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-common.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.0.6/
 include/qapi/util.h /usr/src/debug/qemu/10.0.6/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.0.6/include/system/blockdev.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-common.c /usr/src/debug/qemu/10.0.6/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.0.6/include/exec/breakpoint.h /usr/src/debug/qemu/10.0.6/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.0.6/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types.c /usr/src/debug/qemu/10.0.6/include/qemu/timer.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.0.6/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.0.6/include/system/runstate-action.h /usr/src/debug/qemu/10.0.6/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.0.6/include/hw/arm/armsse.h /usr/src/debug/qemu/10.0.6/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.0.6/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.0.6/include/hw/arm/smmuv
 3.h /usr/src/debug/qemu/10.0.6/include/system/event-loop-base.h /usr/src/debug/qemu/10.0.6/include/system/os-posix.h /usr/src/debug/qemu/10.0.6/include/system/replay.h /usr/src/debug/qemu/10.0.6/include/system/system.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.0.6/include/system/cpu-timers.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.0.6/include/qemu/selfmap.h /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.0.6/include/qemu/seqlock.h /usr/src/debug/qemu/10.0.6/include/qemu/host-utils.h /usr/src/debug/qemu/10.0.6/include/qemu/uuid.h /usr/src/debug/qemu/10.0.6/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.0.6/include/qemu/thread-context.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-core.c /usr/src/debu
 g/qemu/10.0.6/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.0.6/include/system/rng.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.0.6/include/qemu/buffer.h /usr/src/debug/qemu/10.0.6/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.0.6/include/qemu/thread.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.0.6/include/qemu/option.h /usr/src/debug/qemu/10.0.6/include/system/xen.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.0.6/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-bloc
 k.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_isa.h /usr/src/debug/qemu/10.0.6/include/hw/char/serial.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.0.6/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.0.6/include/qemu/crc32c.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_timer.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/arm/omap.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.0.6/include/qemu/envlist.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-cxl.h /usr/src/debug/
 qemu/10.0.6/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.0.6/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.0.6/trace/trace-qapi.c /usr/src/debug/qemu/10.0.6/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi.h /usr/src/debug/qemu/10.0.6/include/exec/target_long.h /usr/src/debug/qemu/10.0.6/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.0.6/hw/ppc/e500-ccsr.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.0.6/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.0.6/trace/event-internal.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.0.6/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-yank
 .c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.0.6/include/exec/tb-flush.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.0.6/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.0.6/include/system/block-backend-io.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.0.6/include/exec/memop.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.0.6/include/exec/address-spaces.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-virtio.c /usr/src/debug/qe
 mu/10.0.6/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-misc-target.c /usr/src/debug/qemu/10.0.6/include/system/spdm-socket.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-misc-target.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine-target.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine-target.c /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.0.6/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.0.6/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.0.6/trace/trace-scsi.c /usr/src/debug/qemu/10.0.6/trace/trace-scsi.h /usr/src/debug/qemu/10.0.6
 /include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.0.6/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.0.6/include/qemu/main-loop.h /usr/src/debug/qemu/10.0.6/include/system/hw_accel.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.0.6/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.0.6/include/qemu/event_notifier.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-control.c /usr/src/debug/qemu/10.0.6/include/hw/arm/virt.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-control.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.0.6/include/exec/plugin-gen.h /us
 r/src/debug/qemu/10.0.6/target/arm/cpu-features.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.0.6/include/qemu/bitops.h /usr/src/debug/qemu/10.0.6/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.0.6/include/qemu/hbitmap.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.0.6/include/system/iothread.h /usr/src/debug/qemu/10.0.6/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.0.6/include/qemu/lockcnt.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_misc.c /usr/src/debug/qemu/10.0.6/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.0.6/include/qemu/config-file.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_misc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-migration.c /usr/src/d
 ebug/qemu/10.0.6/include/system/rtc.h /usr/src/debug/qemu/10.0.6/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.0.6/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.0.6/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.0.6/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.0.6/include/qemu/thread-posix.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.0.6/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.0.6/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.0.6/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.0.6/qap
 i/qapi-commands-qom.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.0.6/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-misc-target.c /usr/src/debug/qemu/10.0.6/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-misc-target.h /usr/src/debug/qemu/10.0.6/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.0.6/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.0.6/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.0.6/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.0.6/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.0.6/include/qemu/cpu-float.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.0.6/include/qem
 u/plugin.h /usr/src/debug/qemu/10.0.6/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.0.6/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.0.6/include/qemu/reserved-region.h /usr/src/debug/qemu/10.0.6/include/qemu/guest-random.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_usb.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.0.6/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.0.6/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_usb.c /usr/src/debug/qemu/10.0.6/include/qemu/qht.h /usr/src/debug/qemu/10.0.6/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.0.6/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /usr/src/debug/qemu/10.0.6/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.0.6/i
 nclude/hw/i386/apic_internal.h /usr/src/debug/qemu/10.0.6/include/qemu/pmem.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.0.6/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.0.6/include/qapi/compat-policy.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.0.6/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.0.6/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.0.6/include/exec/cpu-common.h /usr/src/debug/qemu/10.0.6/include/qemu/bcd.h /usr/src/debug/qemu/10.0.6/include/qemu/readline.h /usr/src/debug/qemu/10.0.6/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.0.6/
 include/system/kvm_int.h /usr/src/debug/qemu/10.0.6/include/system/iommufd.h /usr/src/debug/qemu/10.0.6/include/hw/i386/apic.h /usr/src/debug/qemu/10.0.6/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.0.6/include/exec/memory-internal.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_isa.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.0.6/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.0.6/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.0.6/include/system/dma.h /usr/src/debug/qemu/10.0.6/target/riscv/pmu.h /usr/src/debug/qemu/10.0.6/include/system/watchdog.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.0.6/include/qemu/base64.h /usr/src/debug/qemu/10.0.6/include/exec
 /cpu_ldst.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.0.6/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-job.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-net.c /usr/src/debug/qemu/10.0.6/include/exec/exec-all.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.0.6/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.0.6/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.0.6/trace/trace-system.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-job.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-net.h /usr/src/debug/qemu/10.0.6/include/exec/page-vary.h /usr/src/debug/qemu/10.0.6/include/system/tcg.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.0.6/include/qemu/progress_meter.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-
 replay.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_timer.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_audio.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_block.h /usr/src/debug/qemu/10.0.6/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_input.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.0.6/target/arm/cpu-qom.h /usr/src/debug/qemu/10.0.6/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_audio.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_block.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_input.c /usr/src/debug/qemu/10.0.6/include/qemu/qtree.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.0.6/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_comm
 ands_cxl_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.0.6/include/qemu/module.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.0.6/include/system/memory_mapping.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-bloc
 k-core.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.0.6/include/hw/arm/boot.h /usr/src/debug/qemu/10.0.6/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.0.6/include/qemu/job.h /usr/src/debug/qemu/10.0.6/include/qemu/queue.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.0.6/include/qemu/id.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.0.6/trace/control.h /usr/src/debug/qemu/10.0.6/include/qemu/fifo32.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.0.6/include/system/device_tree.h /usr/src/deb
 ug/qemu/10.0.6/target/riscv/cpu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.0.6/include/qemu/bswap.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_pci.c /usr/src/debug/qemu/10.0.6/include/system/balloon.h /usr/src/debug/qemu/10.0.6/include/system/kvm_xen.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_pci.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.0.6/include/qemu/transactions.h /usr/src/debug/qemu/10.0.6/include/exec/cpu-all.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.0.6/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.0.6/include/qapi/
 qobject-output-visitor.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.0.6/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.0.6/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.0.6/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.0.6/include/system/dump.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.0.6/include/qemu/mprotect.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.0.6/include/system/seccomp.h /usr/src/debug/qemu/10.0.6/include/system/dump-arch.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc-target.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.0.6/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc-target.h /usr/src/debug/qemu/10.0.6/include/qemu/stats64.h /usr/src/debug
 /qemu/10.0.6/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.0.6/include/qemu/filemonitor.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-char.c /usr/src/debug/qemu/10.0.6/trace/trace-monitor.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_sd.h /usr/src/debug/qemu/10.0.6/trace/trace-monitor.c /usr/src/debug/qemu/10.0.6/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_sd.c /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.0.6/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-acpi.h /usr/src/debug/qemu/
 10.0.6/qapi/qapi-types-char.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.0.6/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.0.6/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_xen.c /usr/src/debug/qemu/10.0.6/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_xen.h /usr/src/debug/qemu/10.0.6/include/exec/ioport.h /usr/src/debug/qemu/10.0.6/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_net.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.0.6/trace/trace-hw
 _net.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.0.6/include/exec/memory.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.0.6/target/arm/multiprocessing.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.0.6/include/system/tpm.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.0.6/include/system/dirtylimit.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.0.6/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.0.6/include/s
 ystem/numa.h /usr/src/debug/qemu/10.0.6/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ide.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.0.6/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.0.6/include/exec/translator.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.0.6/include/qemu/accel.h /usr/src/debug/qemu/10.0.6/include/hw/i386/topology.h /usr/src/debug/qemu/10.0.6/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.0.6/include/hw/misc/unimp.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/boot.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/numa.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/virt.h /usr/src/debug/qemu/10.0.6/include/qemu/memfd.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ide.c /usr/src/debug/qemu/10.0.6
 /trace/trace-hw_ssi.h /usr/src/debug/qemu/10.0.6/trace/trace-nbd.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.0.6/trace/trace-nbd.c /usr/src/debug/qemu/10.0.6/include/qemu/option_int.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.0.6/include/qemu/dbus.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.0.6/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.0.6/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_dma.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_dma.h /usr/src/debug/qemu/10.0.6/include/qemu/drm.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc-target.trace-events /
 usr/src/debug/qemu/10.0.6/include/hw/i386/pc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.0.6/target/arm/cpu.h /usr/src/debug/qemu/10.0.6/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.0.6/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-tpm.h /usr/src/debug/qemu/10.0.6/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.0.6/include/qemu/lockable.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_adc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_adc.c /us
 r/src/debug/qemu/10.0.6/include/qemu/systemd.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.0.6/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.0.6/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_core.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.0.6/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.0.6/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_core.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_intc.h /usr/src/debug/qemu/10.0.6/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_intc.c /usr/src/debug/qemu/10.0.6/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.0.6/trace/trace-root.c /usr/src/debug/qe
 mu/10.0.6/include/system/rng-random.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.0.6/trace/trace-root.h /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.0.6/include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.0.6/include/system/kvm.h /usr/src/debug/qemu/10.0.6/include/system/dirtyrate.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block.h /usr/src/debug/qemu/10.
 0.6/qapi/qapi-types-error.h /usr/src/debug/qemu/10.0.6/include/qemu/notify.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.0.6/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-block.c /usr/src/debug/qemu/10.0.6/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.0.6/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-error.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.0.6/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_char.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_char.h /usr/src/debug/qemu/10.0.6/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-char.c /usr/src/debug/qemu/10.0.6/qap
 i/qapi-events-dump.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.0.6/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-char.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.0.6/include/hw/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.0.6/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.0.6/include/qemu/timed-average.h /usr/src/debug/qemu/
 10.0.6/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-net.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.0.6/include/qemu/unicode.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-net.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.0.6/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine-target.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine-target.h /usr/src/debug/qemu/10.0.6/target/arm/idau.h /usr/src/debug/qemu/10.0.6/include/system/cpus.h /usr/src/debug/qemu/10.0.6/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.0.6/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.0.6/include/qemu/iov.h /usr/src/debug/qemu/10.0.6/include/hw/riscv/spike.h /usr/src/debug/qemu/10.0.6/target/arm/cpregs.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_scsi.h /usr/src/deb
 ug/qemu/10.0.6/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.0.6/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.0.6/trace/trace-target_i386.c /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.0.6/include/exec/tlb-common.h /usr/src/debug/qemu/10.0.6/include/system/host_iommu_device.h /usr/src/debug/qemu/10.0.6/trace/trace-target_i386.h /usr/src/debug/qemu/10.0.6/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.0.6/include/qapi/visitor.h /usr/src/debug/qemu/10.0.6/include/hw/char/parallel.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.0.6/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.0.6/include/qemu/int128.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.0.6/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.0.6/include/qemu/coroutine_int.h /usr/src
 /debug/qemu/10.0.6/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_mips.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.0.6/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386.h /usr/src/debug/qemu/10.0.6/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.0.6/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.0.6/target/arm/gtimer.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_mips.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qapi-introspect.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.0.6/trace/trace-chardev.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_mem.c /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.0.6/qapi/qa
 pi-visit-block-core.c /usr/src/debug/qemu/10.0.6/qapi/qapi-introspect.c /usr/src/debug/qemu/10.0.6/trace/trace-chardev.c /usr/src/debug/qemu/10.0.6/trace/trace-target_riscv.c /usr/src/debug/qemu/10.0.6/include/hw/char/serial-isa.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.0.6/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.0.6/trace/trace-target_riscv.h /usr/src/debug/qemu/10.0.6/include/hw/misc/led.h /usr/src/debug/qemu/10.0.6/trace/trace-hw_mem.h /usr/src/debug/qemu/10.0.6/include/qemu/coroutine.h /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.0.6/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.0.6/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.0.6/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.0.6/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.0.6/include/hw/cha
 r/pl011.h /usr/src/debug/qemu/10.0.6/include/qemu/osdep.h /usr/src/debug/qemu/10.0.6/trace/trace-qapi_commands_yank_trace_events.h", added "/usr/src/debug/qemu/10.1.2/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.1.2/include/exec/plugin-gen.h /usr/src/debug/qemu/10.1.2/target/arm/cpu-features.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.1.2/include/qemu/bitops.h /usr/src/debug/qemu/10.1.2/include/exec/mmap-lock.h /usr/src/debug/qemu/10.1.2/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.1.2/include/qemu/hbitmap.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.1.2/include/system/iothread.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-cpr.h /usr/src/debug/qemu/10.1.2/include/qemu/lockcnt.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-pci.c /usr/src/debug/qe
 mu/10.1.2/trace/trace-hw_misc.c /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.1.2/include/qemu/config-file.h /usr/src/debug/qemu/10.1.2/common-user/plugin-api.c.inc /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_misc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.1.2/include/system/rtc.h /usr/src/debug/qemu/10.1.2/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.1.2/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.1.2/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.1.2/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.1.2/include/qemu/thread-posix.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.1.2/hw/vfio-user/device.h /usr/src/debug/qemu/10.1.2/include/system/system.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-intros
 pect.c /usr/src/debug/qemu/10.1.2/include/accel/tcg/helper-retaddr.h /usr/src/debug/qemu/10.1.2/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.1.2/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.1.2/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.1.2/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.1.2/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.1.2/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.1.2/include/qapi/error-internal.h /usr/src/debug
 /qemu/10.1.2/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.1.2/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.1.2/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.1.2/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.1.2/include/qemu/cpu-float.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.1.2/include/qemu/plugin.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.1.2/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.1.2/include/qemu/reserved-region.h /usr/src/debug/qemu/10.1.2/include/qemu/guest-random.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_usb.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-run-state.c /usr/src/d
 ebug/qemu/10.1.2/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/iommu.h /usr/src/debug/qemu/10.1.2/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.1.2/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_usb.c /usr/src/debug/qemu/10.1.2/include/qemu/qht.h /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.1.2/include/hw/i386/apic_internal.h /usr/src/debug/qemu/10.1.2/include/qemu/pmem.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.1.2/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.1.2/include/qapi/compat-policy.h /usr/src/debug/qemu/10.1.2/hw/vfio/vfio-display.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block-expo
 rt.c /usr/src/debug/qemu/10.1.2/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.1.2/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.1.2/include/exec/cpu-common.h /usr/src/debug/qemu/10.1.2/include/qemu/bcd.h /usr/src/debug/qemu/10.1.2/include/qemu/readline.h /usr/src/debug/qemu/10.1.2/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.1.2/include/system/kvm_int.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-accelerator.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-accelerator.c /usr/src/debug/qemu/10.1.2/include/system/iommufd.h /usr/src/debug/qemu/10.1.2/include/hw/i386/apic.h /usr/src/debug/qemu/10.1.2/include/hw/i386/tdvf.h /usr/src/debug/qemu/1
 0.1.2/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine-s390x.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.1.2/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.1.2/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.1.2/include/system/dma.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine-s390x.h /usr/src/debug/qemu/10.1.2/include/system/watchdog.h /usr/src/debug/qemu/10.1.2/target/riscv/pmu.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.1.2/include/accel/accel-cpu-ops.h /usr/src/debug/qemu/10.1.2/include/qemu/base64.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-i386.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-types-socket
 s.c /usr/src/debug/qemu/10.1.2/hw/vfio-user/container.h /usr/src/debug/qemu/10.1.2/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-job.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-net.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.1.2/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.1.2/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_input.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-job.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-net.h /usr/src/debug/qemu/10.1.2/include/exec/page-vary.h /usr/src/debug/qemu/10.1.2/include/system/tcg.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_audio.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_block.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.1.2/include/qemu/progress_meter.h /usr
 /src/debug/qemu/10.1.2/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_timer.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_audio.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_input.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_timer.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_block.h /usr/src/debug/qemu/10.1.2/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.1.2/target/arm/cpu-qom.h /usr/src/debug/qemu/10.1.2/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.1.2/include/qemu/qtree.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.1.2/include/system/block-ram-registrar.h /usr/s
 rc/debug/qemu/10.1.2/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.1.2/include/qemu/module.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.1.2/include/system/memory_mapping.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block-core.h /usr/
 src/debug/qemu/10.1.2/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.1.2/include/hw/arm/boot.h /usr/src/debug/qemu/10.1.2/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.1.2/include/qemu/job.h /usr/src/debug/qemu/10.1.2/include/qemu/queue.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.1.2/include/qemu/id.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.1.2/trace/control.h /usr/src/debug/qemu/10.1.2/include/qemu/fifo32.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.1.2
 /include/system/device_tree.h /usr/src/debug/qemu/10.1.2/target/riscv/cpu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.1.2/include/qemu/bswap.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_pci.c /usr/src/debug/qemu/10.1.2/include/system/balloon.h /usr/src/debug/qemu/10.1.2/include/system/kvm_xen.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_pci.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.1.2/include/qemu/transactions.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.1.2/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.1.2/include/qapi/qobject-
 output-visitor.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine-s390x.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.1.2/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.1.2/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.1.2/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.1.2/include/system/dump.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.1.2/include/qemu/mprotect.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.1.2/include/system/seccomp.h /usr/src/debug/qemu/10.1.2/include/system/dump-arch.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.1.2/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/tb-cpu-state.h /usr/src/debug/qemu/10.1.2/include/qemu/stats64.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx_ccm.h /
 usr/src/debug/qemu/10.1.2/include/qemu/filemonitor.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-char.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.1.2/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_sd.c /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.1.2/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-char.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-qdev.h /usr/
 src/debug/qemu/10.1.2/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.1.2/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_xen.c /usr/src/debug/qemu/10.1.2/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_xen.h /usr/src/debug/qemu/10.1.2/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_net.c /usr/src/debug/qemu/10.1.2/include/system/ram_addr.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_net.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-cxl.c /usr/src/debug/qemu
 /10.1.2/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.1.2/target/arm/multiprocessing.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.1.2/include/system/tpm.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/s390x/storage-keys.h /usr/src/debug/qemu/10.1.2/include/system/dirtylimit.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.1.2/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.1.2/include/system/numa.h /usr/src/debug/qemu/10.1.2/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ide
 .h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.1.2/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.1.2/include/exec/translator.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.1.2/include/qemu/accel.h /usr/src/debug/qemu/10.1.2/include/hw/i386/topology.h /usr/src/debug/qemu/10.1.2/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/unimp.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/boot.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/numa.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ide.c /usr/src/debug/qemu/10.1.2/include/qemu/memfd.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/virt.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_accelerator_trace_events.h /usr/src/debug/qemu
 /10.1.2/trace/trace-nbd.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.1.2/trace/trace-nbd.c /usr/src/debug/qemu/10.1.2/include/qemu/option_int.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_accelerator_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-accelerator.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.1.2/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-accelerator.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_dma.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_dma.h /usr/src/debug/qemu/10.1.2/include/qemu/drm.h /usr/src/debug/qem
 u/10.1.2/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.1.2/include/hw/i386/pc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.1.2/target/arm/cpu.h /usr/src/debug/qemu/10.1.2/target/sh4/cpu.h /usr/src/debug/qemu/10.1.2/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.1.2/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-tpm.h /usr/src/debug/qemu/10.1.2/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.1.2/include/qemu/lockable.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.1.2/q
 api/qapi-types-qom.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_adc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_adc.c /usr/src/debug/qemu/10.1.2/include/qemu/systemd.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.1.2/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.1.2/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_core.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.1.2/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.1.2/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_core.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_intc.h /usr/src/debug/qemu/10.1.2/include/qemu/target
 -info-impl.h /usr/src/debug/qemu/10.1.2/include/qemu/target-info-qapi.h /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_intc.c /usr/src/debug/qemu/10.1.2/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.1.2/trace/trace-root.c /usr/src/debug/qemu/10.1.2/include/system/rng-random.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.1.2/trace/trace-root.h /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_char_trace_even
 ts.h /usr/src/debug/qemu/10.1.2/include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.1.2/include/system/kvm.h /usr/src/debug/qemu/10.1.2/include/system/dirtyrate.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-error.h /usr/src/debug/qemu/10.1.2/include/qemu/notify.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.1.2/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block.c /usr/src/debug/qemu/10.1.2/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.1.2/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-error.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-trace.c /usr/src
 /debug/qemu/10.1.2/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.1.2/hw/vfio-user/proxy.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_char.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_char.h /usr/src/debug/qemu/10.1.2/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-char.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-char.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-vfio.h /usr/src/debug
 /qemu/10.1.2/include/hw/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.1.2/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.1.2/include/qemu/timed-average.h /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-net.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.1.2/include/qemu/unicode.h /usr/src/debug/qemu/10.1.2/include/system/address-spaces.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-net.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.1.2/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.1.2/target/arm/idau.h /usr/src/debug/qemu/10.1.2/include/system/cpus.h /usr/src/debug/qemu/10.1.2/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.1.2/ta
 rget/riscv/cpu_bits.h /usr/src/debug/qemu/10.1.2/include/qemu/iov.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/spike.h /usr/src/debug/qemu/10.1.2/target/arm/cpregs.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.1.2/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.1.2/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.1.2/trace/trace-target_i386.c /usr/src/debug/qemu/10.1.2/nbd/nbd-internal.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine-s390x.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.1.2/include/exec/tlb-common.h /usr/src/debug/qemu/10.1.2/include/system/host_iommu_device.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine-s390x.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_sd.h /usr/src/debug/qemu/10.1.2/trace/trace-target_i386.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-accelerator.trace-events /usr/src/debug/qemu/10.1.2/include/qapi/visitor.h /
 usr/src/debug/qemu/10.1.2/include/hw/char/parallel.h /usr/src/debug/qemu/10.1.2/accel/dummy-cpus.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.1.2/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.1.2/include/qemu/int128.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.1.2/include/qemu/coroutine_int.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_mips.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386.h /usr/src/debug/qemu/10.1.2/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.
 1.2/target/arm/gtimer.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_mips.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-introspect.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.1.2/trace/trace-target_riscv.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_vfio_user.c /usr/src/debug/qemu/10.1.2/trace/trace-chardev.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_mem.c /usr/src/debug/qemu/10.1.2/trace/trace-chardev.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.1.2/include/system/ramblock.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/10.1.2/qapi/qapi-introspect.c /usr/src/debug/qemu/10.1.2/include/hw/char/serial-isa.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.1.2/trace/trace-target_riscv.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_vfio_user.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.1.2/in
 clude/hw/misc/led.h /usr/src/debug/qemu/10.1.2/include/qemu/coroutine.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_mem.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.1.2/include/qemu/dbus.h /usr/src/debug/qemu/10.1.2/include/hw/char/pl011.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.1.2/include/qemu/osdep.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-cryptodev.c /usr/sr
 c/debug/qemu/10.1.2/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.1.2/hw/vfio/pci.h /usr/src/debug/qemu/10.1.2/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.1.2/include/qemu/datadir.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.1.2/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.1.2/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.1.2/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.1.2/include/hw/char/max78000_uart.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_trace_even
 ts.h /usr/src/debug/qemu/10.1.2/include/qemu/async-teardown.h /usr/src/debug/qemu/10.1.2/include/qemu/atomic.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.1.2/include/qemu/qemu-print.h /usr/src/debug/qemu/10.1.2/hw/vfio-user/protocol.h /usr/src/debug/qemu/10.1.2/include/qemu/yank.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.1.2/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.1.2/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.1.2/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_display.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_machine_s390x_trace_events.h /usr
 /src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.1.2/include/qemu/fifo8.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_display.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_machine_s390x_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine-s390x.c /usr/src/debug/qemu/10.1.2/include/qemu/madvise.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.1.2/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/max78000_trng.h /usr/src/debug/qemu/10.1.2/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine-s390x.h /usr/src/debug/
 qemu/10.1.2/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.1.2/include/exec/abi_ptr.h /usr/src/debug/qemu/10.1.2/include/hw/char/escc.h /usr/src/debug/qemu/10.1.2/include/qapi/qmp-event.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-accelerator.c /usr/src/debug/qemu/10.1.2/include/system/hvf.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-container.h /usr/src/debug/qemu/10.1.2/include/qemu/path.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-accelerator.h /usr/src/debug/qemu/10.1.2/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.1.2/include/system/xen-mapcache.h /usr/src/debug/qemu/10.1.2/include/qemu/typedefs.h /usr/src/debug/qemu/10.1.2/include/exec/log.h /usr/src/debug/qemu/10.1.2/include/qemu/log.h /usr/src/debug/qemu/10.1.2/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.1.2/trace/trace-backends.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive
 _test.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.1.2/trace/trace-backends.c /usr/src/debug/qemu/10.1.2/include/exec/icount.h /usr/src/debug/qemu/10.1.2/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc-i386.h /usr/src/debug/qemu/10.1.2/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc-i386.c /usr/src/debug/qemu/10.1.2/include/exec/ramlist.h /usr/src/debug/qemu/10.1.2/include/qemu/cacheflush.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.1.2/target/riscv/pmp.h /usr/src/debug/qemu/10.1.2/trace/trace-target_ppc.c /usr/src/debug/qemu/10.1.2/include/qapi/type-helpers.h /usr/src/debug/qemu/10.1.2/qapi/qap
 i-commands-cryptodev.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.1.2/include/exec/target_page.h /usr/src/debug/qemu/10.1.2/include/exec/gdbstub.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.1.2/include/qemu/xxhash.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.1.2/trace/trace-target_ppc.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i38
 6_kvm.h /usr/src/debug/qemu/10.1.2/include/exec/memattrs.h /usr/src/debug/qemu/10.1.2/include/hw/misc/max78000_icc.h /usr/src/debug/qemu/10.1.2/include/exec/memopidx.h /usr/src/debug/qemu/10.1.2/include/hw/misc/max78000_aes.h /usr/src/debug/qemu/10.1.2/include/hw/misc/max78000_gcr.h /usr/src/debug/qemu/10.1.2/include/qemu/memalign.h /usr/src/debug/qemu/10.1.2/include/exec/watchpoint.h /usr/src/debug/qemu/10.1.2/include/qemu/ratelimit.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.1.2/include/qemu/sockets.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qom.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_sh4.c /usr/src/debug/qemu/1
 0.1.2/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-qom.c /usr/src/debug/qemu/10.1.2/trace/trace-ui.c /usr/src/debug/qemu/10.1.2/include/qemu/qsp.h /usr/src/debug/qemu/10.1.2/qapi/qapi-features.h /usr/src/debug/qemu/10.1.2/include/qemu/iova-tree.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_remote.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_remote.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.1.2/trace/trace-ui.h
  /usr/src/debug/qemu/10.1.2/trace/trace-io.c /usr/src/debug/qemu/10.1.2/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.1.2/include/system/cpu-throttle.h /usr/src/debug/qemu/10.1.2/trace/trace-io.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.1.2/include/exec/hwaddr.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.1.2/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.1.2/include/hw/i386/microvm.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.1.2/include/system/igvm-cfg.h /usr/src/debug/qemu/10.1.2/include/exec/cputlb.h /usr/src/debug/qemu/10.1.2/include/qemu/bitmap.h /usr/src/debug/qemu/10.1.2/include/qemu/plugin-event.h /usr/src/debug/qemu/10.1.2/include/
 system/tpm_backend.h /usr/src/debug/qemu/10.1.2/trace/trace-util.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-arm.h /usr/src/debug/qemu/10.1.2/trace/trace-target_arm.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-target_arm.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-arm.c /usr/src/debug/qemu/10.1.2/trace/trace-util.h /usr/src/debug/qemu/10.1.2/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.1.2/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.1.2/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.1.2/include/system/runstate.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.1.2/include/system/block-backend-common.h /usr/src/debug/qemu/10.1.2/qapi/qa
 pi-commands-misc-arm.trace-events /usr/src/debug/qemu/10.1.2/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.1.2/include/hw/arm/max78000_soc.h /usr/src/debug/qemu/10.1.2/include/qemu/throttle.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.1.2/include/system/tpm_util.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.1.2/include/qemu/interval-tree.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.1.2/hw/i386/tdvf-hob.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.1.2/trace/trace-linux_user.c /usr/src/debug/qemu/10.1.2/include/hw/i386/vmport.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.1.2/include/hw/arm/soc_dma.h /usr/src/d
 ebug/qemu/10.1.2/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-linux_user.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.1.2/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.1.2/include/hw/i386/x86.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.1.2/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.1.2/trace/trace-authz.c /usr/src/debug/qemu/10.1.2/include/hw/riscv/xiangshan_kmh.h /usr/src/debug/qemu/10.1.2/include/qemu/futex.h /usr/src/debug/qemu/10.1.2/trace/trace-authz.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.1.2/target/riscv/time_helper.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.1.2/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.1.2/include/qemu/error-report.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-pci.c /usr/src/debug
 /qemu/10.1.2/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.1.2/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.1.2/include/qemu/cpuid.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.1.2/include/exec/vaddr.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.1.2/include/exec/translation-block.h /usr/src/debug/qemu/10.1.2/include/system/cryptodev.h /usr/src/debug/qemu/10.1.2/include/qemu/hw-version.h /usr/src/debug/qemu/10.1.2/include/qemu/chardev_open.h /usr/src/debug/qemu/10.1.2/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.1.2/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.1.2/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.1.2/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.1.2/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.1.2/include/hw/arm/allwinner-r40.h 
 /usr/src/debug/qemu/10.1.2/trace/trace-gdbstub.c /usr/src/debug/qemu/10.1.2/trace/trace-migration.h /usr/src/debug/qemu/10.1.2/trace/trace-migration.c /usr/src/debug/qemu/10.1.2/trace/trace-gdbstub.h /usr/src/debug/qemu/10.1.2/include/exec/replay-core.h /usr/src/debug/qemu/10.1.2/trace/trace-block.c /usr/src/debug/qemu/10.1.2/include/accel/tcg/probe.h /usr/src/debug/qemu/10.1.2/include/qemu/range.h /usr/src/debug/qemu/10.1.2/trace/trace-block.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.1.2/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.1.2/include/system/hostmem.h /usr/src/debug/qemu/10.1.2/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.1.2/include/system/accel-blocker.h /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.1.2/target/riscv/cpu_cfg_fields.h.inc /usr/src/debug/qemu/10.1.2/hw/i386/acpi-build.h /usr/src/debug/qemu/10.1.2/include/qemu/rcu.h /usr/src/debug/qemu/10.1.2/include/qapi
 /error.h /usr/src/debug/qemu/10.1.2/target/arm/syndrome.h /usr/src/debug/qemu/10.1.2/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.1.2/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.1.2/include/qemu/keyval.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.1.2/include/accel/accel-cpu.h /usr/src/debug/qemu/10.1.2/include/hw/arm/digic.h /usr/src/debug/qemu/10.1.2/include/system/qtest.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/cpu-ldst-common.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.1.2/include/system/reset.h /usr/src/debug/qemu/10.1.2/include/system/stats.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.1.2
 /include/qemu/qdist.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.1.2/trace/control-internal.h /usr/src/debug/qemu/10.1.2/trace/trace-system.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.1.2/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-job.h /usr/src/debug/qemu/10.1.2/include/accel/accel-ops.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-dump.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.1.2/qapi/qapi-events-block.c /us
 r/src/debug/qemu/10.1.2/qapi/qapi-types-job.c /usr/src/debug/qemu/10.1.2/include/exec/tswap.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.1.2/trace/trace-audio.h /usr/src/debug/qemu/10.1.2/include/qemu/help_option.h /usr/src/debug/qemu/10.1.2/include/qemu/host-pci-mmio.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.1.2/include/qemu/defer-call.h /usr/src/debug/qemu/10.1.2/trace/trace-audio.c /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_uefi.c /usr/
 src/debug/qemu/10.1.2/trace/trace-net.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.1.2/trace/trace-net.c /usr/src/debug/qemu/10.1.2/include/system/arch_init.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_arm.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.1.2/include/qemu/cutils.h /usr/src/debug/qemu/10.1.2/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_arm.h /usr/src/debug/qemu/10.1.2/target/arm/internals.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-common.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.1.2/include/qapi/util.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc-arm.c /usr/src/debug/qemu/10.1.2/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.1.2/include/system/blockdev.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.1.2/qapi/qapi-types-common.c /usr/src/debug/qemu/10.1.2/qapi/qapi-in
 it-commands.h /usr/src/debug/qemu/10.1.2/target/arm/cpu-sysregs.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-misc-arm.h /usr/src/debug/qemu/10.1.2/include/exec/breakpoint.h /usr/src/debug/qemu/10.1.2/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.1.2/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.1.2/include/qemu/timer.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.1.2/include/accel/tcg/cpu-ldst.h /usr/src/debug/qemu/10.1.2/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-migration.h /usr/src/debug/qemu/10.1.2/include/system/runstate-action.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.1.2/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.1.2/target/i386/kvm/tdx-quote-generator.h /usr/src/debug/qemu/10.1.2/include/hw/arm/armsse.h /usr/src/debug/qemu/10.1.2/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.1.2/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.1.2/include/hw/arm/smmuv3.h /usr/src/debug/qemu
 /10.1.2/include/system/event-loop-base.h /usr/src/debug/qemu/10.1.2/include/system/ioport.h /usr/src/debug/qemu/10.1.2/include/system/memory.h /usr/src/debug/qemu/10.1.2/include/system/os-posix.h /usr/src/debug/qemu/10.1.2/include/system/replay.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.1.2/include/system/cpu-timers.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.1.2/include/qemu/selfmap.h /usr/src/debug/qemu/10.1.2/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.1.2/include/qemu/seqlock.h /usr/src/debug/qemu/10.1.2/include/qemu/host-utils.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc-arm.h /usr/src/debug/qemu/10.1.2/include/qemu/uuid.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc-arm.c /usr/src/debug/qemu/10.1.2/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.1.2/include/qemu/thread-context.h /usr/src/debug/
 qemu/10.1.2/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.1.2/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.1.2/include/system/rng.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.1.2/include/qemu/buffer.h /usr/src/debug/qemu/10.1.2/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.1.2/include/qemu/thread.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.1.2/include/qemu/option.h /usr/src/debug/qemu/10.1.2/include/system/xen.h /usr/src/debug/qemu/10.1.2
 /qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.1.2/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-block.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_isa.h /usr/src/debug/qemu/10.1.2/include/hw/char/serial.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.1.2/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.1.2/include/qemu/crc32c.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.1.2/include/hw/arm/omap.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc-i386.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-misc-i386.c /usr/src/debug/qemu/10.1.2/include/qemu/envlist.h /usr/src/debug/qe
 mu/10.1.2/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.1.2/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-i386.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_i386_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi.c /usr/src/debug/qemu/10.1.2/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_i386_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-misc-i386.c /usr/src/debug/qemu/10.1.2/trace/trace-monitor.h /usr/src/debug/qemu/10.1.2/include/exec/target_long.h /usr/src/debug/qemu/10.1.2/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.1.2/include/standard-headers/uefi/uefi.h /usr/src/debug/qemu/10.1.2/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/q
 emu/10.1.2/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-region.h /usr/src/debug/qemu/10.1.2/hw/vfio/vfio-listener.h /usr/src/debug/qemu/10.1.2/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.1.2/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.1.2/trace/event-internal.h /usr/src/debug/qemu/10.1.2/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.1.2/target/i386/kvm/tdx.h /usr/src/debug/qemu/10.1.2/trace/trace-monitor.c /usr/src/debug/qemu/10.1.2/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.1.2/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.1.2/include/accel/tcg/cpu-mmu-index.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.1.2/include/exec/tb-flush.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.1.2/tra
 ce/trace-hw_net_can.h /usr/src/debug/qemu/10.1.2/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.1.2/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.1.2/include/system/block-backend-io.h /usr/src/debug/qemu/10.1.2/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.1.2/include/exec/memop.h /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_arm_trace_events.c /usr/src/debug/qemu/10.1.2/trace/trace-qapi_commands_misc_arm_trace_events.h /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.1.2/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.1.2/include/hw/vfio/vfio-device.h /usr/src/debug/qemu/10.1.2/include/system/spdm-socket.h /usr/src/debug/qemu/10.1.2/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.1.2/qapi/qapi-co
 mmands-qom.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.1.2/trace/trace-hw_isa.c /usr/src/debug/qemu/10.1.2/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.1.2/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.1.2/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.1.2/trace/trace-scsi.c /usr/src/debug/qemu/10.1.2/trace/trace-scsi.h /usr/src/debug/qemu/10.1.2/trace/trace-system.h /usr/src/debug/qemu/10.1.2/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.1.2/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.1.2/include/qemu/main-loop.h /usr/src/debug/qemu/10.1.2/include/system/hw_accel.h /usr/src/debug/qemu/10.1.2/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qem
 u/10.1.2/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.1.2/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.1.2/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.1.2/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.1.2/include/qemu/event_notifier.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-control.c /usr/src/debug/qemu/10.1.2/include/hw/arm/virt.h /usr/src/debug/qemu/10.1.2/include/qemu/target-info.h /usr/src/debug/qemu/10.1.2/qapi/qapi-types-control.h"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGSIZE changed from 33861132 to 32256545 (-5%)
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31678344 to 33668088 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29184224 to 30750096 (+5%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26872104 to 28372920 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14807816 to 14339640 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13609896 to 13191992 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13750632 to 13328632 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15702472 to 15226936 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13601704 to 13183800 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15808384 to 15303728 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 16966344 to 16416152 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 16030312 to 15603064 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16101992 to 15678840 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12136320 to 11736304 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26923080 to 28498424 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGSIZE changed from 5334176 to 5795152 (+9%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGSIZE changed from 3351680 to 3446352 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGSIZE changed from 2716032 to 2748208 (+1%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGSIZE changed from 2577768 to 2635448 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGSIZE changed from 3149632 to 3211600 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGSIZE changed from 3182112 to 3248176 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGSIZE changed from 3173920 to 3239984 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGSIZE changed from 3137344 to 3203408 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGSIZE changed from 2988992 to 3050736 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGSIZE changed from 3063808 to 3125552 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGSIZE changed from 3055616 to 3117360 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGSIZE changed from 3469856 to 3535728 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGSIZE changed from 3535392 to 3605360 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGSIZE changed from 2008704 to 2062256 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGSIZE changed from 878792 to 825816 (-6%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PV changed from "10.0.6" to "10.1.2"
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGSIZE changed from 2700416 to 2736688 (+1%)
packages/x86-64-v3-poky-linux/qemu/qemu: PKGV changed from 10.0.6 [default] to 10.1.2 [default]
packages/x86-64-v3-poky-linux/qemu/qemu: PV changed from "10.0.6" to "10.1.2"
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

--===============5578891785752314519==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-system-native-qemu-qemu-native-upgrade-10.0.6-1.patch"

RnJvbSA2NjQ3YWZkZjUxYmRlNjQ1NTYzZTEzMDg4ZjdjMWUyYWQyMDk5OTZjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFNhdCwgMTUgTm92IDIwMjUgMDY6NDY6MzEgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11LXN5c3RlbS1uYXRpdmUscWVtdSxxZW11LW5hdGl2ZTogdXBncmFkZSAxMC4wLjYgLT4KIDEw
LjEuMiwxMC4wLjYgLT4gMTAuMS4yLDEwLjAuNiAtPiAxMC4xLjIKCi0tLQogLi4ubmF0aXZlXzEw
LjAuNi5iYiA9PiBxZW11LW5hdGl2ZV8xMC4xLjIuYmJ9IHwgNDMgKysrKysrKysrKysrKysrKysr
KwogLi4uMTAuMC42LmJiID0+IHFlbXUtc3lzdGVtLW5hdGl2ZV8xMC4xLjIuYmJ9IHwgNDMgKysr
KysrKysrKysrKysrKysrKwogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgICAg
ICAgICAgIHwgIDcgKy0tCiAuLi5uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEu
cGF0Y2ggfCAgNCArLQogLi4uLzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0
Y2ggIHwgIDYgKy0tCiAuLi5tdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0
Y2ggfCAgNiArLS0KIC4uLmVyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRj
aCB8ICA2ICstLQogLi4uL3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoICAg
IHwgIDYgKy0tCiAuLi5kLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gg
fCAgMiArLQogLi4uYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoIHwg
IDIgKy0KIC4uLmd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaCB8ICA2
ICstLQogLi4uYW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoIHwgIDYg
Ky0tCiAuLi4vcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2ggICAgICAgfCAgNiAr
LS0KIC4uLi9xZW11L3txZW11XzEwLjAuNi5iYiA9PiBxZW11XzEwLjEuMi5iYn0gICB8IDQzICsr
KysrKysrKysrKysrKysrKysKIDE0IGZpbGVzIGNoYW5nZWQsIDE1OCBpbnNlcnRpb25zKCspLCAy
OCBkZWxldGlvbnMoLSkKIHJlbmFtZSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdS1u
YXRpdmVfMTAuMC42LmJiID0+IHFlbXUtbmF0aXZlXzEwLjEuMi5iYn0gKDEzJSkKIHJlbmFtZSBt
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS97cWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjAuNi5iYiA9
PiBxZW11LXN5c3RlbS1uYXRpdmVfMTAuMS4yLmJifSAoNDIlKQogcmVuYW1lIG1ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3txZW11XzEwLjAuNi5iYiA9PiBxZW11XzEwLjEuMi5iYn0gKDQxJSkK
CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8xMC4w
LjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8xMC4xLjIuYmIK
c2ltaWxhcml0eSBpbmRleCAxMyUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS1uYXRpdmVfMTAuMC42LmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMv
cWVtdS9xZW11LW5hdGl2ZV8xMC4xLjIuYmIKaW5kZXggMjZmYTg0YzE4MC4uMzI0Y2Y5ZDUxYSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfMTAuMC42
LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjEuMi5i
YgpAQCAtMSwzICsxLDQ2IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVTX0NIS1NVTSB2YWx1ZXMg
aGF2ZSBiZWVuIHVwZGF0ZWQgYnkgJ2RldnRvb2wgdXBncmFkZScuCisjIFRoZSBmb2xsb3dpbmcg
aXMgdGhlIGRpZmZlcmVuY2UgYmV0d2VlbiB0aGUgb2xkIGFuZCB0aGUgbmV3IGxpY2Vuc2UgdGV4
dC4KKyMgUGxlYXNlIHVwZGF0ZSB0aGUgTElDRU5TRSB2YWx1ZSBpZiBuZWVkZWQsIGFuZCBzdW1t
YXJpemUgdGhlIGNoYW5nZXMgaW4KKyMgdGhlIGNvbW1pdCBtZXNzYWdlIHZpYSAnTGljZW5zZS1V
cGRhdGU6JyB0YWcuCisjIChleGFtcGxlOiAnTGljZW5zZS1VcGRhdGU6IGNvcHlyaWdodCB5ZWFy
cyB1cGRhdGVkLicpCisjCisjIFRoZSBjaGFuZ2VzOgorIworIyAtLS0gQ09QWUlORworIyArKysg
Q09QWUlORworIyBAQCAtMiw3ICsyLDcgQEAKKyMgIAkJICAgICAgIFZlcnNpb24gMiwgSnVuZSAx
OTkxCisjICAKKyMgICBDb3B5cmlnaHQgKEMpIDE5ODksIDE5OTEgRnJlZSBTb2Z0d2FyZSBGb3Vu
ZGF0aW9uLCBJbmMuLAorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGggRmxvb3IsIEJvc3Rv
biwgTUEgMDIxMTAtMTMwMSBVU0EKKyMgKyA8aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9u
ZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMg
ICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dl
ZC4KKyMgIAorIyBAQCAtMzA0LDggKzMwNCw3IEBACisjICAgICAgR05VIEdlbmVyYWwgUHVibGlj
IExpY2Vuc2UgZm9yIG1vcmUgZGV0YWlscy4KKyMgIAorIyAgICAgIFlvdSBzaG91bGQgaGF2ZSBy
ZWNlaXZlZCBhIGNvcHkgb2YgdGhlIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGFsb25nCisj
IC0gICAgd2l0aCB0aGlzIHByb2dyYW07IGlmIG5vdCwgd3JpdGUgdG8gdGhlIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSAgICA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZs
b29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBLgorIyArICAgIHdpdGggdGhpcyBwcm9ncmFt
OyBpZiBub3QsIHNlZSA8aHR0cHM6Ly93d3cuZ251Lm9yZy9saWNlbnNlcy8+LgorIyAgCisjICBB
bHNvIGFkZCBpbmZvcm1hdGlvbiBvbiBob3cgdG8gY29udGFjdCB5b3UgYnkgZWxlY3Ryb25pYyBh
bmQgcGFwZXIgbWFpbC4KKyMgIAorIyAtLS0gQ09QWUlORy5MSUIKKyMgKysrIENPUFlJTkcuTElC
CisjIEBAIC0yLDcgKzIsNyBAQAorIyAgICAgICAgICAgICAgICAgICAgICAgICBWZXJzaW9uIDIu
MSwgRmVicnVhcnkgMTk5OQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAxOTkxLCAxOTk5IEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgorIyAtIDUxIEZyYW5rbGluIFN0cmVldCwgRmlmdGgg
Rmxvb3IsIEJvc3RvbiwgTUEgIDAyMTEwLTEzMDEgIFVTQQorIyArIDxodHRwczovL2ZzZi5vcmcv
PgorIyAgIEV2ZXJ5b25lIGlzIHBlcm1pdHRlZCB0byBjb3B5IGFuZCBkaXN0cmlidXRlIHZlcmJh
dGltIGNvcGllcworIyAgIG9mIHRoaXMgbGljZW5zZSBkb2N1bWVudCwgYnV0IGNoYW5naW5nIGl0
IGlzIG5vdCBhbGxvd2VkLgorIyAgCisjIAorIworCiBCUE4gPSAicWVtdSIKIAogREVQRU5EUyAr
PSAiZ2xpYi0yLjAtbmF0aXZlIHpsaWItbmF0aXZlIgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjAuNi5iYiBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2ZV8xMC4xLjIuYmIKc2ltaWxhcml0eSBp
bmRleCA0MiUKcmVuYW1lIGZyb20gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0
ZW0tbmF0aXZlXzEwLjAuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjEuMi5iYgppbmRleCAyMjQ2MmUyNDk5Li41MTFjMjNjM2Jh
IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRp
dmVfMTAuMC42LmJiCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVt
LW5hdGl2ZV8xMC4xLjIuYmIKQEAgLTEsMyArMSw0NiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxF
U19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgor
IyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhl
IG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYg
bmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2Fn
ZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRl
OiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0t
IENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTIsNyArMiw3IEBACisjICAJCSAgICAgICBW
ZXJzaW9uIDIsIEp1bmUgMTk5MQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZy
ZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSA1MSBGcmFua2xpbiBTdHJlZXQsIEZp
ZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBCisjICsgPGh0dHBzOi8vZnNmLm9y
Zy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVy
YmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcg
aXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgQEAgLTMwNCw4ICszMDQsNyBAQAorIyAgICAgIEdO
VSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICAKKyMgICAgICBZ
b3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMg
TGljZW5zZSBhbG9uZworIyAtICAgIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRv
IHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjIC0gICAgNTEgRnJhbmtsaW4g
U3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQS4KKyMgKyAgICB3
aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5z
ZXMvPi4KKyMgIAorIyAgQWxzbyBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNvbnRhY3QgeW91
IGJ5IGVsZWN0cm9uaWMgYW5kIHBhcGVyIG1haWwuCisjICAKKyMgLS0tIENPUFlJTkcuTElCCisj
ICsrKyBDT1BZSU5HLkxJQgorIyBAQCAtMiw3ICsyLDcgQEAKKyMgICAgICAgICAgICAgICAgICAg
ICAgICAgVmVyc2lvbiAyLjEsIEZlYnJ1YXJ5IDE5OTkKKyMgIAorIyAgIENvcHlyaWdodCAoQykg
MTk5MSwgMTk5OSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMgLSA1MSBGcmFua2xp
biBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgKyA8
aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQg
ZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQs
IGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAKKyMKKwogQlBOID0gInFl
bXUiCiAKIHJlcXVpcmUgcWVtdS1uYXRpdmUuaW5jCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LmluYyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUu
aW5jCmluZGV4IDNlZDVkY2M2NzEuLmYzZjI3N2YyNTMgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUuaW5jCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUuaW5jCkBAIC0xNSw4ICsxNSw5IEBAIHJlcXVpcmUgcWVtdS10YXJnZXRzLmluYwogIyB3
ZSBuZWVkIGEgZnVsbCBweXRob24zLW5hdGl2ZSBzZXR1cAogaW5oZXJpdCBwa2djb25maWcgcHRl
c3QgdXBkYXRlLXJjLmQgc3lzdGVtZCBweXRob24zbmF0aXZlCiAKLUxJQ19GSUxFU19DSEtTVU0g
PSAiZmlsZTovL0NPUFlJTkc7bWQ1PTQ0MWMyOGQyY2Y4NmUxNWEzN2ZhNDdlMTVhNzJmYmFjIFwK
LSAgICAgICAgICAgICAgICAgICAgZmlsZTovL0NPUFlJTkcuTElCO2VuZGxpbmU9MjQ7bWQ1PThj
NWVmZGE2Y2YxZTFiMDNkY2ZkMGU2YzBkMjcxYzdmIgorTElDX0ZJTEVTX0NIS1NVTSA9ICJmaWxl
Oi8vQ09QWUlORzttZDU9YTNiNTBkOGI4OGRjYzBlYjNkN2QzOWI3NjBiOWU4MjEgXAorICAgICAg
ICAgICAgICAgICAgICBmaWxlOi8vQ09QWUlORy5MSUI7ZW5kbGluZT0yNDttZDU9OGE4MTc4YzA2
NDc4NzQ3YTc3MTU4OGFkZWM5NjUyMzIgXAorICAgICAgICAgICAgICAgICAgICAiCiAKIFNSQ19V
UkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0tJHtQVn0udGFyLnh6IFwKICAg
ICAgICAgICAgZmlsZTovL3Bvd2VycGNfcm9tLmJpbiBcCkBAIC0zOCw3ICszOSw3IEBAIFNSQ19V
UkkgPSAiaHR0cHM6Ly9kb3dubG9hZC5xZW11Lm9yZy8ke0JQTn0tJHtQVn0udGFyLnh6IFwKIFVQ
U1RSRUFNX0NIRUNLX1VSSSA9ICJodHRwczovL3d3dy5xZW11Lm9yZyIKIFVQU1RSRUFNX0NIRUNL
X1JFR0VYID0gInFlbXUtKD9QPHB2ZXI+XGQrKFwuXGQrKSspXC50YXIiCiAKLVNSQ19VUklbc2hh
MjU2c3VtXSA9ICJjN2M0MGM0YjE2Njg3MWU3NzU4MDRlOTdmY2U0ZGE2NTY2NWQxY2M5M2E1YzZj
OWUyZWRlOWQ5ZWU5OTJlN2EwIgorU1JDX1VSSVtzaGEyNTZzdW1dID0gIjlkNzVmMzMxYzFhNWNi
OWI2ZWI4ZmQ5ZjY0ZjU2M2VjMmVhYjM0NmM4MjJjYjk3ZjhiMzVjZDgyZDNmMTE0NzkiCiAKIENW
RV9TVEFUVVNbQ1ZFLTIwMDctMDk5OF0gPSAibm90LWFwcGxpY2FibGUtY29uZmlnOiBUaGUgVk5D
IHNlcnZlciBjYW4gZXhwb3NlIGhvc3QgZmlsZXMgdWRlciBzb21lIGNpcmN1bXN0YW5jZXMuIFdl
IGRvbid0IGVuYWJsZSBpdCBieSBkZWZhdWx0LiIKIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNw
YWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2UtdG8tYm9vdC1sb2Fk
ZXItcS5wYXRjaAppbmRleCBmMjcyMDhmNDVmLi4yMTFhZmJjMTdjIDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJv
bm1lbnQtc3BhY2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3BhY2Ut
dG8tYm9vdC1sb2FkZXItcS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMjcyNzNmY2FjNjg1
Nzc1MGYwN2EyNjMyYmRiNmIwZWQ2NmFlOTgyYSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zy
b20gNGQxOWZiYmNhNDgzODc5YmM2N2E3OGMyNDBlNjQ1ZTA0YWY4NGNmZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKIEZyb206IEphc29uIFdlc3NlbCA8amFzb24ud2Vzc2VsQHdpbmRyaXZlci5j
b20+CiBEYXRlOiBGcmksIDI4IE1hciAyMDE0IDE3OjQyOjQzICswODAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHFlbXU6IEFkZCBhZGRpdGlvbiBlbnZpcm9ubWVudCBzcGFjZSB0byBib290IGxvYWRlcgpA
QCAtMTgsNyArMTgsNyBAQCBTaWduZWQtb2ZmLWJ5OiBSb3kgTGkgPHJvbmdxaW5nLmxpQHdpbmRy
aXZlci5jb20+CiAgMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0p
CiAKIGRpZmYgLS1naXQgYS9ody9taXBzL21hbHRhLmMgYi9ody9taXBzL21hbHRhLmMKLWluZGV4
IDhlOWNlYTcwYi4uMjI2OGE4YjYxIDEwMDY0NAoraW5kZXggY2JkYmIyMTA1Li42MjY4MWZkYWUg
MTAwNjQ0CiAtLS0gYS9ody9taXBzL21hbHRhLmMKICsrKyBiL2h3L21pcHMvbWFsdGEuYwogQEAg
LTY1LDcgKzY1LDcgQEAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaCBiL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5w
YXRjaAppbmRleCBhZDVjNWJhMDNlLi40ZWVlMzlmOTliIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lw
ZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMu
cGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4
dXAtZmFsbHRocm91Z2gtdG8tUElDLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAxOWI5NTA3
M2U1ZDQyZGM0YWE1MzkyZGEzZDQyMmFiNjY4MDAzMTA3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAw
MQorRnJvbSBkMzY2M2U2MTFlODllY2M2ZTVlNzU3ZDIwOWRkMDgyODE3ZGQxNzBmIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQogRnJvbTogTWFyayBBc3NlbHN0aW5lIDxtYXJrLmFzc2Vsc3RpbmVA
d2luZHJpdmVyLmNvbT4KIERhdGU6IFR1ZSwgMjYgRmViIDIwMTMgMTE6NDM6MjggLTA1MDAKIFN1
YmplY3Q6IFtQQVRDSF0gYXBpYzogZml4dXAgZmFsbHRocm91Z2ggdG8gUElDCkBAIC0yOSwxMCAr
MjksMTAgQEAgU2lnbmVkLW9mZi1ieTogSGUgWmhlIDx6aGUuaGVAd2luZHJpdmVyLmNvbT4KICAx
IGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdp
dCBhL2h3L2ludGMvYXBpYy5jIGIvaHcvaW50Yy9hcGljLmMKLWluZGV4IGQxOGMxZGJmMi4uNDVk
ZGUxZmM1IDEwMDY0NAoraW5kZXggMTQzZDA4ZjFhLi41YmIwMDhkNTkgMTAwNjQ0CiAtLS0gYS9o
dy9pbnRjL2FwaWMuYwogKysrIGIvaHcvaW50Yy9hcGljLmMKLUBAIC03NTgsNyArNzU4LDcgQEAg
aW50IGFwaWNfYWNjZXB0X3BpY19pbnRyKERldmljZVN0YXRlICpkZXYpCitAQCAtNzU2LDcgKzc1
Niw3IEBAIGludCBhcGljX2FjY2VwdF9waWNfaW50cihEZXZpY2VTdGF0ZSAqZGV2KQogICAgICBB
UElDQ29tbW9uU3RhdGUgKnMgPSBBUElDKGRldik7CiAgICAgIHVpbnQzMl90IGx2dDA7CiAgCmRp
ZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1u
b3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMu
cGF0Y2gKaW5kZXggYzA0ZTQyNjA4Zi4uNTY0OTViZTMyMyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1u
b3QtZXhpc3RzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAw
NC1xZW11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaApAQCAtMSw0ICsx
LDQgQEAKLUZyb20gOTEzMDY0ZjlmZTcyNGZhMWI3MGI5YmY2ZGQzNDQ0YzdkZGRlYjkyOCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNWIyMjBkMTY4ZTY0OTYxYThlZGUyNmI2N2M1YjFk
MTg4ZjhkNWYxMSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE9sZWtzaXkgT2JpdG90
c2t5eSA8b29iaXRvdHNAY2lzY28uY29tPgogRGF0ZTogV2VkLCAyNSBNYXIgMjAyMCAyMToyMToz
NSArMDIwMAogU3ViamVjdDogW1BBVENIXSBxZW11OiBEbyBub3QgaW5jbHVkZSBmaWxlIGlmIG5v
dCBleGlzdHMKQEAgLTE2LDEwICsxNiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBTYWtpYiBTYWphbCA8
c2FraWIuc2FqYWxAd2luZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25z
KCspCiAKIGRpZmYgLS1naXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lz
Y2FsbC5jCi1pbmRleCA4YmZlNDkxMmUuLmQwNDk4NGY2NiAxMDA2NDQKK2luZGV4IDkxMzYwYTA3
Mi4uYWNmZGRjZjBhIDEwMDY0NAogLS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMKICsrKyBiL2xp
bnV4LXVzZXIvc3lzY2FsbC5jCi1AQCAtMTE4LDcgKzExOCw5IEBACitAQCAtMTE5LDcgKzExOSw5
IEBACiAgI2luY2x1ZGUgPGxpbnV4L2Jsa3BnLmg+CiAgI2luY2x1ZGUgPG5ldHBhY2tldC9wYWNr
ZXQuaD4KICAjaW5jbHVkZSA8bGludXgvbmV0bGluay5oPgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFw
LXR3ZWFrcy10by1hZGRyZXNzLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJl
c3MtbXVzbC5wYXRjaAppbmRleCAzODhkMTFkMTBkLi45MDFmM2MxYWE3IDEwMDY0NAotLS0gYS9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNw
YWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdl
YWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjJhZGZjNzAz
ZTk0ODE5YjBkYWNhOThmZGUxZDBhMzAxNjhjMjkyZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gZGYzMTAzOWRkNTk4NjYxN2E3NDNlYzc5MGJjZmFjMWFlMjAwZWVlMyBNb24gU2VwIDE3
IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51
eGZvdW5kYXRpb24ub3JnPgogRGF0ZTogRnJpLCA4IEphbiAyMDIxIDE3OjI3OjA2ICswMDAwCiBT
dWJqZWN0OiBbUEFUQ0hdIHFlbXU6IEFkZCBzb21lIHVzZXIgc3BhY2UgbW1hcCB0d2Vha3MgdG8g
YWRkcmVzcyBtdXNsIDMyIGJpdApAQCAtMjIsMTAgKzIyLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJp
Y2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnCiAgMSBmaWxl
IGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBh
L2xpbnV4LXVzZXIvbW1hcC5jIGIvbGludXgtdXNlci9tbWFwLmMKLWluZGV4IGQxZjM2ZTZmMS4u
MjZjY2Y4ZjRkIDEwMDY0NAoraW5kZXggMDAyZTFlNjY4Li45MTI4MzlkZWMgMTAwNjQ0CiAtLS0g
YS9saW51eC11c2VyL21tYXAuYwogKysrIGIvbGludXgtdXNlci9tbWFwLmMKLUBAIC0xMTA4LDEy
ICsxMTA4LDE2IEBAIGFiaV9sb25nIHRhcmdldF9tcmVtYXAoYWJpX3Vsb25nIG9sZF9hZGRyLCBh
YmlfdWxvbmcgb2xkX3NpemUsCitAQCAtMTEwOSwxMiArMTEwOSwxNiBAQCBhYmlfbG9uZyB0YXJn
ZXRfbXJlbWFwKGFiaV91bG9uZyBvbGRfYWRkciwgYWJpX3Vsb25nIG9sZF9zaXplLAogICAgICBp
bnQgcHJvdDsKICAgICAgdm9pZCAqaG9zdF9hZGRyOwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2gg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1m
aXhlcy5wYXRjaAppbmRleCA0NjkwZDg2MzE1Li4xYjRmMjdiMWE1IDEwMDY0NAotLS0gYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRl
cm1pbmlzbS1maXhlcy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTAzMjcyNmU5ZGE4ZGUw
MDg4ZDZjNzBjZmQ5MmUwYTUyMTU1MzE1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20g
OTQzNDQwY2Y3YjhjNTRhMDljMTZmYThmMDkxN2Y5Y2IxNGQxZDA3MiBNb24gU2VwIDE3IDAwOjAw
OjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5k
YXRpb24ub3JnPgogRGF0ZTogTW9uLCAxIE1hciAyMDIxIDEzOjAwOjQ3ICswMDAwCiBTdWJqZWN0
OiBbUEFUQ0hdIHFlbXU6IERldGVybWluaXNtIGZpeGVzCkBAIC0xNiwxMCArMTYsMTAgQEAgUlAg
MjAyMS8zLzEKICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkK
IAogZGlmZiAtLWdpdCBhL3NjcmlwdHMvZGVjb2RldHJlZS5weSBiL3NjcmlwdHMvZGVjb2RldHJl
ZS5weQotaW5kZXggZThiNzJkYTNhLi41Y2Q4NmIxNDIgMTAwNjQ0CitpbmRleCBmOTkyNDcyYjcu
LjJlNDIxOGIxNCAxMDA2NDQKIC0tLSBhL3NjcmlwdHMvZGVjb2RldHJlZS5weQogKysrIGIvc2Ny
aXB0cy9kZWNvZGV0cmVlLnB5Ci1AQCAtMTU1OCw3ICsxNTU4LDcgQEAgZGVmIG1haW4oKToKK0BA
IC0xNTU5LDcgKzE1NTksNyBAQCBkZWYgbWFpbigpOgogICAgICB0b3BwYXQgPSBFeGNNdWx0aVBh
dHRlcm4oMCkKICAKICAgICAgZm9yIGZpbGVuYW1lIGluIGFyZ3M6CmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDctdGVzdHMtbWVzb24uYnVpbGQtdXNlLXJl
bGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1y
ZWZlci10by1maWxlLnBhdGNoCmluZGV4IDdjMjRmNDMyZjIuLmZiYjAxZjc2Y2YgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWls
ZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCisrKyBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRp
dmUtcGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYmVh
YjA2NzQ3MzA2ZWMxNjI5OTIwN2JmNGJkNzQ4MWE0NzJiNGRlIE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA2ODgzNWE2ZDRmZTA5YWIzZGY4MWU1ZjhmODU0YTY3MzZmOWUwYjBjIE1vbiBT
ZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2lu
ZHJpdmVyLmNvbT4KIERhdGU6IFRodSwgMTQgSmFuIDIwMjEgMDY6MzM6MDQgKzAwMDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gdGVzdHMvbWVzb24uYnVpbGQ6IHVzZSByZWxhdGl2ZSBwYXRoIHRvIHJlZmVy
IHRvIGZpbGVzCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MDgtRGVmaW5lLU1BUF9TWU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5w
YXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZ
TkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCmluZGV4IDU0NDIx
NTQ0YmIuLjg4ZmMwM2U3ZjggMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11
L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVl
ZGVkLWxpLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1E
ZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNo
CkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5YzIyNTIzNGE3NTZmMjc0NWNmMDRjM2MzYWY2ZWY2YjZh
Y2Y0Mjc3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSA2MmRiZTlhMWQ2ZDU3ZWVmZjU3
OWM5N2JlZjFmZTIwNWY4OTgwZDc2IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hl
bSBSYWogPHJhai5raGVtQGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjEgTWFyIDIwMjIgMTA6MDk6
MzggLTA3MDAKIFN1YmplY3Q6IFtQQVRDSF0gRGVmaW5lIE1BUF9TWU5DIGFuZCBNQVBfU0hBUkVE
X1ZBTElEQVRFIG9uIG5lZWRlZCBsaW51eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1Q
QVRILnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3Vy
ZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCmluZGV4IDI4YTEwZDk4YmQu
LjQyYTU1YWJhZmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaAorKysg
Yi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1t
ZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlhZGYz
ZmMzZWEyY2JjY2I0MWQ0OTY5NWE1M2M3NGZlZDY4NTBmYjAgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCitGcm9tIGYzMWI2ODM2YTA1MGNkNTUwZjJlZTJhOGFkOGYyNjZiOWFkNGFlODIgTW9uIFNl
cCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiA9P1VURi04P3E/TWFydGluPTIwSHVuZGViPUMzPUI4
bGw/PSA8bWFydGluQGdlYW5peC5jb20+CiBEYXRlOiBXZWQsIDIyIE1heSAyMDI0IDE0OjAyOjU1
ICswMjAwCiBTdWJqZWN0OiBbUEFUQ0hdIGNvbmZpZ3VyZTogbG9va3VwIG1lc29uIGV4dXRhYmxl
IGZyb20gUEFUSApAQCAtOSwxMCArOSwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlh
dGUgW3dvcmthcm91bmQsIHdvdWxkIG5lZWQgYSByZWFsIGZpeCBmb3IgdXBzdHJlYW1dCiAgMSBm
aWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0
IGEvY29uZmlndXJlIGIvY29uZmlndXJlCi1pbmRleCAwMmYxZGQyMzEuLjJjNWVjZDM0NiAxMDA3
NTUKK2luZGV4IDI3NGE3Nzg3Ni4uODRlNDI5NDA5IDEwMDc1NQogLS0tIGEvY29uZmlndXJlCiAr
KysgYi9jb25maWd1cmUKLUBAIC05ODMsMTIgKzk4Myw3IEBAIG1rdmVudj0iJHB5dGhvbiAke3Nv
dXJjZV9wYXRofS9weXRob24vc2NyaXB0cy9ta3ZlbnYucHkiCitAQCAtOTk1LDEyICs5OTUsNyBA
QCBta3ZlbnY9IiRweXRob24gJHtzb3VyY2VfcGF0aH0vcHl0aG9uL3NjcmlwdHMvbWt2ZW52LnB5
IgogICRta3ZlbnYgZW5zdXJlZ3JvdXAgLS1kaXIgIiR7c291cmNlX3BhdGh9L3B5dGhvbi93aGVl
bHMiIFwKICAgICAgICR7c291cmNlX3BhdGh9L3B5dGhvbmRlcHMudG9tbCBtZXNvbiB8fCBleGl0
IDEKICAKZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1x
ZW11LUVuc3VyZS1waXAtYW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNo
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1h
bmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKaW5kZXggYjA2MDIwZDEw
Ni4uYmQ5NjcwNzk3ZiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVt
dS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZv
ci0ucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUt
RW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKQEAg
LTEsNCArMSw0IEBACi1Gcm9tIDBkODU5ODg0NTdhNDc1YzI1Yjg0MDg1Y2YwOTAwNDAxNTBhOWMx
NmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDhjY2ZkNTk2ZTNlN2M3NDVlOGM5MTBh
Nzk1Y2FkMzM1ZTZjNjBiYWYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJk
IFB1cmRpZSA8cmljaGFyZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwg
MjIgTWF5IDIwMjQgMTM6NTg6MjMgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTogRW5zdXJl
IHBpcCBhbmQgdGhlIHB5dGhvbiB2ZW52IGFyZW4ndCB1c2VkIGZvciBtZXNvbgpAQCAtMjksMTAg
KzI5LDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBs
aW51eGZvdW5kYXRpb24ub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIg
ZGVsZXRpb25zKC0pCiAKIGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKLWluZGV4
IDJjNWVjZDM0Ni4uNTMxNWVkZTM1IDEwMDc1NQoraW5kZXggODRlNDI5NDA5Li4xYTk1ODVlOGUg
MTAwNzU1CiAtLS0gYS9jb25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTk2OSwxNCArOTY5
LDE0IEBAIHB5dGhvbj0iJChjb21tYW5kIC12ICIkcHl0aG9uIikiCitAQCAtOTgxLDE0ICs5ODEs
MTQgQEAgcHl0aG9uPSIkKGNvbW1hbmQgLXYgIiRweXRob24iKSIKICBlY2hvICJweXRob24gZGV0
ZXJtaW5lZCB0byBiZSAnJHB5dGhvbiciCiAgZWNobyAicHl0aG9uIHZlcnNpb246ICQoJHB5dGhv
biAtLXZlcnNpb24pIgogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUv
cWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBhdGNoCmluZGV4IDFjYzk3MzQ0M2UuLjc2NjUz
NzRkNTEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0
cmVycm9ybmFtZV9ucC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
L2ZpeC1zdHJlcnJvcm5hbWVfbnAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdlMDk2NTRm
YTE3OWFkNWZhYjFkYzBhNDc4ODZjNmExYTJhY2MwOTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIDgwODYyZTY2MThkN2RiNzA3NzQ1YTA3NmI2Yzc3YjkzZmNlNmFiN2YgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBOYXRhbmFlbCBDb3BhIDxuY29wYUBhbHBpbmVsaW51eC5v
cmc+CiBEYXRlOiBXZWQsIDE4IFNlcCAyMDI0IDE2OjE5OjM3IC0wNzAwCiBTdWJqZWN0OiBbUEFU
Q0hdIHRhcmdldC9yaXNjdi9rdm06IGRvIG5vdCB1c2Ugbm9uLXBvcnRhYmxlIHN0cmVycm9ybmFt
ZV9ucCgpCkBAIC0yMCwxMCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogTmF0YW5hZWwgQ29wYSA8
bmNvcGFAYWxwaW5lbGludXgub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MiBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9rdm0va3ZtLWNwdS5j
IGIvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMKLWluZGV4IDgwMDFjYTE1My4uNzlmYjQzZjky
IDEwMDY0NAoraW5kZXggNWMxOTA2MmMxLi41OWI0YmYxNmEgMTAwNjQ0CiAtLS0gYS90YXJnZXQv
cmlzY3Yva3ZtL2t2bS1jcHUuYwogKysrIGIvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMKLUBA
IC0xOTY4LDggKzE5NjgsNyBAQCBzdGF0aWMgYm9vbCBrdm1fY3B1X3JlYWxpemUoQ1BVU3RhdGUg
KmNzLCBFcnJvciAqKmVycnApCitAQCAtMTk5Myw4ICsxOTkzLDcgQEAgc3RhdGljIGJvb2wga3Zt
X2NwdV9yZWFsaXplKENQVVN0YXRlICpjcywgRXJyb3IgKiplcnJwKQogICAgICBpZiAocmlzY3Zf
aGFzX2V4dCgmY3B1LT5lbnYsIFJWVikpIHsKICAgICAgICAgIHJldCA9IHByY3RsKFBSX1JJU0NW
X1ZfU0VUX0NPTlRST0wsIFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfT04pOwogICAgICAgICAgaWYg
KHJldCkgewpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4w
LjYuYmIgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjEuMi5iYgpzaW1pbGFy
aXR5IGluZGV4IDQxJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
XzEwLjAuNi5iYgpyZW5hbWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4x
LjIuYmIKaW5kZXggNWQ1NDRkOGQxMy4uNzJlMDYxMjZiYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4wLjYuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdV8xMC4xLjIuYmIKQEAgLTEsMyArMSw0NiBAQAorIyBGSVhNRTogdGhlIExJ
Q19GSUxFU19DSEtTVU0gdmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3Jh
ZGUnLgorIyBUaGUgZm9sbG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBh
bmQgdGhlIG5ldyBsaWNlbnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFs
dWUgaWYgbmVlZGVkLCBhbmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQg
bWVzc2FnZSB2aWEgJ0xpY2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2Ut
VXBkYXRlOiBjb3B5cmlnaHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMK
KyMgLS0tIENPUFlJTkcKKyMgKysrIENPUFlJTkcKKyMgQEAgLTIsNyArMiw3IEBACisjICAJCSAg
ICAgICBWZXJzaW9uIDIsIEp1bmUgMTk5MQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAxOTg5LCAx
OTkxIEZyZWUgU29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSA1MSBGcmFua2xpbiBTdHJl
ZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBCisjICsgPGh0dHBzOi8v
ZnNmLm9yZy8+CisjICAgRXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1
dGUgdmVyYmF0aW0gY29waWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hh
bmdpbmcgaXQgaXMgbm90IGFsbG93ZWQuCisjICAKKyMgQEAgLTMwNCw4ICszMDQsNyBAQAorIyAg
ICAgIEdOVSBHZW5lcmFsIFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICAKKyMg
ICAgICBZb3Ugc2hvdWxkIGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQ
dWJsaWMgTGljZW5zZSBhbG9uZworIyAtICAgIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdy
aXRlIHRvIHRoZSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjIC0gICAgNTEgRnJh
bmtsaW4gU3RyZWV0LCBGaWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQS4KKyMg
KyAgICB3aXRoIHRoaXMgcHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3LmdudS5vcmcv
bGljZW5zZXMvPi4KKyMgIAorIyAgQWxzbyBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNvbnRh
Y3QgeW91IGJ5IGVsZWN0cm9uaWMgYW5kIHBhcGVyIG1haWwuCisjICAKKyMgLS0tIENPUFlJTkcu
TElCCisjICsrKyBDT1BZSU5HLkxJQgorIyBAQCAtMiw3ICsyLDcgQEAKKyMgICAgICAgICAgICAg
ICAgICAgICAgICAgVmVyc2lvbiAyLjEsIEZlYnJ1YXJ5IDE5OTkKKyMgIAorIyAgIENvcHlyaWdo
dCAoQykgMTk5MSwgMTk5OSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMgLSA1MSBG
cmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EK
KyMgKyA8aHR0cHM6Ly9mc2Yub3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29w
eSBhbmQgZGlzdHJpYnV0ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9j
dW1lbnQsIGJ1dCBjaGFuZ2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAKKyMKKwogQkJD
TEFTU0VYVEVORCA9ICJuYXRpdmVzZGsiCiAKIHJlcXVpcmUgcWVtdS5pbmMKLS0gCjIuNDcuMQoK

--===============5578891785752314519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 947 .bb files complete (0 cached, 947 parsed). 1945 targets, 54 skipped, 0 masked, 0 errors.
Removing 151 recipes from the qemux86_64 sysroot...done.
Removing 139 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-29bbb19f7e8ca053fcea0ac35d3dc36d5ecd4149"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 = "tmp-auh-upgrades:29bbb19f7e8ca053fcea0ac35d3dc36d5ecd4149"
meta-yocto-bsp       
meta-poky            = "master:66ea31cee15309af07afeee8dec8a6fe1d92d28e"
workspace            = "<unknown>:<unknown>"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 971 Local 741 Mirrors 0 Missed 230 Current 413 (76% match, 83% complete)
Removing 5 stale sstate objects for arch allarch...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 4 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 417 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 431 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_populate_lic_setscene)
NOTE: Running setscene task 441 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 456 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 501 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 510 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 521 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 527 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 552 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 560 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 572 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 583 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 584 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 601 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 614 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-10.1.2-r0: task do_populate_lic_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 619 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 622 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-10.1.2-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 623 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 625 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 629 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: Running setscene task 630 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 644 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 649 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 651 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 652 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 654 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 655 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 659 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-21.1.5-r1: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 661 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 664 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_create_spdx_setscene)
NOTE: recipe libclc-21.1.5-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 667 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 668 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 670 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 672 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 675 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 677 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 679 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 680 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 681 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 684 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe qemu-10.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 685 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 690 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_create_spdx_setscene)
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 693 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 696 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe curl-8.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 702 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_create_spdx_setscene)
NOTE: Running setscene task 704 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 708 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 711 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 712 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 714 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 721 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 722 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_recipe_qa_setscene)
NOTE: recipe qemu-10.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 730 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 743 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe llvm-21.1.5-r1: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libgpg-error-1.56-r0: task do_create_spdx_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 745 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 748 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_populate_sysroot_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 750 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 752 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_packagedata_setscene)
NOTE: recipe libsdl2-2.32.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe llvm-21.1.5-r1: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 754 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 756 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 762 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-21.1.5-r1: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-21.1.5-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 764 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 765 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 766 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 768 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 770 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 774 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 778 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 791 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 795 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 796 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 798 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: Running setscene task 804 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 805 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 806 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libclc-21.1.5-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 807 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 809 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 812 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 814 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 815 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 818 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_packagedata_setscene)
NOTE: Running setscene task 819 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 820 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 824 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe mesa-2_25.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 826 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 832 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 834 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe llvm-21.1.5-r1: task do_packagedata_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 836 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 837 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 838 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 839 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 840 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libclc-21.1.5-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 841 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 842 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 845 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 846 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 849 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 852 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-21.1.5-r1: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 853 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 858 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 859 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 861 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 864 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 865 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 867 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 868 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 870 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 873 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_populate_sysroot_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 874 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 875 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_create_spdx_setscene)
NOTE: Running setscene task 877 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 878 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 881 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 882 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe llvm-21.1.5-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 885 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 886 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-21.1.5-r1: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 889 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 890 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 891 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 892 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 896 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 897 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-21.1.5-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 898 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 901 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 905 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-3.13.9-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 906 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe ofono-2.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 908 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 912 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 914 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 918 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 919 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 920 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 921 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 924 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 925 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 926 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe ell-0.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 933 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 936 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 939 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 941 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe ell-0.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 943 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 945 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 946 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 948 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 951 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_create_spdx_setscene)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 952 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 954 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 955 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe bluez5-5.84-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 956 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 957 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.84-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 961 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 964 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 966 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 968 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 969 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 970 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 971 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: Running setscene task 972 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 975 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_create_spdx_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 976 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 978 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 980 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 981 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 983 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 984 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 986 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 987 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 988 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 989 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 990 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 992 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 996 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 997 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1000 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1001 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1002 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1003 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1005 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1007 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ofono-2.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1009 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1011 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1013 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1015 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1016 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1017 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-tools_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe curl-8.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1019 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1021 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1023 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1026 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1027 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.84-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1028 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1032 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1035 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1036 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1037 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe bluez5-5.84-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1040 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1041 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1042 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1043 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1045 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1046 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1048 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1049 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1050 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1056 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/spir/spirv-headers_1.4.328.1.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1060 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libarchive/libarchive_3.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1061 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1062 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1064 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1067 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1069 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1071 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1073 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1074 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.328.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1075 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1076 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1077 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1079 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1080 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_packagedata_setscene)
NOTE: recipe libarchive-3.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1086 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1089 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_populate_sysroot_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1091 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1092 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1093 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1095 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1096 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1099 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1100 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1102 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1103 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1106 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1107 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1108 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1109 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1111 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1114 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1115 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1116 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe llvm-21.1.5-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1117 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 1120 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1121 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1122 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1124 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1126 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1130 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1133 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1137 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1138 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1144 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1145 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1148 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/clang/llvm_git.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1149 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1151 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1154 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1156 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1157 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1160 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1161 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1162 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1165 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe llvm-21.1.5-r1: task do_recipe_qa_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1167 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1168 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1170 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1172 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1173 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe llvm-21.1.5-r1: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1175 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1176 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgpg-error/libgpg-error_1.56.bb:do_recipe_qa_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1177 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1179 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1181 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1182 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/curl/curl_8.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1185 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1186 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1188 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1189 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1192 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1194 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1195 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1197 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libgpg-error-1.56-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1200 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1202 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1203 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1204 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1205 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1206 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe curl-8.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1207 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1210 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1213 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1215 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1219 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1220 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1221 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1222 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1223 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1224 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1225 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1226 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1227 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1228 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1229 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1230 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1231 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1232 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1234 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1235 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1236 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1237 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1251 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 1253 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1255 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1256 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1259 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1260 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1261 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1262 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1263 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1264 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1265 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1266 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1268 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1269 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1271 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1277 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1279 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.9-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 532 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe python3-3.13.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1281 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1282 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1283 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1284 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1285 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1286 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1287 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1288 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1289 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: Running setscene task 1290 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1291 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1292 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1293 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1294 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_packagedata_setscene)
NOTE: Running setscene task 1295 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1296 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1297 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1299 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1300 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1301 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_populate_sysroot_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1303 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/python/python3_3.13.9.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1310 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1311 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1312 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1315 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1316 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1317 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 561 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1321 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1324 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1326 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/openssl/openssl_3.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 603 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.9-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.3-r0: task do_packagedata_setscene: Succeeded
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/util-linux-libuuid/2.41.1/temp/log.do_packagedata_setscene.367246
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1328 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_package_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1330 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/expat/expat_2.7.3.bb:do_recipe_qa_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 672 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_fetch)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1332 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1334 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1335 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1337 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe openssl-3.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_package_setscene: Started
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 776 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 807 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 836 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_unpack)
NOTE: recipe expat-2.7.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 839 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_write_config)
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 917 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: Running task 921 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_fetch)
NOTE: Running task 923 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_write_config: Started
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1340 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: Running task 967 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: Running task 983 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: Running task 986 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_write_config)
NOTE: Running task 993 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: Running task 1046 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1047 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: Running task 1058 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_fetch: Started
NOTE: Running task 1060 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: Running task 1067 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1068 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 1069 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: Running task 1073 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_package_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_write_config: Started
NOTE: Running setscene task 1341 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: Running setscene task 1342 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1344 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_write_config: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: Running task 1105 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1106 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1108 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1110 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Succeeded
NOTE: Running task 1111 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: Running task 1114 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: Running task 1115 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: Running task 1120 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1121 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1125 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1134 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_unpack)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1137 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1346 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1347 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 1158 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1349 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: Running task 1159 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: Running task 1160 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: Running task 1161 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_unpack: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1163 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: Running task 1166 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: Running task 1167 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1168 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: Running task 1171 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: Running task 1172 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_unpack: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: Running task 1179 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_patch: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: Running task 1187 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: Running task 1222 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1351 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: Running task 1261 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: Running task 1262 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: Running task 1283 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: Running task 1284 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: Running task 1292 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_patch)
NOTE: Running task 1293 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: Running task 1330 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: Running task 1331 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: Running task 1332 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: Running setscene task 1353 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: Running setscene task 1354 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_packagedata_setscene)
NOTE: Running setscene task 1355 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running task 1337 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1357 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running setscene task 1358 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: Running task 1339 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: Running task 1340 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: Running task 1341 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Started
NOTE: Running task 1386 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: Running task 1395 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: Running task 1396 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_patch)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: Running task 1397 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Started
NOTE: Running task 1401 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1405 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: Running task 1410 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: Running task 1419 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: Running task 1430 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 1434 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: Running task 1438 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: Running task 1449 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1458 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_fetch)
NOTE: Running setscene task 1363 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1364 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: Running task 1463 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1470 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_fetch: Started
NOTE: Running task 1471 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_fetch: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1476 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: Running task 1486 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: Running task 1497 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1529 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: Running task 1541 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: Running task 1554 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1365 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe bluez5-5.84-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: Running setscene task 1367 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Succeeded
NOTE: Running setscene task 1371 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: Running task 1558 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: Running task 1560 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: Running task 1562 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1599 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1623 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: Running task 1628 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: Running task 1629 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: Running task 1632 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1374 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: Running task 1639 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1376 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe bluez5-5.84-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: Running task 1640 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: Running task 1650 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: Running task 1700 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: Running task 1704 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_fetch)
NOTE: Running task 1713 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_fetch: Started
NOTE: Running task 1719 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: Running task 1720 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: Running task 1721 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1735 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: Running task 1737 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_fetch)
NOTE: Running task 1745 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Started
NOTE: Running task 1759 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Succeeded
NOTE: Running task 1777 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Started
NOTE: Running task 1852 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1855 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: Running task 1858 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_unpack)
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: Running task 1868 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1869 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: Running task 1870 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: Running task 1871 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe bluez5-5.84-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_fetch: Succeeded
NOTE: Running task 1945 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_unpack)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1950 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_write_config)
NOTE: Running task 1956 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: Running task 1960 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_write_config)
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Started
NOTE: Running task 1991 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_fetch)
NOTE: Running task 1993 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: recipe mesa-2_25.2.5-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: Running task 1994 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_fetch: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_unpack: Started
NOTE: Running task 1995 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Started
NOTE: recipe ell-0.79-r0: task do_fetch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1996 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1997 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_fetch)
NOTE: recipe ell-0.79-r0: task do_fetch: Succeeded
NOTE: Running task 1998 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1999 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: Running task 2000 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: Running task 2003 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_patch)
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: Running task 2011 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_patch)
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Succeeded
NOTE: Running task 2016 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_fetch)
NOTE: Running task 2017 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Succeeded
NOTE: Running task 2018 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: Running task 2019 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_configure)
NOTE: recipe mesa-2_25.2.5-r0: task do_unpack: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Started
NOTE: Running task 2020 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe ofono-2.18-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Started
NOTE: Running task 2033 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: Running task 2034 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2037 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_unpack)
NOTE: Running task 2042 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe ofono-2.18-r0: task do_fetch: Succeeded
NOTE: Running task 2047 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: Running task 2048 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_unpack)
NOTE: Running task 2055 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: Running task 2065 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2069 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_fetch)
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe ell-0.79-r0: task do_unpack: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: Running task 2072 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_fetch)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe ofono-2.18-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2073 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_write_config: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 2074 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: recipe libsdl2-2.32.10-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_write_config: Succeeded
NOTE: Running task 2075 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_unpack)
NOTE: recipe libsdl2-2.32.10-r0: task do_fetch: Succeeded
NOTE: Running task 2077 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2079 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_write_config)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2080 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: Running task 2081 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe ell-0.79-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: Running task 2082 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2083 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_unpack: Succeeded
NOTE: Running task 2084 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Started
NOTE: recipe ofono-2.18-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_fetch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Started
NOTE: Running task 2085 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_patch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe ell-0.79-r0: task do_patch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_patch: Started
NOTE: Running task 2087 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2093 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_fetch)
NOTE: Running task 2094 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: recipe ell-0.79-r0: task do_patch: Succeeded
NOTE: recipe ofono-2.18-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Succeeded
NOTE: Running task 2096 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: Running task 2097 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_fetch)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: Running task 2098 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe ofono-2.18-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_patch: Succeeded
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: Running task 2100 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_generate_toolchain_file)
NOTE: Running task 2101 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: Running setscene task 1378 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_populate_sysroot_setscene)
NOTE: Running task 2112 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_unpack)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2113 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_unpack)
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_unpack: Started
NOTE: Running task 2114 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_compile)
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 2124 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_fetch)
NOTE: Running task 2127 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_unpack)
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_unpack: Started
NOTE: Running task 2134 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Started
NOTE: Running task 2136 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_unpack: Started
NOTE: recipe qemu-10.1.2-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe qemu-10.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 2137 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: Running task 2138 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Succeeded
NOTE: Running task 2139 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_patch)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.17-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: Running task 2141 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: Running setscene task 1382 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.17.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1383 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: Running task 2142 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_patch)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: Running task 2143 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_unpack)
NOTE: Running task 2144 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: Running task 2145 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe xkeyboard-config-2.45-r0: task do_patch: Started
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Started
NOTE: recipe linux-libc-headers-6.17-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Succeeded
NOTE: Running task 2159 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_patch: Succeeded
NOTE: Running task 2181 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_write_config)
NOTE: Running task 2183 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_write_config)
NOTE: Running task 2184 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_write_config)
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_unpack: Succeeded
NOTE: Running task 2185 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_patch)
NOTE: recipe qemu-10.1.2-r0: task do_unpack: Started
NOTE: Running task 2186 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_install)
NOTE: recipe xkeyboard-config-2.45-r0: task do_write_config: Started
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: Running task 2188 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: recipe xkeyboard-config-2.45-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_write_config: Succeeded
NOTE: Running task 2189 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: Running task 2190 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_write_config)
NOTE: Running task 2191 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: recipe libsdl2-2.32.10-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: Setscene tasks completed
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_patch: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_unpack: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: Running task 2276 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Succeeded
NOTE: Running task 2334 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Succeeded
NOTE: Running task 2375 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 2464 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: Running task 2487 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2556 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2564 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2615 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2637 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2672 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_prepare_recipe_sysroot)
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Succeeded
NOTE: Running task 2702 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_patch)
NOTE: Running task 2713 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_unpack)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_patch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_patch: Succeeded
NOTE: Running task 2714 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: Running task 2715 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2718 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: Running task 2719 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_configure)
NOTE: Running task 2725 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_patch)
NOTE: Running task 2726 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: recipe mesa-2_25.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2727 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2728 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot)
NOTE: Running task 2756 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: Running task 2757 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure: Started
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Started
NOTE: Running task 2758 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_patch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Started
NOTE: Running task 2759 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure)
NOTE: Running task 2760 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: Running task 2768 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2769 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_configure)
NOTE: Running task 2770 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Started
NOTE: Running task 2784 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe mesa-2_25.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2786 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Succeeded
NOTE: Running task 2790 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2791 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2792 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2793 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2794 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_generate_toolchain_file)
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_generate_toolchain_file: Started
NOTE: Running task 2795 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_configure)
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2833 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot unihash changed to 8c93dafe3f2a8dcf911693c65fcf2f58c29d2f3fa2db913de59bfbaa4259cffd
NOTE: recipe xkeyboard-config-2.45-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Setscene tasks completed
NOTE: Running task 2834 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_configure)
NOTE: Running task 2835 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_configure)
NOTE: Running task 2836 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: Running task 2855 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: Running task 2926 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: Running task 2973 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Started
NOTE: recipe dtc-1.7.2-r0: task do_configure: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2974 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Running task 3004 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: Running task 3005 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Succeeded
NOTE: Running task 3006 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package unihash changed to f1de4a65034064e087b26385d8f52817ed08039c694c8e79fe4b756050c8d095
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata became valid
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Started
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running task 3007 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: Running task 3068 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: Running task 3107 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: Running task 3196 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3198 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: Running task 3199 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx)
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Succeeded
NOTE: Running task 3200 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_install)
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: Running task 3246 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_configure: Succeeded
NOTE: Running task 3247 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_collect_spdx_deps)
NOTE: Running task 3248 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3249 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: recipe xkeyboard-config-2.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3250 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Succeeded
NOTE: Running task 3276 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_compile)
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3277 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure_ptest_base)
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Succeeded
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: Running task 3278 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: Running task 3279 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3280 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Succeeded
NOTE: Running task 3281 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot)
NOTE: Running task 3282 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package)
NOTE: recipe wayland-1.24.0-r0: task do_compile: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: Running task 3283 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: Running task 3284 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: Running task 3285 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_compile: Succeeded
NOTE: Running task 3286 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_install)
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Succeeded
NOTE: Running task 3287 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_install)
NOTE: recipe xkeyboard-config-2.45-r0: task do_install: Started
NOTE: recipe libucontext-1.3.2-r0: task do_install: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot unihash changed to ba055d9cbae4b9971173b4d630addaf79ce5a8a806728c750e3dab01b6b6b9b9
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to e2c92832420883c099d37fc49de1354f7e963b0c6bf8bf8825f97da9e138c1af
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: recipe dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_install: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_install: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package unihash changed to 94343c7646a61c9874b33ee69c8e5bdf004ad72f159f9c1e1ed7dc92223878a0
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 9c19ae6f03cc3dc8b4ec2f3c0605b67991bfb80b171d6674fe1e495f5b1eb5c8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata became valid
NOTE: recipe qemu-10.1.2-r0: task do_unpack: Succeeded
NOTE: Running setscene task 1306 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1318 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1319 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1320 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1322 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1323 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1324 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1325 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1327 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1334 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1335 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata_setscene)
NOTE: Running setscene task 1346 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1347 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 3288 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: Running task 3289 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1348 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1349 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1350 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running setscene task 1351 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package_setscene)
NOTE: Running setscene task 1352 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1353 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3290 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3291 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: Running task 3292 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: Running task 3293 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_patch)
NOTE: Running task 3294 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot)
NOTE: Running task 3295 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: Running task 3296 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Started
NOTE: Running task 3297 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_install)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot: Started
NOTE: recipe qemu-10.1.2-r0: task do_patch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe dtc-1.7.2-r0: task do_install: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3298 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: Running task 3299 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install: Started
NOTE: Running setscene task 1354 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1355 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running task 3301 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package)
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1356 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1357 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1358 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot unihash changed to f14fa3bd11c6d876ab8e0c464a4f65d418a4d93e483f58fc4c0f6783d2140802
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to a2d5048e0b3c86e272f2083bd082768d1fcaffea2075db034279cc196194f2d3
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe qemu-10.1.2-r0: task do_patch: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_install: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot unihash changed to 6fbdbba72bb2b3ac6312582a10f35ea50e61238d681ff1e5c21625ce88bc1f18
NOTE: Running setscene task 1324 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1325 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package_setscene)
NOTE: Running setscene task 1326 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package_setscene)
NOTE: Running setscene task 1328 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: Running task 3302 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: Running task 3303 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install_ptest_base)
NOTE: Running task 3304 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_prepare_recipe_sysroot)
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 3305 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: Running task 3306 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_deploy_source_date_epoch)
NOTE: Running task 3307 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot)
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: Running task 3308 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package)
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Started
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe qemu-10.1.2-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3309 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package)
NOTE: recipe libucontext-1.3.2-r0: task do_package: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to 8768576a8de799453a98418122f6fbc6580d08ac5f17461e0273938eed3b7584
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe qemu-10.1.2-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_package: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to 71788404568ac79f09a216009a2e373bef6e445e4eaef2b5e72cda8f52762623
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/qemu/qemu_10.1.2.bb:do_deploy_source_date_epoch unihash changed to 16888d5dbe0f450a08866b6ca24156555db8876b71fbedd6521c0b58491c4d8e
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot unihash changed to 4ed40834174648210e0e18148fd20fb45eef14db762c347681d67ea03fd3d9c3
NOTE: Running setscene task 1342 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1345 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1353 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1357 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1358 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1361 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1363 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running task 3310 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: Running task 3321 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot)
NOTE: Running task 3322 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_configure)
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1369 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3323 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package)
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1370 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: Running setscene task 1371 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package_setscene)
NOTE: Running task 3324 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: Running task 3326 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: Running task 3327 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_package: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: recipe libucontext-1.3.2-r0: task do_package: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package unihash changed to 6be1547d4109be6d9f0d4e5e3c9261a3518df9ee9e2ba5c005319350ce033d2f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata became valid
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1371 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot unihash changed to 9ad3647c4dc3d1a08752a133b7240c0401122cc1ad8b93075f3efd4c2729327f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot became valid
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package unihash changed to 085b35fa1b2f727f17009d67140c8fa9b666f8837aeb8992ca1cd4b3f2520512
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 8ad0f6e9c17cc7ba23686cd1c99a77fd1b5e8393121419c7f66d46f103b60181
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata became valid
NOTE: Running setscene task 1344 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1365 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1371 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1372 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running task 3330 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_collect_spdx_deps)
NOTE: Running task 3331 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/musl/libucontext_1.3.2.bb:do_create_spdx)
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 3332 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Started
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1373 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package_setscene)
NOTE: Running task 3334 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_spdx)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3336 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: Running setscene task 1374 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3337 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot)
NOTE: Running task 3338 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package unihash changed to 6d568313ac1554db48d46ab9720ec5e954597e597fb01cd9237c531648d36ead
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata became valid
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Succeeded
NOTE: Running setscene task 1374 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata_setscene)
NOTE: Running task 3339 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_compile)
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1375 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1376 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot unihash changed to a1372d80f2c2864d63e095605153130d8de1275411b14c87419b037b50e373c2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot became valid
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package unihash changed to 226eec8e8ac1edcc35a3ebe8ecb52242fb806f6c4a9a26a3430776a9a8282998
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata became valid
NOTE: Running setscene task 1279 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 1335 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1338 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1347 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1360 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running task 3341 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_create_spdx)
NOTE: Running task 3342 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_configure_ptest_base)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure_ptest_base: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1372 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_package_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3343 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1373 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running task 3344 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1374 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3345 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_install)
NOTE: recipe libdrm-2.4.125-r0: task do_install: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3346 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1375 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_package_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1376 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 3347 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_create_spdx: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1377 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3349 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3350 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.41.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3351 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_configure)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libdrm-2.4.125-r0: task do_install: Succeeded
NOTE: Running task 3352 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot)
NOTE: Running task 3353 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package)
NOTE: recipe util-linux-2.41.1-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Started
NOTE: Running task 3354 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe libdrm-2.4.125-r0: task do_package: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 3355 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Succeeded
NOTE: Running setscene task 1378 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: Running setscene task 1379 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1380 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1381 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot unihash changed to dce91b97c7d087e1713f8d53ab57e42a13b41769612d50a660cb79211731be70
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: Running setscene task 1361 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package_setscene)
NOTE: Running setscene task 1363 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: Running task 3356 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running task 3432 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3442 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: Running task 3469 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: Running task 3470 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3471 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_collect_spdx_deps)
NOTE: Running task 3472 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3473 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_collect_spdx_deps)
NOTE: Running task 3474 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_configure)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to f06fc14aa0c558b80748f619c011a7fac068240be5a04f1639cce6bea1d1b2c5
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3475 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3476 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: Running task 3477 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.125-r0: task do_package: Succeeded
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package unihash changed to bac2462d362283a87faf18e4bd3f80213441e43e132f2172de22f40bbb632ca2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata became valid
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running task 3478 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3479 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3480 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_collect_spdx_deps)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3482 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3483 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: Running task 3484 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to cb6a6fed61479fb3f58a9c787887beb436f036bc2d7bd7e39a1109d3f393dec2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata became valid
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3486 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: Running task 3488 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3489 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to 71c3d307f899795b401a27fa92aae28e01a5ce89a8d5855c227e5be840c39cb4
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata became valid
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package became valid
NOTE: Running setscene task 1310 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 1311 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_qa_setscene)
NOTE: Running setscene task 1315 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 1359 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_packagedata_setscene)
NOTE: Running task 3490 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_collect_spdx_deps)
NOTE: Running task 3491 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_compile)
NOTE: Running task 3492 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_compile: Started
NOTE: recipe bash-5.3-r0: task do_package_qa_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe bash-5.3-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 1373 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/coreutils/coreutils_9.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1374 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1375 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3493 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx)
NOTE: recipe elfutils-0.193-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1376 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_package_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3500 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/util-linux/2.41.1/temp/log.do_packagedata_setscene.404232
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running task 3501 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: Running task 3502 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 3503 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3504 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3505 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3506 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: Running task 3507 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3508 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3509 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: Running task 3510 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3511 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3512 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3513 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3514 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: Running task 3515 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.193-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1378 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: Running task 3516 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_compile_ptest_base)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile_ptest_base: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3517 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3518 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_collect_spdx_deps)
NOTE: Running task 3519 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install: Started
NOTE: Running task 3520 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3521 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 3522 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1380 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: Running task 3523 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/vulkan/vulkan-loader_1.4.328.1.bb:do_create_spdx)
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1381 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_package_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe vulkan-loader-1.4.328.1-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1382 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: Running task 3544 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_prepare_recipe_sysroot)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1383 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_package_setscene)
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install: Succeeded
NOTE: Running task 3545 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe libcap-2.76-r0: task do_package_setscene: Succeeded
NOTE: Running task 3546 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_populate_sysroot)
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 3547 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_install)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_install: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3548 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_rust_create_wrappers)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3554 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_populate_sysroot unihash changed to faf051da52f4e3b1d8a920a850732da761cbabc1513251c007a99ef23c30b94a
NOTE: recipe mesa-2_25.2.5-r0: task do_rust_create_wrappers: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_rust_create_wrappers: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_install: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3555 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3556 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_configure)
NOTE: Running task 3557 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_create_spdx)
NOTE: Running task 3558 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot)
NOTE: Running task 3563 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_package)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_configure: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3566 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3567 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: Running task 3568 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_collect_spdx_deps)
NOTE: Running task 3569 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.41.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot unihash changed to 4a37901d4aec6bb411a4501733ea3598b291912805f74f855257dc3a74395775
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3570 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_configure)
NOTE: Running task 3571 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package became valid
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package_setscene)
NOTE: Running task 3572 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3573 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.2-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3574 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3575 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_package unihash changed to 2c0241236bf7a77101a1a91ec954f19f894478083e443c72fda8a2d4c5499328
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata became valid
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Started
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_package_setscene: Succeeded
NOTE: Running task 3581 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3593 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_collect_spdx_deps)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3595 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx)
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3596 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_create_spdx)
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_create_spdx: Succeeded
NOTE: Running task 3599 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3600 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_compile)
NOTE: recipe mesa-2_25.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Started
NOTE: recipe mesa-2_25.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mesa-2_25.2.5-r0: task do_configure: Succeeded
NOTE: Running task 3601 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-graphics/mesa/mesa.bb:do_compile)
NOTE: recipe mesa-2_25.2.5-r0: task do_compile: Started
NOTE: recipe util-linux-2.41.1-r0: task do_configure: Succeeded
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package became valid
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_package_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Succeeded
NOTE: Running task 3602 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_install)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Succeeded
NOTE: Running task 3603 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot)
NOTE: Running task 3604 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot unihash changed to a53055c75eede1aafe4825c973d8f5837a3bf1668a5ea7b60cd9c7f44d800045
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package unihash changed to d939bcb6c70e64c7a429601876ba15882ef15b5720acd85da83da81949d27ede
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
NOTE: Running task 3622 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-extended/bash/bash_5.3.bb:do_package_write_rpm)
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx: Started
NOTE: recipe bash-5.3-r0: task do_package_write_rpm: Started
NOTE: recipe util-linux-2.41.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3624 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_collect_spdx_deps)
NOTE: Running task 3625 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_collect_spdx_deps)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_collect_spdx_deps: Succeeded
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
NOTE: Running task 3631 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_package)
NOTE: recipe eudev-3.2.14-r0: task do_package: Started
NOTE: recipe eudev-3.2.14-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_package unihash changed to 6fa16033df9a687a2be4874f004d7e5dec9d743182b1aeca0bf1114d0103d836
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata became valid
NOTE: Running setscene task 1384 of 1384 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/udev/eudev_3.2.14.bb:do_packagedata_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_packagedata_setscene: Succeeded
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
NOTE: recipe libslirp-4.9.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3642 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_configure)
NOTE: recipe vala-0.56.18-r0: task do_prepare_recipe_sysroot: Succeeded
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
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_package: Succeeded
NOTE: Running task 3657 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/ell/ell_0.79.bb:do_configure)
NOTE: Running task 3658 of 3777 (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata)
NOTE: recipe ell-0.79-r0: task do_configure: Started
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
NOTE: Tasks Summary: Attempted 3660 tasks of which 3230 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115064409.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251115064409.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/glib-2.0/2.86.0/temp/log.do_packagedata.461209
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
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/glib-2.0/2.86.0/temp/log.do_packagedata.461209
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/layers/openembedded-core/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_packagedata) failed with exit code '1'

--===============5578891785752314519==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/canyonlands.dtb /usr/share/qemu/bamboo.dtb /usr/share/qemu/petalogix-ml605.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb", added "/usr/share/qemu/dtb/bamboo.dtb /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb /usr/share/qemu/ast27x0_bootrom.bin /usr/share/qemu/dtb/petalogix-ml605.dtb /usr/share/qemu/dtb/canyonlands.dtb"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py /usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py", added "/usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tes
 ts/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/vi
 rt/SRAT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC"
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

--===============5578891785752314519==--

