Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web11.120.1600785749957459990
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 07:42:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5AB1A101E
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 07:42:29 -0700 (PDT)
Received: from rossb-vm.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EF2373F718
	for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 07:42:28 -0700 (PDT)
From: "Ross Burton" <ross@burtonini.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH] meta: add/fix invalid Upstream-Status tags
Date: Tue, 22 Sep 2020 15:42:26 +0100
Message-Id: <20200922144226.260524-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correctly.patch  | 2 +-
 ...1-setup.py-pass-missing-libraries-to-Extension-for-mul.patch | 2 +-
 .../qemu/qemu/0001-qemu-Do-not-include-file-if-not-exists.patch | 2 +-
 .../ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.patch           | 2 +-
 ...1-Fix-segfault-on-probing-a-non-PCI-platform-device-on.patch | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX=
-correctly.patch b/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOT=
PREFIX-correctly.patch
index c61941df91..953a33a7a7 100644
--- a/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correc=
tly.patch
+++ b/meta/recipes-core/systemd/systemd/0001-Use-PREFIX-ROOTPREFIX-correc=
tly.patch
@@ -4,7 +4,7 @@ Date: Sun, 16 Aug 2020 16:07:12 +0000
 Subject: [PATCH] Use PREFIX/ROOTPREFIX correctly
=20
 Signed-off-by: Alex Kiernan <alex.kiernan@gmail.com>
-Upstream-status: Pending [https://github.com/systemd/systemd/issues/1677=
3]
+Upstream-Status: Submitted [https://github.com/systemd/systemd/issues/16=
773]
 ---
  meson.build                      | 1 +
  src/core/systemd.pc.in           | 8 ++++----
diff --git a/meta/recipes-devtools/python/python3/0001-setup.py-pass-miss=
ing-libraries-to-Extension-for-mul.patch b/meta/recipes-devtools/python/p=
ython3/0001-setup.py-pass-missing-libraries-to-Extension-for-mul.patch
index d38ed61dd7..ea0af02e72 100644
--- a/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-lib=
raries-to-Extension-for-mul.patch
+++ b/meta/recipes-devtools/python/python3/0001-setup.py-pass-missing-lib=
raries-to-Extension-for-mul.patch
@@ -46,7 +46,7 @@ ValueError: semaphore or lock released too many times
=20
 And the semaphore issue also caused multiprocessing.Queue().put() hung.
=20
-Upstream-Status: Pensing
+Upstream-Status: Pending
=20
 Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
 Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
diff --git a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-fil=
e-if-not-exists.patch b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-=
include-file-if-not-exists.patch
index 678e059463..d6c0f9ebe9 100644
--- a/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-no=
t-exists.patch
+++ b/meta/recipes-devtools/qemu/qemu/0001-qemu-Do-not-include-file-if-no=
t-exists.patch
@@ -6,7 +6,7 @@ Subject: [PATCH] qemu: Do not include file if not exists
 Script configure checks for if_alg.h and check failed but
 if_alg.h still included.
=20
-Upstream-status: Submitted [https://lists.gnu.org/archive/html/qemu-deve=
l/2020-03/msg07188.html]
+Upstream-Status: Submitted [https://lists.gnu.org/archive/html/qemu-deve=
l/2020-03/msg07188.html]
 Signed-off-by: Oleksiy Obitotskyy <oobitots@cisco.com>
=20
 [update patch context]
diff --git a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GL=
IBC__.patch b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__G=
LIBC__.patch
index e93886c9cd..a187f61f08 100644
--- a/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.p=
atch
+++ b/meta/recipes-extended/ltp/ltp/0004-guard-mallocopt-with-__GLIBC__.p=
atch
@@ -7,7 +7,7 @@ mallocopt is not available on non glibc implementations
=20
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
-[ Upstream-Status: accepted in 967612c454aea66770b64f69287671037fe895b3 =
]
+Upstream-Status: Accepted [967612c454aea66770b64f69287671037fe895b3]
 ---
  utils/benchmark/ebizzy-0.3/ebizzy.c | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)
diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-seg=
fault-on-probing-a-non-PCI-platform-device-on.patch b/meta/recipes-graphi=
cs/xorg-xserver/xserver-xorg/0001-Fix-segfault-on-probing-a-non-PCI-platf=
orm-device-on.patch
index 7b9e3b4cad..8b687d612d 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-o=
n-probing-a-non-PCI-platform-device-on.patch
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xorg/0001-Fix-segfault-o=
n-probing-a-non-PCI-platform-device-on.patch
@@ -10,7 +10,7 @@ case.
=20
 Signed-off-by: Eric Anholt <eric@anholt.net>
=20
-Upstream-status: Backport [https://github.com/freedesktop/xorg-xserver/c=
ommit/e50c85f4e]
+Upstream-Status: Backport [https://github.com/freedesktop/xorg-xserver/c=
ommit/e50c85f4e]
 Signed-off-by: An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.org>
 ---
  hw/xfree86/common/xf86platformBus.c | 2 +-
--=20
2.28.0

