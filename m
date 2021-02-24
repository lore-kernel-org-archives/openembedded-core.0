Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web09.1824.1614200018830918753
 for <openembedded-core@lists.openembedded.org>;
 Wed, 24 Feb 2021 12:53:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=cKia1D4k;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1614200019;
  x=1645736019;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KBJXum+18m57KqhKmEmck0x8UVNPiFK+Uj4bPJWOINA=;
  b=cKia1D4kgTYApUCG3RiZ/Uz1JqP9PrtP5j63Eu2+o+S0ncoPEhf/cMYK
   mqoR6EzntjFVRbbtIb7eTjwWFmdvJeApJdfGDDyU+quNUQ1FltOcLC1eJ
   +h0z9xT9RzqkFt36X9Mcbb0t2xwW/LyFV6kZJVfsycIJYTn5H8BJIwZyJ
   7I2UChKhd63bXe3gVjAdoWazo+T8ILk5jrzMkR+mBr+AnIsk1dJnoE5X/
   gEZw8qK+wNqEMpA4xbc8Qwo/uyGSkodFhalUXkNg+L7jfrOoxBI+4tD+r
   jcKLfHrulWE6534QpZG2hRodf6s0BeAKsC6cZpNrchdCB9GupheKadbSP
   Q==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] uninative-tarball: Add a dependency on nativesdk-glibc-dbg
Date: Wed, 24 Feb 2021 21:53:32 +0100
Message-ID: <20210224205332.3195-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

This adds the debug symbols for the binaries included in the uninative
tar ball. These are needed if one wants to run valgrind on a native
binary when uninative is used. Or get complete backtraces using gdb.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---

For the uninative tar ball for x86-64 that I built to test this change
the size increased by ~4% (200 kB). I hope that is acceptable to
consider this change.

 meta/recipes-core/meta/uninative-tarball.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta/recipes-core/meta/uninative-tarball.bb b/meta/recipes-core/meta/uninative-tarball.bb
index c4a6c96b4d..bbdaebad94 100644
--- a/meta/recipes-core/meta/uninative-tarball.bb
+++ b/meta/recipes-core/meta/uninative-tarball.bb
@@ -8,6 +8,7 @@ TOOLCHAIN_TARGET_TASK = ""
 # utf-16, cp1252 - binutils-windres
 TOOLCHAIN_HOST_TASK = "\
     nativesdk-glibc \
+    nativesdk-glibc-dbg \
     nativesdk-glibc-gconv-ibm850 \
     nativesdk-glibc-gconv-iso8859-1 \
     nativesdk-glibc-gconv-utf-16 \
