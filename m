Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web10.34710.1630000660824620603
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 10:57:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=CxQedKxt;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1630000661;
  x=1661536661;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=obKfkrVborO1d6O1MImUk+8TE7ZVlpXbrOPvfTxJgM0=;
  b=CxQedKxtFZGiwZ1lDl/3FBwTWSaFlVurDsY6ueIk1ZgMrbQZPbuUkMg4
   WkwRNL6E/hehuSuWH2NVyyyBEFinUEfgQSp1tQBgHsknM9OGWTompTIHQ
   svnBJiLdPlbnIw9y8mnfqORVu3K/XcmmX77NQ5RR9wGRP4QuvhUkYpHHA
   3Dk+dKpAoervaU24iuq9ZBrDQPp3ks+yvuO3GIsM77IUwYsvxQ5g0MaKB
   H+u/tBKyD1SkIOaKUf25rTtSd63kt+37+ZATQGL6z2gjjDAVsHZkgDQWn
   nopZP0QFXd+Ys42MqctVhML/ejNZlPw5j+AAVWNT4TQ7CDVZgIjcmCrOg
   w==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCHv2 1/2] bitbake.conf: Use the new variable override syntax in a comment
Date: Thu, 26 Aug 2021 19:57:36 +0200
Message-ID: <20210826175737.9388-1-pkj@axis.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Return-Path: pkj@axis.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

It is probably a good idea if the comment that describes how variable
overrides work use the new override syntax...

Signed-off-by: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
---
 meta/conf/bitbake.conf | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/meta/conf/bitbake.conf b/meta/conf/bitbake.conf
index 46c8d08620..2140d498f7 100644
--- a/meta/conf/bitbake.conf
+++ b/meta/conf/bitbake.conf
@@ -743,11 +743,11 @@ DISTRO_NAME ??= "OpenEmbedded"
 
 # Overrides are processed left to right, so the ones that are named later take precedence.
 # You generally want them to go from least to most specific. This means that:
-# A variable '<foo>_arm' overrides a variable '<foo>' when ${TARGET_ARCH} is arm.
-# A variable '<foo>_qemuarm' overrides '<foo>' and overrides '<foo>_arm' when ${MACHINE} is 'qemuarm'.
-# If you use combination ie '<foo>_qemuarm_arm', then '<foo>_qemuarm_arm' will override
-# '<foo>_qemuarm' and then '<foo>' will be overriden with that value from '<foo>_qemuarm'.
-# And finally '<foo>_forcevariable' overrides any standard variable, with the highest priority.
+# A variable '<foo>:arm' overrides a variable '<foo>' when ${TARGET_ARCH} is arm.
+# A variable '<foo>:qemuarm' overrides '<foo>' and overrides '<foo>:arm' when ${MACHINE} is 'qemuarm'.
+# If you use combination ie '<foo>:qemuarm:arm', then '<foo>:qemuarm:arm' will override
+# '<foo>:qemuarm' and then '<foo>' will be overriden with that value from '<foo>:qemuarm'.
+# And finally '<foo>:forcevariable' overrides any standard variable, with the highest priority.
 # This works for functions as well, they are really just variables.
 #
 OVERRIDES = "${TARGET_OS}:${TRANSLATED_TARGET_ARCH}:pn-${PN}:${MACHINEOVERRIDES}:${DISTROOVERRIDES}:${CLASSOVERRIDE}${LIBCOVERRIDE}:forcevariable"
