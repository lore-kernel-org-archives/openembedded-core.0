Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42582C4332F
	for <webhook@archiver.kernel.org>; Thu,  8 Dec 2022 22:43:14 +0000 (UTC)
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
 by mx.groups.io with SMTP id smtpd.web11.4572.1670539386398613815
 for <openembedded-core@lists.openembedded.org>;
 Thu, 08 Dec 2022 14:43:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112 header.b=qd0GsgGc;
 spf=softfail (domain: sakoman.com, ip: 209.85.216.42, mailfrom: steve@sakoman.com)
Received: by mail-pj1-f42.google.com with SMTP id n65-20020a17090a2cc700b0021bc5ef7a14so3070006pjd.0
        for <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 14:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IcAwWK7DLL1H+LRZrJMWLxnRx+p3p9bbgGgGsU3Bulw=;
        b=qd0GsgGcnsYFXkB09ObwOcWd21pzgiLRQhDULEMTc8K7NNXfg7A8rDFUORhlUXb4E3
         LJI99Da4Yu4mL6LzRjqDUe54ymjCdQuacbv50kyG4V3lssEm9rOZZbFhPPcZMfsaqJNh
         IgjPhAT+wuVYhXicz4d/AMcmnprWKboBKI3EXFJXGTLoM3WQBv9EVWlLgvOqF+uwnOQ7
         gTWn7Rnk42QtKsqvZxW0yzUAlEa4KlBY4O/wMyOmxOfB/KaFGhBn5LYuILwtS8qAXbJL
         SVoEZBb/dsiFI6bh/IDDrVXquM2q0nkYkdUcO0IbYtQW35x1k73FNwSgaunO+gsTI1Jf
         86JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IcAwWK7DLL1H+LRZrJMWLxnRx+p3p9bbgGgGsU3Bulw=;
        b=PfzH0y8KG/FMxad7ScYLc2MfEU72pSbTZnf+A9pTGQVrFRc90jO5X7RhakpXPjIFzI
         2FMcsWNBB4at2PDgOnH5LCOECCqTuIEKIQUKul5xqkGocWhrHJ3n3g+utGjvJcJ2aZxw
         yDSZ8u2L1SBVAstujXeQkJrrAnjNC6AtM3tXIYywhZFTSizrLhdOT1vD/hnJUl69Hjgt
         mIWPR7LM5Ey0HNkuoyvApEtIBUAvLIzi4EmHdZNStiVWZvCIoxZV8kX74F4WmPsBwhiU
         hC44etq1UV95NJ6iaHA8Ef0IfBne3cCdHWIqw4Uuzab5ga/gryQ8vad43i0Zce+CoGhW
         aFag==
X-Gm-Message-State: ANoB5plJXKgmcNrS0fu1yjq2JC5bYB6I0gxFhmkjVR7U0OCh/LQaR/ah
	srrglyx744cI1uIeKqlvjphZswp+PtbBnWWl9BuG7Q==
X-Google-Smtp-Source: AA0mqf41UBzDYwQhqpuc2QO4uQ6pIm3AsisWv0BvZ0JMWUwNfabf0AOL/+YTox0EYvsjFsIVe7TI7Q==
X-Received: by 2002:a17:902:e5cd:b0:188:f547:c0ed with SMTP id u13-20020a170902e5cd00b00188f547c0edmr4900478plf.38.1670539392978;
        Thu, 08 Dec 2022 14:43:12 -0800 (PST)
Received: from hexa.router0800d9.com (dhcp-72-253-6-214.hawaiiantel.net. [72.253.6.214])
        by smtp.gmail.com with ESMTPSA id p1-20020a1709027ec100b00172973d3cd9sm1675980plb.55.2022.12.08.14.43.12
        for <openembedded-core@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Dec 2022 14:43:12 -0800 (PST)
From: Steve Sakoman <steve@sakoman.com>
To: openembedded-core@lists.openembedded.org
Subject: [OE-core][kirkstone 06/12] python3: advance to version 3.10.8
Date: Thu,  8 Dec 2022 12:42:47 -1000
Message-Id: <cfd015005586577679bd973e203a0eb12235b723.1670539236.git.steve@sakoman.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1670539235.git.steve@sakoman.com>
References: <cover.1670539235.git.steve@sakoman.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 08 Dec 2022 22:43:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174419

From: Joe Slater <joe.slater@windriver.com>

Fixes CVE-2022-37460.  Also add patch to fix CVE-2022-37454.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Steve Sakoman <steve@sakoman.com>
---
 .../python/python3/cve-2022-37454.patch       | 108 ++++++++++++++++++
 .../{python3_3.10.7.bb => python3_3.10.8.bb}  |   4 +-
 2 files changed, 110 insertions(+), 2 deletions(-)
 create mode 100644 meta/recipes-devtools/python/python3/cve-2022-37454.patch
 rename meta/recipes-devtools/python/{python3_3.10.7.bb => python3_3.10.8.bb} (99%)

diff --git a/meta/recipes-devtools/python/python3/cve-2022-37454.patch b/meta/recipes-devtools/python/python3/cve-2022-37454.patch
new file mode 100644
index 0000000000..c019151a64
--- /dev/null
+++ b/meta/recipes-devtools/python/python3/cve-2022-37454.patch
@@ -0,0 +1,108 @@
+From 1f66b714c5f2fef80ec5389456ac31756dbfff0e Mon Sep 17 00:00:00 2001
+From: Theo Buehler <botovq@users.noreply.github.com>
+Date: Fri, 21 Oct 2022 21:26:01 +0200
+Subject: [PATCH] gh-98517: Fix buffer overflows in _sha3 module (#98519)
+
+This is a port of the applicable part of XKCP's fix [1] for
+CVE-2022-37454 and avoids the segmentation fault and the infinite
+loop in the test cases published in [2].
+
+[1]: https://github.com/XKCP/XKCP/commit/fdc6fef075f4e81d6b1bc38364248975e08e340a
+[2]: https://mouha.be/sha-3-buffer-overflow/
+
+Regression test added by: Gregory P. Smith [Google LLC] <greg@krypto.org>
+---
+
+Patch applied without modification.
+
+CVE: CVE-2022-37454
+
+Upstream-Status: Backport [github.com/cpython/cpython.git 0e4e058602d...]
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+---
+ Lib/test/test_hashlib.py                          |  9 +++++++++
+ .../2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst |  1 +
+ Modules/_sha3/kcp/KeccakSponge.inc                | 15 ++++++++-------
+ 3 files changed, 18 insertions(+), 7 deletions(-)
+ create mode 100644 Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+
+diff --git a/Lib/test/test_hashlib.py b/Lib/test/test_hashlib.py
+index ea31f8b..65330e1 100644
+--- a/Lib/test/test_hashlib.py
++++ b/Lib/test/test_hashlib.py
+@@ -491,6 +491,15 @@ class HashLibTestCase(unittest.TestCase):
+     def test_case_md5_uintmax(self, size):
+         self.check('md5', b'A'*size, '28138d306ff1b8281f1a9067e1a1a2b3')
+ 
++    @unittest.skipIf(sys.maxsize < _4G - 1, 'test cannot run on 32-bit systems')
++    @bigmemtest(size=_4G - 1, memuse=1, dry_run=False)
++    def test_sha3_update_overflow(self, size):
++        """Regression test for gh-98517 CVE-2022-37454."""
++        h = hashlib.sha3_224()
++        h.update(b'\x01')
++        h.update(b'\x01'*0xffff_ffff)
++        self.assertEqual(h.hexdigest(), '80762e8ce6700f114fec0f621fd97c4b9c00147fa052215294cceeed')
++
+     # use the three examples from Federal Information Processing Standards
+     # Publication 180-1, Secure Hash Standard,  1995 April 17
+     # http://www.itl.nist.gov/div897/pubs/fip180-1.htm
+diff --git a/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+new file mode 100644
+index 0000000..2d23a6a
+--- /dev/null
++++ b/Misc/NEWS.d/next/Security/2022-10-21-13-31-47.gh-issue-98517.SXXGfV.rst
+@@ -0,0 +1 @@
++Port XKCP's fix for the buffer overflows in SHA-3 (CVE-2022-37454).
+diff --git a/Modules/_sha3/kcp/KeccakSponge.inc b/Modules/_sha3/kcp/KeccakSponge.inc
+index e10739d..cf92e4d 100644
+--- a/Modules/_sha3/kcp/KeccakSponge.inc
++++ b/Modules/_sha3/kcp/KeccakSponge.inc
+@@ -171,7 +171,7 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
+     i = 0;
+     curData = data;
+     while(i < dataByteLen) {
+-        if ((instance->byteIOIndex == 0) && (dataByteLen >= (i + rateInBytes))) {
++        if ((instance->byteIOIndex == 0) && (dataByteLen-i >= rateInBytes)) {
+ #ifdef SnP_FastLoop_Absorb
+             /* processing full blocks first */
+ 
+@@ -199,10 +199,10 @@ int SpongeAbsorb(SpongeInstance *instance, const unsigned char *data, size_t dat
+         }
+         else {
+             /* normal lane: using the message queue */
+-
+-            partialBlock = (unsigned int)(dataByteLen - i);
+-            if (partialBlock+instance->byteIOIndex > rateInBytes)
++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
+                 partialBlock = rateInBytes-instance->byteIOIndex;
++            else
++                partialBlock = (unsigned int)(dataByteLen - i);
+             #ifdef KeccakReference
+             displayBytes(1, "Block to be absorbed (part)", curData, partialBlock);
+             #endif
+@@ -281,7 +281,7 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
+     i = 0;
+     curData = data;
+     while(i < dataByteLen) {
+-        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen >= (i + rateInBytes))) {
++        if ((instance->byteIOIndex == rateInBytes) && (dataByteLen-i >= rateInBytes)) {
+             for(j=dataByteLen-i; j>=rateInBytes; j-=rateInBytes) {
+                 SnP_Permute(instance->state);
+                 SnP_ExtractBytes(instance->state, curData, 0, rateInBytes);
+@@ -299,9 +299,10 @@ int SpongeSqueeze(SpongeInstance *instance, unsigned char *data, size_t dataByte
+                 SnP_Permute(instance->state);
+                 instance->byteIOIndex = 0;
+             }
+-            partialBlock = (unsigned int)(dataByteLen - i);
+-            if (partialBlock+instance->byteIOIndex > rateInBytes)
++            if (dataByteLen-i > rateInBytes-instance->byteIOIndex)
+                 partialBlock = rateInBytes-instance->byteIOIndex;
++            else
++                partialBlock = (unsigned int)(dataByteLen - i);
+             i += partialBlock;
+ 
+             SnP_ExtractBytes(instance->state, curData, instance->byteIOIndex, partialBlock);
+-- 
+2.32.0
+
diff --git a/meta/recipes-devtools/python/python3_3.10.7.bb b/meta/recipes-devtools/python/python3_3.10.8.bb
similarity index 99%
rename from meta/recipes-devtools/python/python3_3.10.7.bb
rename to meta/recipes-devtools/python/python3_3.10.8.bb
index 2d230793ef..8963ce6dd2 100644
--- a/meta/recipes-devtools/python/python3_3.10.7.bb
+++ b/meta/recipes-devtools/python/python3_3.10.8.bb
@@ -4,7 +4,7 @@ DESCRIPTION = "Python is a programming language that lets you work more quickly
 LICENSE = "PSF-2.0"
 SECTION = "devel/python"
 
-LIC_FILES_CHKSUM = "file://LICENSE;md5=4b8801e752a2c70ac41a5f9aa243f766"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=a1822df8d0f068628ca6090aedc5bfc8"
 
 SRC_URI = "http://www.python.org/ftp/python/${PV}/Python-${PV}.tar.xz \
            file://run-ptest \
@@ -44,7 +44,7 @@ SRC_URI:append:class-native = " \
            file://12-distutils-prefix-is-inside-staging-area.patch \
            file://0001-Don-t-search-system-for-headers-libraries.patch \
            "
-SRC_URI[sha256sum] = "6eed8415b7516fb2f260906db5d48dd4c06acc0cb24a7d6cc15296a604dcdc48"
+SRC_URI[sha256sum] = "6a30ecde59c47048013eb5a658c9b5dec277203d2793667f578df7671f7f03f3"
 
 # exclude pre-releases for both python 2.x and 3.x
 UPSTREAM_CHECK_REGEX = "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
-- 
2.25.1


