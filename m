Received: from mail.lineo.co.jp (mail.lineo.co.jp [203.141.200.203])
 by mx.groups.io with SMTP id smtpd.web12.34522.1602482420060429931
 for <openembedded-core@lists.openembedded.org>;
 Sun, 11 Oct 2020 23:00:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: lineo.co.jp, ip: 203.141.200.203, mailfrom: naokihayama@lineo.co.jp)
Received: from naokihayama-desktop (unknown [203.141.200.204])
	by mail.lineo.co.jp (Postfix) with ESMTPSA id 4283E8035CE48;
	Mon, 12 Oct 2020 15:00:18 +0900 (JST)
Received: by naokihayama-desktop (Postfix, from userid 1000)
	id 2A97750040FF; Mon, 12 Oct 2020 15:00:18 +0900 (JST)
From: "Naoki Hayama" <naoki.hayama@lineo.co.jp>
To: openembedded-core@lists.openembedded.org
Cc: Naoki Hayama <naoki.hayama@lineo.co.jp>
Subject: [PATCH] uninative: Fix typo in error message
Date: Mon, 12 Oct 2020 14:59:52 +0900
Message-Id: <20201012055952.8850-1-naoki.hayama@lineo.co.jp>
X-Mailer: git-send-email 2.17.1

Fix typo in an error message.
s/verson/version/

Signed-off-by: Naoki Hayama <naoki.hayama@lineo.co.jp>
---
 meta/classes/uninative.bbclass | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta/classes/uninative.bbclass b/meta/classes/uninative.bbclass
index 316c0f0616..1e19917a97 100644
--- a/meta/classes/uninative.bbclass
+++ b/meta/classes/uninative.bbclass
@@ -89,7 +89,7 @@ python uninative_event_fetchloader() {
         # ldd output is "ldd (Ubuntu GLIBC 2.23-0ubuntu10) 2.23", extract last option from first line
         glibcver = subprocess.check_output(["ldd", "--version"]).decode('utf-8').split('\n')[0].split()[-1]
         if bb.utils.vercmp_string(d.getVar("UNINATIVE_MAXGLIBCVERSION"), glibcver) < 0:
-            raise RuntimeError("Your host glibc verson (%s) is newer than that in uninative (%s). Disabling uninative so that sstate is not corrupted." % (glibcver, d.getVar("UNINATIVE_MAXGLIBCVERSION")))
+            raise RuntimeError("Your host glibc version (%s) is newer than that in uninative (%s). Disabling uninative so that sstate is not corrupted." % (glibcver, d.getVar("UNINATIVE_MAXGLIBCVERSION")))
 
         cmd = d.expand("\
 mkdir -p ${UNINATIVE_STAGING_DIR}-uninative; \
-- 
2.17.1

