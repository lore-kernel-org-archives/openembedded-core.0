Return-Path: <auh@yoctoproject.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20308CAC59E
	for <webhook@archiver.kernel.org>; Mon, 15 Sep 2025 11:54:37 +0000 (UTC)
Received: from a27-192.smtp-out.us-west-2.amazonses.com (a27-192.smtp-out.us-west-2.amazonses.com [54.240.27.192])
 by mx.groups.io with SMTP id smtpd.web11.30916.1757937276245233262
 for <openembedded-core@lists.openembedded.org>;
 Mon, 15 Sep 2025 04:54:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=X1T7b58G;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=PLWSxZIY;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.192, mailfrom: 010101994d3a11b7-b27b4587-3600-44ca-a9c7-7244136dade9-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1757937275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=gEwwW/2KFTyr2uZva7F2ry5vdHcom8qR8scKMBjJrF8=;
	b=X1T7b58Gm0pnHvNCGnYbGi/15b4Ix7u5aNqyHDaEW1cCaJEEBDHshA5fIXrHRVqW
	8h/yORXVGyeb11BFgTa4Ya26OgurzzkBIH8ZOP8gN2cZJFg0LWJZokrD5g+Kp8o0h1y
	PYd05F6veBa6QrEHZIRep8G3ubTZBPlf6DMmn4ec=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1757937275;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=gEwwW/2KFTyr2uZva7F2ry5vdHcom8qR8scKMBjJrF8=;
	b=PLWSxZIYSzYDh29HMsAtyUJ/P1nb6RwDiNFBAXDRRf3bttbE6+lBpJIQ3/xa2/mO
	poAQeuQAx1WPI0s23y9lvvoywUCw1ca8ud+Sf1nYL+s/1NdMdQ/G0hOX+QcAHFgiPYh
	BzFO5mLLjMZiY5SvsKrbcjkkmcueKzETzKuKmEWQ=
Content-Type: multipart/mixed; boundary="===============2618060461140205839=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu,qemu-native,qemu-system-native: upgrading to
 10.1.0,10.1.0,10.1.0 SUCCEEDED
Message-ID: <010101994d3a11b7-b27b4587-3600-44ca-a9c7-7244136dade9-000000@us-west-2.amazonses.com>
Date: Mon, 15 Sep 2025 11:54:35 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.09.15-54.240.27.192
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 15 Sep 2025 11:54:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/223409

--===============2618060461140205839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu,qemu-native,qemu-system-native* to *10.1.0,10.1.0,10.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-qemu-native-qemu-system-native-upgrade-10.0.2-1.patch
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
From 8836aaf530577ad98001c1aaf11999fbb16cf19c Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Mon, 15 Sep 2025 06:51:02 +0000
Subject: [PATCH] qemu,qemu-native,qemu-system-native: upgrade 10.0.2 ->
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
index f27208f45f..cc2cdb4973 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
+From 127c62d485cad1c0f97c83d7b709d9771622931f Mon Sep 17 00:00:00 2001
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
index ad5c5ba03e..13c09e916b 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
+From e1b5e8a370edf842e45e0d4789ebe29a9f78216b Mon Sep 17 00:00:00 2001
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
index c04e42608f..e85128b842 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
+From d09eca44a34b5a135857e7ff794492b7fddc22c8 Mon Sep 17 00:00:00 2001
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
index 388d11d10d..64a68540e6 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
+From e3ef034a20448e1af6299e54093d316389f8471f Mon Sep 17 00:00:00 2001
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
index 4690d86315..68f5c1d220 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
+From 89bad6efa86665c93190ebf60c2809209e8f62f2 Mon Sep 17 00:00:00 2001
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
index 7c24f432f2..a37a30bc9a 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
+From c6003dc4551c78e42bf79f9287ad03639c1f4228 Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 54421544bb..839d54d087 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
+From a04d7f8a38d8fe492ccb976912b514f3fd346862 Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd..bbebeda6f8 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
+From d36bf471b13f8378801b790543d85eaf60134c13 Mon Sep 17 00:00:00 2001
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
index b06020d106..09f9ac5719 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
+From ce881cd13ea855fd858e15b165de7acd056efadf Mon Sep 17 00:00:00 2001
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
index 64816fe7d9..65ba8282a8 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
@@ -1,4 +1,4 @@
-From 5240406747fd43886618ae8194153e6fc957a82a Mon Sep 17 00:00:00 2001
+From f5d7707ea7b91820e0a930687364ca00126ead38 Mon Sep 17 00:00:00 2001
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
index 1cc973443e..c7fe304ce2 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
+From 61f0b54ae138d3d959c95ea6cf52e13b35646f7c Mon Sep 17 00:00:00 2001
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


--===============2618060461140205839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-10.0.2.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.1.0.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-ad
 dition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/x86-64-v3-poky-linux/qemu: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/canyonlands.dtb /usr/share/qemu/petalogix-ml605.dtb /usr/share/qemu/bamboo.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb", added "/usr/share/qemu/dtb/petalogix-s3adsp1800.dtb /usr/share/qemu/dtb/petalogix-ml605.dtb /usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/dtb/bamboo.dtb /usr/share/qemu/ast27x0_bootrom.bin"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGSIZE changed from 341237291 to 340789657 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: FILELIST: added "/usr/lib/qemu/ptest/tests/tcg/plugins/.debug/libpatch.so /usr/lib/qemu/ptest/tests/qtest/.debug/aspeed_scu-test /usr/lib/qemu/ptest/tests/qtest/.debug/ast2700-hace-test"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1865081104 to 1870453768 (+0%)
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-dev: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-doc: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGSIZE changed from 885233 to 881537 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-guest-agent: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-locale: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py", added "/usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/aarch64/
 virt/IORT.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/li
 b/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 185304402 to 181840300 (-2%)
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-src: FILELIST: directory renamed /usr/src/debug/qemu/10.0.2/include/fpu -> /usr/src/debug/qemu/10.1.0/include/fpu, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-i386-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-i386-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/scsi -> /usr/src/debug/qemu/10.1.0/include/hw/scsi, directory renamed /usr/src/debug/qemu/10.0.2/include/standard-headers/asm-x86 -> /usr/src/debug/qemu/10.1.0/include/standard-headers/asm-x86, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-loongarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-loongarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/i
 nterface/arch-x86 -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/arch-x86, directory renamed /usr/src/debug/qemu/10.0.2/hw/riscv -> /usr/src/debug/qemu/10.1.0/hw/riscv, directory renamed /usr/src/debug/qemu/10.0.2/include/disas -> /usr/src/debug/qemu/10.1.0/include/disas, directory renamed /usr/src/debug/qemu/10.0.2/include/migration -> /usr/src/debug/qemu/10.1.0/include/migration, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/audio -> /usr/src/debug/qemu/10.1.0/include/hw/audio, directory renamed /usr/src/debug/qemu/10.0.2/subprojects/libvduse -> /usr/src/debug/qemu/10.1.0/subprojects/libvduse, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/hyperv -> /usr/src/debug/qemu/10.1.0/include/hw/hyperv, directory renamed /usr/src/debug/qemu/10.0.2/tcg/i386 -> /usr/src/debug/qemu/10.1.0/tcg/i386, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/core -> /usr/src/debug/qemu/10.1.0/include/hw/core, directory renamed /usr/src/debug/qemu/10.0.2/hw/block/dataplan
 e -> /usr/src/debug/qemu/10.1.0/hw/block/dataplane, directory renamed /usr/src/debug/qemu/10.0.2/host/include/i386/host -> /usr/src/debug/qemu/10.1.0/host/include/i386/host, directory renamed /usr/src/debug/qemu/10.0.2/linux-headers/asm -> /usr/src/debug/qemu/10.1.0/linux-headers/asm, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-arm-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-arm-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/host/include/generic/host -> /usr/src/debug/qemu/10.1.0/host/include/generic/host, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/southbridge -> /usr/src/debug/qemu/10.1.0/include/hw/southbridge, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libcommon.a.p -> /usr/src/debug/qemu/10.1.
 0/libcommon.a.p, directory renamed /usr/src/debug/qemu/10.0.2/target/i386 -> /usr/src/debug/qemu/10.1.0/target/i386, directory renamed /usr/src/debug/qemu/10.0.2/linux-headers/linux -> /usr/src/debug/qemu/10.1.0/linux-headers/linux, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/block -> /usr/src/debug/qemu/10.1.0/include/hw/block, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/usb -> /usr/src/debug/qemu/10.1.0/include/hw/usb, directory renamed /usr/src/debug/qemu/10.0.2/include/gdbstub -> /usr/src/debug/qemu/10.1.0/include/gdbstub, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/display -> /usr/src/debug/qemu/10.1.0/include/hw/display, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv32-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv32-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci-bridge -> /usr/src/debug/qemu/10.1.0/include/hw/pci-bridge, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mipsel-softmmu.a.p ->
  /usr/src/debug/qemu/10.1.0/libqemu-mipsel-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/linux-user -> /usr/src/debug/qemu/10.1.0/linux-user, directory renamed /usr/src/debug/qemu/10.0.2/include/qom -> /usr/src/debug/qemu/10.1.0/include/qom, directory renamed /usr/src/debug/qemu/10.0.2/host/include/i386/host/crypto -> /usr/src/debug/qemu/10.1.0/host/include/i386/host/crypto, directory renamed /usr/src/debug/qemu/10.0.2/ui/shader -> /usr/src/debug/qemu/10.1.0/ui/shader, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/loongarch -> /usr/src/debug/qemu/10.1.0/include/hw/loongarch, directory renamed /usr/src/debug/qemu/10.0.2/include -> /usr/src/debug/qemu/10.1.0/include, directory renamed /usr/src/debug/qemu/10.0.2/include/ui -> /usr/src/debug/qemu/10.1.0/include/ui, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64le-linux-user.a
 .p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64le-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/misc/macio -> /usr/src/debug/qemu/10.1.0/include/hw/misc/macio, directory renamed /usr/src/debug/qemu/10.0.2/target/ppc -> /usr/src/debug/qemu/10.1.0/target/ppc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci-host -> /usr/src/debug/qemu/10.1.0/include/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.2/include/tcg -> /usr/src/debug/qemu/10.1.0/include/tcg, directory renamed /usr/src/debug/qemu/10.0.2/block -> /usr/src/debug/qemu/10.1.0/block, directory renamed /usr/src/debug/qemu/10.0.2/migration -> /usr/src/debug/qemu/10.1.0/migration, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/firmware -> /usr/src/debug/qemu/10.1.0/include/hw/firmware, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/intc -> /usr/src/debug/qemu/10.1.0/include/hw/intc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/sd -> /usr/src/debug/qemu/10.1.0/i
 nclude/hw/sd, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv32-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv32-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/monitor -> /usr/src/debug/qemu/10.1.0/monitor, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mipsel-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mipsel-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-arm-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-arm-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/hw/intc -> /usr/src/debug/qemu/10.1.0/hw/intc, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64el-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64el-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/qobject -> /usr/src/debug/qemu/10.1.0/include/qobject, directory renamed
  /usr/src/debug/qemu/10.0.2/hw/virtio -> /usr/src/debug/qemu/10.1.0/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.2/hw/block -> /usr/src/debug/qemu/10.1.0/hw/block, directory renamed /usr/src/debug/qemu/10.0.2/include/standard-headers/linux -> /usr/src/debug/qemu/10.1.0/include/standard-headers/linux, directory renamed /usr/src/debug/qemu/10.0.2/storage-daemon/qapi -> /usr/src/debug/qemu/10.1.0/storage-daemon/qapi, directory renamed /usr/src/debug/qemu/10.0.2/target/loongarch -> /usr/src/debug/qemu/10.1.0/target/loongarch, directory renamed /usr/src/debug/qemu/10.0.2/include/semihosting -> /usr/src/debug/qemu/10.1.0/include/semihosting, directory renamed /usr/src/debug/qemu/10.0.2/hw/loongarch -> /usr/src/debug/qemu/10.1.0/hw/loongarch, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/timer -> /usr/src/debug/qemu/10.1.0/include/hw/timer, directory renamed /usr/src/debug/qemu/10.0.2/include/hw -> /usr/src/debug/qemu/10.1.0/include/hw, directory renamed /usr/src/debug/q
 emu/10.0.2/include/hw/xen/interface -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/uefi -> /usr/src/debug/qemu/10.1.0/include/hw/uefi, directory renamed /usr/src/debug/qemu/10.0.2 -> /usr/src/debug/qemu/10.1.0, directory renamed /usr/src/debug/qemu/10.0.2/hw/i386/kvm -> /usr/src/debug/qemu/10.1.0/hw/i386/kvm, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-x86_64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-x86_64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/nvram -> /usr/src/debug/qemu/10.1.0/include/hw/nvram, directory renamed /usr/src/debug/qemu/10.0.2/ebpf -> /usr/src/debug/qemu/10.1.0/ebpf, directory renamed /usr/src/debug/qemu/10.0.2/hw/arm -> /usr/src/debug/qemu/10.1.0/hw/arm, directory renamed /usr/src/debug/qemu/10.0.2/crypto -> /usr/src
 /debug/qemu/10.1.0/crypto, directory renamed /usr/src/debug/qemu/10.0.2/include/authz -> /usr/src/debug/qemu/10.1.0/include/authz, directory renamed /usr/src/debug/qemu/10.0.2/contrib/ivshmem-server -> /usr/src/debug/qemu/10.1.0/contrib/ivshmem-server, directory renamed /usr/src/debug/qemu/10.0.2/hw/pci-host -> /usr/src/debug/qemu/10.1.0/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.2/qga -> /usr/src/debug/qemu/10.1.0/qga, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-loongarch64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-loongarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/hw/usb -> /usr/src/debug/qemu/10.1.0/hw/usb, directory renamed /usr/src/debug/qemu/10.0.2/host/include/x86_64/host -> /usr/src/debug/qemu/10.1.0/host/include/x86_64/host, directory renamed /usr/src/debug/qemu/10.0.2/accel/tcg -> /usr/src/debug/qemu/10.1.0/accel/tcg, directory renamed /usr/src/debug/qemu/10.0.2/hw/net -> /usr/src/debug/qemu/10.1.0/hw/net, directory re
 named /usr/src/debug/qemu/10.0.2/libqemu-mips64el-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64el-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/disas -> /usr/src/debug/qemu/10.1.0/disas, directory renamed /usr/src/debug/qemu/10.0.2/include/scsi -> /usr/src/debug/qemu/10.1.0/include/scsi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ipack -> /usr/src/debug/qemu/10.1.0/include/hw/ipack, directory renamed /usr/src/debug/qemu/10.0.2/include/net -> /usr/src/debug/qemu/10.1.0/include/net, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ipmi -> /usr/src/debug/qemu/10.1.0/include/hw/ipmi, directory renamed /usr/src/debug/qemu/10.0.2/include/chardev -> /usr/src/debug/qemu/10.1.0/include/chardev, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/virtio -> /usr/src/debug/qemu/10.1.0/include/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.2/net -> /usr/src/debug/qemu/10.1.0/net, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/gpio ->
  /usr/src/debug/qemu/10.1.0/include/hw/gpio, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface/io -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/io, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-aarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-aarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/sh4 -> /usr/src/debug/qemu/10.1.0/include/hw/sh4, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-aarch64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-aarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10
 .0.2/include/hw/watchdog -> /usr/src/debug/qemu/10.1.0/include/hw/watchdog, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/input -> /usr/src/debug/qemu/10.1.0/include/hw/input, directory renamed /usr/src/debug/qemu/10.0.2/include/libdecnumber/dpd -> /usr/src/debug/qemu/10.1.0/include/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/10.0.2/subprojects/libvhost-user -> /usr/src/debug/qemu/10.1.0/subprojects/libvhost-user, directory renamed /usr/src/debug/qemu/10.0.2/util -> /usr/src/debug/qemu/10.1.0/util, directory renamed /usr/src/debug/qemu/10.0.2/target/mips -> /usr/src/debug/qemu/10.1.0/target/mips, directory renamed /usr/src/debug/qemu/10.0.2/audio -> /usr/src/debug/qemu/10.1.0/audio, directory renamed /usr/src/debug/qemu/10.0.2/include/user -> /usr/src/debug/qemu/10.1.0/include/user, directory renamed /usr/src/debug/qemu/10.0.2/tests -> /usr/src/debug/qemu/10.1.0/tests, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ssi -> /usr/src/debug/qemu/10.1.0/inc
 lude/hw/ssi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen -> /usr/src/debug/qemu/10.1.0/include/hw/xen, directory renamed /usr/src/debug/qemu/10.0.2/include/libdecnumber -> /usr/src/debug/qemu/10.1.0/include/libdecnumber, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/fsi -> /usr/src/debug/qemu/10.1.0/include/hw/fsi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci -> /usr/src/debug/qemu/10.1.0/include/hw/pci, directory renamed /usr/src/debug/qemu/10.0.2/include/crypto -> /usr/src/debug/qemu/10.1.0/include/crypto, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/cxl -> /usr/src/debug/qemu/10.1.0/include/hw/cxl, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/mem -> /usr/src/debug/qemu/10.1.0/include/hw/mem, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/i2c -> /usr/src/debug/qemu/10.1.0/include/hw/i2c, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ppc -> /usr/src/debug/qemu/10.1.0/include/hw/ppc, directory renamed 
 /usr/src/debug/qemu/10.0.2/include/hw/isa -> /usr/src/debug/qemu/10.1.0/include/hw/isa, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/adc -> /usr/src/debug/qemu/10.1.0/include/hw/adc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/dma -> /usr/src/debug/qemu/10.1.0/include/hw/dma, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/rtc -> /usr/src/debug/qemu/10.1.0/include/hw/rtc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ide -> /usr/src/debug/qemu/10.1.0/include/hw/ide, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface/hvm -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/hvm, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/remote -> /usr/src/debug/qemu/10.1.0/include/hw/remote, directory renamed /usr/src/debug/qemu/10.0.2/include/io -> /usr/src/debug/qemu/10.1.0/include/io, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/net -> /usr/src/debug/qemu/10.1.0/include/hw/net, directory renamed /usr/src/debug/qe
 mu/10.0.2/backends/tpm -> /usr/src/debug/qemu/10.1.0/backends/tpm, directory renamed /usr/src/debug/qemu/10.0.2/include/block -> /usr/src/debug/qemu/10.1.0/include/block, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/cpu -> /usr/src/debug/qemu/10.1.0/include/hw/cpu, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/acpi -> /usr/src/debug/qemu/10.1.0/include/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.2/hw/acpi -> /usr/src/debug/qemu/10.1.0/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.2/include/monitor -> /usr/src/debug/qemu/10.1.0/include/monitor, directory renamed /usr/src/debug/qemu/10.0.2/hw/net/fsl_etsec -> /usr/src/debug/qemu/10.1.0/hw/net/fsl_etsec, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/mips -> /usr/src/debug/qemu/10.1.0/include/hw/mips, directory renamed /usr/src/debug/qemu/10.0.2/ui -> /usr/src/debug/qemu/10.1.0/ui, directory renamed /usr/src/debug/qemu/10.0.2/hw/mips -> /usr/src/debug/qemu/10.1.0/hw/mips, directory renamed /u
 sr/src/debug/qemu/10.0.2/include/hw/sensor -> /usr/src/debug/qemu/10.1.0/include/hw/sensor, removed "/usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.0.2/include/qemu/host-utils.h /usr/src/debug/qemu/10.0.2/include/qemu/cpuid.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.0.2/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.0.2/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.0.2/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.0.2/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.0.2/include/system/block-backend-io.h /usr/src/debug/qemu/10.0.2/trace/trace-io.c /usr/src/debug/qemu/10.0.2/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.0.2/trace/trace-
 io.h /usr/src/debug/qemu/10.0.2/include/exec/address-spaces.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.0.2/trace/trace-ui.c /usr/src/debug/qemu/10.0.2/qapi/qapi-features.h /usr/src/debug/qemu/10.0.2/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.0.2/include/system/cryptodev.h /usr/src/debug/qemu/10.0.2/include/qemu/hw-version.h /usr/src/debug/qemu/10.0.2/trace/trace-ui.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.0.2/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.0.2/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.0.2/include/system/accel-blocker.h /usr/src/debug/qemu/10.0.2/include/system/block-backend-common.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.0.2/q
 api/qapi-types-tpm.h /usr/src/debug/qemu/10.0.2/include/system/runstate-action.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.0.2/target/riscv/pmp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.0.2/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.0.2/target/arm/cpu.h /usr/src/debug/qemu/10.0.2/trace/trace-qom.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.0.2/include/qemu/dbus.h /usr/src/debug/qemu/10.0.2/trace/trace-qom.c /usr/src/debug/qemu/10.0.2/include/qemu/defer-call.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.0.2/include/qemu/lockable.h /usr/src/debug/qemu/10.0.2/include/qemu/main-loop.h /usr/
 src/debug/qemu/10.0.2/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.0.2/target/arm/idau.h /usr/src/debug/qemu/10.0.2/include/qemu/thread-context.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.0.2/include/qemu/iova-tree.h /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.0.2/include/system/kvm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-ui.h /usr
 /src/debug/qemu/10.0.2/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi.c /usr/src/debug/qemu/10.0.2/trace/trace-target_arm.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi.h /usr/src/debug/qemu/10.0.2/target/arm/gtimer.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.0.2/include/system/dirtylimit.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/memattrs.h /usr/src/debug/qemu/10.0.2/include/exec/memopidx.h /usr/src/debug/qemu/10.0.2/include/qemu/memalign.h /usr/src/debug/qemu/10.0.2/include/qemu/qht.h /usr/src/debug/qemu/10.0.2/trace/trace-target_arm.h /usr/src/debug/qemu/10.0.2/trace/trace-authz.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine-target.c /usr/src/debug/qemu/10.0.2/include/qemu/plugin-event.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.trace-events /usr/src/de
 bug/qemu/10.0.2/include/qemu/xxhash.h /usr/src/debug/qemu/10.0.2/trace/trace-authz.h /usr/src/debug/qemu/10.0.2/include/qemu/selfmap.h /usr/src/debug/qemu/10.0.2/include/qemu/seqlock.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.0.2/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.0.2/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.0.2/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.0.2/include/hw/misc/unimp.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/boot.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/numa.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/virt.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.0.2/include/qemu/ratelimit.h /usr/src/debug/qemu/10.0.2/include/system/event-loop-base.h /usr/src/debug/qemu/10.0.2/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cxl.trace-events /usr
 /src/debug/qemu/10.0.2/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.0.2/include/exec/memop.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.0.2/hw/vfio/pci.h /usr/src/debug/qemu/10.0.2/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.0.2/include/qemu/chardev_open.h /usr/src/debug/qemu/10.0.2/include/qemu/option_int.h /usr/src/debug/qemu/10.0.2/trace/trace-target_i386.c /usr/src/debug/qemu/10.0.2/include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.0.2/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.0.2/include/qemu/rcu.h /usr/src/debug/qemu/10.0.2/include/qemu/notify.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.0.2/trace/trace-target_i386.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.0.2/hw/i386/fw_cfg.h /usr/sr
 c/debug/qemu/10.0.2/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.0.2/include/qemu/qtree.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.0.2/include/qapi/qmp-event.h /usr/src/debug/qemu/10.0.2/include/hw/char/serial-
 isa.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.0.2/include/system/cpus.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.0.2/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.0.2/include/qemu/bitops.h /usr/src/debug/qemu/10.0.2/include/exec/ioport.h /usr/src/debug/qemu/10.0.2/include/system/watchdog.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-monitor.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.0.2/trace/trace-monitor.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/misc/armsse-cpuid.h /usr/s
 rc/debug/qemu/10.0.2/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.0.2/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-target.h /usr/src/debug/qemu/10.0.2/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.0.2/hw/i386/acpi-build.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-error.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.0.2/include/hw/char/parallel.h /usr/src/debug/qemu/10.0.2/target/arm/cpregs.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.0.2/trace/control.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block.c /usr/s
 rc/debug/qemu/10.0.2/qapi/qapi-types-error.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.0.2/include/system/iothread.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.0.2/include/qemu/plugin.h /usr/src/debug/qemu/10.0.2/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.0.2/include/exec/page-protection.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-scsi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.0.2/qapi/
 qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.0.2/include/exec/gdbstub.h /usr/src/debug/qemu/10.0.2/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.0.2/trace/trace-scsi.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.0.2/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.0.2/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.0.2/include/system/kvm_int.h /usr/src/debug/qemu/10.0.2/include/hw/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.0.2/include/system/numa.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_isa.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_net.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_isa.h /usr/src/debug/qemu/10.0.2/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net
 .h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386.c /usr/src/debug/qemu/10.0.2/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.0.2/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386.h /usr/src/debug/qemu/10.0.2/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.0.2/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.0.2/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_remote.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_remote.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.0.2/in
 clude/hw/i386/vmport.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.0.2/include/qemu/guest-random.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.h /usr/src/debug/qemu/10.0.2/include/qemu/config-file.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.c /usr/src/debug/qemu/10.0.2/target/arm/multiprocessing.h /usr/src/debug/qemu/10.0.2/include/qemu/drm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.0.2/target/arm/internals.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.0.2/include/qemu/range.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.0.2/include/qemu/base64.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block.h /usr/src/debug/qemu/
 10.0.2/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.0.2/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.0.2/include/exec/target_long.h /usr/src/debug/qemu/10.0.2/include/exec/page-vary.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sd.c /usr/src/debug/qemu/10.0.2/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sd.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.0.2/include/exec/translator.h /usr/src/debug/qemu/10.0.2/include/qemu/timed-average.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.0.2/trace/event-internal.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cxl.h /usr/s
 rc/debug/qemu/10.0.2/include/qemu/memfd.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.0.2/include/exec/ram_addr.h /usr/src/debug/qemu/10.0.2/include/exec/ramblock.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.0.2/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.0.2/include/system/seccomp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_audio.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_block.h /usr/src/debug/qemu/10.0.2/include/qemu/error-report.h /usr/src/debug/qemu/10.0.2/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.0.2/target/arm/cpu-qom.h /usr/src/debug/qemu/10.0.2/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_audio.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_block.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_input.c /us
 r/src/debug/qemu/10.0.2/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.0.2/include/qemu/job.h /usr/src/debug/qemu/10.0.2/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.0.2/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.0.2/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_input.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_timer.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.0.2/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.0.2/trace/trace-qap
 i_commands_replay_trace_events.h /usr/src/debug/qemu/10.0.2/include/qemu/typedefs.h /usr/src/debug/qemu/10.0.2/include/qemu/reserved-region.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_core.c /usr/src/debug/qemu/10.0.2/include/system/balloon.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.0.2/include/qemu/yank.h /usr/src/debug/qemu/10.0.2/include/system/kvm_xen.h /usr/src/debug/qemu/10.0.2/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-hw_core.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_timer.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_adc.h /usr/src/debug/qemu/10.0.2/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_adc.c /usr/src/debug/qemu/10.0.2/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.0.2/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.0.2/inc
 lude/qemu/qdist.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.0.2/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.0.2/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armsse.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.0.2/include/system/memory_mapping.h /usr/src/debug/qemu/10.0.2/include/system/replay.h /usr/src/debug/qemu/10.0.2/include/system/system.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.0.2/include/qemu/keyval.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_dma.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_dma.h /usr/src/debug/qemu/1
 0.0.2/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.0.2/trace/trace-target_riscv.c /usr/src/debug/qemu/10.0.2/include/system/device_tree.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.0.2/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.0.2/include/hw/misc/led.h /usr/src/debug/qemu/10.0.2/trace/trace-target_riscv.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.0.2/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.0.2/include/system/cpu-throttle.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_char.c /usr/src/de
 bug/qemu/10.0.2/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.0.2/include/qemu/coroutine_int.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_char.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands.c /usr/src/debug/qemu/10.0.2/include/system/host_iommu_device.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-common.c /usr/src/debug/qemu/10.0.2/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.0.2/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-dra
 mc.h /usr/src/debug/qemu/10.0.2/include/qemu/async-teardown.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/futex.h /usr/src/debug/qemu/10.0.2/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.0.2/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.0.2/include/qemu/envlist.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types.c /usr/src/debug/qemu/10.0.2/qapi/qapi-vis
 it-net.h /usr/src/debug/qemu/10.0.2/include/qemu/uuid.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-net.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.0.2/include/qemu/event_notifier.h /usr/src/debug/qemu/10.0.2/include/qemu/path.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_usb.h /usr/src/debug/qemu/10.0.2/include/qemu/bcd.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_usb.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-net.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-dump.c /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/1
 0.0.2/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.0.2/include/system/arch_init.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-misc-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc-target.trace-events /usr/src/debug/
 qemu/10.0.2/include/qemu/throttle.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.0.2/trace/trace-linux_user.c /usr/src/debug/qemu/10.0.2/include/qemu/transactions.h /usr/src/debug/qemu/10.0.2/trace/trace-linux_user.h /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.0.2/include/system/spdm-socket.h /usr/src/debug/qemu/10.0.2/include/qemu/lockcnt.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.0.2/qapi/qap
 i-visit-rocker.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.0.2/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.0.2/trace/trace-target_ppc.c /usr/src/debug/qemu/10.0.2/include/exec/target_page.h /usr/src/debug/qemu/10.0.2/trace/trace-target_ppc.h /usr/src/debug/qemu/10.0.2/include/qemu/stats64.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.0.2/include/qemu/module.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.0.2/include/qemu/osdep.
 h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.0.2/qapi/qapi-introspect.h /usr/src/debug/qemu/10.0.2/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-introspect.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.0.2/include/exec/tswap.h /usr/src/debug/qemu/10.0.2/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.0.2/trace/trace-gdbstub.c /usr/src/debug/qemu/10.0.2/trace/trace-root.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.0.2/include/system/tpm_util.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.0.2/trace/trace-gdbstub.h /usr/src/debug/qemu/10.0.2/include/qemu/cpu-float.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ppc.c /usr/src/debu
 g/qemu/10.0.2/include/qemu/progress_meter.h /usr/src/debug/qemu/10.0.2/trace/trace-root.h /usr/src/debug/qemu/10.0.2/include/qemu/bswap.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_ide.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.0.2/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_ide.c /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.0.2/include/qapi/visitor.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc-target.c /usr/src/debug/qemu/10.0.2/include/exec/hwa
 ddr.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc-target.h /usr/src/debug/qemu/10.0.2/include/qemu/madvise.h /usr/src/debug/qemu/10.0.2/include/qemu/timer.h /usr/src/debug/qemu/10.0.2/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit.c /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.0.2/include/qapi/compat-policy.h /usr/src/debug/qemu/10.0.2/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.0.2/include/exec/cputlb.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.0.2/include/hw/i386/pc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-r40-ccu.h /usr/sr
 c/debug/qemu/10.0.2/include/system/runstate.h /usr/src/debug/qemu/10.0.2/include/qemu/accel.h /usr/src/debug/qemu/10.0.2/include/qemu/filemonitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc-target.c /usr/src/debug/qemu/10.0.2/include/hw/arm/virt.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc-target.h /usr/src/debug/qemu/10.0.2/trace/trace-audio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.0.2/trace/trace-audio.c /usr/src/debug/qemu/10.0.2/include/system/dump-arch.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.0.2/include/system/accel-ops.h /usr/src/debug/qemu/10.0.2/qapi/qa
 pi-commands-misc-target.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.0.2/include/hw/i386/apic.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.0.2/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_mips.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.0.2/include/system/rng-random.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.0.2/include/qemu/iov.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_mips.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-pmc-iou-slcr.
 h /usr/src/debug/qemu/10.0.2/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-job.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-net.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.0.2/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-job.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-net.h /usr/src/debug/qemu/10.0.2/trace/trace-block.c /usr/src/debug/qemu/10.0.2/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.0.2/trace/trace-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.0.2/include/exec/cpu-all.h /usr/src/debug/qemu/10.0.2/i
 nclude/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.0.2/include/qapi/type-helpers.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.0.2/include/qemu/systemd.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.0.2/include/exec/vaddr.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_net_trace_events.c 
 /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.0.2/hw/ppc/e500-ccsr.h /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.0.2/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.0.2/trace/trace-migration.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.0.2/include/exec/memory-internal.h /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.0.2/trace/trace-migration.c /usr/src/debug/qemu/10.0.2/include/qemu/cutils.h /usr/src/debu
 g/qemu/10.0.2/include/system/rng.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-net.h /usr/src/debug/qemu/10.0.2/target/arm/cpu-features.h /usr/src/debug/qemu/10.0.2/trace/trace-net.c /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.0.2/include/exec/tlb-common.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.0.2/target/riscv/cpu.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.0.2/include/system/xen.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/i386/apic_internal.h /usr/src/deb
 ug/qemu/10.0.2/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.0.2/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.0.2/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.0.2/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.0.2/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_intc.h /usr/src/debug/qemu/10.0.2/include/qemu/bitmap.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.0.2/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_intc.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-control.c /usr/src/debug/qemu/10.
 0.2/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.0.2/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-control.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-job.h /usr/src/debug/qemu/10.0.2/trace/trace-chardev.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.0.2/trace/trace-chardev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-job.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.0.2/include/system/cpu-timers.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.0.2/include/exec/replay-core.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.0.2/qap
 i/qapi-types-acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.0.2/include/exec/tb-flush.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-char.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.0.2/include/system/iommufd.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.0.2/include/hw/char/serial.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-rocker.trace
 -events /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.0.2/include/exec/exec-all.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.0.2/include/qemu/hbitmap.h /usr/src/debug/qemu/10.0.2/include/exec/cpu_ldst.h /usr/src/debug/qemu/10.0.2/include/qemu/atomic.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.0.2/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.0.2/trace/trace-system.h /usr/src/debug/qemu/10.0.2/trace/control-internal.h /usr/src/debug/qemu/10.0.2/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_sbc.h /usr/s
 rc/debug/qemu/10.0.2/include/qemu/mprotect.h /usr/src/debug/qemu/10.0.2/include/hw/arm/omap.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.0.2/trace/trace-system.c /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.0.2/include/qemu/fifo8.h /usr/src/debug/qemu/10.0.2/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.0.2/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.0.2/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.0.2/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_target_trace_events.h /usr/src/debug/qemu/10.0.2/include/qemu/help_option.h /usr/src/debug/qemu/10.0.2/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.0.2/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.0.2/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc.h /usr/src/debug/qemu/10.0.2
 /trace/trace-qapi_commands_machine_target_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.0.2/include/system/hw_accel.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.0.2/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.0.2/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.0.2/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.0.2/include/qemu/id.h /usr/src/debug/qemu/10.0.2/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.0.2/include/exec/plugin-gen.h /usr/src/debug/qemu/10.0.2/include/qemu/qsp.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/memory.h /usr/src/debug/qemu/10.0.2/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.0.2/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.0.2/trace/t
 race-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.0.2/include/qemu/buffer.h /usr/src/debug/qemu/10.0.2/include/qemu/thread.h /usr/src/debug/qemu/10.0.2/include/system/hostmem.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/arm/digic.h /usr/src/debug/qemu/10.0.2/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.0.2/include/system/qtest.h /usr/src/debug/qemu/10.0.2/include/system/reset.h /usr/src/debug/qemu/10.0.2/include/system/stats.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_arm.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_migration_trace_events.
 h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.0.2/include/exec/abi_ptr.h /usr/src/debug/qemu/10.0.2/include/hw/char/escc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_arm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-target.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.0.2/include/qemu/int128.h /usr/src/debug/qemu/10.0.2/include/system/tpm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-target.c /usr/src/debug/qemu/10.0.2/include/system/tpm_backend.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.0.2/include/qemu/unicode.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/readline.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.0.2/incl
 ude/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.0.2/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.0.2/include/system/dma.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_target_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_target_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/log.h /usr/src/debug/qemu/10.0.2/include/qemu/log.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.0.2/qapi/qapi-emit-events.c /usr/src/debug/qemu/10.0.2/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.0.2/inclu
 de/hw/arm/boot.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.0.2/include/system/dirtyrate.h /usr/src/debug/qemu/10.0.2/include/qapi/error.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.0.2/include/qemu/fifo32.h /usr/src/debug/qemu/10.0.2/include/qemu/option.h /usr/src/debug/qemu/10.0.2/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.0.2/include/qemu/pmem.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-char.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-dump.h /usr/src/
 debug/qemu/10.0.2/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.0.2/include/exec/breakpoint.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.0.2/include/qemu/coroutine.h /usr/src/debug/qemu/10.0.2/include/qemu/sockets.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.0.2/include/exec/cpu-common.h /usr/src/debug/qemu/10.0.2/include/exec/translation-block.h /usr/src/debug/qemu/10.0.2/include/hw/char/pl011.h /usr/src/debug/qemu/10.0.2/include/system/block-bac
 kend-global-state.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.0.2/include/system/os-posix.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.0.2/trace/trace-backends.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.0.2/include/qemu/interval-tree.h /usr/src/debug/qemu/10.0.2/target/riscv/pmu.h /usr/src/debug/qemu/10.0.2/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.0.2/trace/trace-backends.c /usr/src/debug/qemu/10.0.2/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.0.2/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/
 10.0.2/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.0.2/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.0.2/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.0.2/include/exec/ramlist.h /usr/src/debug/qemu/10.0.2/include/qapi/util.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.0.2/include/system/blockdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.0.2/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.0.2/include/system/tcg.h /usr/src/debug/qemu/10.0.2/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.0.2/include/system/dump.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.0.2/include/system/rtc.h /
 usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.0.2/include/qemu/thread-posix.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci.c /usr/src/debug/qemu/10.0.2/include/hw/i386/topology.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.0.2/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.0.2/include/qemu/queue.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.0.2/include/qemu/datadir.h /usr/src/debug/qemu/1
 0.0.2/trace/trace-nbd.h /usr/src/debug/qemu/10.0.2/trace/trace-nbd.c /usr/src/debug/qemu/10.0.2/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.0.2/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.0.2/include/qemu/qemu-print.h /usr/src/debug/qemu/10.0.2/include/hw/i386/microvm.h /usr/src/debug/qemu/10.0.2/include/qemu/crc32c.h /usr/src/debug/qemu/10.0.2/target/arm/syndrome.h /usr/src/debug/qemu/10.0.2/include/qemu/cacheflush.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/spike.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_mem.c /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32f2xx_syscfg.h /usr/src
 /debug/qemu/10.0.2/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_mem.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.0.2/trace/trace-util.c /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_xen.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.0.2/trace/trace-util.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_xen.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_display.c /usr/src/debug/qemu/10.0.2/include/hw/i386/x86.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_displ
 ay.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_trace_events.h", added "/usr/src/debug/qemu/10.1.0/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.1.0/include/hw/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.1.0/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.1.0/include/system/numa.h /usr/src/debug/qemu/10.1.0/include/system/ramblock.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.1.0/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386.c /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32
 f4xx_exti.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386.h /usr/src/debug/qemu/10.1.0/include/exec/plugin-gen.h /usr/src/debug/qemu/10.1.0/include/qemu/qsp.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_remote.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_remote.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-s390x.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.1.0/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-s390x.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_yank_trace_events
 .h /usr/src/debug/qemu/10.1.0/include/exec/icount.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.1.0/include/qemu/base64.h /usr/src/debug/qemu/10.1.0/include/system/hostmem.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.1.0/include/hw/arm/digic.h /usr/src/debug/qemu/10.1.0/include/system/qtest.h /usr/src/debug/qemu/10.1.0/include/system/reset.h /usr/src/debug/qemu/10.1.0/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.1.0/include/system/stats.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_trng.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_arm.c /usr/src/debug/qemu/10.1.0/include/exec/target_long.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.1.0/include/exec/abi_ptr.h /usr/src/debug/qemu/10.1.0/include/hw/char/escc.h /usr/src/debug/qemu/10.1.0/include/exec/page-vary.h /usr/src/debug/qemu/10.1.0/trace/tr
 ace-hw_arm.h /usr/src/debug/qemu/10.1.0/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sd.c /usr/src/debug/qemu/10.1.0/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sd.h /usr/src/debug/qemu/10.1.0/include/system/tpm.h /usr/src/debug/qemu/10.1.0/include/system/tpm_backend.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.1.0/include/exec/translator.h /usr/src/debug/qemu/10.1.0/include/qemu/timed-average.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.1.0/trace/event-internal.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/10.1.0/include/qemu/unicode.h /usr/src/debug/qemu/10.1.0/include/qemu/readline.h /usr/src/debug/qemu/10.1.0/include/hw/mis
 c/aspeed_sli.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_aes.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_gcr.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_icc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.1.0/include/qemu/error-report.h /usr/src/debug/qemu/10.1.0/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.1.0/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.1.0/target/arm/cpu-qom.h /usr/src/debug/qemu/10.1.0/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.1.0/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-error.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-e
 xport.trace-events /usr/src/debug/qemu/10.1.0/include/system/dma.h /usr/src/debug/qemu/10.1.0/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.1.0/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.1.0/include/qapi/error-internal.h /usr/src/debug/qemu/10.1.0/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.1.0/include/exec/log.h /usr/src/debug/qemu/10.1.0/include/qemu/log.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.1.0/include/qemu/reserved-region.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_core.c /usr/src/debug/qemu/10.1.0/include/system/dirtyrate.h /usr/src/debug/qemu/10.1.0/common-user/plugin-api.c.inc /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-cframe-reg.h /
 usr/src/debug/qemu/10.1.0/include/qapi/error.h /usr/src/debug/qemu/10.1.0/include/qemu/yank.h /usr/src/debug/qemu/10.1.0/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_core.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-accelerator.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-i386.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-i386.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-accelerator.h /usr/src/debug/qemu/10.1.0/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-char.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/helper-retaddr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-
 events-acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.1.0/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.1.0/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.1.0/include/hw/arm/armsse.h /usr/src/debug/qemu/10.1.0/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.1.0/include/system/ioport.h /usr/src/debug/qemu/10.1.0/include/system/memory.h /usr/src/debug/qemu/10.1.0/include/system/replay.h /usr/src/debug/qemu/10.1.0/include/system/system.h /usr/src/debug/qemu/10.1.0/include/qemu/keyval.h /usr/src/debug/qemu/10.1.0/include/qemu/coroutine.h /usr/src/debug/qemu/10.1.0/include/qemu/sockets.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.1.0/include/exec/cpu-common.h /usr/src/debug/qemu/10.1.0/include/exec/translation-block.h /usr/sr
 c/debug/qemu/10.1.0/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.1.0/include/exec/watchpoint.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.1.0/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.1.0/include/hw/misc/led.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.1.0/trace/trace-backends.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.1.0/include/qemu/interval-tree.h /usr/src/debug/qemu/10.1.0/include/system/cpu-throttle.h /usr/src/debug/qemu/10.1.0/trace/trace-backends.c /usr/src/debug/qemu/10.1.0/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_char.c /usr/src/debug/qemu/10.1.0/trace/trace
 -qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-mmu-index.h /usr/src/debug/qemu/10.1.0/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_char.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/container.h /usr/src/debug/qemu/10.1.0/include/system/host_iommu_device.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.1.0/hw/i386/tdvf-hob.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.1.0/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.1.0/include/qemu/async-teardown.h /usr/src/debug/qemu/10.1.0/qapi/qap
 i-commands-transaction.c /usr/src/debug/qemu/10.1.0/include/system/tcg.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.1.0/include/system/rtc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.1.0/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.1.0/include/qemu/thread-posix.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci.c /usr/src/debug/qemu/10.1.0/include/qemu/uuid.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-net.h /usr/src/debug/qemu/10.1.0/include/qemu/event_notifier.h /usr/s
 rc/debug/qemu/10.1.0/include/qemu/path.h /usr/src/debug/qemu/10.1.0/include/hw/i386/topology.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-net.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-dump.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/
 10.1.0/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.1.0/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.1.0/include/qemu/queue.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.1.0/trace/trace-authz.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.1.0/include/qemu/qemu-print.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/protocol.h /usr/src/debug/qemu/10.1.0/include/qemu/transactions.h /usr/src/debug/qemu/10.1.0/include/qemu/cacheflush.h /usr/src/debug/qemu/10.1.0/target/arm/syndrome.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.1.0/include/hw/r
 iscv/spike.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.1.0/include/system/ram_addr.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_mem.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_mem.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.1.0/trace/trace-util.c /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.1.0/trace
 /trace-hw_ufs.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_xen.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_xen.h /usr/src/debug/qemu/10.1.0/trace/trace-util.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_display.c /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_display.h /usr/src/debug/qemu/10.1.0/include/exec/target_page.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.1.0/include/qemu/stats64.h /usr/src/debug/qemu/10.1.0/qapi/qapi-comma
 nds-char.c /usr/src/debug/qemu/10.1.0/include/qemu/cpuid.h /usr/src/debug/qemu/10.1.0/include/system/hvf.h /usr/src/debug/qemu/10.1.0/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.1.0/include/qemu/module.h /usr/src/debug/qemu/10.1.0/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.1.0/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.1.0/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.1.0/include/system/block-backend-io.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.1.0/trace/trace-gdbstub.c /usr/src/debug/qemu/10.1.0/include/hw/riscv/virt.h /usr/src/debug/qemu/10.1.0/include/system/tpm_util.h /usr/src/debug/qemu/10.1.0/trace/trace-io.c /usr/src/debug/qemu/10.1.0/qapi/
 qapi-visit-crypto.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.1.0/trace/trace-gdbstub.h /usr/src/debug/qemu/10.1.0/include/qemu/cpu-float.h /usr/src/debug/qemu/10.1.0/target/i386/kvm/tdx-quote-generator.h /usr/src/debug/qemu/10.1.0/include/qemu/progress_meter.h /usr/src/debug/qemu/10.1.0/trace/trace-io.h /usr/src/debug/qemu/10.1.0/trace/trace-ui.c /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.1.0/qapi/qapi-features.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.1.0/include/system/cryptodev.h /usr/src/debug/qemu/10.1.0/include/qemu/target-info-impl.h /usr/src/debug/qemu/10.1.0/trace/trace-ui.h /usr/src/debug/qemu/10.1.0/include/qemu/target-info-qapi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-sockets.h
  /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.1.0/include/system/block-backend-common.h /usr/src/debug/qemu/10.1.0/include/qapi/visitor.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-device.h /usr/src/debug/qemu/10.1.0/include/exec/hwaddr.h /usr/src/debug/qemu/10.1.0/include/qemu/madvise.h /usr/src/debug/qemu/10.1.0/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.1.0/include/exec/cputlb.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10
 .1.0/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.1.0/hw/vfio/vfio-listener.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.1.0/include/system/runstate.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.1.0/include/qemu/filemonitor.h /usr/src/debug/qemu/10.1.0/trace/trace-audio.h /usr/src/debug/qemu/10.1.0/include/hw/arm/virt.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.1.0/include/qemu/defer-call.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.1.0/trace/trace-audio.c /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.1.0/target/arm/idau.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.1.0/qa
 pi/qapi-commands-migration.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_mips.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.1.0/include/system/rng-random.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_mips.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/thread-context.h /usr/src/debug/qemu/10.1.0/include/qemu/iova-tree.h /usr/src/debug/qemu/10.1.0/include/system/xen-mapcache.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /usr/src/debug/qemu/10.1.0/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.1.0/include/system/kvm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-job.c /usr/src/debug/qe
 mu/10.1.0/qapi/qapi-events-net.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.1.0/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-job.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-net.h /usr/src/debug/qemu/10.1.0/trace/trace-block.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.1.0/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.1.0/trace/trace-block.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.1.0/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi.c /usr/src/debug/qemu/10.1.0/trace/trace-target_arm.c /usr/src/debug/qemu/10.1.0
 /trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-target_arm.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.c /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.1.0/target/arm/gtimer.h /usr/src/debug/qemu/10.1.0/include/exec/memattrs.h /usr/src/debug/qemu/10.1.0/include/exec/memopidx.h /usr/src/debug/qemu/10.1.0/include/qemu/memalign.h /usr/src/debug/qemu/10.1.0/include/qemu/qht.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.1.0/include/qemu/plugin-event.h /usr/src/debug/qemu/10.1.0/include/qemu/systemd.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/arm/nrf51_soc.h /us
 r/src/debug/qemu/10.1.0/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.1.0/target/i386/kvm/tdx.h /usr/src/debug/qemu/10.1.0/include/system/event-loop-base.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.1.0/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.1.0/trace/trace-migration.h /usr/src/debug/qemu/10.1.0/include/exec/memop.h /usr/src/debug/qemu/10.1.0/trace/trace-migration.c /usr/src/debug/qemu/10.1.0/include/qemu/cutils.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.1.0/hw/vfio/pci.h /usr/src/debug/qemu/10.1.0/includ
 e/qapi/opts-visitor.h /usr/src/debug/qemu/10.1.0/trace/trace-net.h /usr/src/debug/qemu/10.1.0/target/arm/cpu-features.h /usr/src/debug/qemu/10.1.0/include/qemu/chardev_open.h /usr/src/debug/qemu/10.1.0/include/qemu/option_int.h /usr/src/debug/qemu/10.1.0/trace/trace-net.c /usr/src/debug/qemu/10.1.0/include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.1.0/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.1.0/include/qemu/rcu.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/probe.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-cpr.h /usr/src/debug/qemu/10.1.0/include/hw/i386/apic_internal.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.1.0/include/hw/s390x/storage-keys.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.1.0/incl
 ude/exec/mmu-access-type.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_intc.h /usr/src/debug/qemu/10.1.0/include/hw/arm/max78000_soc.h /usr/src/debug/qemu/10.1.0/include/qemu/bitmap.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.1.0/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_intc.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.1.0/include/qemu/qtree.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-control.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-accelerator.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-accelerator.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-job.h
  /usr/src/debug/qemu/10.1.0/trace/trace-chardev.h /usr/src/debug/qemu/10.1.0/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.1.0/trace/trace-chardev.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-job.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.1.0/include/hw/char/serial-isa.h /usr/src/debug/qemu/10.1.0/include/system/cpu-timers.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.1.0/include/exec/replay-core.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.1.0/
 qapi/qapi-commands-accelerator.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-accelerator.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.1.0/include/exec/tb-flush.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-arm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.1.0/include/hw/char/parallel.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-arm.h /usr/src/debug/qemu/10.1.0/target/arm/cpregs.h /usr/src/debug/qemu/10.1.0/trace/control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu-ops.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.1.0/include/qemu/atomic.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.1.0/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.1.0/q
 api/qapi-visit-transaction.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.1.0/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.1.0/include/hw/arm/omap.h /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.1.0/trace/trace-scsi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.1.0/trace/trace-scsi.h /usr/src/debug/qemu/10.1.0/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.1.0/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc.c /usr/src/debug/qemu/10.1.0/include/hw/misc
 /vmcoreinfo.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-container.h /usr/src/debug/qemu/10.1.0/include/qemu/help_option.h /usr/src/debug/qemu/10.1.0/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.1.0/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.1.0/include/system/kvm_int.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc.h /usr/src/debug/qemu/10.1.0/include/system/hw_accel.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_isa.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_net.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_isa.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net.h /usr/src/debug/qemu/10.1.0/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.1.0/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.1.0/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.1.0/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.1.0/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.1.0/inclu
 de/qemu/crc-ccitt.h /usr/src/debug/qemu/10.1.0/include/qemu/id.h /usr/src/debug/qemu/10.1.0/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.1.0/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.1.0/include/hw/i386/vmport.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.1.0/include/qemu/guest-random.h /usr/src/debug/qemu/10.1.0/include/qemu/config-file.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.1.0/target/arm/multiprocessing.h /usr/src/debug/qemu/10.1.0/include/qemu/drm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.1.0/target/arm/internals.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.1.0/include/qemu/buffer.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.1.0/include/qemu/range.h /usr/src/debug/qemu/10.1.0/include/qemu/thread.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-audi
 o.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.1.0/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ldst.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.1.0/include/qemu/int128.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine.h /u
 sr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/memfd.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_timer.h /usr/src/debug/qemu/10.1.0/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.1.0/include/system/seccomp.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_audio.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_block.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_input.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_audio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_block.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_input.c /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-re
 gion.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_timer.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/job.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.1.0/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-s390x.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-s390x.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.1.0/include/qemu/typedefs.h /usr/src/debug/qemu/10.1.0/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.1.0/include/hw/arm/boot.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2
 835_rng.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.1.0/include/system/balloon.h /usr/src/debug/qemu/10.1.0/include/system/kvm_xen.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/iommu.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.1.0/include/qemu/fifo32.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_adc.h /usr/src/debug/qemu/10.1.0/include/qemu/option.h /usr/src/debug/qemu/10.1.0/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_adc.c /usr/src/debug/qemu/10.1.0/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.1.0/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.1.0/include/qemu/pmem.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_arm_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_arm_trace_events.h /usr/src/debug/qemu/10.1.0/includ
 e/qemu/qdist.h /usr/src/debug/qemu/10.1.0/target/riscv/time_helper.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.1.0/include/system/memory_mapping.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.1.0/include/exec/breakpoint.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_dma.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.1.0/qapi/qapi
 -commands-tpm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.1.0/include/hw/char/pl011.h /usr/src/debug/qemu/10.1.0/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.1.0/include/system/address-spaces.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_dma.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.1.0/include/standard-headers/uefi/uefi.h /usr/src/debug/qemu/10.1.0/include/system/os-posix.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.1.0/include/accel/accel-ops.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.1.0/trace/trace-target_riscv.c /usr/src/debug/qemu/10.1.0/include/system/device_tree.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cryptod
 ev.c /usr/src/debug/qemu/10.1.0/trace/trace-target_riscv.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.1.0/target/riscv/pmu.h /usr/src/debug/qemu/10.1.0/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.1.0/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.1.0/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.1.0/include/qemu/coroutine_int.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.1.0/qapi
 /qapi-types-common.h /usr/src/debug/qemu/10.1.0/include/exec/ramlist.h /usr/src/debug/qemu/10.1.0/include/qapi/util.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.1.0/include/system/blockdev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-common.c /usr/src/debug/qemu/10.1.0/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.1.0/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ldst-common.h /usr/src/debug/qemu/10.1.0/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.1.0/include/system/dump.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_hace.h /usr/src/d
 ebug/qemu/10.1.0/trace/trace-qapi_commands_machine_s390x_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.1.0/include/qemu/futex.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.1.0/include/qemu/envlist.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_s390x_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-arm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_usb.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-arm.c /usr/src/debug/qemu/10.1.0/include/qemu/bcd.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_usb.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.1.0/include/system/arch_init.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32_r
 cc.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.1.0/include/qemu/datadir.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.1.0/trace/trace-nbd.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.1.0/include/qemu/throttle.h /usr/src/debug/qemu/10.1.0/trace/trace-nbd.c /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.1.0/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.1.0/trace/trace-linux_user.c /usr/src/debug/qemu/10.1.0/include/hw/i386/microvm.h /usr/src/debug/qemu/10.1.0/include/qemu/crc32c.h /usr/src/debug/qemu/10.1.0/trace/trace-linux_user.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.1.0/include/system/spdm-socket.h /usr/src/debug/qemu/10.1.0/include/qe
 mu/lockcnt.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.1.0/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.1.0/include/system/igvm-cfg.h /usr/src/debug/qemu/10.1.0/include/hw/i386/x86.h /usr/src/debug/qemu/10.1.0/trace/trace-target_ppc.c /usr/src/debug/qemu/10.1.0/hw/vfio-user/proxy.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.1.0/trace/trace-target_ppc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.
 1.0/include/qemu/host-utils.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.1.0/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.1.0/include/qemu/osdep.h /usr/src/debug/qemu/10.1.0/hw/vfio/vfio-display.h /usr/src/debug/qemu/10.1.0/qapi/qapi-introspect.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio_user.c /usr/src/debug/qemu/10.1.0/qapi/qapi-introspect.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio_user.h /usr/src/debug/qemu/10.1.0/include/exec/tswap.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-trace.h /usr/src/debug/qe
 mu/10.1.0/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_i386_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-root.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_i386_trace_events.h /usr/src/debug/qemu/10.1.0/include/exec/mmap-lock.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.1.0/include/hw/char/max78000_uart.h /usr/src/debug/qemu/10.1.0/trace/trace-root.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_accelerator_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.1.0/include/qemu/hw-version.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.1.
 0/trace/trace-qapi_commands_accelerator_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.1.0/include/qemu/bswap.h /usr/src/debug/qemu/10.1.0/include/system/accel-blocker.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ide.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.1.0/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_ide.c /usr/src/debug/qemu/10.1.0/target/arm/cpu-sysregs.h /usr/src/debug/qemu/10.1.0/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-tpm.h /usr/src/debug/qemu/10.1.0/include/qemu/timer.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-migration.h /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.1.0/include/qapi/compat-policy.h /usr/src/debug/qemu/10.1.0/include/system/runstat
 e-action.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.1.0/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.1.0/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.1.0/target/riscv/pmp.h /usr/src/debug/qemu/10.1.0/include/hw/i386/pc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/xiangshan_kmh.h /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.1.0/target/arm/cpu.h /usr/src/debug/qemu/10.1.0/target/sh4/cpu.h /usr/src/debug/qemu/10.1.0/trace/trace-qom.h /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.1.0/include/qemu/accel.h /usr/src/debug/qemu/10.1.0/include/qemu/dbus.h /usr/src/debug/qemu/10.1.0/include/qemu/host-pci-mmio.h /usr/src/debug/qemu/10.1.0/include/qemu/target-info.h /us
 r/src/debug/qemu/10.1.0/trace/trace-qom.c /usr/src/debug/qemu/10.1.0/include/system/dump-arch.h /usr/src/debug/qemu/10.1.0/include/qemu/lockable.h /usr/src/debug/qemu/10.1.0/include/qemu/main-loop.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.1.0/include/hw/i386/apic.h /usr/src/debug/qemu/10.1.0/include/hw/i386/tdvf.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.1.0/include/qemu/iov.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f100_soc.h /usr/src/debug/qe
 mu/10.1.0/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.1.0/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.1.0/hw/vfio-user/device.h /usr/src/debug/qemu/10.1.0/include/system/dirtylimit.h /usr/src/debug/qemu/10.1.0/trace/trace-authz.c /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.1.0/include/qapi/type-helpers.h /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands
 _qom_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.1.0/include/qemu/xxhash.h /usr/src/debug/qemu/10.1.0/include/qemu/selfmap.h /usr/src/debug/qemu/10.1.0/include/qemu/seqlock.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.1.0/include/exec/vaddr.h /usr/src/debug/qemu/10.1.0/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.1.0/include/hw/misc/unimp.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/boot.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/numa.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-accelerator.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_comma
 nds_job_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/ratelimit.h /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.1.0/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.1.0/include/system/rng.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.1.0/trace/trace-target_i386.c /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_lpc.h /usr/src/debug/
 qemu/10.1.0/nbd/nbd-internal.h /usr/src/debug/qemu/10.1.0/include/exec/tlb-common.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.1.0/include/qemu/notify.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.1.0/trace/trace-target_i386.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.1.0/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.1.0/include/system/xen.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-uefi.h /usr/
 src/debug/qemu/10.1.0/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.1.0/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-i386.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-i386.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/tb-cpu-state.h /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu
 /10.1.0/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.1.0/include/qapi/qmp-event.h /usr/src/debug/qemu/10.1.0/include/system/cpus.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.1.0/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.1.0/include/qemu/bitops.h /usr/src/debug/qemu/10.1.0/include/system/watchdog.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.1.0/trace/trace-monitor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-char.c /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.1.0/trace/trace-monitor.c /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.1.0/
 qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu_cfg_fields.h.inc /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.1.0/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.1.0/include/system/iommufd.h /usr/src/debug/qemu/10.1.0/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.1.0/include/hw/char/serial.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.1.0/hw/i386/acpi-build.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-authz.h /usr/
 src/debug/qemu/10.1.0/qapi/qapi-types-block.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.1.0/include/qemu/hbitmap.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-error.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.1.0/include/system/iothread.h /usr/src/debug/qemu/10.1.0/include/qemu/plugin.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.1.0/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.1.0/trace/trace-system.h /usr/src/debug/qemu/10.1.0/trace/control-internal.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.1.0/inc
 lude/qemu/mprotect.h /usr/src/debug/qemu/10.1.0/trace/trace-system.c /usr/src/debug/qemu/10.1.0/accel/dummy-cpus.h /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/fifo8.h /usr/src/debug/qemu/10.1.0/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.1.0/include/exec/gdbstub.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_trace_trace_events.h"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGSIZE changed from 33860011 to 32255141 (-5%)
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-staticdev: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGSIZE changed from 31678344 to 33668088 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-aarch64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGSIZE changed from 29180128 to 30750096 (+5%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-arm: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGSIZE changed from 26872104 to 28372856 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-i386: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGSIZE changed from 14803720 to 14339640 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-loongarch64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGSIZE changed from 13605800 to 13191992 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGSIZE changed from 13750632 to 13328632 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGSIZE changed from 15702472 to 15226936 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mips64el: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGSIZE changed from 13601704 to 13183800 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-mipsel: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGSIZE changed from 15808384 to 15307824 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGSIZE changed from 16962248 to 16416152 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-ppc64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGSIZE changed from 16030216 to 15602968 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv32: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGSIZE changed from 16097800 to 15674648 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-riscv64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGSIZE changed from 12132224 to 11736304 (-3%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-sh4: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGSIZE changed from 26918984 to 28494264 (+6%)
packages/x86-64-v3-poky-linux/qemu/qemu-system-x86-64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGSIZE changed from 5334176 to 5791056 (+9%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-aarch64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGSIZE changed from 3351680 to 3446352 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-arm: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGSIZE changed from 2716032 to 2748208 (+1%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-i386: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGSIZE changed from 2569576 to 2635448 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-loongarch64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGSIZE changed from 3149632 to 3211600 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGSIZE changed from 3182112 to 3248176 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGSIZE changed from 3173920 to 3235888 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGSIZE changed from 3137344 to 3203408 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGSIZE changed from 2988992 to 3050736 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGSIZE changed from 3063808 to 3125552 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGSIZE changed from 3055616 to 3117360 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-ppc64le: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGSIZE changed from 3461664 to 3531632 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv32: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGSIZE changed from 3535392 to 3601264 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-riscv64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGSIZE changed from 2004608 to 2062256 (+3%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-sh4: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGSIZE changed from 878792 to 825816 (-6%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-vmsr-helper: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGSIZE changed from 2700416 to 2732592 (+1%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-x86-64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
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

--===============2618060461140205839==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/petalogix-s3adsp1800.dtb /usr/share/qemu/bamboo.dtb /usr/share/qemu/canyonlands.dtb /usr/share/qemu/petalogix-ml605.dtb", added "/usr/share/qemu/dtb/petalogix-s3adsp1800.dtb /usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/dtb/petalogix-ml605.dtb /usr/share/qemu/ast27x0_bootrom.bin /usr/share/qemu/dtb/bamboo.dtb"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py /usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py", added "/usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt
 /DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /us
 r/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG"
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

--===============2618060461140205839==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-qemu-native-qemu-system-native-upgrade-10.0.2-1.patch"

RnJvbSA4ODM2YWFmNTMwNTc3YWQ5ODAwMWMxYWFmMTE5OTlmYmIxNmNmMTljIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IE1vbiwgMTUgU2VwIDIwMjUgMDY6NTE6MDIgKzAwMDAKU3ViamVjdDogW1BBVENIXSBx
ZW11LHFlbXUtbmF0aXZlLHFlbXUtc3lzdGVtLW5hdGl2ZTogdXBncmFkZSAxMC4wLjIgLT4KIDEw
LjEuMCwxMC4wLjIgLT4gMTAuMS4wLDEwLjAuMiAtPiAxMC4xLjAKCi0tLQogLi4ubmF0aXZlXzEw
LjAuMi5iYiA9PiBxZW11LW5hdGl2ZV8xMC4xLjAuYmJ9IHwgNDMgKysrKysrKysrKysrKysrKysr
KwogLi4uMTAuMC4yLmJiID0+IHFlbXUtc3lzdGVtLW5hdGl2ZV8xMC4xLjAuYmJ9IHwgNDMgKysr
KysrKysrKysrKysrKysrKwogbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS5pbmMgICAg
ICAgICAgIHwgIDcgKy0tCiAuLi5uLWVudmlyb25tZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEu
cGF0Y2ggfCAgNCArLQogLi4uLzAwMDItYXBpYy1maXh1cC1mYWxsdGhyb3VnaC10by1QSUMucGF0
Y2ggIHwgIDQgKy0KIC4uLm11LURvLW5vdC1pbmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRj
aCB8ICA2ICstLQogLi4uZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1tdXNsLnBhdGNo
IHwgIDYgKy0tCiAuLi4vcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2ggICAg
fCAgNiArLS0KIC4uLmQtdXNlLXJlbGF0aXZlLXBhdGgtdG8tcmVmZXItdG8tZmlsZS5wYXRjaCB8
ICAyICstCiAuLi5hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2ggfCAg
MiArLQogLi4uZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoIHwgIDYg
Ky0tCiAuLi5hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2ggfCAgNiAr
LS0KIC4uLm1vdmUtZGVwcmVjYXRlZC1nZXRfZXZlbnRfbG9vcC1jYWxscy5wYXRjaCB8ICA4ICsr
LS0KIC4uLi9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9ucC5wYXRjaCAgICAgICB8ICA2ICst
LQogLi4uL3FlbXUve3FlbXVfMTAuMC4yLmJiID0+IHFlbXVfMTAuMS4wLmJifSAgIHwgNDMgKysr
KysrKysrKysrKysrKysrKwogMTUgZmlsZXMgY2hhbmdlZCwgMTYxIGluc2VydGlvbnMoKyksIDMx
IGRlbGV0aW9ucygtKQogcmVuYW1lIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11LW5h
dGl2ZV8xMC4wLjIuYmIgPT4gcWVtdS1uYXRpdmVfMTAuMS4wLmJifSAoMTMlKQogcmVuYW1lIG1l
dGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3txZW11LXN5c3RlbS1uYXRpdmVfMTAuMC4yLmJiID0+
IHFlbXUtc3lzdGVtLW5hdGl2ZV8xMC4xLjAuYmJ9ICg0MiUpCiByZW5hbWUgbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUve3FlbXVfMTAuMC4yLmJiID0+IHFlbXVfMTAuMS4wLmJifSAoNDElKQoK
ZGlmZiAtLWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjAu
Mi5iYiBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtbmF0aXZlXzEwLjEuMC5iYgpz
aW1pbGFyaXR5IGluZGV4IDEzJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LW5hdGl2ZV8xMC4wLjIuYmIKcmVuYW1lIHRvIG1ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUtbmF0aXZlXzEwLjEuMC5iYgppbmRleCAyNmZhODRjMTgwLi4zMjRjZjlkNTFhIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LW5hdGl2ZV8xMC4wLjIu
YmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1uYXRpdmVfMTAuMS4wLmJi
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
ZGV2dG9vbHMvcWVtdS9xZW11LXN5c3RlbS1uYXRpdmVfMTAuMC4yLmJiIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0tbmF0aXZlXzEwLjEuMC5iYgpzaW1pbGFyaXR5IGlu
ZGV4IDQyJQpyZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LXN5c3Rl
bS1uYXRpdmVfMTAuMC4yLmJiCnJlbmFtZSB0byBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LXN5c3RlbS1uYXRpdmVfMTAuMS4wLmJiCmluZGV4IDIyNDYyZTI0OTkuLjUxMWMyM2MzYmEg
MTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUtc3lzdGVtLW5hdGl2
ZV8xMC4wLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS1zeXN0ZW0t
bmF0aXZlXzEwLjEuMC5iYgpAQCAtMSwzICsxLDQ2IEBACisjIEZJWE1FOiB0aGUgTElDX0ZJTEVT
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
bmMKaW5kZXggMmVlNzZlOWE3Yy4uYjhiZDY1YTdjNyAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
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
ICAgICAgICBmaWxlOi8vcG93ZXJwY19yb20uYmluIFwKQEAgLTM5LDcgKzQwLDcgQEAgU1JDX1VS
SSA9ICJodHRwczovL2Rvd25sb2FkLnFlbXUub3JnLyR7QlBOfS0ke1BWfS50YXIueHogXAogVVBT
VFJFQU1fQ0hFQ0tfVVJJID0gImh0dHBzOi8vd3d3LnFlbXUub3JnIgogVVBTVFJFQU1fQ0hFQ0tf
UkVHRVggPSAicWVtdS0oP1A8cHZlcj5cZCsoXC5cZCspKylcLnRhciIKIAotU1JDX1VSSVtzaGEy
NTZzdW1dID0gImVmNzg2ZjIzOThjYjUxODQ2MDBmNjlhZWY0ZDVkNjkxZWZkNDQ1NzZhM2NmZjQx
MjZkMzhkNGM2ZmVjODc3NTkiCitTUkNfVVJJW3NoYTI1NnN1bV0gPSAiZTA1MTczNDliNTBjYTcz
ZWJlYzJmYTg1YjA2MDUwZDVjNDYzY2E2NWM3Mzg4MzNiZDhmYzFmMTVmMTgwYmU1MSIKIAogQ1ZF
X1NUQVRVU1tDVkUtMjAwNy0wOTk4XSA9ICJub3QtYXBwbGljYWJsZS1jb25maWc6IFRoZSBWTkMg
c2VydmVyIGNhbiBleHBvc2UgaG9zdCBmaWxlcyB1ZGVyIHNvbWUgY2lyY3Vtc3RhbmNlcy4gV2Ug
ZG9uJ3QgZW5hYmxlIGl0IGJ5IGRlZmF1bHQuIgogCmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDEtcWVtdS1BZGQtYWRkaXRpb24tZW52aXJvbm1lbnQtc3Bh
Y2UtdG8tYm9vdC1sb2FkZXItcS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10by1ib290LWxvYWRl
ci1xLnBhdGNoCmluZGV4IGYyNzIwOGY0NWYuLmNjMmNkYjQ5NzMgMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9u
bWVudC1zcGFjZS10by1ib290LWxvYWRlci1xLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwMS1xZW11LUFkZC1hZGRpdGlvbi1lbnZpcm9ubWVudC1zcGFjZS10
by1ib290LWxvYWRlci1xLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSAyNzI3M2ZjYWM2ODU3
NzUwZjA3YTI2MzJiZGI2YjBlZDY2YWU5ODJhIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJv
bSAxMjdjNjJkNDg1Y2FkMWMwZjk3YzgzZDdiNzA5ZDk3NzE2MjI5MzFmIE1vbiBTZXAgMTcgMDA6
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
dGNoCmluZGV4IGFkNWM1YmEwM2UuLjEzYzA5ZTkxNmIgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVwLWZhbGx0aHJvdWdoLXRvLVBJQy5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDItYXBpYy1maXh1
cC1mYWxsdGhyb3VnaC10by1QSUMucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDE5Yjk1MDcz
ZTVkNDJkYzRhYTUzOTJkYTNkNDIyYWI2NjgwMDMxMDcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CitGcm9tIGUxYjVlOGEzNzBlZGY4NDJlNDVlMGQ0Nzg5ZWJlMjlhOWY3ODIxNmIgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCiBGcm9tOiBNYXJrIEFzc2Vsc3RpbmUgPG1hcmsuYXNzZWxzdGluZUB3
aW5kcml2ZXIuY29tPgogRGF0ZTogVHVlLCAyNiBGZWIgMjAxMyAxMTo0MzoyOCAtMDUwMAogU3Vi
amVjdDogW1BBVENIXSBhcGljOiBmaXh1cCBmYWxsdGhyb3VnaCB0byBQSUMKQEAgLTI5LDcgKzI5
LDcgQEAgU2lnbmVkLW9mZi1ieTogSGUgWmhlIDx6aGUuaGVAd2luZHJpdmVyLmNvbT4KICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L2h3L2ludGMvYXBpYy5jIGIvaHcvaW50Yy9hcGljLmMKLWluZGV4IGQxOGMxZGJmMi4uNDVkZGUx
ZmM1IDEwMDY0NAoraW5kZXggYmNiMTAzNTYwLi5hNmYxNjEwNjAgMTAwNjQ0CiAtLS0gYS9ody9p
bnRjL2FwaWMuYwogKysrIGIvaHcvaW50Yy9hcGljLmMKIEBAIC03NTgsNyArNzU4LDcgQEAgaW50
IGFwaWNfYWNjZXB0X3BpY19pbnRyKERldmljZVN0YXRlICpkZXYpCmRpZmYgLS1naXQgYS9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxl
LWlmLW5vdC1leGlzdHMucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gKaW5kZXggYzA0
ZTQyNjA4Zi4uZTg1MTI4Yjg0MiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWluY2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNo
CisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNC1xZW11LURvLW5vdC1p
bmNsdWRlLWZpbGUtaWYtbm90LWV4aXN0cy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOTEz
MDY0ZjlmZTcyNGZhMWI3MGI5YmY2ZGQzNDQ0YzdkZGRlYjkyOCBNb24gU2VwIDE3IDAwOjAwOjAw
IDIwMDEKK0Zyb20gZDA5ZWNhNDRhMzRiNWExMzU4NTdlN2ZmNzk0NDkyYjdmZGRjMjJjOCBNb24g
U2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IE9sZWtzaXkgT2JpdG90c2t5eSA8b29iaXRvdHNA
Y2lzY28uY29tPgogRGF0ZTogV2VkLCAyNSBNYXIgMjAyMCAyMToyMTozNSArMDIwMAogU3ViamVj
dDogW1BBVENIXSBxZW11OiBEbyBub3QgaW5jbHVkZSBmaWxlIGlmIG5vdCBleGlzdHMKQEAgLTE2
LDEwICsxNiwxMCBAQCBTaWduZWQtb2ZmLWJ5OiBTYWtpYiBTYWphbCA8c2FraWIuc2FqYWxAd2lu
ZHJpdmVyLmNvbT4KICAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspCiAKIGRpZmYgLS1n
aXQgYS9saW51eC11c2VyL3N5c2NhbGwuYyBiL2xpbnV4LXVzZXIvc3lzY2FsbC5jCi1pbmRleCA4
YmZlNDkxMmUuLmQwNDk4NGY2NiAxMDA2NDQKK2luZGV4IDkxMzYwYTA3Mi4uYWNmZGRjZjBhIDEw
MDY0NAogLS0tIGEvbGludXgtdXNlci9zeXNjYWxsLmMKICsrKyBiL2xpbnV4LXVzZXIvc3lzY2Fs
bC5jCi1AQCAtMTE4LDcgKzExOCw5IEBACitAQCAtMTE5LDcgKzExOSw5IEBACiAgI2luY2x1ZGUg
PGxpbnV4L2Jsa3BnLmg+CiAgI2luY2x1ZGUgPG5ldHBhY2tldC9wYWNrZXQuaD4KICAjaW5jbHVk
ZSA8bGludXgvbmV0bGluay5oPgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS8wMDA1LXFlbXUtQWRkLXNvbWUtdXNlci1zcGFjZS1tbWFwLXR3ZWFrcy10by1hZGRy
ZXNzLW11c2wucGF0Y2ggYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVt
dS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3MtbXVzbC5wYXRjaApp
bmRleCAzODhkMTFkMTBkLi42NGE2ODU0MGU2IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2
dG9vbHMvcWVtdS9xZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtz
LXRvLWFkZHJlc3MtbXVzbC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9x
ZW11LzAwMDUtcWVtdS1BZGQtc29tZS11c2VyLXNwYWNlLW1tYXAtdHdlYWtzLXRvLWFkZHJlc3Mt
bXVzbC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZjJhZGZjNzAzZTk0ODE5YjBkYWNhOThm
ZGUxZDBhMzAxNjhjMjkyZCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gZTNlZjAzNGEy
MDQ0OGUxYWY2Mjk5ZTU0MDkzZDMxNjM4OWY4NDcxZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
IEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3Jn
PgogRGF0ZTogRnJpLCA4IEphbiAyMDIxIDE3OjI3OjA2ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hd
IHFlbXU6IEFkZCBzb21lIHVzZXIgc3BhY2UgbW1hcCB0d2Vha3MgdG8gYWRkcmVzcyBtdXNsIDMy
IGJpdApAQCAtMjIsMTAgKzIyLDEwIEBAIFNpZ25lZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxy
aWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnCiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKIAogZGlmZiAtLWdpdCBhL2xpbnV4LXVzZXIvbW1h
cC5jIGIvbGludXgtdXNlci9tbWFwLmMKLWluZGV4IGQxZjM2ZTZmMS4uMjZjY2Y4ZjRkIDEwMDY0
NAoraW5kZXggMDAyZTFlNjY4Li45MTI4MzlkZWMgMTAwNjQ0CiAtLS0gYS9saW51eC11c2VyL21t
YXAuYwogKysrIGIvbGludXgtdXNlci9tbWFwLmMKLUBAIC0xMTA4LDEyICsxMTA4LDE2IEBAIGFi
aV9sb25nIHRhcmdldF9tcmVtYXAoYWJpX3Vsb25nIG9sZF9hZGRyLCBhYmlfdWxvbmcgb2xkX3Np
emUsCitAQCAtMTEwOSwxMiArMTEwOSwxNiBAQCBhYmlfbG9uZyB0YXJnZXRfbXJlbWFwKGFiaV91
bG9uZyBvbGRfYWRkciwgYWJpX3Vsb25nIG9sZF9zaXplLAogICAgICBpbnQgcHJvdDsKICAgICAg
dm9pZCAqaG9zdF9hZGRyOwogIApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS8wMDA2LXFlbXUtRGV0ZXJtaW5pc20tZml4ZXMucGF0Y2ggYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaAppbmRl
eCA0NjkwZDg2MzE1Li42OGY1YzFkMjIwIDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5wYXRjaAorKysgYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDYtcWVtdS1EZXRlcm1pbmlzbS1maXhlcy5w
YXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gZTAzMjcyNmU5ZGE4ZGUwMDg4ZDZjNzBjZmQ5MmUw
YTUyMTU1MzE1ZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gODliYWQ2ZWZhODY2NjVj
OTMxOTBlYmY2MGMyODA5MjA5ZThmNjJmMiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206
IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24ub3JnPgogRGF0
ZTogTW9uLCAxIE1hciAyMDIxIDEzOjAwOjQ3ICswMDAwCiBTdWJqZWN0OiBbUEFUQ0hdIHFlbXU6
IERldGVybWluaXNtIGZpeGVzCkBAIC0xNiwxMCArMTYsMTAgQEAgUlAgMjAyMS8zLzEKICAxIGZp
bGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRpb24oLSkKIAogZGlmZiAtLWdpdCBh
L3NjcmlwdHMvZGVjb2RldHJlZS5weSBiL3NjcmlwdHMvZGVjb2RldHJlZS5weQotaW5kZXggZThi
NzJkYTNhLi41Y2Q4NmIxNDIgMTAwNjQ0CitpbmRleCBmOTkyNDcyYjcuLjJlNDIxOGIxNCAxMDA2
NDQKIC0tLSBhL3NjcmlwdHMvZGVjb2RldHJlZS5weQogKysrIGIvc2NyaXB0cy9kZWNvZGV0cmVl
LnB5Ci1AQCAtMTU1OCw3ICsxNTU4LDcgQEAgZGVmIG1haW4oKToKK0BAIC0xNTU5LDcgKzE1NTks
NyBAQCBkZWYgbWFpbigpOgogICAgICB0b3BwYXQgPSBFeGNNdWx0aVBhdHRlcm4oMCkKICAKICAg
ICAgZm9yIGZpbGVuYW1lIGluIGFyZ3M6CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9v
bHMvcWVtdS9xZW11LzAwMDctdGVzdHMtbWVzb24uYnVpbGQtdXNlLXJlbGF0aXZlLXBhdGgtdG8t
cmVmZXItdG8tZmlsZS5wYXRjaCBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAw
Ny10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZlci10by1maWxlLnBh
dGNoCmluZGV4IDdjMjRmNDMyZjIuLmEzN2EzMGJjOWEgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBl
cy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUt
cGF0aC10by1yZWZlci10by1maWxlLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9x
ZW11L3FlbXUvMDAwNy10ZXN0cy1tZXNvbi5idWlsZC11c2UtcmVsYXRpdmUtcGF0aC10by1yZWZl
ci10by1maWxlLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlYmVhYjA2NzQ3MzA2ZWMxNjI5
OTIwN2JmNGJkNzQ4MWE0NzJiNGRlIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBjNjAw
M2RjNDU1MWM3OGU0MmJmNzlmOTI4N2FkMDM2MzljMWY0MjI4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQogRnJvbTogQ2hhbmdxaW5nIExpIDxjaGFuZ3FpbmcubGlAd2luZHJpdmVyLmNvbT4KIERh
dGU6IFRodSwgMTQgSmFuIDIwMjEgMDY6MzM6MDQgKzAwMDAKIFN1YmplY3Q6IFtQQVRDSF0gdGVz
dHMvbWVzb24uYnVpbGQ6IHVzZSByZWxhdGl2ZSBwYXRoIHRvIHJlZmVyIHRvIGZpbGVzCmRpZmYg
LS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMDgtRGVmaW5lLU1BUF9T
WU5DLWFuZC1NQVBfU0hBUkVEX1ZBTElEQVRFLW9uLW5lZWRlZC1saS5wYXRjaCBiL21ldGEvcmVj
aXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFS
RURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCmluZGV4IDU0NDIxNTQ0YmIuLjgzOWQ1NGQw
ODcgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZp
bmUtTUFQX1NZTkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCisr
KyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZTkMt
YW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoCkBAIC0xLDQgKzEsNCBA
QAotRnJvbSA5YzIyNTIzNGE3NTZmMjc0NWNmMDRjM2MzYWY2ZWY2YjZhY2Y0Mjc3IE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQorRnJvbSBhMDRkN2Y4YTM4ZDhmZTQ5MmNjYjk3NjkxMmI1MTRmM2Zk
MzQ2ODYyIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTogS2hlbSBSYWogPHJhai5raGVt
QGdtYWlsLmNvbT4KIERhdGU6IE1vbiwgMjEgTWFyIDIwMjIgMTA6MDk6MzggLTA3MDAKIFN1Ympl
Y3Q6IFtQQVRDSF0gRGVmaW5lIE1BUF9TWU5DIGFuZCBNQVBfU0hBUkVEX1ZBTElEQVRFIG9uIG5l
ZWRlZCBsaW51eApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8w
MDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoIGIvbWV0
YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1sb29rdXAtbWVzb24t
ZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCmluZGV4IDI4YTEwZDk4YmQuLmJiZWJlZGE2ZjggMTAw
NjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUt
bG9va3VwLW1lc29uLWV4dXRhYmxlLWZyb20tUEFUSC5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMt
ZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1m
cm9tLVBBVEgucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDlhZGYzZmMzZWEyY2JjY2I0MWQ0
OTY5NWE1M2M3NGZlZDY4NTBmYjAgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGQzNmJm
NDcxYjEzZjgzNzg4MDFiNzkwNTQzZDg1ZWFmNjAxMzRjMTMgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiA9P1VURi04P3E/TWFydGluPTIwSHVuZGViPUMzPUI4bGw/PSA8bWFydGluQGdl
YW5peC5jb20+CiBEYXRlOiBXZWQsIDIyIE1heSAyMDI0IDE0OjAyOjU1ICswMjAwCiBTdWJqZWN0
OiBbUEFUQ0hdIGNvbmZpZ3VyZTogbG9va3VwIG1lc29uIGV4dXRhYmxlIGZyb20gUEFUSApAQCAt
OSwxMCArOSwxMCBAQCBVcHN0cmVhbS1TdGF0dXM6IEluYXBwcm9wcmlhdGUgW3dvcmthcm91bmQs
IHdvdWxkIG5lZWQgYSByZWFsIGZpeCBmb3IgdXBzdHJlYW1dCiAgMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCA2IGRlbGV0aW9ucygtKQogCiBkaWZmIC0tZ2l0IGEvY29uZmlndXJlIGIv
Y29uZmlndXJlCi1pbmRleCAwMmYxZGQyMzEuLjJjNWVjZDM0NiAxMDA3NTUKK2luZGV4IDI3NGE3
Nzg3Ni4uODRlNDI5NDA5IDEwMDc1NQogLS0tIGEvY29uZmlndXJlCiArKysgYi9jb25maWd1cmUK
LUBAIC05ODMsMTIgKzk4Myw3IEBAIG1rdmVudj0iJHB5dGhvbiAke3NvdXJjZV9wYXRofS9weXRo
b24vc2NyaXB0cy9ta3ZlbnYucHkiCitAQCAtOTk1LDEyICs5OTUsNyBAQCBta3ZlbnY9IiRweXRo
b24gJHtzb3VyY2VfcGF0aH0vcHl0aG9uL3NjcmlwdHMvbWt2ZW52LnB5IgogICRta3ZlbnYgZW5z
dXJlZ3JvdXAgLS1kaXIgIiR7c291cmNlX3BhdGh9L3B5dGhvbi93aGVlbHMiIFwKICAgICAgICR7
c291cmNlX3BhdGh9L3B5dGhvbmRlcHMudG9tbCBtZXNvbiB8fCBleGl0IDEKICAKZGlmZiAtLWdp
dCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMS1xZW11LUVuc3VyZS1waXAt
YW5kLXRoZS1weXRob24tdmVudi1hcmVuLXQtdXNlZC1mb3ItLnBhdGNoIGIvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12
ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKaW5kZXggYjA2MDIwZDEwNi4uMDlmOWFjNTcxOSAx
MDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5z
dXJlLXBpcC1hbmQtdGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKKysrIGIv
bWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDExLXFlbXUtRW5zdXJlLXBpcC1hbmQt
dGhlLXB5dGhvbi12ZW52LWFyZW4tdC11c2VkLWZvci0ucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1G
cm9tIDBkODU5ODg0NTdhNDc1YzI1Yjg0MDg1Y2YwOTAwNDAxNTBhOWMxNmQgTW9uIFNlcCAxNyAw
MDowMDowMCAyMDAxCitGcm9tIGNlODgxY2QxM2VhODU1ZmQ4NThlMTViMTY1ZGU3YWNkMDU2ZWZh
ZGYgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBSaWNoYXJkIFB1cmRpZSA8cmljaGFy
ZC5wdXJkaWVAbGludXhmb3VuZGF0aW9uLm9yZz4KIERhdGU6IFdlZCwgMjIgTWF5IDIwMjQgMTM6
NTg6MjMgKzAyMDAKIFN1YmplY3Q6IFtQQVRDSF0gcWVtdTogRW5zdXJlIHBpcCBhbmQgdGhlIHB5
dGhvbiB2ZW52IGFyZW4ndCB1c2VkIGZvciBtZXNvbgpAQCAtMjksMTAgKzI5LDEwIEBAIFNpZ25l
ZC1vZmYtYnk6IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJkLnB1cmRpZUBsaW51eGZvdW5kYXRpb24u
b3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pCiAK
IGRpZmYgLS1naXQgYS9jb25maWd1cmUgYi9jb25maWd1cmUKLWluZGV4IDJjNWVjZDM0Ni4uNTMx
NWVkZTM1IDEwMDc1NQoraW5kZXggODRlNDI5NDA5Li4xYTk1ODVlOGUgMTAwNzU1CiAtLS0gYS9j
b25maWd1cmUKICsrKyBiL2NvbmZpZ3VyZQotQEAgLTk2OSwxNCArOTY5LDE0IEBAIHB5dGhvbj0i
JChjb21tYW5kIC12ICIkcHl0aG9uIikiCitAQCAtOTgxLDE0ICs5ODEsMTQgQEAgcHl0aG9uPSIk
KGNvbW1hbmQgLXYgIiRweXRob24iKSIKICBlY2hvICJweXRob24gZGV0ZXJtaW5lZCB0byBiZSAn
JHB5dGhvbiciCiAgZWNobyAicHl0aG9uIHZlcnNpb246ICQoJHB5dGhvbiAtLXZlcnNpb24pIgog
IApkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEyLVJlbW92
ZS1kZXByZWNhdGVkLWdldF9ldmVudF9sb29wLWNhbGxzLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRl
dnRvb2xzL3FlbXUvcWVtdS8wMDEyLVJlbW92ZS1kZXByZWNhdGVkLWdldF9ldmVudF9sb29wLWNh
bGxzLnBhdGNoCmluZGV4IDY0ODE2ZmU3ZDkuLjY1YmE4MjgyYTggMTAwNjQ0Ci0tLSBhL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAxMi1SZW1vdmUtZGVwcmVjYXRlZC1nZXRfZXZl
bnRfbG9vcC1jYWxscy5wYXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11
LzAwMTItUmVtb3ZlLWRlcHJlY2F0ZWQtZ2V0X2V2ZW50X2xvb3AtY2FsbHMucGF0Y2gKQEAgLTEs
NCArMSw0IEBACi1Gcm9tIDUyNDA0MDY3NDdmZDQzODg2NjE4YWU4MTk0MTUzZTZmYzk1N2E4MmEg
TW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGY1ZDc3MDdlYTdiOTE4MjBlMGE5MzA2ODcz
NjRjYTAwMTI2ZWFkMzggTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBKb2huIFNub3cg
PGpzbm93QHJlZGhhdC5jb20+CiBEYXRlOiBUdWUsIDEzIEF1ZyAyMDI0IDA5OjM1OjMwIC0wNDAw
CiBTdWJqZWN0OiBbUEFUQ0hdIFJlbW92ZSBkZXByZWNhdGVkIGdldF9ldmVudF9sb29wIGNhbGxz
CkBAIC0zMyw3ICszMyw3IEBAIFNpZ25lZC1vZmYtYnk6IEpvaG4gU25vdyA8anNub3dAcmVkaGF0
LmNvbT4KICAzIGZpbGVzIGNoYW5nZWQsIDE1IGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25zKC0p
CiAKIGRpZmYgLS1naXQgYS9weXRob24vcWVtdS9xbXAvbGVnYWN5LnB5IGIvcHl0aG9uL3FlbXUv
cW1wL2xlZ2FjeS5weQotaW5kZXggMjJhMmI1Ni4uZWE5YjgwMyAxMDA2NDQKK2luZGV4IDIyYTJi
NTYxNi4uZWE5YjgwMzJjIDEwMDY0NAogLS0tIGEvcHl0aG9uL3FlbXUvcW1wL2xlZ2FjeS5weQog
KysrIGIvcHl0aG9uL3FlbXUvcW1wL2xlZ2FjeS5weQogQEAgLTg2LDcgKzg2LDE0IEBAIGRlZiBf
X2luaXRfXyhzZWxmLApAQCAtNTMsNyArNTMsNyBAQCBpbmRleCAyMmEyYjU2Li5lYTliODAzIDEw
MDY0NAogICAgICAgICAgc2VsZi5fdGltZW91dDogT3B0aW9uYWxbZmxvYXRdID0gTm9uZQogIAog
ZGlmZiAtLWdpdCBhL3B5dGhvbi9xZW11L3FtcC9xbXBfdHVpLnB5IGIvcHl0aG9uL3FlbXUvcW1w
L3FtcF90dWkucHkKLWluZGV4IDJkOWViYmQuLmQxMWI5ZmMgMTAwNjQ0CitpbmRleCAyZDllYmJk
MjAuLmQxMWI5ZmM1NCAxMDA2NDQKIC0tLSBhL3B5dGhvbi9xZW11L3FtcC9xbXBfdHVpLnB5CiAr
KysgYi9weXRob24vcWVtdS9xbXAvcW1wX3R1aS5weQogQEAgLTM3Nyw3ICszNzcsMTIgQEAgZGVm
IHJ1bihzZWxmLCBkZWJ1ZzogYm9vbCA9IEZhbHNlKSAtPiBOb25lOgpAQCAtNzEsNyArNzEsNyBA
QCBpbmRleCAyZDllYmJkLi5kMTFiOWZjIDEwMDY0NAogIAogICAgICAgICAgIyBHcmFjZWZ1bGx5
IGhhbmRsZSBTSUdURVJNIGFuZCBTSUdJTlQgc2lnbmFscwogZGlmZiAtLWdpdCBhL3B5dGhvbi90
ZXN0cy9wcm90b2NvbC5weSBiL3B5dGhvbi90ZXN0cy9wcm90b2NvbC5weQotaW5kZXggNTZjNGQ0
NC4uOGRjZWY1NyAxMDA2NDQKK2luZGV4IDU2YzRkNDQxZi4uOGRjZWY1NzNiIDEwMDY0NAogLS0t
IGEvcHl0aG9uL3Rlc3RzL3Byb3RvY29sLnB5CiArKysgYi9weXRob24vdGVzdHMvcHJvdG9jb2wu
cHkKIEBAIC0yMjgsNyArMjI4LDcgQEAgZGVmIGFzeW5jX3Rlc3QoYXN5bmNfdGVzdF9tZXRob2Qp
OgpkaWZmIC0tZ2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXgtc3RyZXJy
b3JuYW1lX25wLnBhdGNoIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXgtc3Ry
ZXJyb3JuYW1lX25wLnBhdGNoCmluZGV4IDFjYzk3MzQ0M2UuLmM3ZmUzMDRjZTIgMTAwNjQ0Ci0t
LSBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFtZV9ucC5w
YXRjaAorKysgYi9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11L2ZpeC1zdHJlcnJvcm5h
bWVfbnAucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDdlMDk2NTRmYTE3OWFkNWZhYjFkYzBh
NDc4ODZjNmExYTJhY2MwOTcgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIDYxZjBiNTRh
ZTEzOGQzZDk1OWM5NWVhNmNmNTJlMTNiMzU2NDZmN2MgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAx
CiBGcm9tOiBOYXRhbmFlbCBDb3BhIDxuY29wYUBhbHBpbmVsaW51eC5vcmc+CiBEYXRlOiBXZWQs
IDE4IFNlcCAyMDI0IDE2OjE5OjM3IC0wNzAwCiBTdWJqZWN0OiBbUEFUQ0hdIHRhcmdldC9yaXNj
di9rdm06IGRvIG5vdCB1c2Ugbm9uLXBvcnRhYmxlIHN0cmVycm9ybmFtZV9ucCgpCkBAIC0yMCwx
MCArMjAsMTAgQEAgU2lnbmVkLW9mZi1ieTogTmF0YW5hZWwgQ29wYSA8bmNvcGFAYWxwaW5lbGlu
dXgub3JnPgogIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMiBkZWxldGlvbnMoLSkK
IAogZGlmZiAtLWdpdCBhL3RhcmdldC9yaXNjdi9rdm0va3ZtLWNwdS5jIGIvdGFyZ2V0L3Jpc2N2
L2t2bS9rdm0tY3B1LmMKLWluZGV4IDgwMDFjYTE1My4uNzlmYjQzZjkyIDEwMDY0NAoraW5kZXgg
NWMxOTA2MmMxLi41OWI0YmYxNmEgMTAwNjQ0CiAtLS0gYS90YXJnZXQvcmlzY3Yva3ZtL2t2bS1j
cHUuYwogKysrIGIvdGFyZ2V0L3Jpc2N2L2t2bS9rdm0tY3B1LmMKLUBAIC0xOTY4LDggKzE5Njgs
NyBAQCBzdGF0aWMgYm9vbCBrdm1fY3B1X3JlYWxpemUoQ1BVU3RhdGUgKmNzLCBFcnJvciAqKmVy
cnApCitAQCAtMTk5Myw4ICsxOTkzLDcgQEAgc3RhdGljIGJvb2wga3ZtX2NwdV9yZWFsaXplKENQ
VVN0YXRlICpjcywgRXJyb3IgKiplcnJwKQogICAgICBpZiAocmlzY3ZfaGFzX2V4dCgmY3B1LT5l
bnYsIFJWVikpIHsKICAgICAgICAgIHJldCA9IHByY3RsKFBSX1JJU0NWX1ZfU0VUX0NPTlRST0ws
IFBSX1JJU0NWX1ZfVlNUQVRFX0NUUkxfT04pOwogICAgICAgICAgaWYgKHJldCkgewpkaWZmIC0t
Z2l0IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4wLjIuYmIgYi9tZXRhL3Jl
Y2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjEuMC5iYgpzaW1pbGFyaXR5IGluZGV4IDQxJQpy
ZW5hbWUgZnJvbSBtZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11XzEwLjAuMi5iYgpyZW5h
bWUgdG8gbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8xMC4xLjAuYmIKaW5kZXggNWQ1
NDRkOGQxMy4uNzJlMDYxMjZiYiAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdV8xMC4wLjIuYmIKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdV8x
MC4xLjAuYmIKQEAgLTEsMyArMSw0NiBAQAorIyBGSVhNRTogdGhlIExJQ19GSUxFU19DSEtTVU0g
dmFsdWVzIGhhdmUgYmVlbiB1cGRhdGVkIGJ5ICdkZXZ0b29sIHVwZ3JhZGUnLgorIyBUaGUgZm9s
bG93aW5nIGlzIHRoZSBkaWZmZXJlbmNlIGJldHdlZW4gdGhlIG9sZCBhbmQgdGhlIG5ldyBsaWNl
bnNlIHRleHQuCisjIFBsZWFzZSB1cGRhdGUgdGhlIExJQ0VOU0UgdmFsdWUgaWYgbmVlZGVkLCBh
bmQgc3VtbWFyaXplIHRoZSBjaGFuZ2VzIGluCisjIHRoZSBjb21taXQgbWVzc2FnZSB2aWEgJ0xp
Y2Vuc2UtVXBkYXRlOicgdGFnLgorIyAoZXhhbXBsZTogJ0xpY2Vuc2UtVXBkYXRlOiBjb3B5cmln
aHQgeWVhcnMgdXBkYXRlZC4nKQorIworIyBUaGUgY2hhbmdlczoKKyMKKyMgLS0tIENPUFlJTkcK
KyMgKysrIENPUFlJTkcKKyMgQEAgLTIsNyArMiw3IEBACisjICAJCSAgICAgICBWZXJzaW9uIDIs
IEp1bmUgMTk5MQorIyAgCisjICAgQ29weXJpZ2h0IChDKSAxOTg5LCAxOTkxIEZyZWUgU29mdHdh
cmUgRm91bmRhdGlvbiwgSW5jLiwKKyMgLSA1MSBGcmFua2xpbiBTdHJlZXQsIEZpZnRoIEZsb29y
LCBCb3N0b24sIE1BIDAyMTEwLTEzMDEgVVNBCisjICsgPGh0dHBzOi8vZnNmLm9yZy8+CisjICAg
RXZlcnlvbmUgaXMgcGVybWl0dGVkIHRvIGNvcHkgYW5kIGRpc3RyaWJ1dGUgdmVyYmF0aW0gY29w
aWVzCisjICAgb2YgdGhpcyBsaWNlbnNlIGRvY3VtZW50LCBidXQgY2hhbmdpbmcgaXQgaXMgbm90
IGFsbG93ZWQuCisjICAKKyMgQEAgLTMwNCw4ICszMDQsNyBAQAorIyAgICAgIEdOVSBHZW5lcmFs
IFB1YmxpYyBMaWNlbnNlIGZvciBtb3JlIGRldGFpbHMuCisjICAKKyMgICAgICBZb3Ugc2hvdWxk
IGhhdmUgcmVjZWl2ZWQgYSBjb3B5IG9mIHRoZSBHTlUgR2VuZXJhbCBQdWJsaWMgTGljZW5zZSBh
bG9uZworIyAtICAgIHdpdGggdGhpcyBwcm9ncmFtOyBpZiBub3QsIHdyaXRlIHRvIHRoZSBGcmVl
IFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4sCisjIC0gICAgNTEgRnJhbmtsaW4gU3RyZWV0LCBG
aWZ0aCBGbG9vciwgQm9zdG9uLCBNQSAwMjExMC0xMzAxIFVTQS4KKyMgKyAgICB3aXRoIHRoaXMg
cHJvZ3JhbTsgaWYgbm90LCBzZWUgPGh0dHBzOi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KKyMg
IAorIyAgQWxzbyBhZGQgaW5mb3JtYXRpb24gb24gaG93IHRvIGNvbnRhY3QgeW91IGJ5IGVsZWN0
cm9uaWMgYW5kIHBhcGVyIG1haWwuCisjICAKKyMgLS0tIENPUFlJTkcuTElCCisjICsrKyBDT1BZ
SU5HLkxJQgorIyBAQCAtMiw3ICsyLDcgQEAKKyMgICAgICAgICAgICAgICAgICAgICAgICAgVmVy
c2lvbiAyLjEsIEZlYnJ1YXJ5IDE5OTkKKyMgIAorIyAgIENvcHlyaWdodCAoQykgMTk5MSwgMTk5
OSBGcmVlIFNvZnR3YXJlIEZvdW5kYXRpb24sIEluYy4KKyMgLSA1MSBGcmFua2xpbiBTdHJlZXQs
IEZpZnRoIEZsb29yLCBCb3N0b24sIE1BICAwMjExMC0xMzAxICBVU0EKKyMgKyA8aHR0cHM6Ly9m
c2Yub3JnLz4KKyMgICBFdmVyeW9uZSBpcyBwZXJtaXR0ZWQgdG8gY29weSBhbmQgZGlzdHJpYnV0
ZSB2ZXJiYXRpbSBjb3BpZXMKKyMgICBvZiB0aGlzIGxpY2Vuc2UgZG9jdW1lbnQsIGJ1dCBjaGFu
Z2luZyBpdCBpcyBub3QgYWxsb3dlZC4KKyMgIAorIyAKKyMKKwogQkJDTEFTU0VYVEVORCA9ICJu
YXRpdmVzZGsiCiAKIHJlcXVpcmUgcWVtdS5pbmMKLS0gCjIuNDcuMQoK

--===============2618060461140205839==--

