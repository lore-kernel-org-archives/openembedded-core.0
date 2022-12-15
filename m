Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92197C3DA6E
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 11:40:41 +0000 (UTC)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
 by mx.groups.io with SMTP id smtpd.web10.130758.1671104434282789375
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 03:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=c370ePGf;
 spf=pass (domain: gmail.com, ip: 209.85.218.54, mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-ej1-f54.google.com with SMTP id t17so51625820eju.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 03:40:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qpvf4hUsvShM+s+MmVhfam17UwlVWxse/dA0DIFgdsI=;
        b=c370ePGfAuSdSX3rWIGZcJ/pPLxH3e2Um3LPmUGmr332gCuxUH54K038QppTHNNhDE
         o451jiekJCUI/IJvMxJpIJy9MmIJojlrpYY+SoN9vQ8vmcubj1vk4e4YWj3osXcPW9be
         FE0rq4AmNgUty7yWmcFyv/XJN1lCKCaaYCEyyzvYNtVxyz2UhYXnvd3P0Yta56cfnzWv
         wXhP6XGXegW9bHS6FBqa2HoIOYXXfdKx3ndnJGflQeOjpvfVDEiaah1YoP9jbv3wtZHy
         TlB4wtvMiV0wEOaY7U/9M9qPQhvq8omUlPYBIneMd1BeNNUkf5LKcguygP9ISY+fWlud
         PLwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qpvf4hUsvShM+s+MmVhfam17UwlVWxse/dA0DIFgdsI=;
        b=BqddEOShqtRaFJbsw4ID1RNEMV308ffWel3QREWYseaxSY0pYFMPk8eHSYKDSZo5eB
         hXOZPepmhZ7TdJggP8BAqyhlhkNk6TYDDKXLjkMcXv9O58yPkIPSz2WV4NdwMtdFknJO
         3gMkI9iuBZ8zoONo1awAVLO8Cw04jGszjDvoOYl+TCwx5AekegyEzbs9XwXW25nMeiRS
         awpKrjrUXFoo51ceuR6JRtHDIbP+0uB7edm9I03yP56ajUDMh/jFINImtqW4RsuVwM/8
         ypMiTdqml0acBV7AJS0KXL0qUhP4UVrk3DzS5QBdlmOFE9spYISl7VBaNm1QLSiGlMdK
         ih2w==
X-Gm-Message-State: ANoB5pm5+XSmCEHWwlV+/K1lUum/PjXMmTnlC7Kxpwu+3db+77te57Hf
	XL5u4dEprK/bD808G0m9uHw8e23vAQU=
X-Google-Smtp-Source: AA0mqf6WMC3i64FBEYz3ADjiEadXU3H7uxQ0T9dKuJY4Ptmor0d4NuVfQyx4ivGhYW8BOfTRVx8alA==
X-Received: by 2002:a17:906:3a18:b0:7ba:5085:869 with SMTP id z24-20020a1709063a1800b007ba50850869mr23487325eje.9.1671104432029;
        Thu, 15 Dec 2022 03:40:32 -0800 (PST)
Received: from FDIACONESCU-KS0.lenovo.com ([92.87.113.28])
        by smtp.gmail.com with ESMTPSA id hb14-20020a170906b88e00b007c10d47e748sm7112543ejb.36.2022.12.15.03.40.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 03:40:31 -0800 (PST)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [kirkstone][PATCH] python3: upgrade 3.10.8 -> 3.10.9
Date: Thu, 15 Dec 2022 13:36:56 +0200
Message-Id: <20221215113655.315-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:40:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174579

Security and bug fixes.

Drop patch for CVE-2022-42919 and CVE-2022-37454 which were merged in 3.10.9

Fixes:
* CVE-2022-45061 (gh-98433)
  https://nvd.nist.gov/vuln/detail/CVE-2022-45061

List of changes:
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-9-final

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 .../python/python3/CVE-2022-42919.patch       |  70 ---
 .../python/python3/cve-2022-37454.patch       | 108 -----
 .../recipes-devtools/python/python3_3.10.9.bb | 428 ++++++++++++++++++
 3 files changed, 428 insertions(+), 178 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2022-42919.patch
 delete mode 100644 meta/recipes-devtools/python/python3/cve-2022-37454.patch
 create mode 100644 meta/recipes-devtools/python/python3_3.10.9.bb

diff --git a/meta/recipes-devtools/python/python3/CVE-2022-42919.patch b/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
deleted file mode 100644
index 6040724dae..0000000000
--- a/meta/recipes-devtools/python/python3/CVE-2022-42919.patch
+++ /dev/null
@@ -1,70 +0,0 @@
-From 87ef80926ea0ec960a220af89d8ff4db99417b03 Mon Sep 17 00:00:00 2001
-From: Vivek Kumbhar <vkumbhar@mvista.com>
-Date: Thu, 24 Nov 2022 17:44:18 +0530
-Subject: [PATCH] CVE-2022-42919
-
-Upstream-Status: Backport [https://github.com/python/cpython/commit/eae692eed18892309bcc25a2c0f8980038305ea2]
-CVE: CVE-2022-42919
-Signed-off-by: Vivek Kumbhar <vkumbhar@mvista.com>
-
-[3.10] gh-97514: Don't use Linux abstract sockets for multiprocessing (GH-98501) (GH-98503)
-
-Linux abstract sockets are insecure as they lack any form of filesystem
-permissions so their use allows anyone on the system to inject code into
-the process.
-
-This removes the default preference for abstract sockets in
-multiprocessing introduced in Python 3.9+ via
-https://github.com/python/cpython/pull/18866 while fixing
-https://github.com/python/cpython/issues/84031.
-
-Explicit use of an abstract socket by a user now generates a
-RuntimeWarning.  If we choose to keep this warning, it should be
-backported to the 3.7 and 3.8 branches.
-(cherry picked from commit 49f61068f49747164988ffc5a442d2a63874fc17)
----
- Lib/multiprocessing/connection.py                 |  5 -----
- .../2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst | 15 +++++++++++++++
- 2 files changed, 15 insertions(+), 5 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
-
-diff --git a/Lib/multiprocessing/connection.py b/Lib/multiprocessing/connection.py
-index 510e4b5..8e2facf 100644
---- a/Lib/multiprocessing/connection.py
-+++ b/Lib/multiprocessing/connection.py
-@@ -73,11 +73,6 @@ def arbitrary_address(family):
-     if family == 'AF_INET':
-         return ('localhost', 0)
-     elif family == 'AF_UNIX':
--        # Prefer abstract sockets if possible to avoid problems with the address
--        # size.  When coding portable applications, some implementations have
--        # sun_path as short as 92 bytes in the sockaddr_un struct.
--        if util.abstract_sockets_supported:
--            return f"\0listener-{os.getpid()}-{next(_mmap_counter)}"
-         return tempfile.mktemp(prefix='listener-', dir=util.get_temp_dir())
-     elif family == 'AF_PIPE':
-         return tempfile.mktemp(prefix=r'\\.\pipe\pyc-%d-%d-' %
-diff --git a/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
-new file mode 100644
-index 0000000..02d95b5
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2022-09-07-10-42-00.gh-issue-97514.Yggdsl.rst
-@@ -0,0 +1,15 @@
-+On Linux the :mod:`multiprocessing` module returns to using filesystem backed
-+unix domain sockets for communication with the *forkserver* process instead of
-+the Linux abstract socket namespace.  Only code that chooses to use the
-+:ref:`"forkserver" start method <multiprocessing-start-methods>` is affected.
-+
-+Abstract sockets have no permissions and could allow any user on the system in
-+the same `network namespace
-+<https://man7.org/linux/man-pages/man7/network_namespaces.7.html>`_ (often the
-+whole system) to inject code into the multiprocessing *forkserver* process.
-+This was a potential privilege escalation. Filesystem based socket permissions
-+restrict this to the *forkserver* process user as was the default in Python 3.8
-+and earlier.
-+
-+This prevents Linux `CVE-2022-42919
-+<https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2022-42919>`_.
--- 
-2.25.1
-
diff --git a/meta/recipes-devtools/python/python3/cve-2022-37454.patch b/meta/recipes-devtools/python/python3/cve-2022-37454.patch
deleted file mode 100644
index c019151a64..0000000000
--- a/meta/recipes-devtools/python/python3/cve-2022-37454.patch
+++ /dev/null
@@ -1,108 +0,0 @@
-From 1f66b714c5f2fef80ec5389456ac31756dbfff0e Mon Sep 17 00:00:00 2001
-From: Theo Buehler <botovq@users.noreply.github.com>
-Date: Fri, 21 Oct 2022 21:26:01 +0200
-Subject: [PATCH] gh-98517: Fix buffer overflows in _sha3 module (#98519)
-
-This is a port of the applicable part of XKCP's fix [1] for
-CVE-2022-37454 and avoids the segmentation fault and the infinite
-loop in the test cases published in [2].
-
-[1]: https://github.com/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc38364248975e08e340a
-[2]: https://mouha.be/sha-3-buffer-overflow/
-
-Regression test added by: Gregory P. Smith [Google LLC] <greg@krypto.org>
----
-
-Patch applied without modification.
-
-CVE: CVE-2022-37454
-
-Upstream-Status: Backport [github.com/cpython/cpython.git 0e4e058602d...]
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
----
- Lib/test/test_hashlib.py                          |  9 +++++++++
- .../2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst |  1 +
- Modules/_sha3/kcp/KeccakSponge.inc                | 15 ++++++++-------
- 3 files changed, 18 insertions(+), 7 deletions(-)
- create mode 100644 Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
-
-diff --git a/Lib/test/test_hashlib.py b/Lib/test/test_hashlib.py
-index ea31f8b..65330e1 100644
---- a/Lib/test/test_hashlib.py
-+++ b/Lib/test/test_hashlib.py
-@@ -491,6 +491,15 @@ class HashLibTestCase(unittest.TestCase):
-     def test_case_md5_uintmax(self, size):
-         self.check('md5', b'A'*size, '28138d306ff1b8281f1a9067e1a1a2b3')
- 
-+    @unittest.skipIf(sys.maxsize < _4G - 1, 'test cannot run on 32-bit systems')
-+    @bigmemtest(size=_4G - 1, memuse=1, dry_run=False)
-+    def test_sha3_update_overflow(self, size):
-+        """Regression test for gh-98517 CVE-2022-37454."""
-+        h = hashlib.sha3_224()
-+        h.update(b'\x01')
-+        h.update(b'\x01'*0xffff_ffff)
-+        self.assertEqual(h.hexdigest(), '80762e8ce6700f114fec0f621fd97c4b9c00147fa052215294cceeed')
-+
-     # use the three examples from Federal Information Processing Standards
-     # Publication 180-1, Secure Hash Standard,  1995 April 17
-     # http://www.itl.nist.gov/div897/pubs/fip180-1.htm
-diff --git a/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
-new file mode 100644
-index 0000000..2d23a6a
---- /dev/null
-+++ b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
-@@ -0,0 +1 @@
-+Port XKCP's fix for the buffer overflows in SHA-3 (CVE-2022-37454).
-diff --git a/Modules/_sha3/kcp/KeccakSponge.inc b/Modules/_sha3/kcp/KeccakSponge.inc
-index e10739d..cf92e4d 100644
---- a/Modules/_sha3/kcp/KeccakSponge.inc
-+++ b/Modules/_sha3/kcp/KeccakSponge.inc
-@@ -171,7 +171,7 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
-     i = 0;
-     curData = data;
-     while(i < dataByteLen) {
--        if ((instance->byteIOIndex == 0) && (dataByteLen >= (i + rateInBytes))) {
-+        if ((instance->byteIOIndex == 0) && (dataByteLen-i >= rateInBytes)) {
- #ifdef SnP_FastLoop_Absorb
-             /* processing full blocks first */
- 
-@@ -199,10 +199,10 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
-         }
-         else {
-             /* normal lane: using the message queue */
--
--            partialBlock = (unsigned int)(dataByteLen - i);
--            if (partialBlock+instance->byteIOIndex > rateInBytes)
-+            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
-                 partialBlock = rateInBytes-instance->byteIOIndex;
-+            else
-+                partialBlock = (unsigned int)(dataByteLen - i);
-             #ifdef KeccakReference
-             displayBytes(1, "Block to be absorbed (part)", curData, partialBlock);
-             #endif
-@@ -281,7 +281,7 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
-     i = 0;
-     curData = data;
-     while(i < dataByteLen) {
--        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen >= (i + rateInBytes))) {
-+        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen-i >= rateInBytes)) {
-             for(j=dataByteLen-i; j>=rateInBytes; j-=rateInBytes) {
-                 SnP_Permute(instance->state);
-                 SnP_ExtractBytes(instance->state, curData, 0, rateInBytes);
-@@ -299,9 +299,10 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
-                 SnP_Permute(instance->state);
-                 instance->byteIOIndex = 0;
-             }
--            partialBlock = (unsigned int)(dataByteLen - i);
--            if (partialBlock+instance->byteIOIndex > rateInBytes)
-+            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
-                 partialBlock = rateInBytes-instance->byteIOIndex;
-+            else
-+                partialBlock = (unsigned int)(dataByteLen - i);
-             i += partialBlock;
- 
-             SnP_ExtractBytes(instance->state, curData, instance->byteIOIndex, partialBlock);
--- 
-2.32.0
-
diff --git a/meta/recipes-devtools/python/python3_3.10.9.bb b/meta/recipes-devtools/python/python3_3.10.9.bb
new file mode 100644
index 0000000000..d6b7a618c1
--- /dev/null
+++ b/meta/recipes-devtools/python/python3_3.10.9.bb
@@ -0,0 +1,428 @@
+SUMMARY = "The Python Programming Language"
+HOMEPAGE = "http://www.python.org"
+DESCRIPTION = "Python is a programming language that lets you work more quickly and integrate your systems more effectively."
+LICENSE = "PSF-2.0"
+SECTION = "devel/python"
+
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a1822df8d0f068628ca6090aedc5bfc8"
+
+SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
+           file://run-ptest \
+           file://create_manifest3.py \
+           file://get_module_deps3.py \
+           file://python3-manifest.json \
+           file://check_build_completeness.py \
+           file://reformat_sysconfig.py \
+           file://cgi_py.patch \
+           file://0001-Do-not-add-usr-lib-termcap-to-linker-flags-to-avoid-.patch \
+           ${@bb.utils.contains('PACKAGECONFIG', 'tk', '', 'file://avoid_warning_about_tkinter.patch', d)} \
+           file://0001-Do-not-use-the-shell-version-of-python-config-that-w.patch \
+           file://python-config.patch \
+           file://0001-Makefile.pre-use-qemu-wrapper-when-gathering-profile.patch \
+           file://0001-python3-use-cc_basename-to-replace-CC-for-checking-c.patch \
+           file://0001-bpo-36852-proper-detection-of-mips-architecture-for-.patch \
+           file://crosspythonpath.patch \
+           file://0001-Use-FLAG_REF-always-for-interned-strings.patch \
+           file://0001-test_locale.py-correct-the-test-output-format.patch \
+           file://0017-setup.py-do-not-report-missing-dependencies-for-disa.patch \
+           file://0001-Makefile-do-not-compile-.pyc-in-parallel.patch \
+           file://0020-configure.ac-setup.py-do-not-add-a-curses-include-pa.patch \
+           file://0001-Skip-failing-tests-due-to-load-variability-on-YP-AB.patch \
+           file://0001-test_ctypes.test_find-skip-without-tools-sdk.patch \
+           file://makerace.patch \
+           file://0001-sysconfig.py-use-platlibdir-also-for-purelib.patch \
+           file://0001-Lib-pty.py-handle-stdin-I-O-errors-same-way-as-maste.patch \
+           file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
+           file://deterministic_imports.patch \
+           file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
+           "
+
+SRC_URI:append:class-native = " \
+           file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
+           file://0001-distutils-sysconfig-append-STAGING_LIBDIR-python-sys.patch \
+           file://12-distutils-prefix-is-inside-staging-area.patch \
+           file://0001-Don-t-search-system-for-headers-libraries.patch \
+           "
+SRC_URI[sha256sum] = "5ae03e308260164baba39921fdb4dbf8e6d03d8235a939d4582b33f0b5e46a83"
+
+# exclude pre-releases for both python 2.x and 3.x
+UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
+UPSTREAM_CHECK_URI = "https://www.python.org/downloads/source/"
+
+CVE_PRODUCT = "python"
+
+# Upstream consider this expected behaviour
+CVE_CHECK_IGNORE += "CVE-2007-4559"
+# This is not exploitable when glibc has CVE-2016-10739 fixed.
+CVE_CHECK_IGNORE += "CVE-2019-18348"
+# These are specific to Microsoft Windows
+CVE_CHECK_IGNORE += "CVE-2020-15523 CVE-2022-26488"
+# The mailcap module is insecure by design, so this can't be fixed in a meaningful way.
+# The module will be removed in the future and flaws documented.
+CVE_CHECK_IGNORE += "CVE-2015-20107"
+
+PYTHON_MAJMIN = "3.10"
+
+S = "${WORKDIR}/Python-${PV}"
+
+BBCLASSEXTEND = "native nativesdk"
+
+inherit autotools pkgconfig qemu ptest multilib_header update-alternatives
+
+MULTILIB_SUFFIX = "${@d.getVar('base_libdir',1).split('/')[-1]}"
+
+ALTERNATIVE:${PN}-dev = "python3-config"
+ALTERNATIVE_LINK_NAME[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config"
+ALTERNATIVE_TARGET[python3-config] = "${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}"
+
+
+DEPENDS = "bzip2-replacement-native libffi bzip2 openssl sqlite3 zlib virtual/libintl xz virtual/crypt util-linux-libuuid libtirpc libnsl2 autoconf-archive-native ncurses"
+DEPENDS:append:class-target = " python3-native"
+DEPENDS:append:class-nativesdk = " python3-native"
+
+# force to use the mutex+cond implementation (https://bugs.python.org/issue41710)
+CFLAGS += "-DHAVE_BROKEN_POSIX_SEMAPHORES"
+
+EXTRA_OECONF = " --without-ensurepip --enable-shared --with-platlibdir=${baselib}"
+EXTRA_OECONF:append:class-native = " --bindir=${bindir}/${PN}"
+
+export CROSSPYTHONPATH="${STAGING_LIBDIR_NATIVE}/python${PYTHON_MAJMIN}/lib-dynload/"
+
+EXTRANATIVEPATH += "python3-native"
+
+# LTO will be enabled via packageconfig depending upong distro features
+LTO:class-target = ""
+
+CACHED_CONFIGUREVARS = " \
+                ac_cv_file__dev_ptmx=yes \
+                ac_cv_file__dev_ptc=no \
+                ac_cv_working_tzset=yes \
+"
+
+# PGO currently causes builds to not be reproducible so disable by default, see YOCTO #13407
+PACKAGECONFIG:class-target ??= "readline gdbm ${@bb.utils.filter('DISTRO_FEATURES', 'lto', d)}"
+PACKAGECONFIG:class-native ??= "readline gdbm"
+PACKAGECONFIG:class-nativesdk ??= "readline gdbm"
+PACKAGECONFIG[readline] = ",,readline"
+# Use profile guided optimisation by running PyBench inside qemu-user
+PACKAGECONFIG[pgo] = "--enable-optimizations,,qemu-native"
+PACKAGECONFIG[tk] = ",,tk"
+PACKAGECONFIG[gdbm] = ",,gdbm"
+PACKAGECONFIG[lto] = "--with-lto,,"
+
+do_configure:prepend () {
+    mkdir -p ${B}/Modules
+    cat > ${B}/Modules/Setup.local << EOF
+*disabled*
+${@bb.utils.contains('PACKAGECONFIG', 'gdbm', '', '_gdbm _dbm', d)}
+${@bb.utils.contains('PACKAGECONFIG', 'readline', '', 'readline', d)}
+EOF
+}
+
+CPPFLAGS:append = " -I${STAGING_INCDIR}/ncursesw -I${STAGING_INCDIR}/uuid"
+
+EXTRA_OEMAKE = '\
+  STAGING_LIBDIR=${STAGING_LIBDIR} \
+  STAGING_INCDIR=${STAGING_INCDIR} \
+  LIB=${baselib} \
+'
+
+do_compile:prepend:class-target() {
+       if ${@bb.utils.contains('PACKAGECONFIG', 'pgo', 'true', 'false', d)}; then
+                qemu_binary="${@qemu_wrapper_cmdline(d, '${STAGING_DIR_TARGET}', ['${B}', '${STAGING_DIR_TARGET}/${base_libdir}'])}"
+                cat >pgo-wrapper <<EOF
+#!/bin/sh
+cd ${B}
+$qemu_binary "\$@"
+EOF
+                chmod +x pgo-wrapper
+        fi
+}
+
+do_install:prepend() {
+        ${WORKDIR}/check_build_completeness.py ${T}/log.do_compile
+}
+
+do_install:append:class-target() {
+        oe_multilib_header python${PYTHON_MAJMIN}/pyconfig.h
+}
+
+do_install:append:class-native() {
+        # Make sure we use /usr/bin/env python
+        for PYTHSCRIPT in `grep -rIl ${bindir}/${PN}/python ${D}${bindir}/${PN}`; do
+                sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
+        done
+        # Add a symlink to the native Python so that scripts can just invoke
+        # "nativepython" and get the right one without needing absolute paths
+        # (these often end up too long for the #! parser in the kernel as the
+        # buffer is 128 bytes long).
+        ln -s python3-native/python3 ${D}${bindir}/nativepython3
+
+        # Remove the opt-1.pyc and opt-2.pyc files. There are over 3,000 of them
+        # and the overhead in each recipe-sysroot-native isn't worth it, particularly
+        # when they're only used for python called with -O or -OO.
+        #find ${D} -name *opt-*.pyc -delete
+        # Remove all pyc files. There are a ton of them and it is probably faster to let
+        # python create the ones it wants at runtime rather than manage in the sstate 
+        # tarballs and sysroot creation.
+        find ${D} -name *.pyc -delete
+
+        # Nothing should be looking into ${B} for python3-native
+        sed -i -e 's:${B}:/build/path/unavailable/:g' \
+                ${D}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile
+}
+
+do_install:append() {
+        for c in ${D}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+            python3 ${WORKDIR}/reformat_sysconfig.py $c
+        done
+        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/_sysconfigdata*.cpython*
+
+        mkdir -p ${D}${libdir}/python-sysconfigdata
+        sysconfigfile=`find ${D} -name _sysconfig*.py`
+        sed -i  \
+                -e "s,^ 'LIBDIR'.*, 'LIBDIR': '${STAGING_LIBDIR}'\,,g" \
+                -e "s,^ 'INCLUDEDIR'.*, 'INCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
+                -e "s,^ 'CONFINCLUDEDIR'.*, 'CONFINCLUDEDIR': '${STAGING_INCDIR}'\,,g" \
+                -e "/^ 'INCLDIRSTOMAKE'/{N; s,/usr/include,${STAGING_INCDIR},g}" \
+                -e "/^ 'INCLUDEPY'/s,/usr/include,${STAGING_INCDIR},g" \
+                -e "s,${B},/build/path/unavailable/,g" \
+                $sysconfigfile
+        cp $sysconfigfile ${D}${libdir}/python-sysconfigdata/_sysconfigdata.py
+
+
+        # Unfortunately the following pyc files are non-deterministc due to 'frozenset'
+        # being written without strict ordering, even with PYTHONHASHSEED = 0
+        # Upstream is discussing ways to solve the issue properly, until then let's
+        # just not install the problematic files.
+        # More info: http://benno.id.au/blog/2013/01/15/python-determinism
+        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_range.cpython*
+        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/test/__pycache__/test_xml_etree.cpython*
+
+        # Similar to the above, we're getting reproducibility issues with 
+        # /usr/lib/python3.10/__pycache__/traceback.cpython-310.pyc
+        # so remove it too
+        rm -f ${D}${libdir}/python${PYTHON_MAJMIN}/__pycache__/traceback.cpython*
+
+        # Remove the opt-1.pyc and opt-2.pyc files. They effectively waste space on embedded
+        # style targets as they're only used when python is called with the -O or -OO options
+        # which is rare.
+        find ${D} -name *opt-*.pyc -delete
+}
+
+do_install:append:class-nativesdk () {
+    # Make sure we use /usr/bin/env python
+    for PYTHSCRIPT in `grep -rIl ${bindir}/python ${D}${bindir}`; do
+         sed -i -e '1s|^#!.*|#!/usr/bin/env python3|' $PYTHSCRIPT
+    done
+    create_wrapper ${D}${bindir}/python${PYTHON_MAJMIN} TERMINFO_DIRS='${sysconfdir}/terminfo:/etc/terminfo:/usr/share/terminfo:/usr/share/misc/terminfo:/lib/terminfo' PYTHONNOUSERSITE='1'
+}
+
+SSTATE_SCAN_FILES += "Makefile _sysconfigdata.py"
+SSTATE_HASHEQUIV_FILEMAP = " \
+    populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${TMPDIR} \
+    populate_sysroot:*/lib*/python3*/_sysconfigdata*.py:${COREBASE} \
+    populate_sysroot:*/lib*/python3*/config-*/Makefile:${TMPDIR} \
+    populate_sysroot:*/lib*/python3*/config-*/Makefile:${COREBASE} \
+    populate_sysroot:*/lib*/python-sysconfigdata/_sysconfigdata.py:${TMPDIR} \
+    populate_sysroot:*/lib*/python-sysconfigdata/_sysconfigdata.py:${COREBASE} \
+    "
+PACKAGE_PREPROCESS_FUNCS += "py_package_preprocess"
+
+py_package_preprocess () {
+        # Remove references to buildmachine paths in target Makefile and _sysconfigdata
+        sed -i -e 's:--sysroot=${STAGING_DIR_TARGET}::g' -e s:'--with-libtool-sysroot=${STAGING_DIR_TARGET}'::g \
+                -e 's|${DEBUG_PREFIX_MAP}||g' \
+                -e 's:${HOSTTOOLS_DIR}/::g' \
+                -e 's:${RECIPE_SYSROOT_NATIVE}::g' \
+                -e 's:${RECIPE_SYSROOT}::g' \
+                -e 's:${BASE_WORKDIR}/${MULTIMACH_TARGET_SYS}::g' \
+                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}${PYTHON_ABI}*/Makefile \
+                ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py \
+                ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config
+
+        # Reformat _sysconfigdata after modifying it so that it remains
+        # reproducible
+        for c in ${PKGD}/${libdir}/python${PYTHON_MAJMIN}/_sysconfigdata*.py; do
+            python3 ${WORKDIR}/reformat_sysconfig.py $c
+        done
+
+        # Recompile _sysconfigdata after modifying it
+        cd ${PKGD}
+        sysconfigfile=`find . -name _sysconfigdata_*.py`
+        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+             -c "from py_compile import compile; compile('$sysconfigfile')"
+        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+             -c "from py_compile import compile; compile('$sysconfigfile', optimize=1)"
+        ${STAGING_BINDIR_NATIVE}/python3-native/python3 \
+             -c "from py_compile import compile; compile('$sysconfigfile', optimize=2)"
+        cd -
+
+        mv ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config ${PKGD}/${bindir}/python${PYTHON_MAJMIN}-config-${MULTILIB_SUFFIX}
+        
+        #Remove the unneeded copy of target sysconfig data
+        rm -rf ${PKGD}/${libdir}/python-sysconfigdata
+}
+
+# We want bytecode precompiled .py files (.pyc's) by default
+# but the user may set it on their own conf
+INCLUDE_PYCS ?= "1"
+
+python(){
+    import collections, json
+
+    filename = os.path.join(d.getVar('THISDIR'), 'python3', 'python3-manifest.json')
+    # This python changes the datastore based on the contents of a file, so mark
+    # that dependency.
+    bb.parse.mark_dependency(d, filename)
+
+    with open(filename) as manifest_file:
+        manifest_str =  manifest_file.read()
+        json_start = manifest_str.find('# EOC') + 6
+        manifest_file.seek(json_start)
+        manifest_str = manifest_file.read()
+        python_manifest = json.loads(manifest_str, object_pairs_hook=collections.OrderedDict)
+
+    # First set RPROVIDES for -native case
+    # Hardcoded since it cant be python3-native-foo, should be python3-foo-native
+    pn = 'python3'
+    rprovides = (d.getVar('RPROVIDES') or "").split()
+
+    # ${PN}-misc-native is not in the manifest
+    rprovides.append(pn + '-misc-native')
+
+    for key in python_manifest:
+        pypackage = pn + '-' + key + '-native'
+        if pypackage not in rprovides:
+              rprovides.append(pypackage)
+
+    d.setVar('RPROVIDES:class-native', ' '.join(rprovides))
+
+    # Then work on the target
+    include_pycs = d.getVar('INCLUDE_PYCS')
+
+    packages = d.getVar('PACKAGES').split()
+    pn = d.getVar('PN')
+
+    newpackages=[]
+    for key in python_manifest:
+        pypackage = pn + '-' + key
+
+        if pypackage not in packages:
+            # We need to prepend, otherwise python-misc gets everything
+            # so we use a new variable
+            newpackages.append(pypackage)
+
+        # "Build" python's manifest FILES, RDEPENDS and SUMMARY
+        d.setVar('FILES:' + pypackage, '')
+        for value in python_manifest[key]['files']:
+            d.appendVar('FILES:' + pypackage, ' ' + value)
+
+        # Add cached files
+        if include_pycs == '1':
+            for value in python_manifest[key]['cached']:
+                    d.appendVar('FILES:' + pypackage, ' ' + value)
+
+        for value in python_manifest[key]['rdepends']:
+            # Make it work with or without $PN
+            if '${PN}' in value:
+                value=value.split('-', 1)[1]
+            d.appendVar('RDEPENDS:' + pypackage, ' ' + pn + '-' + value)
+
+        for value in python_manifest[key].get('rrecommends', ()):
+            if '${PN}' in value:
+                value=value.split('-', 1)[1]
+            d.appendVar('RRECOMMENDS:' + pypackage, ' ' + pn + '-' + value)
+
+        d.setVar('SUMMARY:' + pypackage, python_manifest[key]['summary'])
+
+    # Prepending so to avoid python-misc getting everything
+    packages = newpackages + packages
+    d.setVar('PACKAGES', ' '.join(packages))
+    d.setVar('ALLOW_EMPTY:${PN}-modules', '1')
+    d.setVar('ALLOW_EMPTY:${PN}-pkgutil', '1')
+
+    if "pgo" in d.getVar("PACKAGECONFIG").split() and not bb.utils.contains('MACHINE_FEATURES', 'qemu-usermode', True, False, d):
+        bb.fatal("pgo cannot be enabled as there is no qemu-usermode support for this architecture/machine")
+}
+
+# Files needed to create a new manifest
+
+do_create_manifest() {
+    # This task should be run with every new release of Python.
+    # We must ensure that PACKAGECONFIG enables everything when creating
+    # a new manifest, this is to base our new manifest on a complete
+    # native python build, containing all dependencies, otherwise the task
+    # wont be able to find the required files.
+    # e.g. BerkeleyDB is an optional build dependency so it may or may not
+    # be present, we must ensure it is.
+
+    cd ${WORKDIR}
+    # This needs to be executed by python-native and NOT by HOST's python
+    nativepython3 create_manifest3.py ${PYTHON_MAJMIN}
+    cp python3-manifest.json.new ${THISDIR}/python3/python3-manifest.json
+}
+
+# bitbake python -c create_manifest
+# Make sure we have native python ready when we create a new manifest
+addtask do_create_manifest after do_patch do_prepare_recipe_sysroot
+
+# manual dependency additions
+RRECOMMENDS:${PN}-core:append:class-nativesdk = " nativesdk-python3-modules"
+RRECOMMENDS:${PN}-crypt:append:class-target = " ${MLPREFIX}openssl ${MLPREFIX}ca-certificates"
+RRECOMMENDS:${PN}-crypt:append:class-nativesdk = " ${MLPREFIX}openssl ${MLPREFIX}ca-certificates"
+
+# For historical reasons PN is empty and provided by python3-modules
+FILES:${PN} = ""
+RPROVIDES:${PN}-modules = "${PN}"
+
+FILES:${PN}-pydoc += "${bindir}/pydoc${PYTHON_MAJMIN} ${bindir}/pydoc3"
+FILES:${PN}-idle += "${bindir}/idle3 ${bindir}/idle${PYTHON_MAJMIN}"
+
+# provide python-pyvenv from python3-venv
+RPROVIDES:${PN}-venv += "${MLPREFIX}python3-pyvenv"
+
+# package libpython3
+PACKAGES =+ "libpython3 libpython3-staticdev"
+FILES:libpython3 = "${libdir}/libpython*.so.*"
+FILES:libpython3-staticdev += "${libdir}/python${PYTHON_MAJMIN}/config-${PYTHON_MAJMIN}-*/libpython${PYTHON_MAJMIN}.a"
+INSANE_SKIP:${PN}-dev += "dev-elf"
+INSANE_SKIP:${PN}-ptest = "dev-deps"
+
+# catch all the rest (unsorted)
+PACKAGES += "${PN}-misc"
+RDEPENDS:${PN}-misc += "\
+  ${PN}-core \
+  ${PN}-email \
+  ${PN}-codecs \
+  ${PN}-pydoc \
+  ${PN}-pickle \
+  ${PN}-audio \
+  ${PN}-numbers \
+"
+RDEPENDS:${PN}-modules:append:class-target = " ${MLPREFIX}python3-misc"
+RDEPENDS:${PN}-modules:append:class-nativesdk = " ${MLPREFIX}python3-misc"
+FILES:${PN}-misc = "${libdir}/python${PYTHON_MAJMIN} ${libdir}/python${PYTHON_MAJMIN}/lib-dynload"
+
+# catch manpage
+PACKAGES += "${PN}-man"
+FILES:${PN}-man = "${datadir}/man"
+
+# See https://bugs.python.org/issue18748 and https://bugs.python.org/issue37395
+RDEPENDS:libpython3:append:libc-glibc = " libgcc"
+RDEPENDS:${PN}-ctypes:append:libc-glibc = " ${MLPREFIX}ldconfig"
+RDEPENDS:${PN}-ptest = "${PN}-modules ${PN}-tests ${PN}-dev unzip bzip2 libgcc tzdata-europe coreutils sed"
+RDEPENDS:${PN}-ptest:append:libc-glibc = " locale-base-tr-tr.iso-8859-9"
+RDEPENDS:${PN}-tkinter += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${MLPREFIX}tk ${MLPREFIX}tk-lib', '', d)}"
+RDEPENDS:${PN}-idle += "${@bb.utils.contains('PACKAGECONFIG', 'tk', '${PN}-tkinter ${MLPREFIX}tcl', '', d)}"
+RDEPENDS:${PN}-dev = ""
+RDEPENDS:${PN}-pydoc += "${PN}-io"
+
+RDEPENDS:${PN}-tests:append:class-target = " ${MLPREFIX}bash"
+RDEPENDS:${PN}-tests:append:class-nativesdk = " ${MLPREFIX}bash"
+
+# Python's tests contain large numbers of files we don't need in the recipe sysroots
+SYSROOT_PREPROCESS_FUNCS += " py3_sysroot_cleanup"
+py3_sysroot_cleanup () {
+	rm -rf ${SYSROOT_DESTDIR}${libdir}/python${PYTHON_MAJMIN}/test
+}
-- 
2.25.1


