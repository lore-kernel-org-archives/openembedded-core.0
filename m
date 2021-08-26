Received: from smtp2.axis.com (smtp2.axis.com [195.60.68.18])
 by mx.groups.io with SMTP id smtpd.web10.34263.1629998931063373962
 for <openembedded-core@lists.openembedded.org>;
 Thu, 26 Aug 2021 10:28:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=K1SpmHTK;
 spf=pass (domain: axis.com, ip: 195.60.68.18, mailfrom: peter.kjellerstedt@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1629998933;
  x=1661534933;
  h=from:to:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=obKfkrVborO1d6O1MImUk+8TE7ZVlpXbrOPvfTxJgM0=;
  b=K1SpmHTKRfcGMephnD6OQqhxL8dJLWjL+FRD4LTALG8fqB4S01znqaau
   JidLjfoK9rVjY0OPBpghUaXAirROf5yT/jAeNrvJ02dJIA4mz16YHMJZU
   Yn4iqnH0rmn+9J63MmuRlA7IDNALu8QRdl12hZNfEN75P2OB4vEJ8bC21
   A6V4ajwOVaR8/CXG4VZGb6OiFr4Ob8+PEuE9oDu/CPlbhDNeKrOwy9xf3
   nZVmfFLxjQYLvDgOva66ZrggJSgfa5sEOqtMBN6O5y0PAPyjc5U93Y9Vm
   zUeXdUG1aDE52xlHn7wV7i1joUkUJoyGKCZrNTFnu3AI7PKhWnru74jMT
   g==;
From: "Peter Kjellerstedt" <peter.kjellerstedt@axis.com>
To: <openembedded-core@lists.openembedded.org>
Subject: [PATCH 1/2] bitbake.conf: Use the new variable override syntax in a comment
Date: Thu, 26 Aug 2021 19:28:43 +0200
Message-ID: <20210826172844.32608-1-pkj@axis.com>
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
