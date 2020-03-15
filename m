Return-Path: <akuster808@gmail.com>
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3D53961C65
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 18:12:14 +0000 (UTC)
Received: by mail-pj1-f48.google.com with SMTP id l36so6886776pjb.3
	for <openembedded-core@openembedded.org>;
	Sun, 15 Mar 2020 11:12:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=yiFJHpjKOrJSOYwkdHiVviFMZ2+NtwrwH4+FJx/3A7Q=;
	b=SiHOcwYWaTAF8ck8fgUvj76FmELF8qmD3K8stqqnUnwe2Ei1vIpletEmsuE53Hvs6j
	mx1udqt84LL/vY31pxhAWwBvy9qXjQMhcfrLlkJ+jibEdBoqNopRMXg1FrMa8uiJlVQA
	sw1N+qgnBT+gvliiNf+uYzynZ1JfA5fSWMdEBUflY6r4hIcufab/C2w/ZOfM3vI8Rb4k
	UugGxnEB1u5WipD6YloKGSbXiMmbYGHllW/D1mQAXkkbWZuEUGoo0PLwiFf9xIlvu7tC
	QOvDt+OUHNrm1uSBQV4LtEMnOLXaMpVBW1vOdEY9+r56SMLfGrELD2JbgILgcfQ9oEDW
	guVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=yiFJHpjKOrJSOYwkdHiVviFMZ2+NtwrwH4+FJx/3A7Q=;
	b=hC12i6B4PMha9YzBU+4L+ge87VOgQdOv4mjfcxYUweMBiyXJcxyo32aB51YPTOWXLW
	lM9a5EJhmirVgPBvFIb9dvLw17atEp2AQfO35JN7E+TCHlGplaDfbgjMsCddYQD12U0V
	Po6b+umwV8tEEfYebzUz9iFx20Xz4NqtRVbeK/AIHNbsqQBt6xi94HoJ6d/R3uyojxqs
	gV4nIHnU/yWAWb5EM7aB+1CmGDRE9p1arX3IBGMNHhbGNNNHEv5bnQveIW28/P9pG7sB
	M0i8PXP5NOtM6QyiyIt1DZR8qC7aoRXnExUw7yB4ZLsENIqzs1O6F0q/fMom0pIyqVl2
	LoGA==
X-Gm-Message-State: ANhLgQ1s5q0FUO105YtGP4FTmbax8yKZgdvYiQASC4TJ/08YC6S+fPdj
	QqFA8uXIGGAtyac5VGJLd2uJMbAI
X-Google-Smtp-Source: ADFU+vtZHQ7v27fFmplCBTk02Qr2GOT3AjhpVhrPjspo3KK9Oo/Lx9cxvlkyB39rMtqV3+2G2E92cg==
X-Received: by 2002:a17:90a:9481:: with SMTP id
	s1mr7526673pjo.114.1584295935061; 
	Sun, 15 Mar 2020 11:12:15 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:c9cd:7c61:9c1c:2d2f])
	by smtp.gmail.com with ESMTPSA id
	n5sm12223816pfq.35.2020.03.15.11.12.14
	for <openembedded-core@openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 15 Mar 2020 11:12:14 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-core@openembedded.org
Date: Sun, 15 Mar 2020 11:11:57 -0700
Message-Id: <b7646fa3646d2a14f657da4056a0fa78334e3182.1584295805.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1584295805.git.akuster808@gmail.com>
References: <cover.1584295805.git.akuster808@gmail.com>
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
X-List-Received-Date: Sun, 15 Mar 2020 18:12:14 -0000

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


