Return-Path: <auh@yoctoproject.org>
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B94ACCD196
	for <webhook@archiver.kernel.org>; Wed,  1 Oct 2025 13:32:23 +0000 (UTC)
Received: from a27-45.smtp-out.us-west-2.amazonses.com (a27-45.smtp-out.us-west-2.amazonses.com [54.240.27.45])
 by mx.groups.io with SMTP id smtpd.web10.17930.1759325533110206195
 for <openembedded-core@lists.openembedded.org>;
 Wed, 01 Oct 2025 06:32:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@yoctoproject.org header.s=j46ser6a2yusdzubpv7m7ewqgesde2ie header.b=sCoQNOKn;
 dkim=pass header.i=@amazonses.com header.s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx header.b=nJF96iyv;
 spf=pass (domain: us-west-2.amazonses.com, ip: 54.240.27.45, mailfrom: 010101999ff9305d-891bb41d-a507-4c1c-bf1a-4b3bb01ad585-000000@us-west-2.amazonses.com)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=j46ser6a2yusdzubpv7m7ewqgesde2ie; d=yoctoproject.org;
	t=1759325532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date;
	bh=Jh8WknOZj3wqLEp9LIKMp/otG6TUSNu4jt5Jh4FWzMQ=;
	b=sCoQNOKn/WmxF2O3d2+WUdVIMO5yfCnfC8fo4VyqAlQCeX4oDivNUI1PeGviwJ+W
	GVtWNt1FguqaRkmNMX8QMPsq/QZfhJreA2JmQoBGT570J9uX4PBE4zRyjMuYTQpMLb/
	LaJ9Di6iuJfE7ScqsylMeDdcZ4Tlkb/ZkvpiXIjc=
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/simple;
	s=gdwg2y3kokkkj5a55z2ilkup5wp5hhxx; d=amazonses.com; t=1759325532;
	h=Content-Type:MIME-Version:From:To:Cc:Subject:Message-Id:Date:Feedback-ID;
	bh=Jh8WknOZj3wqLEp9LIKMp/otG6TUSNu4jt5Jh4FWzMQ=;
	b=nJF96iyvhN0DoXKld34b6yVUcVdAGkJE8eSdG78QPzrLWmnTm3mcX+7ppOLvVFms
	fK9+rrskzw7UMom/Xa0JxSMwZzenLxwW3D3Ns/YGJvvevb9aLQ2ZYYL3j8o+Qzq63Rc
	0/Bg1Zy0/yD4mBs2ijPmrF0i8OAu2RRLW5lVHuuU=
Content-Type: multipart/mixed; boundary="===============2600330818256897111=="
MIME-Version: 1.0
From: auh@yoctoproject.org
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: [AUH] qemu-native,qemu-system-native,qemu: upgrading to
 10.1.0,10.1.0,10.1.0 SUCCEEDED
Message-ID: <010101999ff9305d-891bb41d-a507-4c1c-bf1a-4b3bb01ad585-000000@us-west-2.amazonses.com>
Date: Wed, 1 Oct 2025 13:32:12 +0000
Feedback-ID: ::1.us-west-2.9np3MYPs3fEaOBysGKSlUD4KtcmPijcmS9Az2Hwf7iQ=:AmazonSES
X-SES-Outgoing: 2025.10.01-54.240.27.45
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 01 Oct 2025 13:32:23 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/224218

--===============2600330818256897111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

Hello,

this email is a notification from the Auto Upgrade Helper
that the automatic attempt to upgrade the recipe(s) *qemu-native,qemu-system-native,qemu* to *10.1.0,10.1.0,10.1.0* has Succeeded.

Next steps:
    - apply the patch: git am 0001-qemu-native-qemu-system-native-qemu-upgrade-10.0.2-1.patch
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
From 8a00abac2a5a62e4ba5bbdaf28e4de8df466f376 Mon Sep 17 00:00:00 2001
From: Upgrade Helper <auh@yoctoproject.org>
Date: Wed, 1 Oct 2025 06:51:06 +0000
Subject: [PATCH] qemu-native,qemu-system-native,qemu: upgrade 10.0.2 ->
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
index f27208f45f..9a35e431b3 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch
@@ -1,4 +1,4 @@
-From 27273fcac6857750f07a2632bdb6b0ed66ae982a Mon Sep 17 00:00:00 2001
+From 9fc387eab91d29f85d3bec66c0475267bf222dc4 Mon Sep 17 00:00:00 2001
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
index ad5c5ba03e..e64c985071 100644
--- a/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
+++ b/meta/recipes-devtools/qemu/qemu/0002-apic-fixup-fallthrough-to-PIC.patch
@@ -1,4 +1,4 @@
-From 19b95073e5d42dc4aa5392da3d422ab668003107 Mon Sep 17 00:00:00 2001
+From 85901fb48b467742f4c313b3b55de980de0d6c57 Mon Sep 17 00:00:00 2001
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
index c04e42608f..b342f7b867 100644
--- a/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0004-qemu-Do-not-include-file-if-not-exists.patch
@@ -1,4 +1,4 @@
-From 913064f9fe724fa1b70b9bf6dd3444c7dddeb928 Mon Sep 17 00:00:00 2001
+From 6749a3bcea17c7b8f9a40d9c699744fcd8865e36 Mon Sep 17 00:00:00 2001
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
index 388d11d10d..1ce7948b3f 100644
--- a/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
+++ b/meta/recipes-devtools/qemu/qemu/0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch
@@ -1,4 +1,4 @@
-From f2adfc703e94819b0daca98fde1d0a30168c292d Mon Sep 17 00:00:00 2001
+From e4dec8a12d8f83d006d8d4ca7b108da913ba2c17 Mon Sep 17 00:00:00 2001
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
index 4690d86315..86261df889 100644
--- a/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
+++ b/meta/recipes-devtools/qemu/qemu/0006-qemu-Determinism-fixes.patch
@@ -1,4 +1,4 @@
-From e032726e9da8de0088d6c70cfd92e0a52155315f Mon Sep 17 00:00:00 2001
+From 03b231f155c862e31f0e65cdab75fbfad2debaf7 Mon Sep 17 00:00:00 2001
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
index 7c24f432f2..1da859dc0a 100644
--- a/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
+++ b/meta/recipes-devtools/qemu/qemu/0007-tests-meson.build-use-relative-path-to-refer-to-file.patch
@@ -1,4 +1,4 @@
-From ebeab06747306ec16299207bf4bd7481a472b4de Mon Sep 17 00:00:00 2001
+From f0d05ff226d2cb7bee059cc3bc4cb19306843efd Mon Sep 17 00:00:00 2001
 From: Changqing Li <changqing.li@windriver.com>
 Date: Thu, 14 Jan 2021 06:33:04 +0000
 Subject: [PATCH] tests/meson.build: use relative path to refer to files
diff --git a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
index 54421544bb..73edeae34e 100644
--- a/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
+++ b/meta/recipes-devtools/qemu/qemu/0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch
@@ -1,4 +1,4 @@
-From 9c225234a756f2745cf04c3c3af6ef6b6acf4277 Mon Sep 17 00:00:00 2001
+From 59dcef22a5091bafec29313648af3717fbb391fd Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Mon, 21 Mar 2022 10:09:38 -0700
 Subject: [PATCH] Define MAP_SYNC and MAP_SHARED_VALIDATE on needed linux
diff --git a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
index 28a10d98bd..57f429daa4 100644
--- a/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
+++ b/meta/recipes-devtools/qemu/qemu/0010-configure-lookup-meson-exutable-from-PATH.patch
@@ -1,4 +1,4 @@
-From 9adf3fc3ea2cbccb41d49695a53c74fed6850fb0 Mon Sep 17 00:00:00 2001
+From caafb76a35824443d8ceb6275b4a9f9ae05ca3df Mon Sep 17 00:00:00 2001
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
index b06020d106..65fbd58e0b 100644
--- a/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
+++ b/meta/recipes-devtools/qemu/qemu/0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch
@@ -1,4 +1,4 @@
-From 0d85988457a475c25b84085cf090040150a9c16d Mon Sep 17 00:00:00 2001
+From 323a2e2782354f04f420cb64d9212e78def9627a Mon Sep 17 00:00:00 2001
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
index 64816fe7d9..e843427b0c 100644
--- a/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
+++ b/meta/recipes-devtools/qemu/qemu/0012-Remove-deprecated-get_event_loop-calls.patch
@@ -1,4 +1,4 @@
-From 5240406747fd43886618ae8194153e6fc957a82a Mon Sep 17 00:00:00 2001
+From 94ec5de0f1d891b94fdd8b9aae3e2b89e1154283 Mon Sep 17 00:00:00 2001
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
index 1cc973443e..63aef3eb7f 100644
--- a/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
+++ b/meta/recipes-devtools/qemu/qemu/fix-strerrorname_np.patch
@@ -1,4 +1,4 @@
-From 7e09654fa179ad5fab1dc0a47886c6a1a2acc097 Mon Sep 17 00:00:00 2001
+From 55b5f3259b7507a0250a02a4cf6580592f5888ab Mon Sep 17 00:00:00 2001
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


--===============2600330818256897111==
Content-Type: application/octet-stream
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment;
 filename="0001-qemu-native-qemu-system-native-qemu-upgrade-10.0.2-1.patch"

RnJvbSA4YTAwYWJhYzJhNWE2MmU0YmE1YmJkYWYyOGU0ZGU4ZGY0NjZmMzc2IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBVcGdyYWRlIEhlbHBlciA8YXVoQHlvY3RvcHJvamVjdC5vcmc+
CkRhdGU6IFdlZCwgMSBPY3QgMjAyNSAwNjo1MTowNiArMDAwMApTdWJqZWN0OiBbUEFUQ0hdIHFl
bXUtbmF0aXZlLHFlbXUtc3lzdGVtLW5hdGl2ZSxxZW11OiB1cGdyYWRlIDEwLjAuMiAtPgogMTAu
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
LXEucGF0Y2gKaW5kZXggZjI3MjA4ZjQ1Zi4uOWEzNWU0MzFiMyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25t
ZW50LXNwYWNlLXRvLWJvb3QtbG9hZGVyLXEucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRv
b2xzL3FlbXUvcWVtdS8wMDAxLXFlbXUtQWRkLWFkZGl0aW9uLWVudmlyb25tZW50LXNwYWNlLXRv
LWJvb3QtbG9hZGVyLXEucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIDI3MjczZmNhYzY4NTc3
NTBmMDdhMjYzMmJkYjZiMGVkNjZhZTk4MmEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9t
IDlmYzM4N2VhYjkxZDI5Zjg1ZDNiZWM2NmMwNDc1MjY3YmYyMjJkYzQgTW9uIFNlcCAxNyAwMDow
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
Y2gKaW5kZXggYWQ1YzViYTAzZS4uZTY0Yzk4NTA3MSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDAyLWFwaWMtZml4dXAtZmFsbHRocm91Z2gtdG8tUElDLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwMi1hcGljLWZpeHVw
LWZhbGx0aHJvdWdoLXRvLVBJQy5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gMTliOTUwNzNl
NWQ0MmRjNGFhNTM5MmRhM2Q0MjJhYjY2ODAwMzEwNyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
K0Zyb20gODU5MDFmYjQ4YjQ2Nzc0MmY0YzMxM2IzYjU1ZGU5ODBkZTBkNmM1NyBNb24gU2VwIDE3
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
NDI2MDhmLi5iMzQyZjdiODY3IDEwMDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVt
dS9xZW11LzAwMDQtcWVtdS1Eby1ub3QtaW5jbHVkZS1maWxlLWlmLW5vdC1leGlzdHMucGF0Y2gK
KysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA0LXFlbXUtRG8tbm90LWlu
Y2x1ZGUtZmlsZS1pZi1ub3QtZXhpc3RzLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSA5MTMw
NjRmOWZlNzI0ZmExYjcwYjliZjZkZDM0NDRjN2RkZGViOTI4IE1vbiBTZXAgMTcgMDA6MDA6MDAg
MjAwMQorRnJvbSA2NzQ5YTNiY2VhMTdjN2I4ZjlhNDBkOWM2OTk3NDRmY2Q4ODY1ZTM2IE1vbiBT
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
ZGV4IDM4OGQxMWQxMGQuLjFjZTc5NDhiM2YgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0
b29scy9xZW11L3FlbXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3Mt
dG8tYWRkcmVzcy1tdXNsLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3Fl
bXUvMDAwNS1xZW11LUFkZC1zb21lLXVzZXItc3BhY2UtbW1hcC10d2Vha3MtdG8tYWRkcmVzcy1t
dXNsLnBhdGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBmMmFkZmM3MDNlOTQ4MTliMGRhY2E5OGZk
ZTFkMGEzMDE2OGMyOTJkIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSBlNGRlYzhhMTJk
OGY4M2QwMDZkOGQ0Y2E3YjEwOGRhOTEzYmEyYzE3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQog
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
IDQ2OTBkODYzMTUuLjg2MjYxZGY4ODkgMTAwNjQ0Ci0tLSBhL21ldGEvcmVjaXBlcy1kZXZ0b29s
cy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBhdGNoCisrKyBiL21ldGEv
cmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwNi1xZW11LURldGVybWluaXNtLWZpeGVzLnBh
dGNoCkBAIC0xLDQgKzEsNCBAQAotRnJvbSBlMDMyNzI2ZTlkYThkZTAwODhkNmM3MGNmZDkyZTBh
NTIxNTUzMTVmIE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQorRnJvbSAwM2IyMzFmMTU1Yzg2MmUz
MWYwZTY1Y2RhYjc1ZmJmYWQyZGViYWY3IE1vbiBTZXAgMTcgMDA6MDA6MDAgMjAwMQogRnJvbTog
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
Y2gKaW5kZXggN2MyNGY0MzJmMi4uMWRhODU5ZGMwYSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVz
LWRldnRvb2xzL3FlbXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1w
YXRoLXRvLXJlZmVyLXRvLWZpbGUucGF0Y2gKKysrIGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3Fl
bXUvcWVtdS8wMDA3LXRlc3RzLW1lc29uLmJ1aWxkLXVzZS1yZWxhdGl2ZS1wYXRoLXRvLXJlZmVy
LXRvLWZpbGUucGF0Y2gKQEAgLTEsNCArMSw0IEBACi1Gcm9tIGViZWFiMDY3NDczMDZlYzE2Mjk5
MjA3YmY0YmQ3NDgxYTQ3MmI0ZGUgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tIGYwZDA1
ZmYyMjZkMmNiN2JlZTA1OWNjM2JjNGNiMTkzMDY4NDNlZmQgTW9uIFNlcCAxNyAwMDowMDowMCAy
MDAxCiBGcm9tOiBDaGFuZ3FpbmcgTGkgPGNoYW5ncWluZy5saUB3aW5kcml2ZXIuY29tPgogRGF0
ZTogVGh1LCAxNCBKYW4gMjAyMSAwNjozMzowNCArMDAwMAogU3ViamVjdDogW1BBVENIXSB0ZXN0
cy9tZXNvbi5idWlsZDogdXNlIHJlbGF0aXZlIHBhdGggdG8gcmVmZXIgdG8gZmlsZXMKZGlmZiAt
LWdpdCBhL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvMDAwOC1EZWZpbmUtTUFQX1NZ
TkMtYW5kLU1BUF9TSEFSRURfVkFMSURBVEUtb24tbmVlZGVkLWxpLnBhdGNoIGIvbWV0YS9yZWNp
cGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJF
RF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKaW5kZXggNTQ0MjE1NDRiYi4uNzNlZGVhZTM0
ZSAxMDA2NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmlu
ZS1NQVBfU1lOQy1hbmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKKysr
IGIvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDA4LURlZmluZS1NQVBfU1lOQy1h
bmQtTUFQX1NIQVJFRF9WQUxJREFURS1vbi1uZWVkZWQtbGkucGF0Y2gKQEAgLTEsNCArMSw0IEBA
Ci1Gcm9tIDljMjI1MjM0YTc1NmYyNzQ1Y2YwNGMzYzNhZjZlZjZiNmFjZjQyNzcgTW9uIFNlcCAx
NyAwMDowMDowMCAyMDAxCitGcm9tIDU5ZGNlZjIyYTUwOTFiYWZlYzI5MzEzNjQ4YWYzNzE3ZmJi
MzkxZmQgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCiBGcm9tOiBLaGVtIFJhaiA8cmFqLmtoZW1A
Z21haWwuY29tPgogRGF0ZTogTW9uLCAyMSBNYXIgMjAyMiAxMDowOTozOCAtMDcwMAogU3ViamVj
dDogW1BBVENIXSBEZWZpbmUgTUFQX1NZTkMgYW5kIE1BUF9TSEFSRURfVkFMSURBVEUgb24gbmVl
ZGVkIGxpbnV4CmRpZmYgLS1naXQgYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAw
MTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1leHV0YWJsZS1mcm9tLVBBVEgucGF0Y2ggYi9tZXRh
L3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTAtY29uZmlndXJlLWxvb2t1cC1tZXNvbi1l
eHV0YWJsZS1mcm9tLVBBVEgucGF0Y2gKaW5kZXggMjhhMTBkOThiZC4uNTdmNDI5ZGFhNCAxMDA2
NDQKLS0tIGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEwLWNvbmZpZ3VyZS1s
b29rdXAtbWVzb24tZXh1dGFibGUtZnJvbS1QQVRILnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1k
ZXZ0b29scy9xZW11L3FlbXUvMDAxMC1jb25maWd1cmUtbG9va3VwLW1lc29uLWV4dXRhYmxlLWZy
b20tUEFUSC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gOWFkZjNmYzNlYTJjYmNjYjQxZDQ5
Njk1YTUzYzc0ZmVkNjg1MGZiMCBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gY2FhZmI3
NmEzNTgyNDQ0M2Q4Y2ViNjI3NWI0YTlmOWFlMDVjYTNkZiBNb24gU2VwIDE3IDAwOjAwOjAwIDIw
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
bnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaAppbmRleCBiMDYwMjBkMTA2Li42NWZiZDU4ZTBiIDEw
MDY0NAotLS0gYS9tZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1
cmUtcGlwLWFuZC10aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaAorKysgYi9t
ZXRhL3JlY2lwZXMtZGV2dG9vbHMvcWVtdS9xZW11LzAwMTEtcWVtdS1FbnN1cmUtcGlwLWFuZC10
aGUtcHl0aG9uLXZlbnYtYXJlbi10LXVzZWQtZm9yLS5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZy
b20gMGQ4NTk4ODQ1N2E0NzVjMjViODQwODVjZjA5MDA0MDE1MGE5YzE2ZCBNb24gU2VwIDE3IDAw
OjAwOjAwIDIwMDEKK0Zyb20gMzIzYTJlMjc4MjM1NGYwNGY0MjBjYjY0ZDkyMTJlNzhkZWY5NjI3
YSBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IFJpY2hhcmQgUHVyZGllIDxyaWNoYXJk
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
bHMucGF0Y2gKaW5kZXggNjQ4MTZmZTdkOS4uZTg0MzQyN2IwYyAxMDA2NDQKLS0tIGEvbWV0YS9y
ZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS8wMDEyLVJlbW92ZS1kZXByZWNhdGVkLWdldF9ldmVu
dF9sb29wLWNhbGxzLnBhdGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUv
MDAxMi1SZW1vdmUtZGVwcmVjYXRlZC1nZXRfZXZlbnRfbG9vcC1jYWxscy5wYXRjaApAQCAtMSw0
ICsxLDQgQEAKLUZyb20gNTI0MDQwNjc0N2ZkNDM4ODY2MThhZTgxOTQxNTNlNmZjOTU3YTgyYSBN
b24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gOTRlYzVkZTBmMWQ4OTFiOTRmZGQ4YjlhYWUz
ZTJiODllMTE1NDI4MyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKIEZyb206IEpvaG4gU25vdyA8
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
cnJvcm5hbWVfbnAucGF0Y2gKaW5kZXggMWNjOTczNDQzZS4uNjNhZWYzZWI3ZiAxMDA2NDQKLS0t
IGEvbWV0YS9yZWNpcGVzLWRldnRvb2xzL3FlbXUvcWVtdS9maXgtc3RyZXJyb3JuYW1lX25wLnBh
dGNoCisrKyBiL21ldGEvcmVjaXBlcy1kZXZ0b29scy9xZW11L3FlbXUvZml4LXN0cmVycm9ybmFt
ZV9ucC5wYXRjaApAQCAtMSw0ICsxLDQgQEAKLUZyb20gN2UwOTY1NGZhMTc5YWQ1ZmFiMWRjMGE0
Nzg4NmM2YTFhMmFjYzA5NyBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEKK0Zyb20gNTViNWYzMjU5
Yjc1MDdhMDI1MGEwMmE0Y2Y2NTgwNTkyZjU4ODhhYiBNb24gU2VwIDE3IDAwOjAwOjAwIDIwMDEK
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

--===============2600330818256897111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff-full.txt"

packages/x86-64-v3-poky-linux/qemu: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu: SRC_URI changed from "https://download.qemu.org/qemu-10.0.2.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-addition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev" to "https://download.qemu.org/qemu-10.1.0.tar.xz file://powerpc_rom.bin file://run-ptest file://fix-strerrorname_np.patch file://0001-qemu-Add-ad
 dition-environment-space-to-boot-loader-q.patch file://0002-apic-fixup-fallthrough-to-PIC.patch file://0004-qemu-Do-not-include-file-if-not-exists.patch file://0005-qemu-Add-some-user-space-mmap-tweaks-to-address-musl.patch file://0006-qemu-Determinism-fixes.patch file://0007-tests-meson.build-use-relative-path-to-refer-to-file.patch file://0008-Define-MAP_SYNC-and-MAP_SHARED_VALIDATE-on-needed-li.patch file://0010-configure-lookup-meson-exutable-from-PATH.patch file://0011-qemu-Ensure-pip-and-the-python-venv-aren-t-used-for-.patch file://0012-Remove-deprecated-get_event_loop-calls.patch file://qemu-guest-agent.init file://qemu-guest-agent.udev"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/bamboo.dtb /usr/share/qemu/canyonlands.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb /usr/share/qemu/petalogix-ml605.dtb", added "/usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/dtb/petalogix-ml605.dtb /usr/share/qemu/ast27x0_bootrom.bin /usr/share/qemu/dtb/bamboo.dtb /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-common: PKGSIZE changed from 341237291 to 340789657 (-0%)
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: FILELIST: added "/usr/lib/qemu/ptest/tests/qtest/.debug/aspeed_scu-test /usr/lib/qemu/ptest/tests/qtest/.debug/ast2700-hace-test /usr/lib/qemu/ptest/tests/tcg/plugins/.debug/libpatch.so"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-dbg: PKGSIZE changed from 1865081672 to 1870454408 (+0%)
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
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py /usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py", added "/usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/pte
 st/tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu
 /ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: PKGSIZE changed from 185304402 to 181840300 (-2%)
packages/x86-64-v3-poky-linux/qemu/qemu-src: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-src: FILELIST: directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv32-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv32-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/core -> /usr/src/debug/qemu/10.1.0/include/hw/core, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface/hvm -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/hvm, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/gpio -> /usr/src/debug/qemu/10.1.0/include/hw/gpio, directory renamed /usr/src/debug/qemu/10.0.2/host/include/generic/host -> /usr/src/debug/qemu/10.1.0/host/include/generic/host, directory renamed /usr/src/debug/qemu/10.0.2/net -> /usr/src/debug/qemu/10.1.0/net, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci-bridge -> /usr/src/debug/qemu/10.1.0/include/hw/pci-bridge, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/display -> /usr/src/debug/qemu/10.1.0/include/hw/display, directory
  renamed /usr/src/debug/qemu/10.0.2/block -> /usr/src/debug/qemu/10.1.0/block, directory renamed /usr/src/debug/qemu/10.0.2/subprojects/libvhost-user -> /usr/src/debug/qemu/10.1.0/subprojects/libvhost-user, directory renamed /usr/src/debug/qemu/10.0.2/ebpf -> /usr/src/debug/qemu/10.1.0/ebpf, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-arm-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-arm-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/contrib/ivshmem-server -> /usr/src/debug/qemu/10.1.0/contrib/ivshmem-server, directory renamed /usr/src/debug/qemu/10.0.2/include/hw -> /usr/src/debug/qemu/10.1.0/include/hw, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/standard-headers/linux -> /usr/src/debug/qemu
 /10.1.0/include/standard-headers/linux, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-x86_64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-x86_64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/hw/riscv -> /usr/src/debug/qemu/10.1.0/hw/riscv, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/sensor -> /usr/src/debug/qemu/10.1.0/include/hw/sensor, directory renamed /usr/src/debug/qemu/10.0.2/ui -> /usr/src/debug/qemu/10.1.0/ui, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/input -> /usr/src/debug/qemu/10.1.0/include/hw/input, directory renamed /usr/src/debug/
 qemu/10.0.2/backends/tpm -> /usr/src/debug/qemu/10.1.0/backends/tpm, directory renamed /usr/src/debug/qemu/10.0.2/include/io -> /usr/src/debug/qemu/10.1.0/include/io, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64le-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64le-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/qobject -> /usr/src/debug/qemu/10.1.0/include/qobject, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv32-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv32-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/disas -> /usr/src/debug/qemu/10.1.0/disas, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface/io -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/io, directory renamed /usr/src/debug/qemu/10.0.2/hw/pci-host -> /usr/src/debug/qemu/10.1.0/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.2/target/loongarch -> /usr/src/debug/qemu/10.1.0/target/loongarch, directory renamed /usr
 /src/debug/qemu/10.0.2/libqemu-mips64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include -> /usr/src/debug/qemu/10.1.0/include, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-loongarch64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-loongarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/ui/shader -> /usr/src/debug/qemu/10.1.0/ui/shader, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-aarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-aarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/util -> /usr/src/debug/qemu/10.1.0/util, directory renamed /usr/src/debug/qemu/10.0.2/include/net -> /usr/src/debug/qemu/10.1.0/include/net, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/scsi -> /usr/src/debug/qemu/10.1.0/include/hw/scs
 i, directory renamed /usr/src/debug/qemu/10.0.2/host/include/x86_64/host -> /usr/src/debug/qemu/10.1.0/host/include/x86_64/host, directory renamed /usr/src/debug/qemu/10.0.2/include/scsi -> /usr/src/debug/qemu/10.1.0/include/scsi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/xen/interface/arch-x86 -> /usr/src/debug/qemu/10.1.0/include/hw/xen/interface/arch-x86, directory renamed /usr/src/debug/qemu/10.0.2/include/qom -> /usr/src/debug/qemu/10.1.0/include/qom, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-arm-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-arm-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/firmware -> /usr/src/debug/qemu/10.1.0/include/hw/firmware, directory renamed /usr/src/debug/qemu/10.0.2/linux-headers/linux -> /usr/src/debug/qemu/10.1.0/linux-headers/linux, directory renamed /usr/src/debug/qemu/10.0
 .2/libqemu-mips-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-i386-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-i386-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/timer -> /usr/src/debug/qemu/10.1.0/include/hw/timer, directory renamed /usr/src/debug/qemu/10.0.2/target/i386 -> /usr/src/debug/qemu/10.1.0/target/i386, directory renamed /usr/src/debug/qemu/10.0.2/hw/mips -> /usr/src/debug/qemu/10.1.0/hw/mips, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/sd -> /usr/src/debug/qemu/10.1.0/include/hw/sd, directory renamed /usr/src/debug/qemu/10.0.2/include/disas -> /usr/src/debug/qemu/10.1.0/include/disas, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mipsel-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mipsel-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/loongarch -> /usr/src/debug/qemu/10.1.0/include/hw/loongarch, directory renamed
  /usr/src/debug/qemu/10.0.2/include/semihosting -> /usr/src/debug/qemu/10.1.0/include/semihosting, directory renamed /usr/src/debug/qemu/10.0.2/host/include/i386/host/crypto -> /usr/src/debug/qemu/10.1.0/host/include/i386/host/crypto, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/nvram -> /usr/src/debug/qemu/10.1.0/include/hw/nvram, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ipack -> /usr/src/debug/qemu/10.1.0/include/hw/ipack, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/block -> /usr/src/debug/qemu/10.1.0/include/hw/block, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mipsel-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mipsel-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/linux-user -> /usr/src/debug/qemu/10.1.0/linux-user, directory renamed /usr/src/debug/qemu/10.0.2/hw/intc -> /usr/src/debug/qemu/10.1.0/hw/intc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/intc -> /usr/src/debug/qemu/10.1.0/include/hw/intc
 , directory renamed /usr/src/debug/qemu/10.0.2/libqemu-ppc64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-ppc64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/libdecnumber/dpd -> /usr/src/debug/qemu/10.1.0/include/libdecnumber/dpd, directory renamed /usr/src/debug/qemu/10.0.2/qga -> /usr/src/debug/qemu/10.1.0/qga, directory renamed /usr/src/debug/qemu/10.0.2/tcg/i386 -> /usr/src/debug/qemu/10.1.0/tcg/i386, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/hyperv -> /usr/src/debug/qemu/10.1.0/include/hw/hyperv, directory renamed /usr/src/debug/qemu/10.0.2/include/chardev -> /usr/src/debug/qemu/10.1.0/include/chardev, directory renamed /usr/src/debug/qemu/10.0.2/target/mips -> /usr/src/debug/qemu/10.1.0/target/mips, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64el-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64el-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-aarch64-linux-user.a.p -> /usr/src/debug/qem
 u/10.1.0/libqemu-aarch64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ipmi -> /usr/src/debug/qemu/10.1.0/include/hw/ipmi, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-riscv64-linux-user.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-riscv64-linux-user.a.p, directory renamed /usr/src/debug/qemu/10.0.2/subprojects/libvduse -> /usr/src/debug/qemu/10.1.0/subprojects/libvduse, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/audio -> /usr/src/debug/qemu/10.1.0/include/hw/audio, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/southbridge -> /usr/src/debug/qemu/10.1.0/include/hw/southbridge, directory renamed /usr/src/debug/qemu/10.0.2/include/gdbstub -> /usr/src/debug/qemu/10.1.0/include/gdbstub, directory renamed /usr/src/debug/qemu/10.0.2/include/authz -> /usr/src/debug/qemu/10.1.0/include/authz, directory renamed /usr/src/debug/qemu/10.0.2/include/migration -> /usr/src/debug/qemu/10.1.0/include/migration, directory renamed /usr/src/debug/qem
 u/10.0.2/include/block -> /usr/src/debug/qemu/10.1.0/include/block, directory renamed /usr/src/debug/qemu/10.0.2/target/ppc -> /usr/src/debug/qemu/10.1.0/target/ppc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/uefi -> /usr/src/debug/qemu/10.1.0/include/hw/uefi, directory renamed /usr/src/debug/qemu/10.0.2/accel/tcg -> /usr/src/debug/qemu/10.1.0/accel/tcg, directory renamed /usr/src/debug/qemu/10.0.2/host/include/i386/host -> /usr/src/debug/qemu/10.1.0/host/include/i386/host, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/virtio -> /usr/src/debug/qemu/10.1.0/include/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.2/include/standard-headers/asm-x86 -> /usr/src/debug/qemu/10.1.0/include/standard-headers/asm-x86, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/remote -> /usr/src/debug/qemu/10.1.0/include/hw/remote, directory renamed /usr/src/debug/qemu/10.0.2/monitor -> /usr/src/debug/qemu/10.1.0/monitor, directory renamed /usr/src/debug/qemu/10.0.2/hw
 /block/dataplane -> /usr/src/debug/qemu/10.1.0/hw/block/dataplane, directory renamed /usr/src/debug/qemu/10.0.2/hw/loongarch -> /usr/src/debug/qemu/10.1.0/hw/loongarch, directory renamed /usr/src/debug/qemu/10.0.2/hw/i386/kvm -> /usr/src/debug/qemu/10.1.0/hw/i386/kvm, directory renamed /usr/src/debug/qemu/10.0.2/linux-headers/asm -> /usr/src/debug/qemu/10.1.0/linux-headers/asm, directory renamed /usr/src/debug/qemu/10.0.2/include/libdecnumber -> /usr/src/debug/qemu/10.1.0/include/libdecnumber, directory renamed /usr/src/debug/qemu/10.0.2/include/tcg -> /usr/src/debug/qemu/10.1.0/include/tcg, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/acpi -> /usr/src/debug/qemu/10.1.0/include/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.2/include/monitor -> /usr/src/debug/qemu/10.1.0/include/monitor, directory renamed /usr/src/debug/qemu/10.0.2/hw/net/fsl_etsec -> /usr/src/debug/qemu/10.1.0/hw/net/fsl_etsec, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/watchdog -> /usr
 /src/debug/qemu/10.1.0/include/hw/watchdog, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/mips -> /usr/src/debug/qemu/10.1.0/include/hw/mips, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/fsi -> /usr/src/debug/qemu/10.1.0/include/hw/fsi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci -> /usr/src/debug/qemu/10.1.0/include/hw/pci, directory renamed /usr/src/debug/qemu/10.0.2/include/crypto -> /usr/src/debug/qemu/10.1.0/include/crypto, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ssi -> /usr/src/debug/qemu/10.1.0/include/hw/ssi, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/cxl -> /usr/src/debug/qemu/10.1.0/include/hw/cxl, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/adc -> /usr/src/debug/qemu/10.1.0/include/hw/adc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/i2c -> /usr/src/debug/qemu/10.1.0/include/hw/i2c, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/dma -> /usr/src/debug/qemu/10.1.0/include/hw/dm
 a, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/isa -> /usr/src/debug/qemu/10.1.0/include/hw/isa, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ppc -> /usr/src/debug/qemu/10.1.0/include/hw/ppc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/mem -> /usr/src/debug/qemu/10.1.0/include/hw/mem, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/ide -> /usr/src/debug/qemu/10.1.0/include/hw/ide, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/rtc -> /usr/src/debug/qemu/10.1.0/include/hw/rtc, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/usb -> /usr/src/debug/qemu/10.1.0/include/hw/usb, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-loongarch64-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-loongarch64-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2 -> /usr/src/debug/qemu/10.1.0, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/cpu -> /usr/src/debug/qemu/10.1.0/include/hw/cpu, directory renamed /usr/src/debug/qem
 u/10.0.2/include/hw/net -> /usr/src/debug/qemu/10.1.0/include/hw/net, directory renamed /usr/src/debug/qemu/10.0.2/include/ui -> /usr/src/debug/qemu/10.1.0/include/ui, directory renamed /usr/src/debug/qemu/10.0.2/hw/net -> /usr/src/debug/qemu/10.1.0/hw/net, directory renamed /usr/src/debug/qemu/10.0.2/include/fpu -> /usr/src/debug/qemu/10.1.0/include/fpu, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/pci-host -> /usr/src/debug/qemu/10.1.0/include/hw/pci-host, directory renamed /usr/src/debug/qemu/10.0.2/storage-daemon/qapi -> /usr/src/debug/qemu/10.1.0/storage-daemon/qapi, directory renamed /usr/src/debug/qemu/10.0.2/hw/block -> /usr/src/debug/qemu/10.1.0/hw/block, directory renamed /usr/src/debug/qemu/10.0.2/tests -> /usr/src/debug/qemu/10.1.0/tests, directory renamed /usr/src/debug/qemu/10.0.2/hw/usb -> /usr/src/debug/qemu/10.1.0/hw/usb, directory renamed /usr/src/debug/qemu/10.0.2/include/user -> /usr/src/debug/qemu/10.1.0/include/user, directory renamed /usr/src/debug/
 qemu/10.0.2/include/hw/xen -> /usr/src/debug/qemu/10.1.0/include/hw/xen, directory renamed /usr/src/debug/qemu/10.0.2/crypto -> /usr/src/debug/qemu/10.1.0/crypto, directory renamed /usr/src/debug/qemu/10.0.2/hw/virtio -> /usr/src/debug/qemu/10.1.0/hw/virtio, directory renamed /usr/src/debug/qemu/10.0.2/hw/arm -> /usr/src/debug/qemu/10.1.0/hw/arm, directory renamed /usr/src/debug/qemu/10.0.2/migration -> /usr/src/debug/qemu/10.1.0/migration, directory renamed /usr/src/debug/qemu/10.0.2/include/hw/misc/macio -> /usr/src/debug/qemu/10.1.0/include/hw/misc/macio, directory renamed /usr/src/debug/qemu/10.0.2/audio -> /usr/src/debug/qemu/10.1.0/audio, directory renamed /usr/src/debug/qemu/10.0.2/hw/acpi -> /usr/src/debug/qemu/10.1.0/hw/acpi, directory renamed /usr/src/debug/qemu/10.0.2/libqemu-mips64el-softmmu.a.p -> /usr/src/debug/qemu/10.1.0/libqemu-mips64el-softmmu.a.p, directory renamed /usr/src/debug/qemu/10.0.2/libcommon.a.p -> /usr/src/debug/qemu/10.1.0/libcommon.a.p, directory rena
 med /usr/src/debug/qemu/10.0.2/include/hw/sh4 -> /usr/src/debug/qemu/10.1.0/include/hw/sh4, removed "/usr/src/debug/qemu/10.0.2/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.0.2/trace/trace-target_i386.h /usr/src/debug/qemu/10.0.2/include/system/seccomp.h /usr/src/debug/qemu/10.0.2/trace/trace-target_i386.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.0.2/include/qemu/futex.h /usr/src/debug/qemu/10.0.2/include/hw/i386/vmport.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/arm/allwinner-h3.h /usr/src/debug/qemu/10.0.2/trace/trace-qom.h /usr/src/debug/qemu/10.0.2/include/qemu/pmem.h /usr/src/debug/qemu/10.0.2/include/system/tpm_util.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_run_state_trace_events.c /us
 r/src/debug/qemu/10.0.2/trace/trace-qom.c /usr/src/debug/qemu/10.0.2/hw/ppc/e500-ccsr.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.0.2/include/hw/arm/digic.h /usr/src/debug/qemu/10.0.2/include/system/iommufd.h /usr/src/debug/qemu/10.0.2/include/system/qtest.h /usr/src/debug/qemu/10.0.2/include/system/reset.h /usr/src/debug/qemu/10.0.2/include/system/stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_target_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_usb.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_target_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.0.2/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.0.2/include/exec/tl
 b-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_usb.h /usr/src/debug/qemu/10.0.2/include/qemu/thread-context.h /usr/src/debug/qemu/10.0.2/include/system/balloon.h /usr/src/debug/qemu/10.0.2/include/system/kvm_xen.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.0.2/include/exec/target_page.h /usr/src/debug/qemu/10.0.2/include/system/kvm_int.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qo
 m_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.0.2/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.0.2/include/system/numa.h /usr/src/debug/qemu/10.0.2/include/hw/i386/pc.h /usr/src/debug/qemu/10.0.2/include/qemu/qemu-print.h /usr/src/debug/qemu/10.0.2/include/qemu/crc32c.h /usr/src/debug/qemu/10.0.2/include/qemu/fifo8.h /usr/src/debug/qemu/10.0.2/include/system/blo
 ck-backend-common.h /usr/src/debug/qemu/10.0.2/include/qemu/uuid.h /usr/src/debug/qemu/10.0.2/include/system/accel-blocker.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-pmc-iou-slcr.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.0.2/include/system/event-loop-base.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.0.2/include/qemu/xxhash.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.0.2/trace/trace-chardev.h /usr/src/debug/qemu/10.0.2/trace/trace-chardev.c /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-target.c /usr/src/debug/qemu/10.0.2/include/q
 emu/memfd.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine-target.h /usr/src/debug/qemu/10.0.2/include/hw/char/serial.h /usr/src/debug/qemu/10.0.2/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.0.2/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-qdev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-migration.c
  /usr/src/debug/qemu/10.0.2/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-char.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armsse.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.0.2/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.0.2/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.0.2/include/system/replay.h /usr/src/debug/qemu/10.0.2/include/system/system.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386.h /usr/src/debug/qemu/10.0.2/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.0.2/include/qemu/cpu-float.h /usr/src/debug/qemu/10.0.2/include/qemu/mmap-alloc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cryptodev.h /usr/src/debug/
 qemu/10.0.2/include/system/cpu-timers.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.0.2/include/qemu/envlist.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.0.2/include/exec/tb-flush.h /usr/src/debug/qemu/10.0.2/include/qemu/range.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.0.2/include/system/device_tree.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.0.2/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-misc-target.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci.c /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm_clk.h /usr/src/debug/qemu/10.0.2/trace/trace-nbd.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.trace-
 events /usr/src/debug/qemu/10.0.2/trace/trace-nbd.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc.c /usr/src/debug/qemu/10.0.2/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.0.2/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc.h /usr/src/debug/qemu/10.0.2/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.0.2/include/hw/arm/omap.h /usr/src/debug/qemu/10.0.2/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.0.2/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.0.2/include/qapi/compat-policy.h /usr/src/debug/qemu/10.0.2/include/exec/cputlb.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_adc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.0.2/include/exec/page-vary.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu
 /10.0.2/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-hw_adc.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.0.2/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.0.2/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10.0.2/include/qapi/util.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-job.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-job.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.0.2/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.0.2/include/hw/char/mchp_pfsoc
 _mmuart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.0.2/include/exec/log.h /usr/src/debug/qemu/10.0.2/include/qemu/log.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_isa.h /usr/src/debug/qemu/10.0.2/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_isa.c /usr/src/debug/qemu/10.0.2/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.0.2/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.0.2/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.0.2/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.0.2/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.0.2/include/qemu/selfmap.h /usr/src/debug/qemu/10.0.2/include/qemu/seqlock.h /usr/src/debug/qemu/10.0.2/include/hw/misc/led.h /usr/src/debug/qemu/10.0.2/include/system/host_iommu_device.h /usr/src/debug/qemu/10.0.2/qapi/qapi
 -commands-stats.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.0.2/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.0.2/include/exec/memory-internal.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.0.2/include/system/tpm_backend.h /usr/src/debug/qemu/10.0.2/trace/trace-gdbstub.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_ide.c /usr/src/debug/qemu/10.0
 .2/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-error.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-error.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.0.2/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.0.2/trace/trace-gdbstub.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ide.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.0.2/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.0.2/include/qemu/bswap.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.0.2/
 qapi/qapi-commands-misc-target.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-export.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_target_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_target_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/cpu-common.h /usr/src/debug/qemu/10.0.2/include/hw/arm/boot.h /usr/src/debug/qemu/10.0.2/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.0.2/include/exec/replay-core.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-yank.h 
 /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-char.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-uefi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.0.2/include/qemu/guest-random.h /usr/src/debug/qemu/10.0.2/include/exec/abi_ptr.h /usr/src/debug
 /qemu/10.0.2/include/hw/char/escc.h /usr/src/debug/qemu/10.0.2/include/qemu/main-loop.h /usr/src/debug/qemu/10.0.2/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.0.2/include/system/blockdev.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.0.2/include/qemu/typedefs.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f100_soc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.0.2/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.0.2/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc-target.c /usr/src/debug/qemu/10.0.2/hw/i386/acpi-build.h /usr/src/debug/qemu/10.0.2/include/qemu/madvise.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc-target.h /usr/
 src/debug/qemu/10.0.2/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.0.2/include/qemu/iova-tree.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.0.2/include/system/cpus.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.0.2/trace/trace-root.c /usr/src/debug/qemu/10.0.2/trace/trace-monitor.c /usr/src/debug/qemu/10.0.2/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-monitor.h /usr/src/debug/qemu/10.0.2/include/qapi/visitor.h /usr/src/debug/qemu/10.0.2/trace/trace-root.h /usr/src/debug/qemu/10.0.2/include/system/tcg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mips_itu.h /usr/s
 rc/debug/qemu/10.0.2/include/hw/vfio/vfio-container-base.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.0.2/target/riscv/pmu.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.0.2/include/exec/translator.h /usr/src/debug/qemu/10.0.2/include/system/arch_init.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.0.2/include/qemu/accel.h /usr/src/debug/qemu/10.0.2/include/qapi/qmp-event.h /usr/src/debug/qemu/10.0.2/include/qemu/timer.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.0.2/include/qapi/type-helpers.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_st
 ats_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/vaddr.h /usr/src/debug/qemu/10.0.2/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.0.2/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.0.2/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.0.2/target/arm/cpu-qom.h /usr/src/debug/qemu/10.0.2/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.0.2/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net.c /usr/src/debug/qemu/10.0.2/include/qemu/drm.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net.h /usr/src/debug/qemu/10.0.2/include/qemu/cacheflush.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.0.2/include/exec/target_long.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/
 co-shared-resource.h /usr/src/debug/qemu/10.0.2/target/arm/cpregs.h /usr/src/debug/qemu/10.0.2/include/qemu/cutils.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.0.2/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.0.2/include/qemu/thread.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.0.2/target/arm/idau.h /usr/src/debug/qemu/10.0.2/include/exec/memattrs.h /usr/src/debug/qemu/10.0.2/include/exec/memopidx.h /usr/src/debug/qemu/10.0.2/include/qemu/memalign.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_intc.h /usr/src/debug/qemu/10.0.2/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-migration.c /usr/src/debug/q
 emu/10.0.2/trace/trace-hw_intc.c /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.0.2/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.0.2/include/qemu/async-teardown.h /usr/src/debug/qemu/10.0.2/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.0.2/include/system/os-posix.h /usr/src/debug/qemu/10.0.2/include/qemu/module.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-target.h /usr/src/debug/qemu/10.0.2/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine-target.c /usr/src/debug/qemu/10.0.2/include/exec/ram_addr.h /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.0.2/include/exec/ramblock.h /usr/src/debug/qemu/10.0.2/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.0.2/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.0.2/include/hw/misc/pvpanic.h /usr/sr
 c/debug/qemu/10.0.2/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.0.2/include/exec/ramlist.h /usr/src/debug/qemu/10.0.2/include/qemu/throttle.h /usr/src/debug/qemu/10.0.2/include/system/spdm-socket.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.0.2/trace/trace-system.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.0.2/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.0.2/trace/control-internal.h /usr/src/debug/qemu/10.0.2/trace/trace-system.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-misc-target.h /usr/src/debug/qemu/10.0.2/qapi/qapi-emit-events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit.c /usr/src/debug/qemu/10
 .0.2/qapi/qapi-types-misc-target.c /usr/src/debug/qemu/10.0.2/qapi/qapi-emit-events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_mips.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_core.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.0.2/include/qemu/bcd.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_core.h /usr/src/debug/qemu/10.0.2/include/qemu/error-report.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_mips.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_dma.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events.c /usr/src/debug/qemu/10.0.2/include/system/hw_accel.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_dma.h /usr/src/debug/qemu/10.0.2/include/qemu/even
 t_notifier.h /usr/src/debug/qemu/10.0.2/include/qemu/coroutine-core.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.0.2/include/system/tpm.h /usr/src/debug/qemu/10.0.2/include/system/dirtylimit.h /usr/src/debug/qemu/10.0.2/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.0.2/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.0.2/include/hw/char/xilinx_uartlite.h 
 /usr/src/debug/qemu/10.0.2/include/system/dma.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_arm.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.0.2/include/exec/gdbstub.h /usr/src/debug/qemu/10.0.2/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.0.2/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.0.2/include/qemu/sockets.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_char.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_char.h /usr/src/debug/qemu/10.0.2/target/riscv/cpu.h /usr/src/debug/qemu/10.0.2/include/exec/tswap.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_remote.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-pci.h /usr/src/debug/qemu
 /10.0.2/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.0.2/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.0.2/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.0.2/include/exec/hwaddr.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_arm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.0.2/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_display.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-dump.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_timer.h /usr/src/debug/qemu/10.0.2/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.0.2/include/qemu/datadir.h /usr/src/debug/qemu/10.0.2/include/qemu/coroutine_int.h /usr/s
 rc/debug/qemu/10.0.2/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.0.2/include/qemu/timed-average.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_display.c /usr/src/debug/qemu/10.0.2/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.c /usr/src/debug/qemu/10.0.2/target/arm/gtimer.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.0.2/hw/vfio/pci.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.0.2/include/exec/breakpoint.h
  /usr/src/debug/qemu/10.0.2/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.0.2/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.0.2/include/system/rng.h /usr/src/debug/qemu/10.0.2/target/arm/cpu-features.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.0.2/trace/trace-backends.c /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.0.2/trace/trace-backends.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.trace-events /usr/src/debug/qemu/10.0.2/include/hw/riscv/spike.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-
 commands-qdev.trace-events /usr/src/debug/qemu/10.0.2/include/qemu/plugin.h /usr/src/debug/qemu/10.0.2/include/qemu/qdist.h /usr/src/debug/qemu/10.0.2/include/system/xen.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci_host.c /usr/src/debug/qemu/10.0.2/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.0.2/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.0.2/include/exec/page-protection.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.0.2/include/qemu/option_int.h /usr/src/debug/qemu/10.0.2/trace/t
 race-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_remote.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-tpm.c /usr/src/debug/qemu/10.0.2/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.0.2/qapi/qap
 i-visit-transaction.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/memory.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.0.2/include/qemu/lockable.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.0.2/include/system/watchdog.h /usr/src/debug/qemu/10.0.2/include/qemu/fifo32.h /usr/src/debug/qemu/10.0.2/include/qemu/option.h /usr/src/debug/qemu/10.0.2/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.0.2/target/arm/syndrome.h /usr/src/debug/qemu/10.0.2/include/exec/cpu-all.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.0.2/include/qemu/stats64.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-dump.c 
 /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.0.2/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.0.2/include/qemu/filemonitor.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-common.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-common.c /usr/src/debug/qemu/10.0.2/include/qemu/yank.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.0.2/include/hw/i386/apic.h /usr/src/debug/qemu/10.0.2/include/qemu/keyval.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_sd.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.0.2/hw/i386/amd_iommu.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.0.2/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.0.2/tr
 ace/trace-hw_sd.c /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.0.2/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-common.h /usr/src/debug/qemu/10.0.2/include/qemu/defer-call.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.0.2/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.0.2/include/qemu/bitops.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.0.2/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.0.2/include/hw/misc/unimp.h /usr/src/debug/
 qemu/10.0.2/include/hw/riscv/boot.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/numa.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/virt.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-tpm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.c /usr/src/debug/qemu/10.0.2/trace/trace-authz.h /usr/src/debug/qemu/10.0.2/include/qemu/thread-posix.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-machine-target.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.0.2/trace/trace-authz.c /usr/src/debug/qemu/10.0.2/target/arm/internals.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.0.2/include/qemu/job.h /usr/src/debug/qemu/10.0.2/trace/trace-linux_user.c /usr/src/debug/qemu/10.0.2/include/qemu/qht.h /usr/src/debug/qemu/10.0.2/include/qemu/unicode.h /usr/src/debug/qemu/10.0
 .2/include/qemu/qtree.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.0.2/trace/trace-linux_user.h /usr/src/debug/qemu/10.0.2/include/hw/i386/x86.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/i386/apic_internal.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.0.2/include/exec/memop.h /usr/src/debug/qemu/10.0.2/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.0.2/trace/trace-util.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.0.2/include/qemu/coroutine.h /usr/src/debug/qemu/10.0.2/qapi/qap
 i-commands-cxl.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.0.2/trace/trace-util.h /usr/src/debug/qemu/10.0.2/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.0.2/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.0.2/include/qemu/progress_meter.h /usr/src/debug/qemu/10.0.2/include/system/accel-ops.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.0.2/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.0.2/include/system/dirtyrate.h /usr/src/debug/qemu/10.0.2/include/hw/char/pl011.h /usr/src/debug/qemu/10.0.2/include/qemu/plugin-event.h /usr/src/debug/qemu/10.0.2/include/qemu/ratelimit.h /usr/src/debug/qemu/10.0.2/trace/trace-audio.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types.c /
 usr/src/debug/qemu/10.0.2/include/qemu/config-file.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.0.2/include/system/iothread.h /usr/src/debug/qemu/10.0.2/trace/trace-audio.h /usr/src/debug/qemu/10.0.2/include/system/block-backend-io.h /usr/src/debug/qemu/10.0.2/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.0.2/include/system/dump-arch.h /usr/src/debug/qemu/10.0.2/trace/trace-migration.c /usr/src/debug/qemu/10.0.2/trace/trace-net.h /usr/src/debug/qemu/10.0.2/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.0.2/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.0.2/trace/trace-migration.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-net.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.0.2/
 include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands.c /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.0.2/include/qemu/systemd.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.0.2/include/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.0.2/include/system/cryptodev.h /usr/src/debug/qemu/10.0.2/include/qemu/help_option.h /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.0.2/include/qemu/iov.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.0.2/include/system/hostmem.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.0.2/trace/event-internal.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-rock
 er.c /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.0.2/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.0.2/include/qemu/bitmap.h /usr/src/debug/qemu/10.0.2/include/qemu/dbus.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.0.2/include/qemu/interval-tree.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.0.2/include/hw/arm/virt.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-machine-target.c /usr/src/debug/qemu/10.0.2/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw
 /char/serial-isa.h /usr/src/debug/qemu/10.0.2/trace/trace-target_riscv.c /usr/src/debug/qemu/10.0.2/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-target_riscv.h /usr/src/debug/qemu/10.0.2/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.0.2/include/exec/plugin-gen.h /usr/src/debug/qemu/10.0.2/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_xen.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_xen.c /usr/src/debug/qemu/10.0.2/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qom.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-tpm.trace-events /usr/src/d
 ebug/qemu/10.0.2/include/qemu/int128.h /usr/src/debug/qemu/10.0.2/qapi/qapi-introspect.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.0.2/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.0.2/include/system/dump.h /usr/src/debug/qemu/10.0.2/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-introspect.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.0.2/qapi/qapi-features.h /usr/src/debug/qemu/10.0.2/include/qemu/rcu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.0.2/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.0.2/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.0.2/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.0.2/trace/trace-scsi.h /usr/src/de
 bug/qemu/10.0.2/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.0.2/trace/trace-scsi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-job.c /usr/src/debug/qemu/10.0.2/qapi/qapi-events-net.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/10.0.2/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.0.2/include/qemu/queue.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-job.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-net.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_i2c.h /usr/src/
 debug/qemu/10.0.2/include/qemu/path.h /usr/src/debug/qemu/10.0.2/include/qemu/transactions.h /usr/src/debug/qemu/10.0.2/trace/trace-ui.h /usr/src/debug/qemu/10.0.2/trace/trace-target_ppc.c /usr/src/debug/qemu/10.0.2/trace/trace-ui.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.0.2/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.0.2/include/system/runstate.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_b
 lock_export_trace_events.h /usr/src/debug/qemu/10.0.2/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.0.2/include/hw/char/serial-mm.h /usr/src/debug/qemu/10.0.2/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.0.2/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.0.2/trace/trace-target_ppc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.0.2/target/riscv/pmp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.0.2/include/hw/i386/microvm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.0.2/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.0.2/include/qemu/cpuid.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_scsi.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-audio.trace-events /usr/src/debug/qe
 mu/10.0.2/trace/trace-io.c /usr/src/debug/qemu/10.0.2/trace/trace-io.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.0.2/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.0.2/include/hw/i386/topology.h /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.0.2/include/qapi/error.h /usr/src/debug/qemu/10.0.2/include/system/runstate-action.h /usr/src/debug/qemu/10.0.2/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.0.2/trace/control.h /usr/src/debug/qemu/10.0.2/include/system/rtc.h /usr/src/debug/qemu/10.0.2/include/qemu/readline.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_mem.c /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx6.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_
 mem.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.0.2/include/qemu/osdep.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.0.2/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.0.2/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-char.tr
 ace-events /usr/src/debug/qemu/10.0.2/include/qemu/notify.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.0.2/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.0.2/trace/trace-block.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.0.2/target/arm/multiprocessing.h /usr/src/debug/qemu/10.0.2/trace/trace-block.c /usr/src/debug/qemu/10.0.2/trace/trace-target_arm.h /usr/src/debug/qemu/10.0.2/include/exec/translation-block.h /usr/src/debug/qemu/10.0.2/trace/trace-target_arm.c /usr/src/debug/qemu/10.0.2/include/exec/address-spaces.h /usr/src/debug/qemu/10.0.2/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.0.2/include/system/cpu-throttle.h /usr/src/debug/qemu/10.0.2/include/system/memory_mapping.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.0.2/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block.trace-events /
 usr/src/debug/qemu/10.0.2/include/system/kvm.h /usr/src/debug/qemu/10.0.2/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.0.2/target/arm/cpu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc-target.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.0.2/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-net.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_audio.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_block.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_input.c /usr/src/debug/qemu/10.0.2/qapi/qapi-types-net.c /usr/src/debug/qemu/10.0.2/include/qemu/qsp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.0.2/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-misc-target.c /usr/src/debug/qemu/10.0.2/include/system/rng-random.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-rocker.h /usr/src/debug/qe
 mu/10.0.2/include/qemu/buffer.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-rocker.c /usr/src/debug/qemu/10.0.2/include/qemu/base64.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.0.2/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.0.2/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-control.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.0.2/qapi/qapi-types-control.c /usr/src/debug/qemu/10.0.2/include/qemu/chardev_open.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_audio.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_block.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_input.h /usr/src/debug/qemu/10.0.2/include/exec/ioport.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.0.2/qapi/qa
 pi-builtin-visit.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.0.2/include/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.0.2/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/10.0.2/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.0.2/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.0.2/include/exec/exec-all.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.0.2/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.0.2/include/exec/cpu_ldst.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.0.2/trace/trace-hw_timer.c /usr/src/debug/qemu/10.0.2/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.0.2/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.0.2/include/qemu/reserved-re
 gion.h /usr/src/debug/qemu/10.0.2/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.0.2/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.0.2/include/qemu/host-utils.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.0.2/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.0.2/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.0.2/include/qemu/id.h /usr/src/debug/qemu/10.0.2/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.0.2/include/qemu/hw-version.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.0.2/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.0.2/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.0.2/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.0.2/include/hw/char/parallel.h /usr/src/debug/qemu/10.0.2/include/qemu/atomic.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.0.2/include/qemu/hbitmap.h /usr/src/debug/qemu/10.0.2/include/qemu/mprotect.h /usr/src/debug/qemu/10.0.2/i
 nclude/hw/misc/empty_slot.h /usr/src/debug/qemu/10.0.2/qapi/qapi-commands-misc.c /usr/src/debug/qemu/10.0.2/include/qemu/lockcnt.h", added "/usr/src/debug/qemu/10.1.0/hw/i386/tdvf-hob.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-acpi.h /usr/src/debug/qemu/10.1.0/include/qemu/guest-random.h /usr/src/debug/qemu/10.1.0/include/exec/abi_ptr.h /usr/src/debug/qemu/10.1.0/include/hw/arm/virt.h /usr/src/debug/qemu/10.1.0/include/hw/char/escc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-acpi.c /usr/src/debug/qemu/10.1.0/include/qapi/forward-visitor.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-calxeda-xgmac.h /usr/src/debug/qemu/10.1.0/include/qemu/dbus.h /usr/src/debug/qemu/10.1.0/include/qemu/typedefs.h /usr/src/debug/qemu/10.1.0/include/hw/i386/sgx-epc.h /usr/src/debug/qemu/10.1.0/include/qapi/dealloc-visitor.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_s390x_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.trace-events /usr/src/debug/qemu
 /10.1.0/include/hw/vfio/vfio-platform.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_s390x_trace_events.h /usr/src/debug/qemu/10.1.0/include/qemu/iova-tree.h /usr/src/debug/qemu/10.1.0/include/qemu/int128.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-error.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/proxy.h /usr/src/debug/qemu/10.1.0/include/qemu/win_dump_defs.h /usr/src/debug/qemu/10.1.0/include/system/dump.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_powermgt.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx25.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-trace.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ssi.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ssi.c /usr/src/debug/qemu/10.1.0/trace/trace-root.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-arm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-export.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_c
 ommands_block_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-root.h /usr/src/debug/qemu/10.1.0/include/system/tcg.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-arm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-export.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mips_itu.h /usr/src/debug/qemu/10.1.0/target/arm/arm-powerctl.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_trace_events.h /usr/src/debug/qemu/10.1.0/include/qemu/vfio-helpers.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/sifive_e.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_acpi_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_acpi_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32f2xx_syscfg.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-job.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-net.c /usr/src/debug/qemu/10.1.0/include/system/arch_init.h /
 usr/src/debug/qemu/10.1.0/qapi/qapi-events-job.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-net.h /usr/src/debug/qemu/10.1.0/include/qemu/path.h /usr/src/debug/qemu/10.1.0/include/qemu/transactions.h /usr/src/debug/qemu/10.1.0/include/system/ram_addr.h /usr/src/debug/qemu/10.1.0/include/hw/i386/intel_iommu.h /usr/src/debug/qemu/10.1.0/include/system/runstate.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_acpi.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-mmu-index.h /usr/src/debug/qemu/10.1.0/include/qemu/accel.h /usr/src/debug/qemu/10.1.0/include/qemu/timer.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_acpi.c /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx31.h /usr/src/debug/qemu/10.1.0/include/qemu/nvdimm-utils.h /usr/src/debug/qemu/10.1.0/include/qapi/type-helpers.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_stats_trace_events.c /usr/src/debug/qemu/10.1.0/include/exec/vaddr.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ops.h /usr/src/debug/qemu/10.1.0/include/hw
 /char/serial-mm.h /usr/src/debug/qemu/10.1.0/include/qemu/cacheinfo.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_stats_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net.c /usr/src/debug/qemu/10.1.0/include/qemu/drm.h /usr/src/debug/qemu/10.1.0/target/riscv/pmp.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/tb-cpu-state.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net.h /usr/src/debug/qemu/10.1.0/include/qemu/cacheflush.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.trace-events /usr/src/debug/qemu/10.1.0/include/hw/i386/microvm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_peci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cryptodev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-export.trace-events /usr/src/debug/qemu/10.1.0/include/qemu/co-shared-resource.h /usr/src/debug/qemu/10.1.0/target/arm/cpregs.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cryptodev.c /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm_gcr.h /usr/src/debug/qemu/10.1.0/trac
 e/trace-hw_scsi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-audio.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/mps2-scc.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_scsi.h /usr/src/debug/qemu/10.1.0/include/hw/misc/msf2-sysreg.h /usr/src/debug/qemu/10.1.0/target/arm/idau.h /usr/src/debug/qemu/10.1.0/include/exec/memattrs.h /usr/src/debug/qemu/10.1.0/include/exec/memopidx.h /usr/src/debug/qemu/10.1.0/include/qemu/memalign.h /usr/src/debug/qemu/10.1.0/include/hw/char/digic-uart.h /usr/src/debug/qemu/10.1.0/include/hw/arm/xlnx-versal.h /usr/src/debug/qemu/10.1.0/include/system/runstate-action.h /usr/src/debug/qemu/10.1.0/include/qemu/crc-ccitt.h /usr/src/debug/qemu/10.1.0/include/hw/arm/msf2-soc.h /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst_cached.h.inc /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvme.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvme.c /usr/src/debug/qemu/10.1.0/qapi/qapi-init-commands.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx6.h /usr/src/d
 ebug/qemu/10.1.0/include/accel/tcg/helper-retaddr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-common.h /usr/src/debug/qemu/10.1.0/include/qapi/qmp-registry.h /usr/src/debug/qemu/10.1.0/qapi/qapi-init-commands.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-common.c /usr/src/debug/qemu/10.1.0/include/qemu/throttle.h /usr/src/debug/qemu/10.1.0/include/system/spdm-socket.h /usr/src/debug/qemu/10.1.0/trace/trace-system.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-ui.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-crypto.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-virtio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-compat.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-ui.c /usr/src/debug/qemu/10.1.0/trace/control-internal.h /usr/src/debug/qemu/10.1.0/trace/trace-system.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-compat.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-crypto.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-virtio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-emit-events.h /usr/src/debug/qemu
 /10.1.0/qapi/qapi-visit-block-core.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-char.trace-events /usr/src/debug/qemu/10.1.0/include/qemu/notify.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block-core.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-replay.c /usr/src/debug/qemu/10.1.0/hw/i386/fw_cfg.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-run-state.h /usr/src/debug/qemu/10.1.0/trace/trace-block.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-replay.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-vfio.c /usr/src/debug/qemu/10.1.0/include/qemu/bcd.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-run-state.c /usr/src/debug/qemu/10.1.0/trace/trace-block.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_dma.c /usr/src/debug/qemu/10.1.0/include/system/cpu-throttle.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_dma.h /usr/src/de
 bug/qemu/10.1.0/qapi/qapi-commands-ui.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qom.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-ui.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qom.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_sysreg.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_thermal.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-container.h /usr/src/debug/qemu/10.1.0/include/system/hvf.h /usr/src/debug/qemu/10.1.0/include/system/tpm.h /usr/src/debug/qemu/10.1.0/target/arm/cpu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-net.h /usr/src/debug/qemu/10.1.0/target/sh4/cpu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-net.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine.h /usr/src/debug/qemu/10.1.0/include/system/rng-random.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-rocker.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi.c /usr/src/debug/qemu/10.1.0/include/qemu/buffer.h /usr/src/debug/qemu/10.1.0/qapi/qa
 pi-visit-rocker.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx_rngc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.c /usr/src/debug/qemu/10.1.0/include/qemu/base64.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-export.c /usr/src/debug/qemu/10.1.0/include/system/dma.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx6ul.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-export.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-control.c /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-dramc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-mhu.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio.h /usr/src/debug/qemu/10.1.0/include/qemu/sockets.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.c /usr/src/debug/qemu/10.1.0/in
 clude/hw/misc/nrf51_rng.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_machine_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.h /usr/src/debug/qemu/10.1.0/include/exec/tswap.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu_bits.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-s390x.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-s390x.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-net.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-accelerator.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_test.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx6ul_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm7xx_mft.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-net.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_block.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_input.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_audio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_block.c /usr/src/debug/qemu/10.1.0/trace/
 trace-hw_display.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_input.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvram.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_riscv.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_timer.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_nvram.h /usr/src/debug/qemu/10.1.0/include/qemu/reserved-region.h /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-sysinfo.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_riscv.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_timer.h /usr/src/debug/qemu/10.1.0/include/hw/misc/arm11scu.h /usr/src/debug/qemu/10.1.0/include/qemu/host-utils.h /usr/src/debug/qemu/10.1.0/include/qemu/coroutine_int.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_audio.h /usr/src/debug/qemu/10.1.0/include/qemu/id.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_display.c /usr/src/debug/qemu/10.1.0/hw/vfio/vfio-display.h /usr/src/debug/qemu/10.1.0/include/qemu/hw-version.h /usr/src/debug/qemu/10.1.0/target/arm/gtim
 er.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/sifive_u.h /usr/src/debug/qemu/10.1.0/hw/vfio/pci.h /usr/src/debug/qemu/10.1.0/include/qemu/atomic.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_tpm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_tpm.c /usr/src/debug/qemu/10.1.0/accel/dummy-cpus.h /usr/src/debug/qemu/10.1.0/include/hw/arm/raspi_platform.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-introspect.c /usr/src/debug/qemu/10.1.0/trace/trace-target_i386.h /usr/src/debug/qemu/10.1.0/include/system/rng.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-introspect.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.h /usr/src/debug/qemu/10.1.0/trace/trace-backends.c /usr/src/debug/qemu/10.1.0/hw/vfio-user/protocol.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-sramc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.c /usr/src/debug/qemu/10.1.0/trace/trace-backends.h /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-h3.h /usr/sr
 c/debug/qemu/10.1.0/include/hw/riscv/spike.h /usr/src/debug/qemu/10.1.0/trace/trace-qom.h /usr/src/debug/qemu/10.1.0/include/qemu/pmem.h /usr/src/debug/qemu/10.1.0/include/system/tpm_util.h /usr/src/debug/qemu/10.1.0/trace/trace-qom.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-arm.trace-events /usr/src/debug/qemu/10.1.0/include/qemu/qdist.h /usr/src/debug/qemu/10.1.0/include/system/xen.h /usr/src/debug/qemu/10.1.0/nbd/nbd-internal.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-region.h /usr/src/debug/qemu/10.1.0/include/qemu/target-info.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-mpc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-msc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/tz-ppc.h /usr/src/debug/qemu/10.1.0/include/hw/char/stm32f2xx_usart.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_gpio.c /usr/src/debug/qemu/10.1.0/include/qemu/userfaultfd.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_gpio.h /usr/src/debug/qemu/10.1.0/include/exec/watchpoint.h /usr/src/debug/qemu
 /10.1.0/include/qapi/opts-visitor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-run-state.h /usr/src/debug/qemu/10.1.0/include/qemu/option_int.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-common.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-transaction.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-audio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-authz.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-run-state.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-transaction.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-machine-common.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qdev_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-audio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-authz.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-block.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-trace.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-accelerator.h /usr/src/debug/qemu/
 10.1.0/qapi/qapi-visit-transaction.c /usr/src/debug/qemu/10.1.0/include/exec/icount.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_rtc.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-transaction.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-accelerator.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-vfio.h /usr/src/debug/qemu/10.1.0/include/exec/target_page.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_rtc.h /usr/src/debug/qemu/10.1.0/hw/vfio/vfio-listener.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_exti.h /usr/src/debug/qemu/10.1.0/include/system/numa.h /usr/src/debug/qemu/10.1.0/include/qemu/crc32c.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-accelerator.c /usr/src/debug/qemu/10.1.0/target/arm/syndrome.h /usr/src/debug/qemu/10.1.0/include/qemu/uuid.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-accelerator.h /usr/src/debug/qemu/10.1.0/include/system/accel-blocker.h /usr/src/debug/qemu/10.1.0/include/hw/arm/fsl-imx7.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-pmc-i
 ou-slcr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ldst.h /usr/src/debug/qemu/10.1.0/target/i386/kvm/tdx.h /usr/src/debug/qemu/10.1.0/include/hw/char/stm32l4x5_usart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cryptodev.h /usr/src/debug/qemu/10.1.0/include/qemu/xxhash.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-common.h /usr/src/debug/qemu/10.1.0/trace/trace-chardev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-common.c /usr/src/debug/qemu/10.1.0/trace/trace-chardev.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mips_cmgcr.h /usr/src/debug/qemu/10.1.0/include/hw/i386/apic.h /usr/src/debug/qemu/10.1.0/include/hw/i386/tdvf.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-run-state.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-stats.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-trace.c /usr/src/debug/qemu/10.1.0/hw/i386
 /amd_iommu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-run-state.c /usr/src/debug/qemu/10.1.0/target/arm/cpu-sysregs.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_xen.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_xen.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ufs.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_ufs.c /usr/src/debug/qemu/10.1.0/hw/i386/e820_memory_layout.h /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2836.h /usr/src/debug/qemu/10.1.0/include/qemu/defer-call.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-migration.h /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst_phys.h.inc /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-migration.c /usr/src/debug/qemu/10.1.0/include/hw/arm/armsse.h /usr/src/debug/qemu/10.1.0/include/hw/arm/armv7m.h /usr/src/debug/qemu/10.1.0/include/hw/arm/aspeed.h /usr/src/debug/qemu/10.1.0/include/hw/arm/smmuv3.h /usr/src/debug/qemu/10.1.0/inc
 lude/system/ioport.h /usr/src/debug/qemu/10.1.0/include/system/memory.h /usr/src/debug/qemu/10.1.0/include/system/replay.h /usr/src/debug/qemu/10.1.0/include/system/system.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386.h /usr/src/debug/qemu/10.1.0/include/qemu/cpu-float.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cryptodev.c /usr/src/debug/qemu/10.1.0/include/qemu/thread-posix.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cryptodev.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_lpc.h /usr/src/debug/qemu/10.1.0/include/system/cpu-timers.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine.h /usr/src/debug/qemu/10.1.0/target/arm/internals.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine-s390x.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine.c /usr/src/debug/qemu/10.1.0/include/exec/tb-flush.h /usr/src/debug/qemu/10.1.0/include/qemu/job.h /usr/src/debug/qemu/10.1.0/trace/trace-linux_user.c /usr/src/debu
 g/qemu/10.1.0/include/qemu/qht.h /usr/src/debug/qemu/10.1.0/include/qemu/unicode.h /usr/src/debug/qemu/10.1.0/include/qemu/qtree.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cryptodev_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-linux_user.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx6_src.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_src.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_e_prci.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_u_prci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cryptodev_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-nbd.c /usr/src/debug/qemu/10.1.0/trace/trace-nbd.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_trace_events.h /usr/src/debug/qemu/10.1.0/include/exec/memop.h /usr/src/debug/qemu/10.1.0/tra
 ce/trace-hw_misc.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-accelerator.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386_kvm.h /usr/src/debug/qemu/10.1.0/include/hw/i386/x86-iommu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-accelerator.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc.h /usr/src/debug/qemu/10.1.0/trace/trace-target_i386_kvm.c /usr/src/debug/qemu/10.1.0/trace/trace-util.c /usr/src/debug/qemu/10.1.0/include/hw/arm/omap.h /usr/src/debug/qemu/10.1.0/include/qemu/coroutine.h /usr/src/debug/qemu/10.1.0/include/qapi/clone-visitor.h /usr/src/debug/qemu/10.1.0/include/system/block-backend-global-state.h /usr/src/debug/qemu/10.1.0/trace/trace-util.h /usr/src/debug/qemu/10.1.0/include/qemu/log-for-trace.h /usr/src/debug/qemu/10.1.0/include/hw/arm/soc_dma.h /usr/src/debug/qemu/10.1.0/include/exec/cputlb.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-core.c /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-ccu.h /usr/src/debug/qemu/10.1.0/include/exec/page-vary.h
  /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block-core.h /usr/src/debug/qemu/10.1.0/include/system/dirtyrate.h /usr/src/debug/qemu/10.1.0/include/exec/mmu-access-type.h /usr/src/debug/qemu/10.1.0/include/qemu/plugin-event.h /usr/src/debug/qemu/10.1.0/include/qapi/util.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_ui_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-job.h /usr/src/debug/qemu/10.1.0/include/qemu/config-file.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_ui_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-job.c /usr/src/debug/qemu/10.1.0/include/system/block-backend-io.h /usr/src/debug/qemu/10.1.0/include/system/ramblock.h /usr/src/debug/qemu/10.1.0/include/hw/arm/armsse-version.h /usr/src/debug/qemu/10.1.0/include/hw/char/mchp_pfsoc_mmuart.h /usr/src/debug/qemu/10.1.0/include/system/dump-arch.h /usr/src/debug/qemu/10.1.0/include/system/cryptodev-vhost.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.trace-events /usr/src/debug/qemu
 /10.1.0/trace/trace-accel_kvm.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_tcg.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_char_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm7xx_pwm.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_char_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_kvm.c /usr/src/debug/qemu/10.1.0/include/hw/arm/linux-boot-if.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/iommu.h /usr/src/debug/qemu/10.1.0/target/i386/kvm/tdx-quote-generator.h /usr/src/debug/qemu/10.1.0/trace/trace-accel_tcg.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_syscfg.h /usr/src/debug/qemu/10.1.0/include/qemu/selfmap.h /usr/src/debug/qemu/10.1.0/include/qemu/seqlock.h /usr/src/debug/qemu/10.1.0/include/hw/misc/led.h /usr/src/debug/qemu/10.1.0/include/system/host_iommu_device.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-virtio.trace-events /usr/src/debug/qemu/10.1.0/in
 clude/hw/misc/imx7_gpr.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cxl.c /usr/src/debug/qemu/10.1.0/include/hw/riscv/boot_opensbi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-migration.c /usr/src/debug/qemu/10.1.0/include/system/cryptodev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-cxl.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-migration.h /usr/src/debug/qemu/10.1.0/trace/trace-gdbstub.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-error.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-stats.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-trace.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio_user.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_uefi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-audio.c /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2835_peripherals.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-authz.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32f4xx_exti.h /usr/src/debug/qemu/10.1.0/include/qemu/iov.h /usr/src/debug/qemu/1
 0.1.0/include/system/hostmem.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-audio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-authz.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-block.h /usr/src/debug/qemu/10.1.0/trace/trace-gdbstub.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_uefi.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_vfio_user.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_dmc.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/opentitan.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qom.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-tpm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-job.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_property.h /usr/src/debug/qemu/10.1.0/include/qemu/target-info-impl.h /usr/src/debug/qemu/10.1.0/include/qemu/target-info-qapi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qom.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-tpm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-job.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-export.h 
 /usr/src/debug/qemu/10.1.0/include/standard-headers/uefi/uefi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-rocker.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-export.c /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f205_soc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-rocker.c /usr/src/debug/qemu/10.1.0/include/hw/arm/boot.h /usr/src/debug/qemu/10.1.0/include/qemu/qemu-progress.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/device.h /usr/src/debug/qemu/10.1.0/include/exec/replay-core.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-compat.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-machine.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-types-compat.h /usr/src/debug/qemu/10.1.0/include/qemu/interval-tree.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-stats.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-migration.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.c /usr/src/debug/qemu/10.1.0/include/qemu/main-loop.h /us
 r/src/debug/qemu/10.1.0/include/qemu/qemu-plugin.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-migration.h /usr/src/debug/qemu/10.1.0/include/qemu/host-pci-mmio.h /usr/src/debug/qemu/10.1.0/include/hw/s390x/storage-keys.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_introspect_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/char/serial-isa.h /usr/src/debug/qemu/10.1.0/include/system/blockdev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-s390x.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_watchdog.h /usr/src/debug/qemu/10.1.0/trace/trace-target_riscv.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_introspect_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-target_riscv.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-s390x.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-migration.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_watchdog.c /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f100_soc.h 
 /usr/src/debug/qemu/10.1.0/include/exec/plugin-gen.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc.trace-events /usr/src/debug/qemu/10.1.0/include/hw/char/ibex_uart.h /usr/src/debug/qemu/10.1.0/trace/trace-backends_tpm.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_xen.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-dump.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_audio_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_rocker_trace_events.c /usr/src/debug/qemu/10.1.0/target/riscv/cpu_cfg_fields.h.inc /usr/src/debug/qemu/10.1.0/trace/trace-hw_xen.c /usr/src/debug/qemu/10.1.0/hw/i386/acpi-build.h /usr/src/debug/qemu/10.1.0/include/qemu/madvise.h /usr/src/debug/qemu/10.1.0/trace/trace-backends_tpm.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_audio_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_rocker_trace_events.h /usr/src/debug/qemu/10.1.0/qapi
 /qapi-commands-qom.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-tpm.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-introspect.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-ui.h /usr/src/debug/qemu/10.1.0/qapi/qapi-introspect.h /usr/src/debug/qemu/10.1.0/include/system/cpus.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-ui.c /usr/src/debug/qemu/10.1.0/qapi/qapi-features.h /usr/src/debug/qemu/10.1.0/trace/trace-monitor.c /usr/src/debug/qemu/10.1.0/include/system/block-ram-registrar.h /usr/src/debug/qemu/10.1.0/include/qemu/rcu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.h /usr/src/debug/qemu/10.1.0/include/qapi/visitor.h /usr/src/debug/qemu/10.1.0/trace/trace-monitor.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx8mp_ccm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_ppc.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_dump_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-container-base.h /us
 r/src/debug/qemu/10.1.0/trace/trace-scsi.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_dump_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-scsi.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_ppc.h /usr/src/debug/qemu/10.1.0/target/riscv/pmu.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-r40-ccu.h /usr/src/debug/qemu/10.1.0/include/exec/translator.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i2c.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.trace-events /usr/src/debug/qemu/10.1.0/include/hw/riscv/microchip_pfsoc.h /usr/src/debug/qemu/10.1.0/include/qemu/queue.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i2c.h /usr/src/debug/qemu/10.1.0/include/hw/misc/npcm7xx_rng.h /usr/src/debug/qemu/10.1.0/trace/trace-ui.h /usr/src/debug/qemu/10.1.0/include/system/address-spaces.h /usr/src/debug/qemu/10.1.0/trace/trace-target_ppc.c /usr/src/debug/qemu/10.1.0/trace/trace-ui.c /usr/src/debug/qemu/10.1.0/include/accel/tcg/probe.h /usr/src/debug/qemu/10.1.0/trace/trace-target_p
 pc.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_export_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_i3c.h /usr/src/debug/qemu/10.1.0/include/qapi/qmp-event.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_export_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-a10.h /usr/src/debug/qemu/10.1.0/include/hw/arm/allwinner-r40.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-transaction.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_mbox.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_mphi.h /usr/src/debug/qemu/10.1.0/target/i386/kvm/kvm_i386.h /usr/src/debug/qemu/10.1.0/target/arm/cpu-qom.h /usr/src/debug/qemu/10.1.0/include/hw/char/shakti_uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine.c /usr/src/debug/qemu/10.1.0/target/sh4/cpu-qom.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine.h /usr/src/debug/qemu/10.1.0/qapi/qapi-type
 s-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-dump.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-qdev.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-crl.h /usr/src/debug/qemu/10.1.0/include/exec/target_long.h /usr/src/debug/qemu/10.1.0/include/qemu/cpuid.h /usr/src/debug/qemu/10.1.0/include/qemu/cutils.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mchp_pfsoc_ioscb.h /usr/src/debug/qemu/10.1.0/include/system/xen-mapcache.h /usr/src/debug/qemu/10.1.0/trace/trace-io.c /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-a10-ccm.h /usr/src/debug/qemu/10.1.0/trace/trace-io.h /usr/src/debug/qemu/10.1.0/include/system/cpu-timers-internal.h /usr/src/debug/qemu/10.1.0/include/qemu/thread.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-migration.h /usr/src/debug/qemu/10.1.0/include/hw/i386/topology.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_intc.h /usr/src/debug/qemu/10.1.0/target/riscv/time_helper.h /usr/src/debug/qemu/10.1.0/q
 api/qapi-types-dump.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc.c /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_xdma.h /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-secctl.h /usr/src/debug/qemu/10.1.0/include/hw/misc/iotkit-sysctl.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-cframe-reg.h /usr/src/debug/qemu/10.1.0/include/qapi/error.h /usr/src/debug/qemu/10.1.0/include/qapi/error-internal.h /usr/src/debug/qemu/10.1.0/include/qemu/async-teardown.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-migration.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_intc.c /usr/src/debug/qemu/10.1.0/include/system/os-posix.h /usr/src/debug/qemu/10.1.0/include/qemu/module.h /usr/src/debug/qemu/10.1.0/include/system/vhost-user-backend.h /usr/src/debug/qemu/10.1.0/trace/control.h /usr/src/debug/qemu/10.1.0/include/system/rtc.h /usr/src/debug/qemu/10.1.0/include/qemu/readline.h /usr/src/debug/qemu/10.1.0/include/exec/memory_ldst.h.inc /usr/src/debug/qemu/10.1.0/trace/trace-hw_mem.c 
 /usr/src/debug/qemu/10.1.0/qapi/qapi-types-sockets.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_net_can.h /usr/src/debug/qemu/10.1.0/include/hw/misc/pvpanic.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_mem.h /usr/src/debug/qemu/10.1.0/include/exec/ramlist.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-sockets.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_net_can.c /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_sdmc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-introspect.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_control_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/i386/hostmem-epc.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_control_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/osdep.h /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2838.h /usr/src/debug/qemu/10.1.0/include/system/confidential-guest-support.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-virtio.h /usr/src/debug/qemu/10.1.0/include/accel/accel-ops.h /usr/src/debug/qemu/1
 0.1.0/qapi/qapi-commands-virtio.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-sockets.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_mips.h /usr/src/debug/qemu/10.1.0/hw/vfio-user/container.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_core.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-sockets.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_core.h /usr/src/debug/qemu/10.1.0/target/arm/multiprocessing.h /usr/src/debug/qemu/10.1.0/include/qemu/error-report.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_mips.c /usr/src/debug/qemu/10.1.0/trace/trace-target_arm.h /usr/src/debug/qemu/10.1.0/include/exec/translation-block.h /usr/src/debug/qemu/10.1.0/trace/trace-target_arm.c /usr/src/debug/qemu/10.1.0/include/qapi/string-output-visitor.h /usr/src/debug/qemu/10.1.0/include/system/hw_accel.h /usr/src/debug/qemu/10.1.0/include/system/memory_mapping.h /usr/src/debug/qemu/10.1.0/include/qemu/event_notifier.h /usr/src/debug/qemu/10.1.0/include/system/cryptodev-vhost-user.h /usr/src/debug/qemu/10.1.0/include/q
 emu/coroutine-core.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.trace-events /usr/src/debug/qemu/10.1.0/include/system/kvm.h /usr/src/debug/qemu/10.1.0/include/system/dirtylimit.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/iommu.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_aes.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_gcr.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_icc.h /usr/src/debug/qemu/10.1.0/include/system/igvm-cfg.h /usr/src/debug/qemu/10.1.0/include/hw/char/cmsdk-apb-uart.h /usr/src/debug/qemu/10.1.0/include/qemu/qsp.h /usr/src/debug/qemu/10.1.0/include/hw/arm/nrf51_soc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_i386_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_e_aon.h /usr/src/debug/qemu/10.1.0/include/hw/misc/sifive_u_otp.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-qom.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block.h /usr/src/debug/qem
 u/10.1.0/qapi/qapi-types-qom.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_i386_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/char/bcm2835_aux.h /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_rcc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-crypto.h /usr/src/debug/qemu/10.1.0/include/qemu/plugin-memory.h /usr/src/debug/qemu/10.1.0/include/hw/char/xilinx_uartlite.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-virtio.h /usr/src/debug/qemu/10.1.0/common-user/plugin-api.c.inc /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-crypto.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-virtio.c /usr/src/debug/qemu/10.1.0/include/qapi/string-input-visitor.h /usr/src/debug/qemu/10.1.0/include/exec/gdbstub.h /usr/src/debug/qemu/10.1.0/include/qemu/chardev_open.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_fsi.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_char.c /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-visit.c /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-visit.h /usr/src/debug/qemu/
 10.1.0/trace/trace-hw_char.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_fsi.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-pci.c /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-pci.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-trng.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-core.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-ui.trace-events /usr/src/debug/qemu/10.1.0/include/hw/char/parallel-isa.h /usr/src/debug/qemu/10.1.0/trace/trace-target_mips_tcg.h /usr/src/debug/qemu/10.1.0/include/exec/hwaddr.h /usr/src/debug/qemu/10.1.0/trace/trace-target_mips_tcg.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-char.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-replay.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-du
 mp.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc.c /usr/src/debug/qemu/10.1.0/include/qapi/visitor-impl.h /usr/src/debug/qemu/10.1.0/include/qemu/datadir.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-core.c /usr/src/debug/qemu/10.1.0/include/hw/arm/raspberrypi-fw-defs.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-transaction.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-control.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block-core.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-transaction.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-dump.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu_cfg.h /usr/src/debug/qemu/10.1.0/include/qemu/timed-average.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-control.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-replay.c /usr/src/debug/qemu/10.1.0/include/hw/char/sifive_uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.c /usr/src/debug/qe
 mu/10.1.0/qapi/qapi-types-misc-i386.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-control.c /usr/src/debug/qemu/10.1.0/include/hw/char/parallel.h /usr/src/debug/qemu/10.1.0/target/riscv/cpu-qom.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mos6522.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc_macio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_misc_macio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-trace.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-cpr.h /usr/src/debug/qemu/10.1.0/include/exec/breakpoint.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-misc-i386.h /usr/src/debug/qemu/10.1.0/include/qemu/hbitmap.h /usr/src/debug/qemu/10.1.0/include/qemu/mprotect.h /usr/src/debug/qemu/10.1.0/include/hw/misc/empty_slot.h /usr/src/debug/qemu/10.1.0/include/exec/mmap-lock.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/riscv_hart.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_cprman.h /usr/src/debug/qemu/10.1.0/qapi/qapi-command
 s-misc.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qdev_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-device.h /usr/src/debug/qemu/10.1.0/include/qemu/lockcnt.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.h /usr/src/debug/qemu/10.1.0/target/arm/cpu-features.h /usr/src/debug/qemu/10.1.0/include/system/seccomp.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-net.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_arm_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-a10-dramc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-r40-dramc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_cprman_internals.h /usr/src/debug/qemu/10.1.0/include/qemu/futex.h /usr/src/debug/qemu/10.1.0/include/hw/i386/vmport.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_misc_arm_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_run_state_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-yank.trace-events /us
 r/src/debug/qemu/10.1.0/include/hw/misc/allwinner-h3-sysctrl.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-qdev.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_run_state_trace_events.c /usr/src/debug/qemu/10.1.0/include/qemu/plugin.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_sli.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-export.c /usr/src/debug/qemu/10.1.0/include/hw/misc/imx25_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx31_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/arm/digic.h /usr/src/debug/qemu/10.1.0/include/system/iommufd.h /usr/src/debug/qemu/10.1.0/include/system/qtest.h /usr/src/debug/qemu/10.1.0/include/system/reset.h /usr/src/debug/qemu/10.1.0/include/system/stats.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-block-export.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-i386.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_replay_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci_host.c /usr/src/debug/qemu/
 10.1.0/trace/trace-hw_usb.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-i386.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_replay_trace_events.c /usr/src/debug/qemu/10.1.0/include/qapi/qobject-input-visitor.h /usr/src/debug/qemu/10.1.0/include/exec/tlb-common.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci_host.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_usb.h /usr/src/debug/qemu/10.1.0/include/qemu/thread-context.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-tpm.h /usr/src/debug/qemu/10.1.0/include/system/balloon.h /usr/src/debug/qemu/10.1.0/include/system/kvm_xen.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_hyperv.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_remote.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_sensor.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_virtio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_hyperv.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_remote.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sensor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-tpm.c /usr/
 src/debug/qemu/10.1.0/trace/trace-hw_virtio.h /usr/src/debug/qemu/10.1.0/include/hw/arm/aspeed_soc.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_trace_trace_events.c /usr/src/debug/qemu/10.1.0/include/system/kvm_int.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_trace_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_kvm.c /usr/src/debug/qemu/10.1.0/include/qemu/lockable.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qom_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_tpm_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cxl_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_job_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_i386_kvm.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_net_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_pci_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_cxl_trace_events.c /usr/src/debug/qemu/10.1.0/trace/tr
 ace-qapi_commands_job_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_net_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/arm/bcm2838_peripherals.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_pci_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_qom_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32f4xx_syscfg.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_tpm_trace_events.c /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu-target.h /usr/src/debug/qemu/10.1.0/include/system/watchdog.h /usr/src/debug/qemu/10.1.0/include/hw/i386/pc.h /usr/src/debug/qemu/10.1.0/include/qemu/fifo32.h /usr/src/debug/qemu/10.1.0/include/qemu/qemu-print.h /usr/src/debug/qemu/10.1.0/include/accel/tcg/cpu-ldst-common.h /usr/src/debug/qemu/10.1.0/include/qemu/option.h /usr/src/debug/qemu/10.1.0/include/qemu/fifo8.h /usr/src/debug/qemu/10.1.0/include/qemu/vhost-user-server.h /usr/src/debug/qemu/10.1.0/include/system/block-backend-common.
 h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cxl.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-cxl.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-cfu.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-common.h /usr/src/debug/qemu/10.1.0/include/qemu/stats64.h /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-types.c /usr/src/debug/qemu/10.1.0/include/system/event-loop-base.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-machine-common.c /usr/src/debug/qemu/10.1.0/include/qemu/filemonitor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-builtin-types.h /usr/src/debug/qemu/10.1.0/include/qemu/yank.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-cfi-if.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx6_ccm.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_ccm.h /usr/src/debug/qemu/10.1.0/include/qemu/keyval.h /usr/src/debug/qemu/10.1.0/include/qemu/memfd.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sd.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-machine.c /usr/src/debug/qemu/10.1.0/include/h
 w/arm/fsl-imx8mp.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/xiangshan_kmh.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-cpu-pwrctrl.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-machine.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sd.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32l4x5_rcc_internals.h /usr/src/debug/qemu/10.1.0/include/hw/char/serial.h /usr/src/debug/qemu/10.1.0/include/hw/char/imx_serial.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_sbc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx8mp_analog.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_virtio_trace_events.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-acpi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-char.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-dump.c /usr/src/debug/qemu/10.1.0/qapi/qapi-events-misc.c /usr/src/debug/qemu/10.1.0/include/qapi/qobject-output-visitor.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-qdev.c /usr/src/debug
 /qemu/10.1.0/trace/trace-qapi_commands_virtio_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-vfio.c /usr/src/debug/qemu/10.1.0/include/qemu/bitops.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.trace-events /usr/src/debug/qemu/10.1.0/include/hw/misc/a9scu.h /usr/src/debug/qemu/10.1.0/include/hw/misc/unimp.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/boot.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/numa.h /usr/src/debug/qemu/10.1.0/include/hw/riscv/virt.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-block.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-char.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-dump.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-misc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-events-qdev.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-tpm.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-tpm.h /usr/src/debug/qemu/10.1.0/include/hw/arm/smmu-common.h /usr/src/debug/qemu/10.1.0/include/qemu/mmap-alloc.h /usr
 /src/debug/qemu/10.1.0/trace/trace-authz.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qdev.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-uefi.c /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-vfio.c /usr/src/debug/qemu/10.1.0/include/hw/misc/stm32_rcc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-yank.c /usr/src/debug/qemu/10.1.0/trace/trace-authz.c /usr/src/debug/qemu/10.1.0/include/qemu/envlist.h /usr/src/debug/qemu/10.1.0/include/hw/misc/imx7_snvs.h /usr/src/debug/qemu/10.1.0/include/qemu/range.h /usr/src/debug/qemu/10.1.0/include/system/device_tree.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-qdev.h /usr/src/debug/qemu/10.1.0/include/hw/i386/x86.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-uefi.h /usr/src/debug/qemu/10.1.0/include/hw/char/nrf51_uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-vfio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-yank.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci.c /usr/src/debug/qemu/10.1.0/include/hw/mi
 sc/npcm_clk.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.c /usr/src/debug/qemu/10.1.0/include/hw/i386/apic_internal.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-acpi.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-hw_pci.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-misc-i386.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-job.h /usr/src/debug/qemu/10.1.0/include/hw/arm/exynos4210.h /usr/src/debug/qemu/10.1.0/include/hw/misc/xlnx-versal-xramc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-acpi.c /usr/src/debug/qemu/10.1.0/include/accel/accel-cpu-ops.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_accelerator_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-pci.h /usr/src/debug/qemu/10.1.0/include/hw/char/max78000_uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-cxl.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-pci.c /usr/src/debug/qemu/10.1.0
 /trace/trace-qapi_commands_accelerator_trace_events.c /usr/src/debug/qemu/10.1.0/include/qapi/compat-policy.h /usr/src/debug/qemu/10.1.0/include/qemu/progress_meter.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_adc.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_transaction_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_core_trace_events.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_transaction_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/misc/armv7m_ras.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_scu.h /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32f405_soc.h /usr/src/debug/qemu/10.1.0/include/hw/arm/stm32l4x5_soc.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-pci.trace-events /usr/src/debug/qemu/10.1.0/trace/trace-hw_adc.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_block_core_trace_events.h /usr/src/debug/qemu/10.1.0/include/hw/char/pl011.h /usr/src/debug/qemu/10.1.0/include/hw/arm/npcm7xx.h /usr/src/debug/qemu/10
 .1.0/include/hw/arm/npcm8xx.h /usr/src/debug/qemu/10.1.0/include/qemu/ratelimit.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-migration.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-char.c /usr/src/debug/qemu/10.1.0/trace/trace-audio.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_sh4.h /usr/src/debug/qemu/10.1.0/include/system/iothread.h /usr/src/debug/qemu/10.1.0/trace/trace-audio.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_sh4.c /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-char.h /usr/src/debug/qemu/10.1.0/include/hw/misc/mips_cpc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-sid.h /usr/src/debug/qemu/10.1.0/trace/trace-migration.c /usr/src/debug/qemu/10.1.0/include/exec/log.h /usr/src/debug/qemu/10.1.0/include/qemu/log.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_isa.h /usr/src/debug/qemu/10.1.0/trace/trace-net.h /usr/src/debug/qemu/10.1.0/include/hw/misc/armsse-cpuid.h /usr/src/debug/qemu/10.1.0/include/hw/misc/ivshmem-flat.h /usr/src/debug/qemu/10.1.0/trace
 /trace-migration.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_isa.c /usr/src/debug/qemu/10.1.0/trace/trace-net.c /usr/src/debug/qemu/10.1.0/include/hw/riscv/shakti_c.h /usr/src/debug/qemu/10.1.0/include/qemu/sys_membarrier.h /usr/src/debug/qemu/10.1.0/include/hw/misc/max78000_trng.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.c /usr/src/debug/qemu/10.1.0/include/hw/misc/bcm2835_rng.h /usr/src/debug/qemu/10.1.0/include/qemu/systemd.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-replay.trace-events /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-run-state.h /usr/src/debug/qemu/10.1.0/include/hw/arm/max78000_soc.h /usr/src/debug/qemu/10.1.0/include/hw/misc/allwinner-cpucfg.h /usr/src/debug/qemu/10.1.0/include/qemu/help_option.h /usr/src/debug/qemu/10.1.0/include/hw/vfio/vfio-amd-xgbe.h /usr/src/debug/qemu/10.1.0/include/system/tpm_backend.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-arm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-commands-rocker.trace-events /usr/src/debug/qe
 mu/10.1.0/trace/trace-hw_ide.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_migration_trace_events.h /usr/src/debug/qemu/10.1.0/qapi/qapi-visit-misc-arm.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_ide.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_migration_trace_events.c /usr/src/debug/qemu/10.1.0/include/hw/misc/vmcoreinfo.h /usr/src/debug/qemu/10.1.0/include/hw/char/riscv_htif.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-introspect.h /usr/src/debug/qemu/10.1.0/include/qemu/bswap.h /usr/src/debug/qemu/10.1.0/trace/event-internal.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-introspect.c /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_yank_trace_events.h /usr/src/debug/qemu/10.1.0/trace/trace-qapi_commands_yank_trace_events.c /usr/src/debug/qemu/10.1.0/include/exec/cpu-common.h /usr/src/debug/qemu/10.1.0/include/hw/misc/aspeed_hace.h /usr/src/debug/qemu/10.1.0/include/hw/char/cadence_uart.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-uefi.h /usr/src/debug/qemu/10
 .1.0/qapi/qapi-types-vfio.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-yank.h /usr/src/debug/qemu/10.1.0/trace/trace-hw_arm.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-yank.c /usr/src/debug/qemu/10.1.0/trace/trace-hw_arm.c /usr/src/debug/qemu/10.1.0/include/hw/misc/mps2-fpgaio.h /usr/src/debug/qemu/10.1.0/include/qemu/bitmap.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-acpi.h /usr/src/debug/qemu/10.1.0/qapi/qapi-types-char.c /usr/src/debug/qemu/10.1.0/qapi/qapi-types-uefi.c"
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
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips: PKGSIZE changed from 3149632 to 3211600 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64: PKGSIZE changed from 3182112 to 3248176 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: RDEPENDS: added "zlib (['>= 1.3.1'])"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mips64el: PKGSIZE changed from 3173920 to 3235888 (+2%)
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PKGV changed from 10.0.2 [default] to 10.1.0 [default]
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: PV changed from "10.0.2" to "10.1.0"
packages/x86-64-v3-poky-linux/qemu/qemu-user-mipsel: RDEPENDS: added "zlib (['>= 1.3.1'])"
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

--===============2600330818256897111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="buildhistory-diff.txt"

packages/x86-64-v3-poky-linux/qemu/qemu-common: FILELIST: removed "/usr/share/qemu/canyonlands.dtb /usr/share/qemu/bamboo.dtb /usr/share/qemu/petalogix-ml605.dtb /usr/share/qemu/petalogix-s3adsp1800.dtb", added "/usr/share/qemu/ast27x0_bootrom.bin /usr/share/qemu/dtb/petalogix-ml605.dtb /usr/share/qemu/dtb/canyonlands.dtb /usr/share/qemu/dtb/bamboo.dtb /usr/share/qemu/dtb/petalogix-s3adsp1800.dtb"
packages/x86-64-v3-poky-linux/qemu/qemu-ptest: FILELIST: removed "/usr/lib/qemu/ptest/tests/avocado/README.rst /usr/lib/qemu/ptest/tests/avocado/reverse_debugging.py /usr/lib/qemu/ptest/tests/avocado/boot_linux_console.py /usr/lib/qemu/ptest/tests/avocado/smmu.py /usr/lib/qemu/ptest/tests/avocado/linux_ssh_mips_malta.py /usr/lib/qemu/ptest/tests/avocado/replay_linux.py /usr/lib/qemu/ptest/tests/avocado/boot_linux.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/linuxtest.py /usr/lib/qemu/ptest/tests/avocado/replay_kernel.py /usr/lib/qemu/ptest/tests/avocado/avocado_qemu/__init__.py", added "/usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC.topology /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.hpoffacpiindex /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/HEST /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/MCFG /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT.numamem /usr/lib/qemu/ptest
 /tests/data/acpi/loongarch64/virt/SRAT.numamem /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/APIC /usr/lib/qemu/ptest/tests/qtest/ast2700-hace-test /usr/lib/qemu/ptest/tests/qtest/aspeed_scu-test /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SLIT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SPCR /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/FACP /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/PPTT.topology /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.topology /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.viot /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/DSDT.acpipcihp /usr/lib/qemu/ptest/tests/data/uefi-boot-images/bios-tables-test.loongarch64.iso.qcow2 /usr/lib/qemu/ptest/tests/data/acpi
 /aarch64/virt/APIC.its_off /usr/lib/qemu/ptest/tests/data/acpi/aarch64/virt/IORT.its_off /usr/lib/qemu/ptest/tests/tcg/plugins/libpatch.so /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/DSDT.memhp /usr/lib/qemu/ptest/tests/data/acpi/loongarch64/virt/SRAT.memhp"
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

--===============2600330818256897111==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment; filename="bitbake-output-qemuarm_musl.txt"

NOTE: Reconnecting to bitbake server...
Loading cache...done.
Loaded 0 entries from dependency cache.
Parsing recipes...done.
Parsing of 944 .bb files complete (0 cached, 944 parsed). 1940 targets, 51 skipped, 0 masked, 0 errors.
Removing 152 recipes from the qemux86_64 sysroot...done.
Removing 139 recipes from the x86-64-v3 sysroot...done.
NOTE: Resolving any missing task queue dependencies

Build Configuration:
BB_VERSION           = "2.15.2"
BUILD_SYS            = "x86_64-linux"
NATIVELSBSTRING      = "universal"
TARGET_SYS           = "x86_64-poky-linux-musl"
MACHINE              = "qemux86-64"
DISTRO               = "poky"
DISTRO_VERSION       = "5.2.99+snapshot-7fb9b125052eeb80733f0ca0b0d3312979cd8857"
TUNE_FEATURES        = "m64 x86-64-v3"
TARGET_FPU           = ""
meta                 
meta-poky            
meta-yocto-bsp       
workspace            = "tmp-auh-upgrades:7fb9b125052eeb80733f0ca0b0d3312979cd8857"

Initialising tasks...NOTE: The /proc/pressure files can't be read. Continuing build without monitoring pressure
Sstate summary: Wanted 978 Local 736 Mirrors 0 Missed 242 Current 412 (75% match, 82% complete)
Removing 5 stale sstate objects for arch allarch...done.
Removing 2 stale sstate objects for arch qemux86_64...done.
Removing 5 stale sstate objects for arch x86_64...done.
NOTE: Executing Tasks
NOTE: Running setscene task 457 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_deb_setscene)
NOTE: Running setscene task 459 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_ipk_setscene)
NOTE: Running setscene task 467 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_write_rpm_setscene)
NOTE: Running setscene task 506 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_package_qa_setscene)
NOTE: Running setscene task 520 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.1.0.bb:do_populate_lic_setscene)
NOTE: Running setscene task 532 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/perl/perl_5.40.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 536 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 537 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 545 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/make/make_4.4.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 547 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/sed/sed_4.9.bb:do_packagedata_setscene)
NOTE: Running setscene task 578 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 581 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 587 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_create_spdx_setscene)
NOTE: Running setscene task 588 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_create_spdx_setscene)
NOTE: Running setscene task 591 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 593 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-10.1.0-r0: task do_populate_lic_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Started
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_qa_setscene: Succeeded
NOTE: Running setscene task 624 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_create_spdx_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_deb_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_ipk_setscene: Succeeded
NOTE: Running setscene task 629 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_package_write_rpm_setscene: Succeeded
NOTE: Running setscene task 633 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 634 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 635 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 637 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 639 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/psmisc/psmisc_23.7.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 642 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_create_spdx_setscene)
NOTE: recipe readline-8.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe qemu-10.1.0-r0: task do_populate_lic_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 647 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_create_spdx_setscene)
NOTE: Running setscene task 648 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 650 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 651 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 652 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_populate_sysroot_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libclc-21.1.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe update-rc.d-0.8+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 655 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_create_spdx_setscene)
NOTE: recipe make-4.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 658 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_create_spdx_setscene)
NOTE: recipe libsdl2-2.32.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 659 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 661 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe initscripts-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 664 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 665 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_create_spdx_setscene)
NOTE: recipe libslirp-4.9.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libclc-21.1.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 668 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 669 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 678 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_recipe_qa_setscene)
NOTE: recipe sed-4.9-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 684 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 686 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 688 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 689 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_create_spdx_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 692 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_packagedata_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 696 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 698 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 700 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_packagedata_setscene)
NOTE: recipe shadow-sysroot-4.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 704 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 707 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe virglrenderer-1.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 709 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_create_spdx_setscene)
NOTE: recipe libsdl2-2.32.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 715 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_create_spdx_setscene)
NOTE: recipe pixman-1_0.46.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe psmisc-23.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 716 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_create_spdx_setscene)
NOTE: recipe coreutils-9.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 719 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe libslirp-4.9.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 720 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 725 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_create_spdx_setscene)
NOTE: Running setscene task 726 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_create_spdx_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 728 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 735 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_packagedata_setscene)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-cross-x86_64-git-r0: task do_create_spdx_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe qemu-10.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libatomic-ops-7.8.4-r0: task do_packagedata_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 737 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 738 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_packagedata_setscene)
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-cross-x86_64-git-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe qemu-10.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 744 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 745 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_create_spdx_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 746 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_populate_sysroot_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 747 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow-sysroot_4.6.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 748 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 749 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_create_spdx_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 753 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_create_spdx_setscene)
NOTE: Running setscene task 757 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libucontext-1.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 760 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 762 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 764 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 766 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libatomic-ops-7.8.4-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 774 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe shadow-sysroot-4.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 777 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe virglrenderer-1.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 779 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_populate_sysroot_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 784 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_create_spdx_setscene)
NOTE: recipe libdaemon-0.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 789 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_create_spdx_setscene)
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 792 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 793 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_create_spdx_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 797 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 803 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 804 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_packagedata_setscene)
NOTE: recipe libatomic-ops-7.8.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 806 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_packagedata_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 808 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-21.1.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 812 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_create_spdx_setscene)
NOTE: recipe avahi-0.8-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 814 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 815 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_25.2.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 818 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libdaemon/libdaemon_0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libclc-21.1.1-r0: task do_packagedata_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 819 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe mesa-2_25.2.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 821 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_create_spdx_setscene)
NOTE: Running setscene task 823 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 824 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_create_spdx_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 825 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_package_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libclc-21.1.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe ofono-2.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdaemon-0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ofono-2.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libclc-21.1.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 826 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_create_spdx_setscene)
NOTE: Running setscene task 827 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 830 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/sbc/sbc_2.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 831 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 835 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 836 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 837 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 839 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/ptest-runner/ptest-runner_2.4.5.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 840 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 842 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 844 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_create_spdx_setscene)
NOTE: Running setscene task 846 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_create_spdx_setscene)
NOTE: Running setscene task 848 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 849 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe sbc-2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ptest-runner-2.4.5.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 852 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 853 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 862 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 863 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 865 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libatomic-ops/libatomic-ops_7.8.4.bb:do_recipe_qa_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_create_spdx_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 869 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_create_spdx_setscene)
NOTE: Running setscene task 870 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe xrandr-1_1.5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 871 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_create_spdx_setscene)
NOTE: Running setscene task 872 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 873 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe avahi-0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe file-5.46-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 875 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 876 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_create_spdx_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 879 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/speex/speexdsp_1.2.1.bb:do_recipe_qa_setscene)
NOTE: recipe readline-8.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 881 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe ell-0.79-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe ofono-2.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libatomic-ops-7.8.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe mesa-2_25.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.79-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 882 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe ofono-2.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libatomic-ops-7.8.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 884 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 888 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_create_spdx_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 889 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_create_spdx_setscene)
NOTE: Running setscene task 892 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 893 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 894 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_recipe_qa_setscene)
NOTE: recipe mesa-2_25.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe speexdsp-1.2.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 895 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 898 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 899 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 902 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_create_spdx_setscene)
NOTE: recipe libffi-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 903 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 905 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_create_spdx_setscene)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 910 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_recipe_qa_setscene)
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 912 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe pulseaudio-17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_package_setscene: Started
NOTE: Running setscene task 913 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 916 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 917 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 919 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_create_spdx_setscene)
NOTE: Running setscene task 921 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_recipe_qa_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 929 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 930 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 931 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 933 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_packagedata_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 935 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 936 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/update-rc.d/update-rc.d_0.8.bb:do_packagedata_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 937 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang-cross_git.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 939 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_recipe_qa_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Started
NOTE: recipe bluez5-5.84-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 940 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 941 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_recipe_qa_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Started
NOTE: recipe clang-cross-x86_64-git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bluez5-5.84-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 943 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/libclc_git.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 944 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_create_spdx_setscene)
NOTE: recipe attr-2.5.2-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 945 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool_2.5.4.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 948 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_packagedata_setscene)
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 949 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe ell-0.79-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 951 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 955 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_packagedata_setscene)
NOTE: recipe update-rc.d-0.8+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 958 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Started
NOTE: recipe libclc-21.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe flac-1.5.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 960 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 962 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_packagedata_setscene)
NOTE: recipe clang-cross-x86_64-git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 964 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 966 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 967 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_populate_sysroot_setscene)
NOTE: recipe clang-21.1.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libclc-21.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 968 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Started
NOTE: recipe initscripts-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zlib-1.3.1-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 974 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 975 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_recipe_qa_setscene)
NOTE: recipe libtool-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe clang-21.1.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 976 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe clang-21.1.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 980 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 981 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 982 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_create_spdx_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe clang-21.1.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 985 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_create_spdx_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 987 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 988 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 989 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libsndfile/libsndfile1_1.2.2.bb:do_recipe_qa_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 991 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Started
NOTE: Running setscene task 993 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe flac-1.5.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 994 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 995 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/readline/readline_8.3.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 996 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_packagedata_setscene)
NOTE: Running setscene task 998 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1003 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1004 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_recipe_qa_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1005 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-tools_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1006 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libvorbis-1.3.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1015 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1016 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bluez5-5.84-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1018 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsndfile1-1.2.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1020 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1023 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/alsa/alsa-lib_1.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe readline-8.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1024 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: recipe libical-3.0.20-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1025 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_create_spdx_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1027 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe base-files-3.0.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1029 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe spirv-tools-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1030 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_recipe_qa_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1031 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1034 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1036 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxml2-2.14.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1038 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/initscripts/initscripts_1.0.bb:do_recipe_qa_setscene)
NOTE: recipe binutils-2.45-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1039 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1041 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_populate_sysroot_setscene)
NOTE: recipe alsa-lib-1.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1042 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1044 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_recipe_qa_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1045 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_recipe_qa_setscene)
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1048 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe icu-77-1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1049 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_populate_sysroot_setscene)
NOTE: recipe kmod-34.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1050 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-passwd/base-passwd_3.6.7.bb:do_recipe_qa_setscene)
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1051 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1052 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libvorbis/libvorbis_1.3.7.bb:do_recipe_qa_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe eudev-3.2.14-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vulkan-headers-1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1053 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/flac/flac_1.5.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1054 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_recipe_qa_setscene)
NOTE: recipe initscripts-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1055 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1056 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1057 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_populate_sysroot_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1058 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libogg-1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1059 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe binutils-2.45-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1066 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_recipe_qa_setscene)
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1067 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/libogg/libogg_1.3.6.bb:do_recipe_qa_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe vala-0.56.18-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1068 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_populate_sysroot_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe base-passwd-3.6.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1069 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_recipe_qa_setscene)
NOTE: recipe libvorbis-1.3.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1072 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_packagedata_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1073 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe flac-1.5.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe musl-legacy-error-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1074 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1076 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_packagedata_setscene)
NOTE: Running setscene task 1077 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1078 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_packagedata_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1079 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-headers_1.4.321.0.bb:do_recipe_qa_setscene)
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libarchive-3.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1081 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_packagedata_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1084 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/icu/icu_77-1.bb:do_recipe_qa_setscene)
NOTE: recipe libogg-1.3.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1088 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_packagedata_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1089 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_packagedata_setscene)
NOTE: recipe wayland-1.24.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1092 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_create_spdx_setscene)
NOTE: recipe vala-0.56.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1093 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/libxml/libxml2_2.14.6.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1094 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-obstack-1.2.3-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1096 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1101 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1102 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1103 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_populate_sysroot_setscene)
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Started
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1105 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_populate_sysroot_setscene)
NOTE: recipe spirv-headers-1_1.4.321.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1106 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libarchive/libarchive_3.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe argp-standalone-1.4.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1109 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_packagedata_setscene)
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe icu-77-1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1110 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libxml2-2.14.6-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1111 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe json-c-0.18-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1115 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1117 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_packagedata_setscene)
NOTE: Running setscene task 1118 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1119 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_packagedata_setscene)
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1121 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_populate_sysroot_setscene)
NOTE: recipe curl-8.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1122 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1124 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_recipe_qa_setscene)
NOTE: recipe libarchive-3.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1125 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_packagedata_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1128 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe file-5.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1130 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1132 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1133 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1135 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Started
NOTE: recipe acl-2.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1137 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_populate_sysroot_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1138 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe file-5.46-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1139 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_populate_sysroot_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-setuptools-80.9.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1141 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe perl-5.40.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1142 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_recipe_qa_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1143 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1144 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1148 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xtrans-1_1.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1149 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1150 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe bash-5.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1153 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-obstack.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1157 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_packagedata_setscene)
NOTE: recipe bash-completion-2.16.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1159 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/fts/fts_1.2.7.bb:do_recipe_qa_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1162 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl-legacy-error.bb:do_recipe_qa_setscene)
NOTE: recipe python3-setuptools-80.9.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1163 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_populate_sysroot_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1165 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/curl/curl_8.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe libx11-1_1.8.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1166 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1168 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe gnutls-3.8.10-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1169 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1174 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_create_spdx_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1175 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1176 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_recipe_qa_setscene)
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xcb-proto-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1177 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/json-c/json-c_0.18.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1179 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe musl-obstack-1.2.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1180 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1181 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe musl-legacy-error-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe fts-1.2.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1186 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/argp-standalone/argp-standalone_1.4.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1189 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1190 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe curl-8.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1191 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-5.3-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1192 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_create_spdx_setscene: Succeeded
NOTE: Running setscene task 1194 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_populate_sysroot_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1197 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libpcre/libpcre2_10.46.bb:do_recipe_qa_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1202 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/file/file_5.46.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1204 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/bash-completion/bash-completion_2.16.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe json-c-0.18-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1205 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xtrans_1.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1206 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_packagedata_setscene)
NOTE: Running setscene task 1207 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bash/bash_5.3.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1210 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe util-linux-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1211 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe argp-standalone-1.4.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1212 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_packagedata_setscene)
NOTE: Running setscene task 1214 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_packagedata_setscene)
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Started
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1215 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_packagedata_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1216 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_packagedata_setscene)
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Started
NOTE: recipe file-5.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpcre2-10.46-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe bash-completion-2.16.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1221 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1222 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3-setuptools_80.9.0.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1223 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/acl_2.3.2.bb:do_recipe_qa_setscene)
NOTE: recipe xtrans-1_1.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1226 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1228 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bash-5.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1229 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap-ng/libcap-ng_0.8.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1230 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Started
NOTE: recipe zstd-1.5.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe attr-2.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1232 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1235 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_packagedata_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Started
NOTE: recipe lzlib-1.15-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1236 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libidn2-2.3.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1237 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1240 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_recipe_qa_setscene)
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1243 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/gnutls_3.8.10.bb:do_recipe_qa_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Started
NOTE: recipe python3-setuptools-80.9.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1245 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: recipe acl-2.3.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1249 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpthread-stubs_0.5.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1250 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xcb-proto_1.17.0.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-ng-0.8.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1251 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgpg-error/libgpg-error_1.55.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1254 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_deploy_source_date_epoch_setscene)
NOTE: Running setscene task 1255 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_packagedata_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1256 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1257 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene)
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1259 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_packagedata_setscene)
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1260 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_packagedata_setscene)
NOTE: recipe nettle-3.10.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-macros-1_1.20.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1261 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: Running setscene task 1263 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/zstd/zstd_1.5.7.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1264 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_populate_sysroot_setscene)
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gnutls-3.8.10-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1267 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/attr/attr_2.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libpthread-stubs-0.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1268 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_packagedata_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libseccomp-2.6.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1269 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_packagedata_setscene)
NOTE: Running setscene task 1270 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Started
NOTE: recipe xcb-proto-1.17.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1271 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_recipe_qa_setscene)
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_deploy_source_date_epoch_setscene: Succeeded
NOTE: Running setscene task 1273 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libgpg-error-1.55-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1274 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1275 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_populate_sysroot_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe zstd-1.5.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1278 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_packagedata_setscene)
NOTE: Running setscene task 1279 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_populate_sysroot_setscene)
WARNING: Logfile for failed setscene task is /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/util-linux-libuuid/2.41.1/temp/log.do_packagedata_setscene.2046257
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Started
WARNING: Setscene task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata_setscene) failed with exit code '1' - real task will be run instead
NOTE: Running setscene task 1280 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_packagedata_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1281 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libedit-20250104-3.1-r1: task do_packagedata_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1282 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_packagedata_setscene)
NOTE: recipe attr-2.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1284 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_populate_sysroot_setscene)
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1286 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1287 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_populate_sysroot_setscene)
NOTE: recipe libxau-1_1.0.12-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1288 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_packagedata_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1289 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_recipe_qa_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1290 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/python/python3_3.13.7.bb:do_recipe_qa_setscene)
NOTE: recipe bzip2-1.0.8-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1292 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gnutls/libtasn1_4.20.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1294 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe sqlite3-3_3.48.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1296 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/lzip/lzlib_1.15.bb:do_recipe_qa_setscene)
NOTE: recipe expat-2.7.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1298 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/nettle/nettle_3.10.2.bb:do_recipe_qa_setscene)
NOTE: recipe zlib-1.3.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1300 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1302 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_packagedata_setscene)
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1303 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_package_setscene)
NOTE: recipe gmp-6.3.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1307 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_packagedata_setscene)
NOTE: recipe expat-2.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1308 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_populate_sysroot_setscene)
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Started
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1310 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gdbm/gdbm_1.26.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1315 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/libidn/libidn2_2.3.8.bb:do_recipe_qa_setscene)
NOTE: recipe libtasn1-4.20.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1317 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-util/util-macros_1.20.2.bb:do_recipe_qa_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1319 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libseccomp/libseccomp_2.6.0.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1321 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/gmp/gmp_6.3.0.bb:do_recipe_qa_setscene)
NOTE: recipe xz-5.8.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1323 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libffi/libffi_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe python3-3.13.7-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe lzlib-1.15-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1326 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libedit/libedit_20250104-3.1.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1327 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/bzip2/bzip2_1.0.8.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Started
NOTE: recipe nettle-3.10.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Started
NOTE: Running setscene task 1328 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/expat/expat_2.7.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_package_setscene: Started
NOTE: recipe xorgproto-2024.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1330 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/sqlite/sqlite3_3.48.0.bb:do_recipe_qa_setscene)
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libunistring-1.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1332 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/xz/xz_5.8.1.bb:do_recipe_qa_setscene)
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe openssl-3.5.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1333 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/zlib/zlib_1.3.1.bb:do_recipe_qa_setscene)
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Started
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gdbm-1.26-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1335 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/openssl/openssl_3.5.2.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libidn2-2.3.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Started
NOTE: recipe util-macros-1_1.20.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running setscene task 1338 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libunistring/libunistring_1.3.bb:do_recipe_qa_setscene)
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libseccomp-2.6.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gmp-6.3.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libffi-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libedit-20250104-3.1-r1: task do_recipe_qa_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe bzip2-1.0.8-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe expat-2.7.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe sqlite3-3_3.48.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Started
NOTE: recipe zlib-1.3.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe xz-5.8.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1341 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1342 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1343 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ncurses/ncurses_6.5.bb:do_recipe_qa_setscene)
NOTE: recipe libunistring-1.3-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe openssl-3.5.2-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_package_setscene: Succeeded
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Started
NOTE: Running setscene task 1344 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1346 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_recipe_qa_setscene)
NOTE: recipe ncurses-6.5-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1348 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_packagedata_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1350 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/opkg-utils/opkg-utils_0.7.0.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libtool-cross-2.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1351 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1353 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/libtool/libtool-cross_2.5.4.bb:do_recipe_qa_setscene)
NOTE: Running task 558 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_fetch)
NOTE: recipe opkg-utils-0.7.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 656 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_write_config)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 706 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1355 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_packagedata_setscene)
NOTE: recipe libtool-cross-2.5.4-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_fetch: Succeeded
NOTE: Running task 764 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_unpack)
NOTE: Running task 809 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_fetch: Started
NOTE: Running task 868 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_fetch: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Started
NOTE: Running task 894 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_unpack)
NOTE: recipe libpam-1.7.1-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Started
NOTE: Running task 952 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_fetch)
NOTE: Running task 954 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_fetch)
NOTE: Running task 960 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_fetch)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Started
NOTE: Running task 986 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_fetch)
NOTE: Running task 993 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_write_config: Started
NOTE: Running task 1020 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_write_config)
NOTE: recipe util-linux-2.41.1-r0: task do_fetch: Succeeded
NOTE: Running task 1027 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_write_config)
NOTE: Running task 1035 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_write_config)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_unpack: Started
NOTE: Running task 1040 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_unpack)
NOTE: recipe libgcc-15.2.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1357 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_packagedata_setscene)
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_write_config: Succeeded
NOTE: recipe libcap-2.76-r0: task do_fetch: Started
NOTE: Running task 1092 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_fetch)
NOTE: Running task 1093 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_fetch)
NOTE: Running task 1096 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_fetch)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_fetch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_fetch: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_fetch: Succeeded
NOTE: Running task 1097 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_unpack)
NOTE: recipe libcap-2.76-r0: task do_fetch: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Started
NOTE: Running task 1098 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_unpack)
NOTE: Running task 1099 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_unpack)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_fetch: Succeeded
NOTE: Running task 1100 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_unpack)
NOTE: recipe libgcrypt-1.11.2-r0: task do_fetch: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Started
NOTE: Running task 1101 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_unpack)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_write_config: Started
NOTE: Running setscene task 1358 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-runtime_15.2.bb:do_recipe_qa_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_write_config: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_write_config: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_unpack: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_fetch: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Started
NOTE: recipe libcap-2.76-r0: task do_unpack: Started
NOTE: Running setscene task 1359 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running task 1102 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_patch)
NOTE: recipe libxcb-1.17.0-r0: task do_fetch: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_write_config: Succeeded
NOTE: Running task 1104 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Started
NOTE: Running task 1131 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_unpack)
NOTE: Running task 1132 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_unpack)
NOTE: Running task 1134 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_unpack)
NOTE: Running task 1136 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_fetch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_unpack: Started
NOTE: recipe musl-1.2.5+git-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1362 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_packagedata_setscene)
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Started
NOTE: recipe libpam-1.7.1-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Started
NOTE: recipe gcc-runtime-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Started
NOTE: Running setscene task 1363 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Started
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Started
NOTE: Running setscene task 1364 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_packagedata_setscene)
NOTE: Running task 1139 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_unpack: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_fetch: Succeeded
NOTE: Running task 1140 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_patch)
NOTE: Running task 1143 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_fetch)
NOTE: recipe libpam-1.7.1-r0: task do_patch: Succeeded
NOTE: Running task 1145 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_fetch)
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_patch: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_unpack: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_unpack: Succeeded
NOTE: recipe libgcc-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Started
NOTE: Running task 1147 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Started
NOTE: Running setscene task 1367 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/libgcc_15.2.bb:do_recipe_qa_setscene)
NOTE: Running setscene task 1368 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_populate_sysroot_setscene)
NOTE: Running task 1148 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_patch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_unpack: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_unpack: Succeeded
NOTE: Running task 1149 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_fetch: Succeeded
NOTE: Running task 1150 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_patch)
NOTE: recipe libcap-2.76-r0: task do_patch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_fetch: Succeeded
NOTE: Running task 1151 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_fetch)
NOTE: Running task 1161 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_unpack)
NOTE: Running task 1163 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_fetch)
NOTE: recipe xorgproto-2024.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 1178 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_patch)
NOTE: recipe bsd-headers-1.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1186 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_unpack)
NOTE: recipe linux-libc-headers-6.16-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 1188 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_unpack)
NOTE: Running task 1189 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_unpack)
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Started
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_fetch: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Started
NOTE: Running task 1193 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_unpack)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_patch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_patch: Started
NOTE: Running task 1211 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_fetch)
NOTE: recipe libgcc-15.2.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 1216 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_fetch)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Started
NOTE: recipe dbus-1.16.2-r0: task do_fetch: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Started
NOTE: Running task 1221 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_unpack)
NOTE: Running task 1251 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_fetch)
NOTE: recipe libxcb-1.17.0-r0: task do_patch: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Started
NOTE: Running task 1302 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe util-linux-2.41.1-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Started
NOTE: recipe musl-1.2.5+git-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 1314 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_patch)
NOTE: Running setscene task 1371 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1373 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_populate_sysroot_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_fetch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_fetch: Started
NOTE: Running setscene task 1377 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/musl_git.bb:do_recipe_qa_setscene)
NOTE: recipe libice-1_1.1.2-r0: task do_unpack: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_unpack: Succeeded
NOTE: Running task 1317 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_patch)
NOTE: Running task 1318 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_patch)
NOTE: recipe elfutils-0.193-r0: task do_fetch: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Started
NOTE: Running task 1319 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_unpack)
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_unpack: Succeeded
NOTE: Running task 1320 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_unpack)
NOTE: Running task 1321 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_patch)
NOTE: recipe libgcrypt-1.11.2-r0: task do_unpack: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1322 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_unpack: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Started
NOTE: Running task 1323 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_patch)
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Started
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_patch: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_unpack: Succeeded
NOTE: Running task 1324 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_patch)
NOTE: recipe base-files-3.0.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe musl-1.2.5+git-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_patch: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_patch: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Started
NOTE: Running task 1339 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_write_config)
NOTE: recipe base-files-3.0.14-r0: task do_patch: Succeeded
NOTE: Running task 1340 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_unpack)
NOTE: Running task 1352 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_configure)
NOTE: recipe libssp-nonshared-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1379 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/gcc/gcc-cross_15.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libssp-nonshared.bb:do_recipe_qa_setscene)
NOTE: recipe dbus-1.16.2-r0: task do_unpack: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1382 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/bsd-headers.bb:do_recipe_qa_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1359 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/dbus/dbus_1.16.2.bb:do_patch)
NOTE: Running task 1360 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_patch)
NOTE: recipe libsm-1_1.2.6-r0: task do_patch: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Started
NOTE: recipe base-files-3.0.14-r0: task do_configure: Started
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 1430 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_write_config)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Started
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Started
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Started
NOTE: recipe dbus-1.16.2-r0: task do_patch: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_patch: Succeeded
NOTE: recipe libssp-nonshared-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_configure: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_write_config: Succeeded
NOTE: recipe bsd-headers-1.0-r0: task do_recipe_qa_setscene: Succeeded
NOTE: recipe dbus-1.16.2-r0: task do_patch: Succeeded
NOTE: Running task 1449 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_compile)
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Started
NOTE: Running task 1458 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_fetch)
NOTE: Running task 1460 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_fetch)
NOTE: Running task 1463 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_fetch)
NOTE: Running task 1475 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_fetch)
NOTE: Running task 1479 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_fetch)
NOTE: recipe wayland-1.24.0-r0: task do_unpack: Succeeded
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_patch: Succeeded
NOTE: Running task 1480 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_patch)
NOTE: recipe wayland-1.24.0-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1515 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_fetch)
NOTE: Running task 1519 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_compile: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Started
NOTE: recipe kmod-34.2-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Started
NOTE: Running task 1576 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_unpack)
NOTE: Running task 1580 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_fetch)
NOTE: Running task 1581 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_compile: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_fetch: Succeeded
NOTE: Running task 1582 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_unpack)
NOTE: Running task 1583 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_install)
NOTE: recipe wayland-1.24.0-r0: task do_patch: Started
NOTE: Running task 1584 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_unpack)
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Started
NOTE: recipe bluez5-5.84-r0: task do_fetch: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_fetch: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_fetch: Succeeded
NOTE: Running task 1585 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_unpack)
NOTE: Running task 1586 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_unpack)
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Started
NOTE: recipe libical-3.0.20-r0: task do_unpack: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_fetch: Succeeded
NOTE: Running task 1589 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_unpack: Started
NOTE: Running task 1593 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_fetch)
NOTE: recipe base-files-3.0.14-r0: task do_install: Started
NOTE: recipe wayland-1.24.0-r0: task do_patch: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Started
NOTE: recipe bluez5-5.84-r0: task do_unpack: Started
NOTE: Running task 1655 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_write_config)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_unpack: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_unpack: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_fetch: Succeeded
NOTE: recipe binutils-2.45-r0: task do_fetch: Started
NOTE: Running task 1656 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_patch)
NOTE: Running task 1657 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_patch)
NOTE: Running task 1660 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_unpack)
NOTE: recipe util-linux-2.41.1-r0: task do_patch: Succeeded
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_patch: Succeeded
NOTE: Running task 1662 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_unpack)
NOTE: recipe binutils-2.45-r0: task do_fetch: Succeeded
NOTE: Running task 1671 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_unpack)
NOTE: Running task 1673 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_fetch)
NOTE: recipe kmod-34.2-r0: task do_unpack: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_unpack: Succeeded
NOTE: Running task 1674 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_patch)
NOTE: recipe shadow-4.18.0-r0: task do_unpack: Succeeded
NOTE: Running task 1675 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_patch)
NOTE: recipe kmod-34.2-r0: task do_write_config: Started
NOTE: Running task 1676 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_patch)
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Started
NOTE: recipe libical-3.0.20-r0: task do_patch: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Started
NOTE: recipe kmod-34.2-r0: task do_write_config: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_fetch: Started
NOTE: recipe binutils-2.45-r0: task do_unpack: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_patch: Succeeded
NOTE: Running task 1690 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_fetch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Started
NOTE: recipe kmod-34.2-r0: task do_patch: Started
NOTE: Running task 1727 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Started
NOTE: recipe bluez5-5.84-r0: task do_unpack: Succeeded
NOTE: Running task 1728 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/bluez5/bluez5_5.84.bb:do_patch)
NOTE: recipe libxrender-1_0.9.12-r0: task do_patch: Succeeded
NOTE: recipe kmod-34.2-r0: task do_patch: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_unpack: Succeeded
NOTE: Running task 1733 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_fetch)
NOTE: Running task 1738 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_patch)
NOTE: Running task 1744 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_fetch)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_unpack: Succeeded
NOTE: Running task 1745 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_patch)
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_fetch: Succeeded
NOTE: Running task 1746 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_fetch)
NOTE: recipe vala-0.56.18-r0: task do_unpack: Succeeded
NOTE: recipe bluez5-5.84-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_fetch: Succeeded
NOTE: Running task 1747 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/vala/vala_0.56.18.bb:do_patch)
NOTE: Running task 1748 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_fetch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_install: Succeeded
NOTE: Running task 1749 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_unpack)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Started
NOTE: Running task 1750 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_fetch)
NOTE: recipe libdrm-2.4.125-r0: task do_fetch: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_patch: Succeeded
NOTE: Running task 1751 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_fetch)
NOTE: recipe shadow-4.18.0-r0: task do_patch: Succeeded
NOTE: Running task 1758 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libical/libical_3.0.20.bb:do_generate_toolchain_file)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: recipe vala-0.56.18-r0: task do_patch: Started
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Started
NOTE: recipe bluez5-5.84-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_unpack: Started
NOTE: Running task 1849 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_fetch)
NOTE: Running task 1853 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Started
NOTE: Running task 1858 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_unpack)
NOTE: Running noexec task 1865 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_fetch)
NOTE: Running task 1866 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/clang/clang_git.bb:do_generate_toolchain_file)
NOTE: Running task 1869 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_unpack)
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Started
NOTE: Running task 1870 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_unpack)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_fetch: Succeeded
NOTE: Running task 1871 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_unpack)
NOTE: recipe vala-0.56.18-r0: task do_patch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_fetch: Succeeded
NOTE: Running task 1882 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_unpack)
NOTE: recipe elfutils-0.193-r0: task do_unpack: Succeeded
NOTE: Running task 1932 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_patch)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_fetch: Succeeded
NOTE: recipe libical-3.0.20-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 1949 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_write_config)
NOTE: Running task 1950 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_unpack)
NOTE: Running task 1956 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_write_config)
NOTE: recipe eudev-3.2.14-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Started
NOTE: Running task 1957 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_patch)
NOTE: recipe clang-21.1.1-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.2.3-r0: task do_fetch: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Started
NOTE: recipe mesa-2_25.2.3-r0: task do_fetch: Succeeded
NOTE: Running task 1958 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_unpack)
NOTE: recipe clang-21.1.1-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_unpack: Started
NOTE: Running task 1961 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_write_config)
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_write_config: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_unpack: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_unpack: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1962 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_patch)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_unpack: Succeeded
NOTE: Running task 1963 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_patch)
NOTE: Running task 1964 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_patch)
NOTE: recipe libdrm-2.4.125-r0: task do_unpack: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_write_config: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_unpack: Succeeded
NOTE: Running task 1965 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_patch)
NOTE: Running task 1966 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_configure)
NOTE: Running task 1967 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_patch)
NOTE: Running task 1968 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_patch)
NOTE: recipe mesa-2_25.2.3-r0: task do_unpack: Started
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Started
NOTE: Running task 1998 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_fetch)
NOTE: recipe gcc-cross-x86_64-15.2.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1384 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Started
NOTE: recipe libdrm-2.4.125-r0: task do_write_config: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Started
NOTE: Running task 2009 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_fetch)
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Started
NOTE: recipe ell-0.79-r0: task do_fetch: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_patch: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_patch: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_patch: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_patch: Succeeded
NOTE: Running task 2013 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_fetch)
NOTE: recipe ell-0.79-r0: task do_fetch: Succeeded
NOTE: Running task 2026 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_fetch)
NOTE: Running task 2030 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_fetch)
NOTE: Running task 2031 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_fetch)
NOTE: recipe xrandr-1_1.5.3-r0: task do_patch: Succeeded
NOTE: Running task 2044 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_fetch)
NOTE: Running task 2045 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_fetch)
NOTE: recipe libdrm-2.4.125-r0: task do_patch: Succeeded
NOTE: Running task 2050 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Started
NOTE: recipe eudev-3.2.14-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_fetch: Succeeded
NOTE: Running task 2062 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_write_config)
NOTE: Running task 2063 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_unpack: Succeeded
NOTE: Running task 2064 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Started
NOTE: recipe ofono-2.18-r0: task do_fetch: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_fetch: Succeeded
NOTE: recipe ofono-2.18-r0: task do_fetch: Succeeded
NOTE: recipe ell-0.79-r0: task do_unpack: Started
NOTE: Running task 2065 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_unpack)
NOTE: Running task 2066 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Started
NOTE: recipe avahi-0.8-r0: task do_fetch: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_fetch: Succeeded
NOTE: Running task 2067 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_unpack)
NOTE: Running task 2076 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_unpack)
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_patch: Started
NOTE: recipe mesa-2_25.2.3-r0: task do_write_config: Started
NOTE: recipe linux-libc-headers-6.16-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Started
NOTE: Running setscene task 1387 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils-cross_2.45.bb:do_populate_sysroot_setscene)
NOTE: recipe ofono-2.18-r0: task do_unpack: Started
NOTE: recipe ell-0.79-r0: task do_unpack: Succeeded
NOTE: recipe mesa-2_25.2.3-r0: task do_write_config: Succeeded
NOTE: Running setscene task 1389 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_6.16.bb:do_recipe_qa_setscene)
NOTE: recipe avahi-0.8-r0: task do_unpack: Started
NOTE: Running task 2077 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/ell/ell_0.79.bb:do_patch)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_fetch: Succeeded
NOTE: Running task 2078 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_unpack)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_patch: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_unpack: Succeeded
NOTE: Running task 2080 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_generate_toolchain_file)
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 2081 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_patch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_unpack: Succeeded
NOTE: Running task 2082 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_patch)
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Started
NOTE: recipe ell-0.79-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_fetch: Succeeded
NOTE: Running task 2083 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_unpack)
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Started
NOTE: recipe ofono-2.18-r0: task do_unpack: Succeeded
NOTE: recipe ell-0.79-r0: task do_patch: Succeeded
NOTE: Running task 2084 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/ofono/ofono_2.18.bb:do_patch)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_unpack: Succeeded
NOTE: recipe linux-libc-headers-6.16-r0: task do_recipe_qa_setscene: Succeeded
NOTE: Running task 2086 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_fetch)
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Started
NOTE: Running task 2099 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_patch)
NOTE: Running task 2103 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_fetch)
NOTE: recipe libxi-1_1.8.2-r0: task do_patch: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2104 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_package)
NOTE: Running task 2106 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_fetch)
NOTE: recipe elfutils-0.193-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Started
NOTE: recipe avahi-0.8-r0: task do_unpack: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_patch: Succeeded
NOTE: Running task 2111 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/avahi/avahi_0.8.bb:do_patch)
NOTE: Running task 2114 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_write_config)
NOTE: Running task 2120 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_fetch)
NOTE: recipe pulseaudio-17.0-r0: task do_unpack: Succeeded
NOTE: recipe ofono-2.18-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_fetch: Started
NOTE: Running task 2121 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_patch)
NOTE: recipe xkeyboard-config-2.45-r0: task do_fetch: Succeeded
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_patch: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_fetch: Started
NOTE: Running task 2122 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_fetch)
NOTE: recipe libsdl2-2.32.10-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_configure: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Started
NOTE: recipe ofono-2.18-r0: task do_patch: Succeeded
NOTE: Running task 2123 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_fetch)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_fetch: Started
NOTE: Running task 2124 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_fetch)
NOTE: Running task 2125 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_compile)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Started
NOTE: recipe avahi-0.8-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Started
NOTE: recipe binutils-cross-x86_64-2.45-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Started
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Started
NOTE: Setscene tasks completed
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_patch: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_write_config: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Started
NOTE: Running task 2210 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe pixman-1_0.46.4-r0: task do_fetch: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Started
NOTE: Running task 2268 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2335 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_prepare_recipe_sysroot)
NOTE: recipe dtc-1.7.2-r0: task do_fetch: Succeeded
NOTE: Running task 2426 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2471 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_fetch: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2492 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Started
NOTE: Running task 2500 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux-libuuid_2.41.1.bb:do_packagedata)
NOTE: recipe pulseaudio-17.0-r0: task do_patch: Succeeded
NOTE: recipe virglrenderer-1.1.1-r0: task do_fetch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: Running task 2551 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2565 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/spir/spirv-llvm-translator_21.1.0.bb:do_generate_toolchain_file)
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_unpack: Succeeded
NOTE: Running task 2580 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_generate_toolchain_file: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_compile: Succeeded
NOTE: Running task 2581 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_install)
NOTE: recipe spirv-llvm-translator-21.1.0-r0: task do_generate_toolchain_file: Succeeded
NOTE: Running task 2592 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_patch)
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Started
NOTE: recipe libpam-1.7.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2593 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_patch: Succeeded
NOTE: Running task 2594 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_configure)
NOTE: recipe xorgproto-2024.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2603 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_patch)
NOTE: Running task 2604 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_configure)
NOTE: recipe util-linux-libuuid-2.41.1-r0: task do_packagedata: Succeeded
NOTE: Running task 2640 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_prepare_recipe_sysroot)
NOTE: Running task 2649 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_fetch)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure: Started
NOTE: recipe libpam-1.7.1-r0: task do_configure: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Started
NOTE: recipe kmod-34.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2650 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Started
NOTE: recipe wayland-1.24.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2651 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure)
NOTE: Running task 2652 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_configure)
NOTE: recipe libepoxy-1.5.10-r0: task do_patch: Succeeded
NOTE: Running task 2654 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_unpack)
NOTE: recipe avahi-0.8-r0: task do_patch: Succeeded
NOTE: Running task 2659 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_unpack)
NOTE: recipe kmod-34.2-r0: task do_configure: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_unpack: Started
NOTE: recipe libslirp-4.9.1-r0: task do_fetch: Succeeded
NOTE: Running task 2671 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.1.0.bb:do_fetch)
NOTE: recipe xkeyboard-config-2.45-r0: task do_unpack: Started
NOTE: recipe qemu-10.1.0-r0: task do_fetch: Started
NOTE: recipe qemu-10.1.0-r0: task do_fetch: Succeeded
NOTE: Running task 2694 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_unpack)
NOTE: recipe xkeyboard-config-2.45-r0: task do_unpack: Succeeded
NOTE: Running task 2695 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_patch)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_patch: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_fetch: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_patch: Succeeded
NOTE: Running task 2711 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_configure)
NOTE: Running task 2715 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libepoxy/libepoxy_1.5.10.bb:do_write_config)
NOTE: Running task 2716 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-multimedia/pulseaudio/pulseaudio_17.0.bb:do_write_config)
NOTE: Running task 2717 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot)
NOTE: recipe mesa-2_25.2.3-r0: task do_unpack: Succeeded
NOTE: Running task 2718 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_patch)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Started
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Started
NOTE: recipe libsdl2-2.32.10-r0: task do_unpack: Succeeded
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Started
NOTE: Running task 2719 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_patch)
NOTE: recipe libepoxy-1.5.10-r0: task do_write_config: Succeeded
NOTE: Running task 2723 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_unpack)
NOTE: recipe pulseaudio-17.0-r0: task do_write_config: Succeeded
NOTE: recipe mesa-2_25.2.3-r0: task do_patch: Started
NOTE: Running task 2724 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_unpack)
NOTE: recipe libsdl2-2.32.10-r0: task do_patch: Started
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Started
NOTE: recipe base-files-3.0.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libsdl2-2.32.10-r0: task do_patch: Succeeded
NOTE: Running task 2725 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_unpack)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_populate_sysroot unihash changed to b56557924a2f51d1c2bf9f435dbc817a7459e44001d90ee2c59bd6678c20a36a
NOTE: Setscene tasks completed
NOTE: Running task 2726 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_unpack)
NOTE: recipe mesa-2_25.2.3-r0: task do_patch: Succeeded
NOTE: Running task 2728 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/mesa/mesa.bb:do_rust_gen_targets)
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Started
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_unpack: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_unpack: Succeeded
NOTE: Running task 2729 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_unpack)
NOTE: Running task 2730 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_patch)
NOTE: recipe mesa-2_25.2.3-r0: task do_rust_gen_targets: Started
NOTE: recipe mesa-2_25.2.3-r0: task do_rust_gen_targets: Succeeded
NOTE: Running task 2731 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_patch)
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_patch: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_populate_sysroot unihash changed to 8c93dafe3f2a8dcf911693c65fcf2f58c29d2f3fa2db913de59bfbaa4259cffd
NOTE: recipe dtc-1.7.2-r0: task do_unpack: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_package: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2732 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata)
NOTE: Running task 2733 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_patch)
NOTE: Running task 2743 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.1.0.bb:do_unpack)
NOTE: Running task 2777 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_write_config)
NOTE: Running task 2778 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_prepare_recipe_sysroot)
NOTE: recipe virglrenderer-1.1.1-r0: task do_unpack: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 2779 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_patch)
NOTE: recipe libucontext-1.3.2-r0: task do_unpack: Succeeded
NOTE: Running task 2780 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_patch)
NOTE: Running task 2781 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_compile)
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Started
NOTE: recipe dtc-1.7.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_write_config: Started
NOTE: recipe qemu-10.1.0-r0: task do_unpack: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_write_config: Succeeded
NOTE: Running task 2783 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_write_config)
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Started
NOTE: recipe libslirp-4.9.1-r0: task do_unpack: Succeeded
NOTE: Running task 2784 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_patch)
NOTE: recipe dtc-1.7.2-r0: task do_patch: Succeeded
NOTE: Running task 2785 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_write_config: Started
NOTE: recipe libucontext-1.3.2-r0: task do_patch: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Started
NOTE: Running task 2786 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_write_config: Succeeded
NOTE: Running task 2787 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_collect_spdx_deps)
NOTE: recipe virglrenderer-1.1.1-r0: task do_patch: Succeeded
NOTE: Running task 2800 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_write_config)
NOTE: recipe libslirp-4.9.1-r0: task do_patch: Succeeded
NOTE: recipe base-files-3.0.14-r0: task do_packagedata: Succeeded
NOTE: Running task 2802 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_collect_spdx_deps: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_packagedata unihash changed to 322b8f8b906444532279807f4b6d94c79a2dab3feaff9de6d084f1ef1555cf0a
NOTE: Setscene tasks completed
NOTE: Running task 2803 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/virglrenderer/virglrenderer_1.1.1.bb:do_write_config)
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Started
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_write_config: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe binutils-2.45-r0: task do_unpack: Succeeded
NOTE: Running task 2804 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/binutils/binutils_2.45.bb:do_patch)
NOTE: Running task 2805 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_write_config)
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_compile: Succeeded
NOTE: Running task 2806 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_prepare_recipe_sysroot)
NOTE: recipe libpam-1.7.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_configure: Succeeded
NOTE: Running task 2807 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_install)
NOTE: Running task 2808 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_compile)
NOTE: recipe xkeyboard-config-2.45-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2809 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_write_config)
NOTE: Running task 2810 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_configure)
NOTE: recipe virglrenderer-1.1.1-r0: task do_write_config: Succeeded
NOTE: Running task 2811 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_prepare_recipe_sysroot)
NOTE: recipe binutils-2.45-r0: task do_patch: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_write_config: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Started
NOTE: recipe xorgproto-2024.1-r0: task do_install: Started
NOTE: Running task 2812 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/libsdl2/libsdl2_2.32.10.bb:do_generate_toolchain_file)
NOTE: recipe xkeyboard-config-2.45-r0: task do_configure: Started
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libucontext-1.3.2-r0: task do_write_config: Succeeded
NOTE: Running task 2813 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/slirp/libslirp_4.9.1.bb:do_write_config)
NOTE: recipe libsdl2-2.32.10-r0: task do_generate_toolchain_file: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_configure: Succeeded
NOTE: Running task 2814 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_compile)
NOTE: recipe libsdl2-2.32.10-r0: task do_generate_toolchain_file: Succeeded
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Started
NOTE: Running task 2866 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_fetch)
NOTE: recipe libslirp-4.9.1-r0: task do_write_config: Succeeded
NOTE: Running task 2927 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_collect_spdx_deps)
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Started
NOTE: recipe dtc-1.7.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_fetch: Started
NOTE: Running task 2928 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_configure)
NOTE: recipe coreutils-9.7-r0: task do_fetch: Succeeded
NOTE: Running task 2929 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_unpack)
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Started
NOTE: recipe base-files-3.0.14-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 2932 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/base-files/base-files_3.0.14.bb:do_create_spdx)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_compile: Succeeded
NOTE: Running task 2933 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_install)
NOTE: recipe dtc-1.7.2-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_unpack: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2934 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_configure)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Started
NOTE: recipe libucontext-1.3.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 2935 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_configure)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure: Succeeded
NOTE: Running task 2936 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_configure_ptest_base)
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Started
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Started
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Started
NOTE: recipe kmod-34.2-r0: task do_configure: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 2937 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile)
NOTE: Running task 2938 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_compile)
NOTE: recipe wayland-protocols-1.45-r0: task do_package: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_install: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_unpack: Succeeded
NOTE: recipe binutils-2.45-r0: task do_patch: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_compile: Started
NOTE: Running task 2939 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_patch)
NOTE: Running task 2945 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot)
NOTE: recipe base-files-3.0.14-r0: task do_create_spdx: Succeeded
NOTE: Running task 2946 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package)
NOTE: recipe kmod-34.2-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_package unihash changed to f1de4a65034064e087b26385d8f52817ed08039c694c8e79fe4b756050c8d095
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata became valid
NOTE: recipe coreutils-9.7-r0: task do_patch: Started
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_compile: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package: Started
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_packagedata_setscene)
NOTE: Running task 2973 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_install)
NOTE: Running task 3012 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_collect_spdx_deps)
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_install: Succeeded
NOTE: Running task 3013 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot)
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Started
NOTE: recipe coreutils-9.7-r0: task do_patch: Succeeded
NOTE: Running task 3014 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package)
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-protocols-1.45-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Started
NOTE: Running task 3043 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_collect_spdx_deps)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Started
NOTE: recipe wayland-1.24.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3092 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland-protocols_1.45.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.45-r0: task do_configure: Succeeded
NOTE: Running task 3093 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_compile)
NOTE: recipe kmod-34.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Started
NOTE: Running task 3103 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_collect_spdx_deps)
NOTE: recipe xorgproto-2024.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_populate_sysroot unihash changed to b95f45c06effd2f868301cc0147d67664b0d0a9dc45e2030172c7c5836a2b52f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot became valid
NOTE: recipe xkeyboard-config-2.45-r0: task do_compile: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_configure: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_configure: Succeeded
NOTE: recipe wayland-protocols-1.45-r0: task do_create_spdx: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_install: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_populate_sysroot unihash changed to 065c57527dd678abb51b2b03ec43498e34d2afc33e89e5519772d951150fa101
NOTE: recipe wayland-1.24.0-r0: task do_compile: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_configure: Succeeded
NOTE: Running setscene task 1317 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1337 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1340 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1352 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1357 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1363 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_populate_sysroot_setscene)
NOTE: Running task 3104 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_configure_ptest_base)
NOTE: Running task 3105 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_compile_ptest_base)
NOTE: recipe kmod-34.2-r0: task do_compile: Succeeded
NOTE: Running task 3106 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_install)
NOTE: Running task 3107 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot)
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_compile: Succeeded
NOTE: Running task 3108 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_install)
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Started
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_package unihash changed to 63f4cc90b2b8bd7b66709c9eaae202a0c1c4f4a5ebe6753c2229a24cbc5addfc
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata became valid
NOTE: recipe libpam-1.7.1-r0: task do_configure_ptest_base: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxshmfence-1.3.3-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe xorgproto-2024.1-r0: task do_package: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_install: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_package unihash changed to 5cfc831e4590bf48a0747d3ddb403028a67b7807c4195764930ee88ab4cedb71
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package became valid
NOTE: recipe libpciaccess-0.18.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_populate_sysroot unihash changed to 7109d4048165869558a21c28f09c81c7a2ed41dddb661ac9787f59fa98e46f66
NOTE: Running setscene task 1283 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1321 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1327 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1333 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_packagedata_setscene)
NOTE: Running setscene task 1335 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1338 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_packagedata_setscene)
NOTE: Running setscene task 1339 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_packagedata_setscene)
NOTE: Running setscene task 1354 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_packagedata_setscene)
NOTE: Running task 3109 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile)
NOTE: Running task 3110 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install)
NOTE: Running task 3111 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_compile: Started
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe wayland-1.24.0-r0: task do_install: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_configure: Succeeded
NOTE: Running task 3112 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package)
NOTE: recipe xrandr-1_1.5.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1355 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_package_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe kmod-34.2-r0: task do_install: Succeeded
NOTE: Running setscene task 1356 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_package_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libsm-1_1.2.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1357 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_package_setscene)
NOTE: Running setscene task 1358 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_package_setscene)
NOTE: recipe libxi-1_1.8.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1359 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_package_setscene)
NOTE: Running setscene task 1360 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_package_setscene)
NOTE: Running task 3113 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_compile)
NOTE: Running task 3114 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot)
NOTE: Running task 3115 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package)
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_compile: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Started
NOTE: recipe kmod-34.2-r0: task do_package: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1361 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_packagedata_setscene)
NOTE: recipe libxshmfence-1.3.3-r0: task do_package_setscene: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running setscene task 1362 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_populate_sysroot_setscene)
NOTE: recipe libsm-1_1.2.6-r0: task do_package_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1363 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_packagedata_setscene)
NOTE: Running task 3116 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_compile)
NOTE: Running setscene task 1364 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1365 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_packagedata_setscene)
NOTE: Running task 3117 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_configure)
NOTE: recipe xkeyboard-config-2.45-r0: task do_install: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Started
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 3118 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot)
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_populate_sysroot unihash changed to 4e64ce7716bc658a4e90b2c0b73916ba536ab1e69cb9d1dfdfcdce279e096c72
NOTE: recipe libxrandr-1_1.5.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_install: Succeeded
NOTE: Running setscene task 1342 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_package_setscene)
NOTE: Running setscene task 1343 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_package_setscene)
NOTE: Running setscene task 1345 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_package_setscene)
NOTE: Running task 3119 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_install_ptest_base)
NOTE: Running task 3120 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_compile)
NOTE: Running task 3122 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Started
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Started
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Started
NOTE: Running task 3217 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_collect_spdx_deps)
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package: Started
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Started
NOTE: recipe wayland-1.24.0-r0: task do_install_ptest_base: Succeeded
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3219 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-connectivity/mobile-broadband-provider-info/mobile-broadband-provider-info_20250613.bb:do_create_spdx)
NOTE: Running task 3220 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot)
NOTE: recipe xkeyboard-config-2.45-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_populate_sysroot unihash changed to d7936091f80860dda9adffcb75407fb0cb5feb103669955ee433149222fbec95
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_package_setscene: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_package_setscene: Succeeded
NOTE: recipe libice-1_1.1.2-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1357 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1360 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1367 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1368 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_packagedata_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_compile: Succeeded
NOTE: Running setscene task 1369 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_packagedata_setscene)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_compile: Succeeded
NOTE: Running setscene task 1373 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_populate_sysroot_setscene)
NOTE: recipe mobile-broadband-provider-info-1_20250613-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_compile: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_package: Succeeded
NOTE: Running setscene task 1375 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_package_setscene)
NOTE: recipe libxrender-1_0.9.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3223 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_compile_ptest_base)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1376 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_package_setscene)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_package unihash changed to 209f8820a81af34d11425704cdf4385b456738d314f81b07e72c71cb47487e0c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata became valid
NOTE: recipe libxext-1_1.3.6-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_compile_ptest_base: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package_setscene: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Started
NOTE: Running setscene task 1359 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_package_setscene)
NOTE: Running setscene task 1371 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_packagedata_setscene)
NOTE: Running task 3226 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install)
NOTE: Running task 3233 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package)
NOTE: Running task 3234 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_install)
NOTE: recipe wayland-1.24.0-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3235 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_install)
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_populate_sysroot unihash changed to 52df8496f453932d47f698b472d9130bbeb4c607484e96084b669febec2e8cda
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot became valid
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Started
NOTE: recipe wayland-1.24.0-r0: task do_package: Started
NOTE: recipe dtc-1.7.2-r0: task do_install: Started
NOTE: recipe libucontext-1.3.2-r0: task do_install: Started
NOTE: Running setscene task 1375 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_populate_sysroot_setscene)
NOTE: recipe libpciaccess-0.18.1-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_package_setscene: Succeeded
NOTE: Running task 3245 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libpciaccess_0.18.1.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_package_setscene: Succeeded
NOTE: Running task 3281 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_collect_spdx_deps)
NOTE: Running task 3282 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_collect_spdx_deps)
NOTE: Running task 3283 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_collect_spdx_deps)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe kmod-34.2-r0: task do_package: Succeeded
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_package unihash changed to 85d06d2858940a26b6e15a60ff3424a43ebffeff8208ef5e28faf706c78070aa
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata became valid
NOTE: recipe xkeyboard-config-2.45-r0: task do_collect_spdx_deps: Started
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1377 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_packagedata_setscene)
NOTE: Running task 3284 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_collect_spdx_deps)
NOTE: recipe dtc-1.7.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1378 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_populate_sysroot_setscene)
NOTE: recipe xkeyboard-config-2.45-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe pixman-1_0.46.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running setscene task 1379 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_packagedata_setscene)
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libpciaccess-0.18.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3310 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_collect_spdx_deps)
NOTE: recipe libucontext-1.3.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe kmod-34.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3312 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/kmod/kmod_34.2.bb:do_create_spdx)
NOTE: recipe libx11-1_1.8.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_package_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_install: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_install: Succeeded
NOTE: Running task 3313 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Started
NOTE: Running task 3314 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot)
NOTE: recipe libdrm-2.4.125-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Started
NOTE: Running task 3315 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package)
NOTE: Running task 3316 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package)
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Started
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_package: Started
NOTE: recipe libucontext-1.3.2-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_install: Succeeded
NOTE: Running task 3317 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_install_ptest_base)
NOTE: recipe kmod-34.2-r0: task do_create_spdx: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_configure: Succeeded
NOTE: Running task 3318 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_compile)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Started
NOTE: recipe dtc-1.7.2-r0: task do_populate_sysroot: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_populate_sysroot unihash changed to d6c9e59e85466df27571bf0a80e6d25c6d12249a3bff73f2ba2cba573abe1d43
NOTE: recipe libucontext-1.3.2-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_populate_sysroot unihash changed to 3abbe59586b01d24326f00c2db2105c8beac85b55c1aeda67a2009f01f973e27
NOTE: recipe qemu-10.1.0-r0: task do_unpack: Succeeded
NOTE: Running task 3319 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.1.0.bb:do_patch)
NOTE: recipe libpam-1.7.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3320 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot)
NOTE: Running task 3321 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package)
NOTE: recipe qemu-10.1.0-r0: task do_patch: Started
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Started
NOTE: recipe libx11-1_1.8.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1381 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1382 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_packagedata_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxcb-1.17.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxcb-1.17.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_package_setscene)
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_package unihash changed to a76d32db2cdcb0abba1fb8da31c8afcfc7dd679f5ffe65a3885b2ecc568c88b2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata became valid
NOTE: recipe qemu-10.1.0-r0: task do_patch: Succeeded
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_packagedata_setscene)
NOTE: Running task 3322 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.1.0.bb:do_deploy_source_date_epoch)
NOTE: recipe libpam-1.7.1-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_populate_sysroot unihash changed to 3b9f3e13b3550de0a2cac5027a2919e7c01c107c9d2c7db51843f4461259d97f
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot became valid
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Started
NOTE: recipe qemu-10.1.0-r0: task do_deploy_source_date_epoch: Started
NOTE: recipe libucontext-1.3.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe qemu-10.1.0-r0: task do_deploy_source_date_epoch: Succeeded
NOTE: recipe dtc-1.7.2-r0: task do_package: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_package unihash changed to f4a71aeea6776d14a56a80e7e26d5b0cc85975fc966b099040eef185e5bd7cac
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_package unihash changed to 3c5fd916843c19221c292715e83ece98e91c6bfee9a9586910b54ee182453883
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/qemu/qemu_10.1.0.bb:do_deploy_source_date_epoch unihash changed to e000fc0d8fb39775da1459a8d2ae90a243b210b16af27b3473a0d4a3b34b0d86
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata became valid
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_package became valid
NOTE: Running setscene task 1291 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_packagedata_setscene)
NOTE: Running setscene task 1344 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_packagedata_setscene)
NOTE: Running setscene task 1349 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1366 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_populate_sysroot_setscene)
NOTE: Running task 3324 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3326 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/musl/libucontext_1.3.2.bb:do_create_spdx)
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.41.1-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe dtc-1.7.2-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1379 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_package_setscene)
NOTE: Running task 3328 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-kernel/dtc/dtc_1.7.2.bb:do_create_spdx)
NOTE: recipe shadow-4.18.0-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3329 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe elfutils-0.193-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_populate_sysroot_setscene)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_package_setscene: Started
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Started
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_package: Succeeded
NOTE: recipe libucontext-1.3.2-r0: task do_create_spdx: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_package unihash changed to 80aa2e77a62a01b127b23d66119df4848f722706860ab948b6a784257e9d8f6a
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata became valid
NOTE: Running setscene task 1380 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_packagedata_setscene)
NOTE: recipe libdrm-2.4.125-r0: task do_compile: Succeeded
NOTE: Running task 3330 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1381 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_populate_sysroot_setscene)
NOTE: recipe dtc-1.7.2-r0: task do_create_spdx: Succeeded
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_package_setscene: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_install: Started
NOTE: Running setscene task 1382 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_packagedata_setscene)
NOTE: Running task 3331 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_configure)
NOTE: Running task 3332 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_configure)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_configure: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_populate_sysroot_setscene)
NOTE: recipe util-linux-2.41.1-r0: task do_configure: Started
NOTE: recipe xkeyboard-config-2.45-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Started
NOTE: Running task 3334 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/xkeyboard-config_2.45.bb:do_create_spdx)
NOTE: recipe wayland-1.24.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3336 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/wayland/wayland_1.24.0.bb:do_create_spdx)
NOTE: recipe xkeyboard-config-2.45-r0: task do_create_spdx: Started
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: Running task 3337 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxcb-1.17.0-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1384 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_packagedata_setscene)
NOTE: Running setscene task 1385 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1386 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_populate_sysroot_setscene)
NOTE: Running setscene task 1387 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Started
NOTE: recipe libcap-2.76-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_packagedata_setscene: Succeeded
NOTE: Running setscene task 1388 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_package_setscene)
NOTE: Running setscene task 1389 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_package_setscene)
NOTE: Running task 3338 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_configure)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_populate_sysroot_setscene: Succeeded
NOTE: recipe libdrm-2.4.125-r0: task do_install: Succeeded
NOTE: recipe wayland-1.24.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3339 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot)
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Started
NOTE: Running task 3340 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package)
NOTE: recipe libcap-2.76-r0: task do_configure: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Started
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Started
NOTE: recipe libdrm-2.4.125-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_configure: Succeeded
NOTE: Running task 3341 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_compile)
NOTE: recipe xkeyboard-config-2.45-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_compile: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_package_setscene: Succeeded
NOTE: recipe libxau-1_1.0.12-r0: task do_package_setscene: Succeeded
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_packagedata_setscene)
NOTE: Running task 3417 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_prepare_recipe_sysroot)
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe xorgproto-2024.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Running task 3427 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-proto/xorgproto_2024.1.bb:do_create_spdx)
NOTE: recipe libdrm-2.4.125-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_populate_sysroot unihash changed to b717d9b60add8a38ee89869895d534c3e44d7d493c881000682dd67583ee44bf
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Started
NOTE: Setscene tasks completed
NOTE: recipe xorgproto-2024.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3454 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_collect_spdx_deps)
NOTE: Running task 3455 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_collect_spdx_deps)
NOTE: Running task 3456 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_collect_spdx_deps)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3457 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_configure)
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxau-1_1.0.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3458 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxau_1.0.12.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_configure: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3459 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdmcp_1.1.5.bb:do_create_spdx)
NOTE: recipe libice-1_1.1.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3460 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libice_1.1.2.bb:do_create_spdx)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Started
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Started
NOTE: recipe libice-1_1.1.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3461 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_collect_spdx_deps)
NOTE: recipe libxau-1_1.0.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdmcp-1_1.1.5-r0: task do_create_spdx: Succeeded
NOTE: Running task 3462 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_collect_spdx_deps)
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libsm-1_1.2.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3463 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libsm_1.2.6.bb:do_create_spdx)
NOTE: recipe libxcb-1.17.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3464 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxcb_1.17.0.bb:do_create_spdx)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_compile: Succeeded
NOTE: Running task 3465 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_install)
NOTE: recipe libsm-1_1.2.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_install: Started
NOTE: recipe libdrm-2.4.125-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_package unihash changed to ee969e49c57babfae8b9672b30876c4542d49a3ce080a0af71dc91b9bf4253d1
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata became valid
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure: Succeeded
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_packagedata_setscene)
NOTE: Running task 3466 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_configure_ptest_base)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3467 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_compile)
NOTE: recipe pixman-1_0.46.4-r0: task do_compile: Succeeded
NOTE: Running task 3468 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_install)
NOTE: recipe libdrm-2.4.125-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3470 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/drm/libdrm_2.4.125.bb:do_create_spdx)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Started
NOTE: recipe libxcb-1.17.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3471 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_collect_spdx_deps)
NOTE: Running task 3472 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_collect_spdx_deps)
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe libdrm-2.4.125-r0: task do_create_spdx: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3473 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libx11_1.8.12.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_install: Succeeded
NOTE: Running task 3474 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot)
NOTE: Running task 3475 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package)
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_install: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_configure: Succeeded
NOTE: Running task 3476 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_compile)
NOTE: Running task 3478 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3479 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_prepare_recipe_sysroot)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_populate_sysroot unihash changed to d6aef4bd2fca325146b4bf93a338120eb7f4917e50ba972f5152df05d02f69b6
NOTE: recipe libgcrypt-1.11.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe libx11-1_1.8.12-r0: task do_create_spdx: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3480 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_configure)
NOTE: Running task 3481 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_collect_spdx_deps)
NOTE: Running task 3482 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_collect_spdx_deps)
NOTE: Running task 3483 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure)
NOTE: Running task 3484 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_collect_spdx_deps)
NOTE: Running task 3485 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxext-1_1.3.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3486 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxext_1.3.6.bb:do_create_spdx)
NOTE: recipe libxrender-1_0.9.12-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3487 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrender_0.9.12.bb:do_create_spdx)
NOTE: recipe libxfixes-1_6.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3488 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxfixes_6.0.2.bb:do_create_spdx)
NOTE: recipe libxshmfence-1.3.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3489 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxshmfence_1.3.3.bb:do_create_spdx)
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Started
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Started
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Started
NOTE: recipe libxshmfence-1.3.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libxext-1_1.3.6-r0: task do_create_spdx: Succeeded
NOTE: Running task 3490 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_collect_spdx_deps)
NOTE: recipe libxrender-1_0.9.12-r0: task do_create_spdx: Succeeded
NOTE: recipe libxfixes-1_6.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3491 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_collect_spdx_deps)
NOTE: Running task 3492 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_collect_spdx_deps)
NOTE: Running task 3493 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_collect_spdx_deps)
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Started
NOTE: Running task 3494 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxxf86vm_1.1.6.bb:do_create_spdx)
NOTE: recipe pixman-1_0.46.4-r0: task do_package: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3495 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxrandr_1.5.4.bb:do_create_spdx)
NOTE: recipe libxdamage-1_1.1.6-r0: task do_collect_spdx_deps: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_package unihash changed to 001934528480d605b92bc51e70e639cca2157352b66767e8553c4bb1080bceee
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata became valid
NOTE: recipe libxi-1_1.8.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Started
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_packagedata_setscene)
NOTE: Running task 3496 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxdamage_1.1.6.bb:do_create_spdx)
NOTE: Running task 3497 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxi_1.8.2.bb:do_create_spdx)
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Started
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_package: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Started
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_package unihash changed to 5004a588e68f2ae9f20e1612e5ebb82ede476b882dd46d7dd10acb0f50028126
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata became valid
NOTE: recipe pixman-1_0.46.4-r0: task do_packagedata_setscene: Succeeded
NOTE: recipe libxxf86vm-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxrandr-1_1.5.4-r0: task do_create_spdx: Succeeded
NOTE: recipe libxdamage-1_1.1.6-r0: task do_create_spdx: Succeeded
NOTE: recipe libxi-1_1.8.2-r0: task do_create_spdx: Succeeded
NOTE: Running setscene task 1382 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_packagedata_setscene)
NOTE: Running task 3499 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_collect_spdx_deps)
NOTE: Running task 3500 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_collect_spdx_deps)
NOTE: Running task 3501 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_collect_spdx_deps)
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Started
NOTE: Running task 3502 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/pixman_0.46.4.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Started
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3503 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/vulkan/vulkan-loader_1.4.321.0.bb:do_create_spdx)
NOTE: recipe libxtst-1_1.2.5-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3504 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-app/xrandr_1.5.3.bb:do_create_spdx)
NOTE: Running task 3505 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxtst_1.2.5.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_create_spdx: Started
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Started
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Started
NOTE: recipe pixman-1_0.46.4-r0: task do_create_spdx: Succeeded
NOTE: recipe xrandr-1_1.5.3-r0: task do_create_spdx: Succeeded
NOTE: recipe libpam-1.7.1-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3507 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package)
NOTE: Running task 3508 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/pam/libpam_1.7.1.bb:do_create_spdx)
NOTE: recipe vulkan-loader-1.4.321.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libxtst-1_1.2.5-r0: task do_create_spdx: Succeeded
NOTE: recipe libcap-2.76-r0: task do_package: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Started
NOTE: recipe libpam-1.7.1-r0: task do_create_spdx: Succeeded
NOTE: Running task 3509 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_collect_spdx_deps)
NOTE: Running task 3510 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_collect_spdx_deps)
NOTE: Running task 3511 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_collect_spdx_deps)
NOTE: recipe util-linux-2.41.1-r0: task do_collect_spdx_deps: Started
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe shadow-4.18.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libcap-2.76-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe libxkbcommon-1.11.0-r0: task do_compile: Succeeded
NOTE: Running task 3512 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_install)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_install: Succeeded
NOTE: Running task 3513 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot)
NOTE: Running task 3514 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_package)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_package: Started
NOTE: recipe libcap-2.76-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_package unihash changed to 8ae6383532b1768b87f345a76e429ddbdfbbe4d82f5cfa54690eb7b244bf34d8
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata became valid
NOTE: Running setscene task 1382 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_packagedata_setscene)
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_populate_sysroot unihash changed to be8fdee1f1bd762f40e3f3601c3c013d25357dc03ce5a9d7c04d55be713e84f7
NOTE: recipe libcap-2.76-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3516 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libcap/libcap_2.76.bb:do_create_spdx)
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Started
NOTE: recipe libcap-2.76-r0: task do_create_spdx: Succeeded
NOTE: Running task 3517 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_collect_spdx_deps)
NOTE: recipe libgcrypt-1.11.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile: Succeeded
NOTE: Running task 3518 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_compile_ptest_base)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_package unihash changed to dcaef6d883f9b427100302659075b1fcee09cae5831046d83010fb666d4f8ff2
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata became valid
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile_ptest_base: Started
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_packagedata_setscene)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3519 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_install)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3521 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-graphics/xorg-lib/libxkbcommon_1.11.0.bb:do_create_spdx)
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx: Started
NOTE: recipe libxkbcommon-1.11.0-r0: task do_create_spdx: Succeeded
NOTE: recipe shadow-4.18.0-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3522 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_compile)
NOTE: recipe shadow-4.18.0-r0: task do_compile: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install: Succeeded
NOTE: Running task 3523 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_install_ptest_base)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install_ptest_base: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3524 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_populate_sysroot)
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_populate_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_populate_sysroot unihash changed to 15c25ecf5a6a2ae0f98f452b5bb78decb8c2165ca7a7605023d39c3391fab0a9
NOTE: Setscene tasks completed
NOTE: Running task 3525 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3526 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0-initial_2.86.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_create_spdx: Started
NOTE: recipe glib-2.0-initial-1_2.86.0-r0: task do_create_spdx: Succeeded
NOTE: Running task 3527 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_collect_spdx_deps)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_collect_spdx_deps: Succeeded
NOTE: Running task 3528 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Started
NOTE: recipe shadow-4.18.0-r0: task do_compile: Succeeded
NOTE: Running task 3529 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_install)
NOTE: recipe shadow-4.18.0-r0: task do_install: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3530 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_configure_ptest_base)
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3531 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_compile)
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile: Started
NOTE: recipe shadow-4.18.0-r0: task do_install: Succeeded
NOTE: Running task 3533 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package)
NOTE: recipe shadow-4.18.0-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_configure: Succeeded
NOTE: Running task 3539 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_compile)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Started
NOTE: recipe shadow-4.18.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_package unihash changed to bbfa0dfb6aef8e4ed18117a11079a137d8af4778bdca1027dfbf16e5b59ccae3
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata became valid
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_packagedata_setscene)
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Started
NOTE: recipe shadow-4.18.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3541 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-extended/shadow/shadow_4.18.0.bb:do_create_spdx)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.41.1-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3548 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_configure_ptest_base)
NOTE: recipe util-linux-2.41.1-r0: task do_configure_ptest_base: Started
NOTE: recipe util-linux-2.41.1-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3549 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_compile)
NOTE: recipe shadow-4.18.0-r0: task do_create_spdx: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_compile: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile: Succeeded
NOTE: Running task 3552 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_compile_ptest_base)
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3553 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_install)
NOTE: recipe libgcrypt-1.11.2-r0: task do_install: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_compile: Succeeded
NOTE: Running task 3554 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_install)
NOTE: recipe libgcrypt-1.11.2-r0: task do_install: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Started
NOTE: Running task 3555 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_install_ptest_base)
NOTE: recipe libgcrypt-1.11.2-r0: task do_install_ptest_base: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3557 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3558 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_package: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_install: Succeeded
NOTE: Running task 3559 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot)
NOTE: Running task 3560 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Started
NOTE: Running task 3561 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_configure)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_configure: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_populate_sysroot: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_populate_sysroot unihash changed to 49b62e7b71dd4c30e7b0a91b941a4274bce84a70f7725870c0ad11447aa45d0c
NOTE: Setscene tasks completed
NOTE: recipe gobject-introspection-1.84.0-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_package unihash changed to 9520f271e511db73d6428c0cfa8bb04c80193be56504e78f526315be9c30c442
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata became valid
NOTE: Running setscene task 1390 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_packagedata_setscene)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3563 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-gnome/gobject-introspection/gobject-introspection_1.84.0.bb:do_create_spdx)
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Started
NOTE: recipe util-linux-2.41.1-r0: task do_compile: Succeeded
NOTE: Running task 3564 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_compile_ptest_base)
NOTE: recipe util-linux-2.41.1-r0: task do_compile_ptest_base: Started
NOTE: recipe gobject-introspection-1.84.0-r0: task do_create_spdx: Succeeded
NOTE: recipe libgcrypt-1.11.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_package unihash changed to 0e464c7b7cc000f1c23bd2ab13d1e99a3e46556389eae306eb2a9e8a9ec4576c
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata became valid
NOTE: Running setscene task 1383 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_packagedata_setscene)
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3566 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libgcrypt/libgcrypt_1.11.2.bb:do_create_spdx)
NOTE: recipe libgcrypt-1.11.2-r0: task do_create_spdx: Started
NOTE: recipe libgcrypt-1.11.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3567 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_collect_spdx_deps)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3568 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_install)
NOTE: recipe util-linux-2.41.1-r0: task do_install: Started
NOTE: recipe util-linux-2.41.1-r0: task do_install: Succeeded
NOTE: Running task 3569 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_install_ptest_base)
NOTE: recipe util-linux-2.41.1-r0: task do_install_ptest_base: Started
NOTE: recipe util-linux-2.41.1-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3570 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_populate_sysroot)
NOTE: Running task 3571 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_package)
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot: Started
NOTE: recipe util-linux-2.41.1-r0: task do_package: Started
NOTE: recipe util-linux-2.41.1-r0: task do_populate_sysroot: Succeeded
NOTE: Running task 3572 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3573 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_prepare_recipe_sysroot)
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe eudev-3.2.14-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3574 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_configure)
NOTE: recipe eudev-3.2.14-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3575 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_configure)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_configure: Started
NOTE: recipe coreutils-9.7-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3576 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_configure_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_configure_ptest_base: Started
NOTE: recipe coreutils-9.7-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3577 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_compile)
NOTE: recipe coreutils-9.7-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3578 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_compile)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_configure: Succeeded
NOTE: Running task 3579 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_compile)
NOTE: recipe eudev-3.2.14-r0: task do_compile: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_compile: Succeeded
NOTE: Running task 3580 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_install)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_install: Started
NOTE: recipe coreutils-9.7-r0: task do_compile: Succeeded
NOTE: Running task 3581 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_compile_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_compile_ptest_base: Started
NOTE: recipe coreutils-9.7-r0: task do_compile_ptest_base: Succeeded
NOTE: Running task 3582 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_install)
NOTE: recipe coreutils-9.7-r0: task do_install: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_install: Succeeded
NOTE: Running task 3584 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_prepare_recipe_sysroot)
NOTE: Running task 3585 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package)
NOTE: recipe elfutils-0.193-r0: task do_prepare_recipe_sysroot: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package: Started
NOTE: recipe elfutils-0.193-r0: task do_prepare_recipe_sysroot: Succeeded
NOTE: Running task 3586 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_configure)
NOTE: recipe elfutils-0.193-r0: task do_configure: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_configure: Succeeded
NOTE: Running task 3587 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_configure_ptest_base)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_configure_ptest_base: Started
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3588 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/glib-2.0/glib-2.0_2.86.0.bb:do_compile)
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_compile: Started
NOTE: recipe eudev-3.2.14-r0: task do_compile: Succeeded
NOTE: Running task 3589 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_install)
NOTE: recipe eudev-3.2.14-r0: task do_install: Started
NOTE: recipe coreutils-9.7-r0: task do_install: Succeeded
NOTE: Running task 3590 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_install_ptest_base)
NOTE: recipe coreutils-9.7-r0: task do_install_ptest_base: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_package: Succeeded
NOTE: Task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_package unihash changed to e7e0c22b6277b779795c72c52a6ef17c75b723128ef45d9ea4c1d38243c4ef5b
NOTE: Setscene task /srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata became valid
NOTE: Running setscene task 1384 of 1390 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_packagedata_setscene)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_packagedata_setscene: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3592 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-support/libmicrohttpd/libmicrohttpd_1.0.2.bb:do_create_spdx)
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Started
NOTE: recipe libmicrohttpd-1.0.2-r0: task do_create_spdx: Succeeded
NOTE: Running task 3593 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_collect_spdx_deps)
NOTE: recipe eudev-3.2.14-r0: task do_install: Succeeded
NOTE: Running task 3594 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/udev/eudev_3.2.14.bb:do_populate_sysroot)
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Started
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Started
NOTE: recipe elfutils-0.193-r0: task do_collect_spdx_deps: Succeeded
NOTE: recipe eudev-3.2.14-r0: task do_populate_sysroot: Succeeded
NOTE: recipe util-linux-2.41.1-r0: task do_package: Succeeded
NOTE: Running task 3595 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata)
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata: Started
NOTE: recipe coreutils-9.7-r0: task do_install_ptest_base: Succeeded
NOTE: Running task 3596 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/coreutils/coreutils_9.7.bb:do_package)
NOTE: recipe coreutils-9.7-r0: task do_package: Started
NOTE: recipe elfutils-0.193-r0: task do_configure: Succeeded
NOTE: Setscene tasks completed
NOTE: Running task 3597 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_configure_ptest_base)
NOTE: recipe elfutils-0.193-r0: task do_configure_ptest_base: Started
NOTE: recipe elfutils-0.193-r0: task do_configure_ptest_base: Succeeded
NOTE: Running task 3598 of 3792 (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-devtools/elfutils/elfutils_0.193.bb:do_compile)
NOTE: recipe elfutils-0.193-r0: task do_compile: Started
NOTE: recipe util-linux-2.41.1-r0: task do_packagedata: Failed
NOTE: recipe glib-2.0-1_2.86.0-r0: task do_compile: Succeeded
NOTE: recipe coreutils-9.7-r0: task do_package: Succeeded
NOTE: recipe elfutils-0.193-r0: task do_compile: Succeeded
NOTE: Tasks Summary: Attempted 3598 tasks of which 3163 didn't need to be rerun and 1 failed.
NOTE: Writing buildhistory
NOTE: Writing buildhistory took: 2 seconds
NOTE: The errors for this build are stored in /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001064935.txt
You can send the errors to a reports server by running:
  send-error-report /srv/pokybuild/yocto-worker/auh/build/build/tmp/log/error-report/error_report_20251001064935.txt [-s server]
NOTE: The contents of these logs will be posted in public if you use the above command with the default server. Please ensure you remove any identifying or proprietary information when prompted before sending.

Summary: 1 task failed:
  /srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata
    log: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/util-linux/2.41.1/temp/log.do_packagedata.2202558
Summary: There were 173 ERROR messages, returning a non-zero exit code.
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-src went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dbg went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-staticdev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-dev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-doc went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid-locale went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: QA Issue: Package version for package util-linux-libuuid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-libuuid-2.41.1-r0 do_packagedata_setscene: Fatal QA errors were found, failing task.
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-src went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-dbg went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-libsmartcols went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-libmount went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-liblastlog2 went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-libfdisk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-libblkid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-swaponoff went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-ptest went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-staticdev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-dev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-doc went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ca went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-cs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-da went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-de went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-es went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-et went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-eu went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-fi went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-fr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-gl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-hr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-hu went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-id went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-it went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ja went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ka went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ko went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-nl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-pt-br went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ro went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-ru went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-sv went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-tr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-uk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-vi went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-zh-cn went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-locale-zh-tw went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-bash-completion went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-dmesg went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-getopt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-kill went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-more went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-mount went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-mountpoint went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-su went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-umount went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-agetty went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-blkid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-blockdev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-cfdisk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-ctrlaltdel went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-fdisk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-fsck went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-fstrim went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-hwclock went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-losetup went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-mkswap went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-nologin went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-pivot-root went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-sulogin went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-swapoff went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-swapon went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-switch-root went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-bits went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-cal went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-chfn went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-chmem went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-choom went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-chrt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-chsh went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-colcrt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-colrm went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-column went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-coresched went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-eject went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-enosys went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-exch went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-fadvise went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-fallocate went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-fincore went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-findmnt went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-flock went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-hardlink went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-hexdump went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-ionice went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcmk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcrm went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-ipcs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-irqtop went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-isosize went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-last went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lastlog2 went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-logger went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-look went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lsblk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lsclocks went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lscpu went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lsfd went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lsipc went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lsirq went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lslocks went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lslogins went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lsmem went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-lsns went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-mcookie went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-mesg went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-namei went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-nsenter went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-pipesz went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-prlimit went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-rename went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-renice went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-rev went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-script went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-scriptlive went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-scriptreplay went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-setarch went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-setpgid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-setpriv went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-setsid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-setterm went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-taskset went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-uclampset went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-ul went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-unshare went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-utmpdump went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidgen went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidparse went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-waitpid went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-wall went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-wdctl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-whereis went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-write went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-addpart went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-blkdiscard went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-blkpr went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-blkzone went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-chcpu went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-delpart went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-findfs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-fsck.cramfs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-fsfreeze went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-ldattach went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-mkfs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-mkfs.cramfs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-partx went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-readprofile went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-resizepart went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-rfkill went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-rtcwake went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-runuser went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-sfdisk went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-swaplabel went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-uuidd went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-wipefs went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: QA Issue: Package version for package util-linux-zramctl went backwards which would break package feeds (from 0:2.41.2-r0 to 0:2.41.1-r0) [version-going-backwards]
ERROR: util-linux-2.41.1-r0 do_packagedata: Fatal QA errors were found, failing task.
ERROR: Logfile of failure stored in: /srv/pokybuild/yocto-worker/auh/build/build/tmp/work/x86-64-v3-poky-linux-musl/util-linux/2.41.1/temp/log.do_packagedata.2202558
ERROR: Task (/srv/pokybuild/yocto-worker/auh/build/meta/recipes-core/util-linux/util-linux_2.41.1.bb:do_packagedata) failed with exit code '1'

--===============2600330818256897111==--

