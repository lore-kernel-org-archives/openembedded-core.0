Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.1990.1589319783953974492
 for <openembedded-core@lists.openembedded.org>;
 Tue, 12 May 2020 14:43:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=TDtnLSVZ;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; l=833; q=dns/txt; s=axis-central1;
  t=1589319784; x=1620855784;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=uNpXD87C5h61OK5TTLw/55oJX85eG6TQ+vBNiTLhLJU=;
  b=TDtnLSVZ51oQDL50JWzczD7a5QjHJQQvlXLQfkrxT9LShIxLf0OEKVpu
   897t/XCOTNe9C2mjgbsA4Ie6s5YqMUc7jlcQ3xmh/5DeDeqU3b+wDA+ey
   c7x4zXAMBciot6A8hqPNwSG/mx2WNQAzCNRTD02moB6VVsGv3VbCzWxk4
   7uysyqfdaNvypBCISoQFtJdTdzSZnrrkg0Vid8meUVPsuKraw46/KChsD
   C8CFHCN1yvjC9gHl5oVeAi2octjI2g8uMRiQMv1fBon9yflZR4fu3n0HF
   Lunjb2yVolqJWefEfvFBBE2egAi2D4sjGNKGLSfMEwBgRqzJZFIAUgH7A
   g==;
IronPort-SDR: 4SFAPJeQYzlDF2hif5R8m4VTcBLvx3DMRuToE5yyzqJhVrBmjo2NGf0F/B+xw3/pz+GxXRsA1C
 mEFoumwLh5ic9Jg2JsnJac6JS64xK5uydgSXK12T7KNPPEzbxq+bjSZQyvYBGUiT6AWSETdotb
 1vyJl2FiPhnR44pOA7KgVrs81h8JGA94EGKlD5sgEvX5wUtavTEfG+9Ub/yREjJNw52k3efZxi
 49BjNh/nYshxKU+kD3fXZ+qSgP4Ecivy5+987BNkYlTyWXCZS+YaRKhtDfKvyWV5fsBtqXTt0c
 8/I=
X-IronPort-AV: E=Sophos;i="5.73,385,1583190000"; 
   d="scan'208";a="8660070"
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH] file: Remove unneccessary override of PACKAGECONFIG for native
Date: Tue, 12 May 2020 23:42:55 +0200
Message-ID: <20200512214255.20678-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

There is no reason to set PACKAGECONFIG_class-native to the same value
as the default PACKAGECONFIG.

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/recipes-devtools/file/file_5.38.bb | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta/recipes-devtools/file/file_5.38.bb b/meta/recipes-devtools/file/file_5.38.bb
index f5ad568936..007db4790d 100644
--- a/meta/recipes-devtools/file/file_5.38.bb
+++ b/meta/recipes-devtools/file/file_5.38.bb
@@ -19,7 +19,6 @@ S = "${WORKDIR}/git"
 inherit autotools update-alternatives
 
 PACKAGECONFIG ??= "zlib"
-PACKAGECONFIG_class-native ??= "zlib"
 PACKAGECONFIG[bz2] = "--enable-bzlib, --disable-bzlib, bzip2"
 PACKAGECONFIG[lzma] = "--enable-xzlib, --disable-xzlib, xz"
 PACKAGECONFIG[zlib] = "--enable-zlib, --disable-zlib, zlib"
-- 
2.21.3

