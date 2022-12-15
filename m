Return-Path: <florin.diaconescu009@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80089C4332F
	for <webhook@archiver.kernel.org>; Thu, 15 Dec 2022 11:43:31 +0000 (UTC)
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
 by mx.groups.io with SMTP id smtpd.web11.131661.1671104604810869895
 for <openembedded-core@lists.openembedded.org>;
 Thu, 15 Dec 2022 03:43:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=lK74K3wb;
 spf=pass (domain: gmail.com, ip: 209.85.160.175, mailfrom: florin.diaconescu009@gmail.com)
Received: by mail-qt1-f175.google.com with SMTP id g7so4915571qts.1
        for <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 03:43:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MffX7tHwa1a8OmQKnppJwcdrErPVdOIi1JnArSzC9bI=;
        b=lK74K3wbHwwFHGXDrIx4FJh3jlJ3xv4PeRMUNqRA8xWRLAc+nsE0H9zlmfCZiixuZi
         RcTCFSO5CX3uAbEkPy8vAwbSQ9Nl+rpn1MsYuSEZq8QnuevEoCK1CpV/47YC6b53PlqC
         20Ikd2UwZf0wJde4JIZP9kXX6tSm0f+epR4A4pFJ/S1wnMCCDfOXVgkdFty84V5YI2dZ
         wCQfEmtsdmiyP1zYz1532SdBKcNAsbSIC6mYA9T/GnpwlVEwG2XhBdpexg02EefEVqpZ
         KfxjlaEYw0e7GuWBfkOXHEXP5CWetOEHAOKPvY5JUwF8lVAthuubr9ENIokmW0cTE8Zk
         b0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MffX7tHwa1a8OmQKnppJwcdrErPVdOIi1JnArSzC9bI=;
        b=RilKfr29YF2JNYkUWLKxuZSZQuVDPWHFJMZz/WWeSTzqRSNUmFtccr24zbZ8U7Pt08
         XhB500XBc4h0EXe9Wmfv5pIdqupBy6QjoPFwNu6eSQeP2otPrMwqyFy+GshJ7cyfJdG1
         0fDpJvqEzDpqAC+iqGblVqnFlx5wiEmX12tZ6JvcSSrHcBxpLd7YOouNizpXsMezN8cG
         /0G5PLnWWDYt9LvAEfdKxg+gv33oUU0RXVE0/hlITD3TrtUiRZAj+wMT4iRkWf53LPGz
         W5SHVvlU64pUpvOXWvdrDbXxoGjgxQixA6w2TjeWub+1wvoIi/RaPP1AoiN59l872BoS
         YHWg==
X-Gm-Message-State: ANoB5pk4bimv4wqEUUgmmlWwH0seDKarDAes8RYwpPObuTDaXUtBtal+
	1+aNxRS1zzfs5m7z7e624QqvZQwVnkU=
X-Google-Smtp-Source: AA0mqf50fl/NkxjtZGTTSIPLmVuKAu5KXYGVwcGes5ZBXERHmKUwgHg/lwilGvslqE11UCU8tLryrQ==
X-Received: by 2002:ac8:5805:0:b0:3a5:31cc:50ff with SMTP id g5-20020ac85805000000b003a531cc50ffmr50412225qtg.9.1671104603420;
        Thu, 15 Dec 2022 03:43:23 -0800 (PST)
Received: from FDIACONESCU-KS0.lenovo.com ([92.87.113.28])
        by smtp.gmail.com with ESMTPSA id y8-20020a05620a25c800b006fa8299b4d5sm11876871qko.100.2022.12.15.03.43.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 03:43:23 -0800 (PST)
From: Florin Diaconescu <florin.diaconescu009@gmail.com>
To: openembedded-core@lists.openembedded.org
Cc: Florin Diaconescu <florin.diaconescu009@gmail.com>
Subject: [kirkstone][PATCH] python3: upgrade 3.10.8 -> 3.10.9
Date: Thu, 15 Dec 2022 13:42:55 +0200
Message-Id: <20221215114254.429-1-florin.diaconescu009@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 15 Dec 2022 11:43:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174580

Security and bug fixes.

Drop patch for CVE-2022-42919 and CVE-2022-37454 which were merged in 3.10.9

Fixes:
* CVE-2022-45061 (gh-98433)
  https://nvd.nist.gov/vuln/detail/CVE-2022-45061

List of changes:
https://docs.python.org/3.10/whatsnew/changelog.html#python-3-10-9-final

Signed-off-by: Florin Diaconescu <florin.diaconescu009@gmail.com>
---
 .../python/python3/CVE-2022-42919.patch       |  70 ------------
 .../python/python3/cve-2022-37454.patch       | 108 ------------------
 .../{python3_3.10.8.bb => python3_3.10.9.bb}  |   3 +-
 3 files changed, 1 insertion(+), 180 deletions(-)
 delete mode 100644 meta/recipes-devtools/python/python3/CVE-2022-42919.patch
 delete mode 100644 meta/recipes-devtools/python/python3/cve-2022-37454.patch
 rename meta/recipes-devtools/python/{python3_3.10.8.bb => python3_3.10.9.bb} (99%)

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
diff --git a/meta/recipes-devtools/python/python3_3.10.8.bb b/meta/recipes-devtools/python/python3_3.10.9.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.8.bb
rename to meta/recipes-devtools/python/python3_3.10.9.bb
index 8963ce6dd2..d6b7a618c1 100644
--- a/meta/recipes-devtools/python/python3_3.10.8.bb
+++ b/meta/recipes-devtools/python/python3_3.10.9.bb
@@ -35,7 +35,6 @@ SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://0001-setup.py-Do-not-detect-multiarch-paths-when-cross-co.patch \
            file://deterministic_imports.patch \
            file://0001-Avoid-shebang-overflow-on-python-config.py.patch \
-           file://CVE-2022-42919.patch \
            "
 
 SRC_URI:append:class-native = " \
@@ -44,7 +43,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "6a30ecde59c47048013eb5a658c9b5dec277203d2793667f578df7671f7f03f3"
+SRC_URI[sha256sum] = "5ae03e308260164baba39921fdb4dbf8e6d03d8235a939d4582b33f0b5e46a83"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


