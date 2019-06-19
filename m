Return-Path: <lemagoup@gmail.com>
Received: from mail-wr1-f65.google.com (mail-wr1-f65.google.com
	[209.85.221.65])
	by mail.openembedded.org (Postfix) with ESMTP id AB0ED7E971
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 14:00:18 +0000 (UTC)
Received: by mail-wr1-f65.google.com with SMTP id p11so3524739wre.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Jun 2019 07:00:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=nCVEndjQJ6vozuxGFPmbjD00DhimFZgrs7GECNUu9vU=;
	b=G6w42FOCX4Yhh35F9dKhz9ZQ5U0dmo9Cq/JeYEZdfJYNlMIQ7T8XNVLxU1ZRKMgZF0
	L/waLK/BQK2mTHb6Qn7IPxR4HhqW3qD3Yc0xdnCDfh93v28qNLvh0rTUjv9X4EXZpnto
	BmLYIaDsIO2vNLswKAuhRi1zjI9YB0bXWxqXjHynSNUSIBDhH//sz/uA7p8imAln0kvi
	0xwcnZVgb5wogIQ/XPgAyieCmXrouPq0XUpzL88kqkIJIFjtz3TkzHpkUJsIETSNrP5g
	kJWaqc6FCcf/8j85euncpbRXqjKgJB+rlxscHKdSEmubTbYs7X0U71iFxj7fhoCa2wCe
	cxcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=nCVEndjQJ6vozuxGFPmbjD00DhimFZgrs7GECNUu9vU=;
	b=a157B2KxbwvdrHwTPIdQz+ewPJ2c7yhcq+FoD3RmQ1Lw48vZi5lAvR6+DggKNMVXSn
	W4ftBHC0Q0kAzxNlssFHQTQiT1NNOQYl5GP2MSjR37kEX9ydZHn7QkJOXqeX6vQueJxX
	3yFh1BarkWfieK0CMVAL54XgAvm6OMuzDgRDfNtc5V/HGKq7WVAvZFMdUjoPBPS7C/Cb
	ZsiPLnxtWo8UQ9DgFAG7EyHUbpz9xc7zJldm15QdbgBGv7xD2AyFELXqKfC0dapXlDX+
	tecLAJPM5md/hqupKPaj+tsIlW0EYWhlrUFzjxeRhmWgEGkoiUwyu9RNlFl4EVewKyQ8
	stIg==
X-Gm-Message-State: APjAAAUWwzd0+V5Bz2YxdTAIX9IBK24S1PkzSyu+gNWvBLQkXkwcMHVc
	R9IXwGBcMDAyknBQxH6KVjKuGvAp
X-Google-Smtp-Source: APXvYqylrSAfVunBSoo+/lNdSoEvI9suRF4aw9RtYa/BCWbRa6rq1rucW+JnzlsqXOxDE87038frIw==
X-Received: by 2002:adf:f649:: with SMTP id x9mr17841780wrp.86.1560952819094; 
	Wed, 19 Jun 2019 07:00:19 -0700 (PDT)
Received: from localhost.localdomain
	(softbank-robotics-gw1.ter4.eqx2.par.cust.as8218.eu.
	[158.255.112.194]) by smtp.gmail.com with ESMTPSA id
	g131sm924905wmf.37.2019.06.19.07.00.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 19 Jun 2019 07:00:18 -0700 (PDT)
From: Pierre Le Magourou <lemagoup@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 19 Jun 2019 15:59:38 +0200
Message-Id: <20190619135940.18544-2-lemagoup@gmail.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190619135940.18544-1-lemagoup@gmail.com>
References: <20190619135940.18544-1-lemagoup@gmail.com>
Subject: [PATCH 2/4] cve-check: Remove dependency to cve-check-tool-native
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
X-List-Received-Date: Wed, 19 Jun 2019 14:00:19 -0000

From: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>

Use the new update-cve-db recipe to update database.

Signed-off-by: Pierre Le Magourou <pierre.lemagourou@softbankrobotics.com>
---
 meta/classes/cve-check.bbclass | 71 ++++++++++++++++--------------------------
 1 file changed, 26 insertions(+), 45 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 743bc08a4f..28619c7bd4 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -26,7 +26,7 @@ CVE_PRODUCT ??= "${BPN}"
 CVE_VERSION ??= "${PV}"
 
 CVE_CHECK_DB_DIR ?= "${DL_DIR}/CVE_CHECK"
-CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd.db"
+CVE_CHECK_DB_FILE ?= "${CVE_CHECK_DB_DIR}/nvd-json.db"
 
 CVE_CHECK_LOG ?= "${T}/cve.log"
 CVE_CHECK_TMP_FILE ?= "${TMPDIR}/cve_check"
@@ -62,7 +62,7 @@ python do_cve_check () {
 }
 
 addtask cve_check after do_unpack before do_build
-do_cve_check[depends] = "cve-check-tool-native:do_populate_sysroot cve-check-tool-native:do_populate_cve_db"
+do_cve_check[depends] = "cve-update-db:do_populate_cve_db"
 do_cve_check[nostamp] = "1"
 
 python cve_check_cleanup () {
@@ -163,61 +163,40 @@ def get_patches_cves(d):
 
 def check_cves(d, patched_cves):
     """
-    Run cve-check-tool looking for patched and unpatched CVEs.
+    Connect to the NVD database and find unpatched cves.
     """
-
     import ast, csv, tempfile, subprocess, io
 
-    cves_patched = []
     cves_unpatched = []
     bpn = d.getVar("CVE_PRODUCT")
     # If this has been unset then we're not scanning for CVEs here (for example, image recipes)
     if not bpn:
         return ([], [])
     pv = d.getVar("CVE_VERSION").split("+git")[0]
-    cves = " ".join(patched_cves)
-    cve_db_dir = d.getVar("CVE_CHECK_DB_DIR")
     cve_whitelist = ast.literal_eval(d.getVar("CVE_CHECK_CVE_WHITELIST"))
-    cve_cmd = "cve-check-tool"
-    cmd = [cve_cmd, "--no-html", "--skip-update", "--csv", "--not-affected", "-t", "faux", "-d", cve_db_dir]
 
     # If the recipe has been whitlisted we return empty lists
     if d.getVar("PN") in d.getVar("CVE_CHECK_PN_WHITELIST").split():
         bb.note("Recipe has been whitelisted, skipping check")
         return ([], [])
 
-    try:
-        # Write the faux CSV file to be used with cve-check-tool
-        fd, faux = tempfile.mkstemp(prefix="cve-faux-")
-        with os.fdopen(fd, "w") as f:
-            for pn in bpn.split():
-                f.write("%s,%s,%s,\n" % (pn, pv, cves))
-        cmd.append(faux)
-
-        output = subprocess.check_output(cmd).decode("utf-8")
-        bb.debug(2, "Output of command %s:\n%s" % ("\n".join(cmd), output))
-    except subprocess.CalledProcessError as e:
-        bb.warn("Couldn't check for CVEs: %s (output %s)" % (e, e.output))
-    finally:
-        os.remove(faux)
-
-    for row in csv.reader(io.StringIO(output)):
-        # Third row has the unpatched CVEs
-        if row[2]:
-            for cve in row[2].split():
-                # Skip if the CVE has been whitlisted for the current version
-                if pv in cve_whitelist.get(cve,[]):
-                    bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
-                else:
-                    cves_unpatched.append(cve)
-                    bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
-        # Fourth row has patched CVEs
-        if row[3]:
-            for cve in row[3].split():
-                cves_patched.append(cve)
-                bb.debug(2, "%s-%s is patched for %s" % (bpn, pv, cve))
-
-    return (cves_patched, cves_unpatched)
+    import sqlite3
+    db_file = d.getVar("CVE_CHECK_DB_FILE")
+    conn = sqlite3.connect(db_file)
+    c = conn.cursor()
+    query = "SELECT * FROM PRODUCTS WHERE PRODUCT IS '%s' AND VERSION IS '%s';"
+    for row in c.execute(query % (bpn,pv)):
+        cve = row[1]
+        if pv in cve_whitelist.get(cve,[]):
+            bb.note("%s-%s has been whitelisted for %s" % (bpn, pv, cve))
+        elif cve in patched_cves:
+            bb.note("%s has been patched" % (cve))
+        else:
+            cves_unpatched.append(cve)
+            bb.debug(2, "%s-%s is not patched for %s" % (bpn, pv, cve))
+    conn.close()
+
+    return (list(patched_cves), cves_unpatched)
 
 def get_cve_info(d, cves):
     """
@@ -241,9 +220,10 @@ def get_cve_info(d, cves):
     for row in cur.execute(query, tuple(cves)):
         cve_data[row[0]] = {}
         cve_data[row[0]]["summary"] = row[1]
-        cve_data[row[0]]["score"] = row[2]
-        cve_data[row[0]]["modified"] = row[3]
-        cve_data[row[0]]["vector"] = row[4]
+        cve_data[row[0]]["scorev2"] = row[2]
+        cve_data[row[0]]["scorev3"] = row[3]
+        cve_data[row[0]]["modified"] = row[4]
+        cve_data[row[0]]["vector"] = row[5]
     conn.close()
 
     return cve_data
@@ -270,7 +250,8 @@ def cve_write_data(d, patched, unpatched, cve_data):
             unpatched_cves.append(cve)
             write_string += "CVE STATUS: Unpatched\n"
         write_string += "CVE SUMMARY: %s\n" % cve_data[cve]["summary"]
-        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["score"]
+        write_string += "CVSS v2 BASE SCORE: %s\n" % cve_data[cve]["scorev2"]
+        write_string += "CVSS v3 BASE SCORE: %s\n" % cve_data[cve]["scorev3"]
         write_string += "VECTOR: %s\n" % cve_data[cve]["vector"]
         write_string += "MORE INFORMATION: %s%s\n\n" % (nvd_link, cve)
 
-- 
2.11.0


