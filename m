Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com
	[209.85.215.178])
	by mail.openembedded.org (Postfix) with ESMTP id 739C361BC2
	for <openembedded-core@openembedded.org>;
	Wed, 11 Mar 2020 02:26:33 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id c7so327634pgw.3
	for <openembedded-core@openembedded.org>;
	Tue, 10 Mar 2020 19:26:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yiFJHpjKOrJSOYwkdHiVviFMZ2+NtwrwH4+FJx/3A7Q=;
	b=dwHFT11wbxexDdKDpS2xI6SrGg3IQ0seTaZ0/pI2svO6DLbsFuDU35uEUxsTZbkkFL
	QS5zzgnU3cckDjvcm6b3tlDLYyo7uH8/FrbFad0co9KHUmAE5iWj+bWPx8uiXBcGb8pv
	9/wnYGqMjzF1OflIbb7K5Gmc2lrBE+M5y9BPEaj4nNcRjWf2Fcg42oSJUdvzwi3TXjKv
	sJKajCoYDH0gs8wFOwbB8mbhyRDNnEnk1Z7/qJF2kO257z6Dvmt0YueHRo/UNUAz1Lid
	9HIuI1Q+QiPztC3Pw2ncsW4wN5XAk50MJFnVGtCjQCzEOdWvIVhUDMCHYPLUGSs6R1sF
	51Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yiFJHpjKOrJSOYwkdHiVviFMZ2+NtwrwH4+FJx/3A7Q=;
	b=DVr1rD4F8szbU0ftthiZFxyIHmbvGiLRuw0KtrTvkFoLc9PiyaLSszRcxukyjg4hNY
	N5ECTJ7H1j9MyGJlTsEaVvb8LHcTpzJ3WkuyJrsJL2dlD7FNX8J2UkeuntB9BwcAYS14
	y92tovRlXlVVaAYuYWrsTrXMuzcwt7MitglXDc77Hm2KZ3xVALfzj5M+j+kydT5nQkfC
	F0ZX5TmB91JmeVyCIBN6ZCpbBh53y4slYOMQiQm4PKdFPv4LhrhtmI8ExScgAv+Qije5
	z+3IkCQkdSqbvYqWVHgsawxzvWLrABFBMj+8sBp5hEZVeVY9nPgN2Xa730qWcLFwlgWQ
	2L+w==
X-Gm-Message-State: ANhLgQ279sxou+hByWbpooc4FFW+JdYQcRsCqfr+UwKt68fq6RJp2SVx
	eo93xhubjMCHK28jKohTtyt/7Tk7
X-Google-Smtp-Source: ADFU+vu8YlzFAAHZMV5nWBNZnaVeBkWckGbiT3nNkEyM9LxHoSSH93HuaZUifP/Tto8HHrFF+2uHNQ==
X-Received: by 2002:a63:745c:: with SMTP id e28mr622619pgn.231.1583893594357; 
	Tue, 10 Mar 2020 19:26:34 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:a4a4:c739:7769:e9ed])
	by smtp.gmail.com with ESMTPSA id
	o11sm1461661pjb.18.2020.03.10.19.26.33
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 10 Mar 2020 19:26:33 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Tue, 10 Mar 2020 19:26:16 -0700
Message-Id: <b7646fa3646d2a14f657da4056a0fa78334e3182.1583893499.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1583893499.git.akuster808@gmail.com>
References: <cover.1583893499.git.akuster808@gmail.com>
Subject: [zeus 15/16] cve-check: show whitelisted status
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
X-List-Received-Date: Wed, 11 Mar 2020 02:26:33 -0000

From: Chee Yang Lee <chee.yang.lee@intel.com>

change whitelisted CVE status from "Patched" to "Whitelisted".

[Yocto #13687]

Signed-off-by: Chee Yang Lee <chee.yang.lee@intel.com>
Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
(cherry picked from commit 181bdd670492525f9488d52c3ebb9a1b142e35ea)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta/classes/cve-check.bbclass | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/meta/classes/cve-check.bbclass b/meta/classes/cve-check.bbclass
index 74124364b2..7f98da60f1 100644
--- a/meta/classes/cve-check.bbclass
+++ b/meta/classes/cve-check.bbclass
@@ -56,10 +56,10 @@ python do_cve_check () {
             patched_cves = get_patches_cves(d)
         except FileNotFoundError:
             bb.fatal("Failure in searching patches")
-        patched, unpatched = check_cves(d, patched_cves)
+        whitelisted, patched, unpatched = check_cves(d, patched_cves)
         if patched or unpatched:
             cve_data = get_cve_info(d, patched + unpatched)
-            cve_write_data(d, patched, unpatched, cve_data)
+            cve_write_data(d, patched, unpatched, whitelisted, cve_data)
     else:
         bb.note("No CVE database found, skipping CVE check")
 
@@ -263,7 +263,7 @@ def check_cves(d, patched_cves):
 
     conn.close()
 
-    return (list(patched_cves), cves_unpatched)
+    return (list(cve_whitelist), list(patched_cves), cves_unpatched)
 
 def get_cve_info(d, cves):
     """
@@ -287,7 +287,7 @@ def get_cve_info(d, cves):
     conn.close()
     return cve_data
 
-def cve_write_data(d, patched, unpatched, cve_data):
+def cve_write_data(d, patched, unpatched, whitelisted, cve_data):
     """
     Write CVE information in WORKDIR; and to CVE_CHECK_DIR, and
     CVE manifest if enabled.
@@ -303,7 +303,9 @@ def cve_write_data(d, patched, unpatched, cve_data):
         write_string += "PACKAGE NAME: %s\n" % d.getVar("PN")
         write_string += "PACKAGE VERSION: %s\n" % d.getVar("PV")
         write_string += "CVE: %s\n" % cve
-        if cve in patched:
+        if cve in whitelisted:
+            write_string += "CVE STATUS: Whitelisted\n"
+        elif cve in patched:
             write_string += "CVE STATUS: Patched\n"
         else:
             unpatched_cves.append(cve)
-- 
2.17.1


