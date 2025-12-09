Return-Path: <naftaly.ralamboarivony@smile.fr>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F383D3B7F3
	for <webhook@archiver.kernel.org>; Tue,  9 Dec 2025 10:55:51 +0000 (UTC)
Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.5195.1765277741788876185
 for <openembedded-core@lists.openembedded.org>;
 Tue, 09 Dec 2025 02:55:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google header.b=gTsoSxLA;
 spf=pass (domain: smile.fr, ip: 209.85.128.53, mailfrom: naftaly.ralamboarivony@smile.fr)
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so69695745e9.2
        for <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 02:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google; t=1765277740; x=1765882540; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKnez7GlkVraC4ABlrfa6SvP4abbv+FEIadWzy/e1Fs=;
        b=gTsoSxLAAaOaZn/ykbC0ytdrEKUkakF1VT2q9rndPnz/2X9Bw9HGx9ReQ/sqETUnoQ
         z0uG6iSyPHMvqHqivVbh+P7Wwq0oWkwR3oVLN+AwqIvNLd+eFBbZdv8b1s7Ds+qPLRAG
         oQ20AQbGBOy2vmE7U8T/3O94Nsavd+UvLSTpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765277740; x=1765882540;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKnez7GlkVraC4ABlrfa6SvP4abbv+FEIadWzy/e1Fs=;
        b=fDhgYyOJqokob7lmQ3givyINDwye+tE0jcJ2UuvmVEXe9ruw45X3otsLVnED+ukKSa
         R40WBdcUuxheZmhJj+zNIRlMYWBndDgPLnas25p5ChdhiaBvHN3XB3P6/PC2hURxcZ4O
         PxxYeUip5mQe0x48G2sZeZeW8BrVKBJUJQve5ML8NPgvIzw5RjrzaYVspGVteFtnAGOS
         4QkPO6ErAxvzgS3lOh2y76cZPKsgBx0iNLSWUIEOp/VA9yvukIDKtNRBFa4afRzRyUvb
         BPYp0+hfq+pCt95s8Lj186UYfNrcdpaBVXolunxYJ3uQorzpCBqEJHUZuKFDmpEPe5uJ
         EOfg==
X-Gm-Message-State: AOJu0YzScSUAmB3UsWMpEcmu96eZQuAgwZGfXKFFnsSLElRoS5rhVsnm
	a4gaqFOZnv9or+sjoeZVqJc68pU1dESgck+SBEszGLnEzlFAwMMXIw0WW3eP/Ei3eee3ZIi7ouz
	7Dyar
X-Gm-Gg: ASbGncvaWTtdWdh6vDYS0Nf1nCfgaYyPeRTUhLFhZoVT2ImWR7cE1uPkhkyXxXCNcv0
	8zwSM+DEucK237Au6q7us54pDAmbXyDf2g2+DthMFFPz72J9m+uB/ERLDKqcjodG8wdkEuFUuha
	t3Xh0gf06xirhWwq+ALtiS+FEr20Mi//tCPyShGUodtt+o/3krx73rCiKm/EOa1yeyi9R2VPt/l
	cyTQizLh3dmLeD78B0+MS2Otil+tZbLIA4gKp2VrgK0PW6AzliBfJQRiIbnbBKsOtOLiYmhgeeu
	TeswjMU114M+JAxxAv+sbylyt5P08FCtJzVdKNE26tMAWnNXKpfBgggleHH4x9SH3K98b77Iunb
	hg6IMQ1kwBwlyO8jqgtAsFFSY/KLD/h+q2PffouCBAoHL3h5YSTnBNAd3isIkax1bRQgnrBv84f
	X/Nra9HPRQIQ/f9YVCTBTCStokUGChTZwwojZos2TLSIbVTGCzwoQ9VB+ctqW9IH8ELY0pFt+SV
	HBNZCCbur/IYsZFNgdaAH0=
X-Google-Smtp-Source: AGHT+IGyx+tOrIMGxtTcoAw6A1yUJG281lFstxQyDsaWFoxIoW8lM0khP7wfEMA0AeH0IeM03rl2+Q==
X-Received: by 2002:a05:600c:4743:b0:477:fcb:2256 with SMTP id 5b1f17b1804b1-47939e206cdmr108655905e9.17.1765277739740;
        Tue, 09 Dec 2025 02:55:39 -0800 (PST)
Received: from P-ASN-DERVAUX.. (2a02-8434-8fe1-4f01-fc4a-65a9-382e-6f5d.rev.sfr.net. [2a02:8434:8fe1:4f01:fc4a:65a9:382e:6f5d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47a7d2e7435sm17412895e9.0.2025.12.09.02.55.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Dec 2025 02:55:39 -0800 (PST)
From: naftaly.ralamboarivony@smile.fr
To: openembedded-core@lists.openembedded.org
Cc: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
Subject: [OE-core][PATCH v3 2/6] patchtest/selftest: convert separate count variables into a results dictionary
Date: Tue,  9 Dec 2025 11:55:09 +0100
Message-Id: <20251209105513.273859-2-naftaly.ralamboarivony@smile.fr>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
References: <20251209105513.273859-1-naftaly.ralamboarivony@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 09 Dec 2025 10:55:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/227426

From: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>

Change the variables used to count test results:
- passcount
- failcount
- skipcount
- xpasscount
- xfailcount
- xskipcount
- errorcount

into a single dictionary named counts, in order to make it easier
to pass these values to a result analysis and display function
(print_results).

Signed-off-by: Naftaly RALAMBOARIVONY <naftaly.ralamboarivony@smile.fr>
---
 meta/lib/patchtest/selftest/selftest | 52 +++++++++++++++-------------
 1 file changed, 27 insertions(+), 25 deletions(-)

diff --git a/meta/lib/patchtest/selftest/selftest b/meta/lib/patchtest/selftest/selftest
index 3cf1c361f7..c2f274b15b 100755
--- a/meta/lib/patchtest/selftest/selftest
+++ b/meta/lib/patchtest/selftest/selftest
@@ -18,19 +18,19 @@ parentdir  = os.path.dirname(topdir)
 # path to the repo root
 repodir = os.path.dirname(os.path.dirname(parentdir))
 
-def print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount):
-    total = passcount + skipcount + failcount + xpasscount + xfailcount + xskipcount + errorcount
+def print_results(counts):
+    total = sum(counts.values())
     print("============================================================================")
     print("Testsuite summary for %s" % os.path.basename(topdir))
     print("============================================================================")
-    print("# TOTAL: %s" % str(total))
-    print("# XPASS: %s" % str(xpasscount))
-    print("# XFAIL: %s" % str(xfailcount))
-    print("# XSKIP: %s" % str(xskipcount))
-    print("# PASS: %s" % str(passcount))
-    print("# FAIL: %s" % str(failcount))
-    print("# SKIP: %s" % str(skipcount))
-    print("# ERROR: %s" % str(errorcount))
+    print("# TOTAL: " + str(total))
+    print("# XPASS: " + str(counts["xpass"]))
+    print("# XFAIL: " + str(counts["xfail"]))
+    print("# XSKIP: " + str(counts["xskip"]))
+    print("# PASS: " + str(counts["pass"]))
+    print("# FAIL: " + str(counts["fail"]))
+    print("# SKIP: " + str(counts["skip"]))
+    print("# ERROR: " + str(counts["error"]))
     print("============================================================================")
 
 # Once the tests are in oe-core, we can remove the testdir param and use os.path.dirname to get relative paths
@@ -44,13 +44,15 @@ def test(root, patch):
     return results
 
 if __name__ == '__main__':
-    passcount = 0
-    failcount = 0
-    skipcount = 0
-    xpasscount = 0
-    xfailcount = 0
-    xskipcount = 0
-    errorcount = 0
+    counts = {
+        "pass": 0,
+        "fail": 0,
+        "skip": 0,
+        "xpass": 0,
+        "xfail": 0,
+        "xskip": 0,
+        "error": 0,
+    }
 
     results = None
         
@@ -68,27 +70,27 @@ if __name__ == '__main__':
                     result, _ = resultline.split(':', 1)
 
                     if expected_result.upper() == "FAIL" and result.upper() == "FAIL":
-                        xfailcount = xfailcount + 1
+                        counts["xfail"] = counts["xfail"] + 1
                         print("XFAIL: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
                     elif expected_result.upper() == "PASS" and result.upper() == "PASS":
-                        xpasscount = xpasscount + 1
+                        counts["xpass"] = counts["xpass"] + 1
                         print("XPASS: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
                     elif expected_result.upper() == "SKIP" and result.upper() == "SKIP":
-                        xskipcount = xskipcount + 1
+                        counts["xskip"] = counts["xskip"] + 1
                         print("XSKIP: %s (file: %s)" % (testid.strip("."), os.path.basename(patch)))
                     else:
                         print("%s: %s (%s)" % (result.upper(), testid.strip("."), os.path.basename(patch)))
                         if result.upper() == "PASS":
-                            passcount = passcount + 1
+                            counts["pass"] = counts["pass"] + 1
                         elif result.upper() == "FAIL":
-                            failcount = failcount + 1
+                            counts["fail"] = counts["fail"] + 1
                         elif result.upper() == "SKIP":
-                            skipcount = skipcount + 1
+                            counts["skip"] = counts["skip"] + 1
                         else:
                             print("Bad result on test %s against %s" % (testid.strip("."), os.path.basename(patch)))
-                            errorcount = errorcount + 1
+                            counts["error"] = counts["error"] + 1
                     break
             else:
                 print ("No test for=%s" % patch)
 
-    print_results(passcount, failcount, skipcount, xpasscount, xfailcount, xskipcount, errorcount)
+    print_results(counts)

