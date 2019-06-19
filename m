Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
	[209.85.221.66])
	by mail.openembedded.org (Postfix) with ESMTP id ADB617E968
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:00:19 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id d18so3546936wrs.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:00:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XWiuAScDZBohv8uldS1iOD/4efOYMAKXAnfHcqln/gg=;
	b=cBm701iKb/xfy2pNJFFxI9kXKwNhXj4M6k7vFVja12KN/vX1rpxnkEvTppanTS0h+N
	RFv5aZ5yz32WGExRLyqFGlG5vx6qo+6IVakONWZLUESCoovdOcOyHiQ9OIYNMy/1TKYi
	ZZK/e8QeEON1YkWk5/BoBuni9DnDYmoATLSCCyTpoOjD5VN93XXBx9UW28cD8jYMeJK/
	0SIs0mqg6GKCDF4TMHXhnBFHQBMPp66yZx4znAvJi/FitUjRR72n4QYxasHt90pgXZ+Y
	4N/A72QfR1mqRPLmPKtTDuq1ybuxwfjJ5Yeh5OnkHczTCOUNfP3G5jwXdDqBnJcpai0t
	ncVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XWiuAScDZBohv8uldS1iOD/4efOYMAKXAnfHcqln/gg=;
	b=sFsoexD+/EbN4m4P0QdiFS9ohHpmz46E4W8jxcGf/BO7Y1N7/6wLMXjsLTj+9Tqdjl
	VF5eZdc7eAvDKR7Z8mLB3xrXm5Lj582HXm6arzZh/tQm+w9hbJATZ4f6xOA97ADYe1Xr
	fCWR9LF7Tj+soaAA2oVeBfEmOgJC6i5dXnxi+Xmmjfp3Qf8748eQAVc4R2aChleIUFiC
	uZEl6XvAwuRYwzhDenOwqIDbbq3xasE9YCd5WOCK2cMkmlNVsCnm5q8WGYRaj28sZZn+
	/DMf1McZALokLvy9eCyXz5xdY/KvZurub/rmihirsmPzZhr91bvsX+is81FlnCQzts0T
	usBQ==
X-Gm-Message-State: APjAAAURzxGBg6XaOckn8c23VBkpsx22EAZdK65mdfxFr79EUtBJf41B
	sZLJIyc+1YCFl8GaYmdVr+am0sRd
X-Google-Smtp-Source: APXvYqzV+KDinqiPaFeB6TEopaf8zCaaC5iWC6bHpOt4qW/5lXU5RZWqdmLU1dq39F8k7oL6u/ZISQ==
X-Received: by 2002:a05:6000:1088:: with SMTP id
	y8mr23797207wrw.280.1560952820127; 
	Wed, 19 Jun 2019 07:00:20 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	g131sm924905wmf.37.2019.06.19.07.00.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 07:00:19 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:59:39 +0200
Message-Id: <20190619135940.18544-3-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619135940.18544-1-lemagoup@gmail.com>
References: <20190619135940.18544-1-lemagoup@gmail.com>
Subject: [PATCH 3/4] cve-check: Manage CVE_PRODUCT with more than one name
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 19 Jun 2019 14:00:20 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

In some rare cases (eg. curl recipe) the CVE_PRODUCT contains more than
one name.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 28619c7bd4..e7540b8c1f 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -168,9 +168,10 @@ def check_cves(d, patched_cves):
     import ast, csv, tempfile, subprocess, io
 
     cves_unpatched = []
-    bpn = d.getVar("CVE_PRODUCT")
+    # CVE_PRODUCT can contain more than one product (eg. curl/libcurl)
+    bpn = d.getVar("CVE_PRODUCT").split()
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
-    if not bpn:
+    if len(bpn) == 0:
         return ([], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
     cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
@@ -184,16 +185,18 @@ def check_cves(d, patched_cves):
     db_file = d.getVar("CVE_CHECK_DB_FILE")
     conn = sqlite3.connect(db_file)
     c = conn.cursor()
+
     query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '%s' AND VERSION IS '%s';"
-    for row in c.execute(query % (bpn,pv)):
-        cve = row[1]
-        if pv in cve_whitelist.get(cve,[]):
-            bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
-        elif cve in patched_cves:
-            bb.note("%s has been patched" % (cve))
-        else:
-            cves_unpatched.append(cve)
-            bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
+    for idx in range(len(bpn)):
+        for row in c.execute(query % (bpn[idx],pv)):
+            cve = row[1]
+            if pv in cve_whitelist.get(cve,[]):
+                bb.note("%s-%s has been whitelisted for %s" % (bpn[idx], pv, cve))
+            elif cve in patched_cves:
+                bb.note("%s has been patched" % (cve))
+            else:
+                cves_unpatched.append(cve)
+                bb.debug(2, "%s-%s is not patched for %s" % (bpn[idx], pv, cve))
     conn.close()
 
     return (list(patched_cves), cves_unpatched)
-- 
2.11.0


